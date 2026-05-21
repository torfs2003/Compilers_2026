from llvmlite import ir
import re
from src.parser.AST import *
import llvmlite.binding as llvm

class LLVMVisitor:
    def __init__(self):
        self.module = ir.Module(name="cmm_module")
        llvm.initialize_native_target()
        llvm.initialize_native_asmparser()
        self.module.triple = llvm.get_default_triple()
        self.builder = None
        self.func = None
        self.global_vars = {}
        self.scopes = [] 
        self.local_vars = {}
        self.const_values = {}
        self.results = {}
        self.stdio_declared = False
        self.loop_stack = []
        self.enum_constants = {}
        self.struct_types = {}

    def _get_llvm_type(self, type_str):
        if not type_str: 
            return ir.IntType(32)

        # 1. Function pointer syntax zoals 'int(*)(int)'
        if '(*)' in type_str:
            return_type, params = type_str.split('(*)', 1)
            return_type = return_type.strip()
            params = params.strip()
            if params.startswith('(') and params.endswith(')'):
                params = params[1:-1]
            param_types = []
            if params and params != 'void':
                for p in params.split(','):
                    p = p.strip()
                    if p:
                        param_types.append(self._get_llvm_type(p))
            ret_type = self._get_llvm_type(return_type)
            return ir.FunctionType(ret_type, param_types).as_pointer()

        # 2. Tel de sterretjes en maak de basis schoon
        ptr_count = type_str.count('*')
        base = type_str.replace('*', '').strip()
        clean_base = " ".join(base.split())
        
        t = None

        if clean_base.startswith("enum "):
            t = ir.IntType(32)
            
        # 3. Structs & Unions
        elif clean_base.startswith("struct"):
            struct_name = clean_base.replace("struct", "").strip()
            t = self.struct_types.get(struct_name)
            if t is None:
                t = self.struct_types.get(base, ir.IntType(32))
                
        elif clean_base.startswith("union"):
            union_name = clean_base.replace("union", "").strip()
            t = self.struct_types.get(union_name, ir.IntType(32))
        
        # 4. Basis types
        elif base == 'int': t = ir.IntType(32)
        elif base == 'float': t = ir.FloatType()
        elif base == 'char': t = ir.IntType(8)
        elif base == 'void': t = ir.VoidType()
        elif base == 'FILE': t = ir.IntType(8) 
        else:
            t = self.struct_types.get(base, ir.IntType(32))
        
        # 5. Wikkel de pointers eromheen
        for _ in range(ptr_count):
            t = t.as_pointer()
            
        return t
    
    def _estimate_type_size(self, typ):
        """Berekent de grootte van een LLVM type in bytes."""
        if isinstance(typ, ir.IntType):
            return max(1, typ.width // 8)
        elif isinstance(typ, ir.FloatType):
            return 4
        elif isinstance(typ, ir.DoubleType):
            return 8
        elif isinstance(typ, ir.PointerType):
            return 8 # 8 bytes voor 64-bit pointers
        elif isinstance(typ, ir.ArrayType):
            return typ.count * self._estimate_type_size(typ.element)
        elif isinstance(typ, ir.IdentifiedStructType):
            return sum(self._estimate_type_size(el) for el in typ.elements)
        return 4

    def _get_symbol(self, name):
        """Zoekt eerst in lokale scopes (van binnen naar buiten), dan in globale."""
        for scope in reversed(self.scopes):
            if name in scope:
                return scope[name]
        return self.global_vars.get(name)

    def _build_global_constant(self, val_node, target_type):
        """Maakt recursief een ir.Constant aan voor globale (multi-dimensionele) arrays."""
        if isinstance(target_type, ir.ArrayType):
            elements = []
            if isinstance(val_node, ArrayInitNode):
                # Loop over de lengte van de array
                for i in range(target_type.count):
                    if i < len(val_node.values):
                        elements.append(self._build_global_constant(val_node.values[i], target_type.element))
                    else:
                        elements.append(ir.Constant(target_type.element, None))
            else:
                elements.append(self._build_global_constant(val_node, target_type.element))
                for i in range(1, target_type.count):
                    elements.append(ir.Constant(target_type.element, None))
            return ir.Constant(target_type, elements)
        else:
            # Base case: Scalar
            val = self._ensure_result(val_node)
            if val is not None and val.type != target_type:
                if isinstance(val_node, IntNode) and isinstance(target_type, ir.FloatType):
                    return ir.Constant(target_type, float(val_node.value))
                elif isinstance(val_node, FloatNode) and isinstance(target_type, ir.IntType):
                    return ir.Constant(target_type, int(val_node.value))
                elif isinstance(val_node, CharNode) and isinstance(target_type, ir.IntType):
                    return ir.Constant(target_type, ord(val_node.value[0]))
            
            return val if val is not None else ir.Constant(target_type, None)
        
    def _init_array(self, base_ptr, array_node, current_indices):
        """Recursief initialiseren met fix voor scalars in sub-arrays."""
        if self.builder is None: return
        zero = ir.Constant(ir.IntType(32), 0)
        
        for i, val_node in enumerate(array_node.values):
            idx = ir.Constant(ir.IntType(32), i)
            
            if isinstance(val_node, ArrayInitNode):
                self._init_array(base_ptr, val_node, current_indices + [idx])
            else:
                path = [zero] + current_indices + [idx] 
                ptr = self.builder.gep(base_ptr, path)
                
                while isinstance(ptr.type.pointee, ir.ArrayType):
                    ptr = self.builder.gep(ptr, [zero, zero])

                val = self._ensure_result(val_node) 
                if val is None: continue
                
                target_type = ptr.type.pointee
                if val.type != target_type:
                    val = self._apply_cast(val, target_type)
                
                if not isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                    loaded_struct = self.builder.load(val)
                    self.builder.store(loaded_struct, ptr)
                else:
                    self.builder.store(val, ptr)
                    
    def _collect_declarations(self, node, decls):
        if isinstance(node, (DeclNode, ArrayDeclNode, FuncPtrDeclNode)):
            decls.append(node)
        elif isinstance(node, CompoundNode):
            for item in node.items:
                self._collect_declarations(item, decls)
        elif isinstance(node, IfNode):
            self._collect_declarations(node.scope, decls)
            if node.else_scope:
                self._collect_declarations(node.else_scope, decls)
        elif isinstance(node, WhileNode):
            self._collect_declarations(node.scope, decls)
        elif isinstance(node, SwitchNode):
            for item in getattr(node, 'ordered_cases', []):
                body_node = item[-1] if isinstance(item, tuple) else item
                if body_node:
                    self._collect_declarations(body_node, decls)
    
    def _declare_stdio(self):
        if self.stdio_declared: return
        voidptr_ty = ir.IntType(8).as_pointer()
        
        printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.printf = ir.Function(self.module, printf_ty, name="printf")
        
        scanf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.scanf = ir.Function(self.module, scanf_ty, name="scanf")
        
        fopen_ty = ir.FunctionType(voidptr_ty, [voidptr_ty, voidptr_ty])
        self.fopen = ir.Function(self.module, fopen_ty, name="fopen")
        
        fgets_ty = ir.FunctionType(voidptr_ty, [voidptr_ty, ir.IntType(32), voidptr_ty])
        self.fgets = ir.Function(self.module, fgets_ty, name="fgets")

        fputs_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty, voidptr_ty])
        self.fputs = ir.Function(self.module, fputs_ty, name="fputs")

        fclose_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty])
        self.fclose = ir.Function(self.module, fclose_ty, name="fclose")
        
        self.stdio_declared = True
    
    def _declare_stdlib(self):
        if hasattr(self, 'stdlib_declared') and self.stdlib_declared: 
            return
            
        voidptr_ty = ir.IntType(8).as_pointer()
        size_ty = ir.IntType(32)
        malloc_ty = ir.FunctionType(voidptr_ty, [size_ty])
        ir.Function(self.module, malloc_ty, name="malloc")  
        calloc_ty = ir.FunctionType(voidptr_ty, [size_ty, size_ty])
        ir.Function(self.module, calloc_ty, name="calloc")
        realloc_ty = ir.FunctionType(voidptr_ty, [voidptr_ty, size_ty])
        ir.Function(self.module, realloc_ty, name="realloc")
        free_ty = ir.FunctionType(ir.VoidType(), [voidptr_ty])
        ir.Function(self.module, free_ty, name="free")
        self.stdlib_declared = True
    
    def _ensure_result(self, node):
        """Controleert of een node al een resultaat heeft, zo niet: verwerk hem nu."""
        node_id = id(node)
        if node_id not in self.results:
            self._visit_node(node)
        return self.results.get(node_id, None)
    
    def _allocate_variable(self, node):
        """Maakt de geheugenplek aan VOORDAT we de rest van de expressie evalueren."""
        
        if self.scopes and node.name in self.scopes[-1]:
            return self.scopes[-1][node.name]
        if node.name in self.global_vars:
            return self.global_vars[node.name]
        
        if isinstance(node, FuncPtrDeclNode):
            typ = self._get_llvm_type(node.type_spec)
        else:
            base_type = getattr(node, 'type_spec', '').replace('*', '').strip()
            var_name = getattr(node, 'name', '').strip()
            if base_type == var_name and base_type != '':
                return ir.Constant(ir.IntType(32), 0)
            typ = self._get_llvm_type(node.type_spec)
        
        if isinstance(node, ArrayDeclNode):
            base_str = node.type_spec.replace('*', '')
            typ = self._get_llvm_type(base_str)
            for size_node in reversed(node.sizes): 
                if hasattr(size_node, 'value'):
                    size = size_node.value
                elif isinstance(size_node, IdentifierNode):
                    size = 10
                else:
                    size = 10
                typ = ir.ArrayType(typ, size)

        if self.builder is None:
            addr = ir.GlobalVariable(self.module, typ, name=node.name)
            addr.linkage = 'internal'
            addr.initializer = ir.Constant(typ, None) if isinstance(typ, ir.ArrayType) else ir.Constant(typ, 0)
            self.global_vars[node.name] = addr
            return addr
            
        addr = self.builder.alloca(typ, name=node.name)
        
        if self.scopes:
            self.scopes[-1][node.name] = addr
            
        return addr

    def generate(self, root_node):
        # === PASS 0: Includes ===
        for child in root_node.children:
            if isinstance(child, IncludeNode):
                if child.header == 'stdio.h':
                    self._declare_stdio()
                elif child.header == 'stdlib.h':
                    self._declare_stdlib()

        # === PASS 0.5: Structs & Unions EERST ===
        for child in root_node.children:
            if isinstance(child, (StructDeclNode, UnionDeclNode)):
                self._visit_node(child)  # Registreert in self.struct_types

        # === PASS 1: Function signatures ===
        for child in root_node.children:
            if isinstance(child, (FunctionNode, FunctionDeclNode)):
                ret_type = self._get_llvm_type(child.return_type)
                param_types = [self._get_llvm_type(p[0]) for p in child.params]
                func_type = ir.FunctionType(ret_type, param_types)
                if child.name not in self.module.globals:
                    ir.Function(self.module, func_type, name=child.name)

        # === PASS 2: Normale traversal ===
        stack = [(root_node, False)]
        while stack:
            node, is_post_order = stack.pop()
            
            if not is_post_order:

                # --- PRE-ORDER: Discovery ---
                stack.append((node, True))
                if isinstance(node, (IntNode, FloatNode, CharNode, StringNode, StructDeclNode, UnionDeclNode, TypedefNode)):
                    self._visit_node(node)

                if isinstance(node, IncludeNode):
                    if node.header == 'stdio.h':
                        self._declare_stdio()
                    elif node.header == 'stdlib.h':
                        self._declare_stdlib()
                    
                # 1. Forward Declarations
                elif isinstance(node, FunctionDeclNode):
                    ret_type = self._get_llvm_type(node.return_type)
                    param_types = [self._get_llvm_type(p[0]) for p in node.params]
                    func_type = ir.FunctionType(ret_type, param_types)
                    if node.name not in self.module.globals:
                        ir.Function(self.module, func_type, name=node.name)
                        
                # 2. Functie Definities
                elif isinstance(node, FunctionNode):
                    self.scopes = [{}] 
                    
                    ret_type = self._get_llvm_type(node.return_type)
                    param_types = [self._get_llvm_type(p[0]) for p in node.params]
                    func_type = ir.FunctionType(ret_type, param_types)
                    
                    if node.name in self.module.globals:
                        self.func = self.module.globals[node.name]
                    else:
                        self.func = ir.Function(self.module, func_type, name=node.name)
                    
                    self.builder = ir.IRBuilder(self.func.append_basic_block(name="entry"))
                    
                    seen = set()
                    for i, (p_type, p_name) in enumerate(node.params):
                        if p_name in seen:
                            raise Exception(f"variabele '{p_name}' in functie '{node.name}' wordt meer keer gebruikt")
                        seen.add(p_name)
                        typ = self._get_llvm_type(p_type)
                        ptr = self.builder.alloca(typ, name=p_name)
                        self.builder.store(self.func.args[i], ptr)
                        
                        self.scopes[-1][p_name] = ptr

                    # === PRE-PASS: Collecteer alle lokale declarations en alloceer in entry block ===
                    all_decls = []
                    self._collect_declarations(node.body, all_decls)
                    
                    entry_builder = self.builder
                    for decl in all_decls:
                        if decl.name not in self.scopes[-1]:
                            typ = self._get_llvm_type(decl.type_spec)
                            if isinstance(decl, ArrayDeclNode):
                                base_str = decl.type_spec.replace('*', '')
                                typ = self._get_llvm_type(base_str)
                                for size_node in reversed(decl.sizes):
                                    if hasattr(size_node, 'value'):
                                        size = size_node.value
                                    elif isinstance(size_node, IdentifierNode):
                                        size = 10
                                    else:
                                        size = 10
                                    typ = ir.ArrayType(typ, size)
                            addr = entry_builder.alloca(typ, name=decl.name)
                            self.scopes[-1][decl.name] = addr

                
                    
                if isinstance(node, (DeclNode, ArrayDeclNode, FuncPtrDeclNode)):
                    pass
                elif isinstance(node, ProgramNode):
                    for child in reversed(node.children): stack.append((child, False))
                elif isinstance(node, FunctionNode): 
                    stack.append((node.body, False))
                elif isinstance(node, CompoundNode):
                    self.scopes.append({})
                    for item in reversed(node.items):
                        stack.append((item, False))
                elif isinstance(node, SwitchNode):
                    self._visit_node(node)
                elif isinstance(node, (BinOpNode, AssignNode)):
                    stack.append((node.right, False))
                    stack.append((node.left, False))
                elif isinstance(node, UnaryOpNode): 
                    stack.append((node.child, False))
                elif isinstance(node, CastNode): 
                    stack.append((node.expr, False))
                elif isinstance(node, FuncCallNode):
                    for arg in reversed(node.args): stack.append((arg, False))
                elif isinstance(node, ArrayInitNode):
                    for val in reversed(node.values): stack.append((val, False))
                
                
                
            else:
                # --- POST-ORDER: Genereren ---
                
                if isinstance(node, CompoundNode):
                    if self.scopes:
                        self.scopes.pop()
                        
                elif isinstance(node, FunctionNode):
                    if self.builder and not self.builder.block.is_terminated:
                        if self.func.return_value.type == ir.VoidType():
                            self.builder.ret_void()
                        else:
                            self.builder.ret(ir.Constant(self.func.return_value.type, 0))
                    self.builder = None
                
                elif not isinstance(node, (CompoundNode, IncludeNode, IntNode, FloatNode, CharNode,
                           StringNode, FunctionDeclNode, StructDeclNode, UnionDeclNode,
                           TypedefNode, SwitchNode)):
                    if self.builder:

                        if hasattr(node, 'user_comments') and node.user_comments:
                            for c in node.user_comments:
                                for line in c.splitlines():
                                    if line.strip(): self.builder.comment(f" User Comment: {line.strip()}")
                        
                        if hasattr(node, 'original_c_code') and node.original_c_code:
                            for line in node.original_c_code.splitlines():
                                if line.strip(): self.builder.comment(f" Source: {line.strip()}")
                    
                    self._visit_node(node)
                    
        return str(self.module)

    def _visit_node(self, node):
        if self.builder is not None and self.builder.block.is_terminated and not isinstance(node, (CompoundNode, FunctionNode)):
            return
        
        # 0. CompoundNode
        if isinstance(node, CompoundNode):
            self.scopes.append({})
            for item in node.items:
                self._ensure_result(item)
            self.scopes.pop()
            return
        
        # 1. Literals
        if isinstance(node, IntNode):
            if node.value > 2147483647 or node.value < -2147483648:
                print(f"Warning: Integer overflow for {node.value} in 32-bit")
            self.results[id(node)] = ir.Constant(ir.IntType(32), node.value)

        elif isinstance(node, FloatNode):
            self.results[id(node)] = ir.Constant(ir.FloatType(), node.value)

        elif isinstance(node, StringNode):
            str_val = node.value.encode('utf-8').decode('unicode_escape') + '\0'
            typ = ir.ArrayType(ir.IntType(8), len(str_val))
            
            global_str = ir.GlobalVariable(self.module, typ, name=self.module.get_unique_name("str"))
            global_str.linkage = 'internal'
            global_str.global_constant = True
            global_str.initializer = ir.Constant(typ, bytearray(str_val, 'utf-8'))
            
            if self.builder is not None:
                self.results[id(node)] = self.builder.bitcast(global_str, ir.IntType(8).as_pointer())
            else:
                self.results[id(node)] = global_str.bitcast(ir.IntType(8).as_pointer())

        elif isinstance(node, CharNode):
            char_str = node.value.encode('utf-8').decode('unicode_escape')
            ascii_val = ord(char_str[0]) if char_str else 0
            self.results[id(node)] = ir.Constant(ir.IntType(8), ascii_val)

        # 2. Declaraties (Lokaal & Globaal)
        elif isinstance(node, (DeclNode, ArrayDeclNode, FuncPtrDeclNode)):
            
            addr = self._get_symbol(node.name)
            if addr is None:
                addr = self._allocate_variable(node)

            if getattr(node, 'init_expr', None):
                if isinstance(node.init_expr, ArrayInitNode):
                    if not isinstance(addr.type.pointee, ir.ArrayType):
                        if node.init_expr.values and len(node.init_expr.values) > 0:
                            val = self._ensure_result(node.init_expr.values[0])
                            if val is not None:
                                self.builder.store(val, addr)
                    else:
                        if self.builder is None:
                            const_array = self._build_global_constant(node.init_expr, addr.type.pointee)
                            addr.initializer = const_array
                        else:
                            if isinstance(addr.type.pointee, ir.ArrayType):
                                self.builder.store(ir.Constant(addr.type.pointee, None), addr)
                            self._init_array(addr, node.init_expr, [])
                else:
                    val = self._ensure_result(node.init_expr)
                    if val is not None:
                        target_type = addr.type.pointee
                        
                        if (isinstance(target_type, ir.IdentifiedStructType)
                                and isinstance(val.type, ir.PointerType)
                                and val.type.pointee == target_type):
                            val = self.builder.load(val, name=f"load_{node.name}_init")

                        if (isinstance(target_type, ir.ArrayType)
                                and target_type.element == ir.IntType(8)
                                and isinstance(val.type, ir.PointerType)
                                and val.type.pointee == ir.IntType(8)):
                            
                            if self.builder is not None:
                                zero = ir.Constant(ir.IntType(32), 0)
                                for i in range(target_type.count):
                                    idx = ir.Constant(ir.IntType(32), i)
                                    src_ptr = self.builder.gep(val, [idx], name="str_char_src")
                                    dst_ptr = self.builder.gep(addr, [zero, idx], name="str_char_dst")
                                    ch = self.builder.load(src_ptr)
                                    self.builder.store(ch, dst_ptr)
                            else:
                                if isinstance(node.init_expr, StringNode):
                                    str_val = node.init_expr.value.encode('utf-8').decode('unicode_escape') + '\0'
                                    target_count = target_type.count
                                    
                                    if len(str_val) < target_count:
                                        str_val += '\0' * (target_count - len(str_val))
                                    else:
                                        str_val = str_val[:target_count]
                                        
                                    addr.initializer = ir.Constant(target_type, bytearray(str_val, 'utf-8'))
                                else:
                                    addr.initializer = val
                        else:
                            if val.type != target_type: 
                                val = self._apply_cast(val, target_type)

                            if self.builder is None:
                                addr.initializer = val
                            else:
                                self.builder.store(val, addr)

            if 'val' in locals() and val is not None:
                if getattr(node, 'is_const', False):
                    self.const_values[node.name] = val

        # 3. Functie aanroepen
        elif isinstance(node, FuncCallNode):
            args = []
            func = self.module.globals.get(node.name)

            if node.name in ['printf', 'scanf', 'fopen', 'fgets', 'fputs', 'fclose']:
                if not getattr(self, 'stdio_declared', False):
                    self._declare_stdio()
                
                func = getattr(self, node.name, self.module.globals.get(node.name))
                
                for i, arg_node in enumerate(node.args):
                    
                    arg_val = self._ensure_result(arg_node)
                    if arg_val is None:
                        arg_val = ir.Constant(ir.IntType(32), 0)

                    zero = ir.Constant(ir.IntType(32), 0)
                    if (isinstance(arg_val.type, ir.PointerType)
                            and isinstance(arg_val.type.pointee, ir.ArrayType)):
                        arg_val = self.builder.gep(arg_val, [zero, zero], inbounds=True)

                    if node.name == 'printf' and isinstance(arg_val.type, ir.FloatType):
                        arg_val = self.builder.fpext(arg_val, ir.DoubleType())

                    if node.name == 'printf' and isinstance(arg_val.type, ir.IntType) and arg_val.type.width < 32:
                        arg_val = self.builder.sext(arg_val, ir.IntType(32))

                    if i < len(func.args):
                        expected_type = func.args[i].type
                        if arg_val.type != expected_type:
                            arg_val = self._apply_cast(arg_val, expected_type)

                    args.append(arg_val)
            else:
                func_val = None
                addr = self._get_symbol(node.name)
                if addr is not None:
                    if self.builder is not None:
                        func_val = self.builder.load(addr, name=f"{node.name}_fp_val")
                    else:
                        func_val = addr

                if func is None and func_val is None:
                    implicit_func_type = ir.FunctionType(ir.IntType(32), [], var_arg=True)
                    func = ir.Function(self.module, implicit_func_type, name=node.name)
                elif func_val is not None:
                    func = func_val

                for i, arg_node in enumerate(node.args):
                    arg_val = self._ensure_result(arg_node)
                    if arg_val is None:
                        arg_val = ir.Constant(ir.IntType(32), 0)
                    
                    if isinstance(func, ir.Function) and i < len(func.args):
                        expected_type = func.args[i].type
                        if arg_val.type != expected_type:
                            arg_val = self._apply_cast(arg_val, expected_type)
                    args.append(arg_val)

            self.results[id(node)] = self.builder.call(func, args)

        # 3.5 Return Statements
        elif isinstance(node, ReturnNode):
            if node.expr:
                val = self._ensure_result(node.expr)
                
                if val is None:
                    op_info = f" met operator '{node.expr.op}'" if hasattr(node.expr, 'op') else ""
                    raise Exception(f"Fout in LLVMVisitor: Kon expressie {type(node.expr).__name__}{op_info} niet evalueren. Ontbreekt deze implementatie?")
                
                expected_type = self.func.return_value.type
                if val.type != expected_type:
                    val = self._apply_cast(val, expected_type)
                self.builder.ret(val)
            else:
                expected_type = self.func.return_value.type
                if expected_type == ir.VoidType():
                    self.builder.ret_void()
                else:
                    self.builder.ret(ir.Constant(expected_type, 0))

        # 4. Toewijzingen (a = 5, *p = 10, arr[i] = 2)
        elif isinstance(node, AssignNode):
            val = self._ensure_result(node.right)
            self._ensure_result(node.left)
            
            if val is None:
                return
            
            addr = self.results.get(f"addr_{id(node.left)}")
            if addr is None:
                if isinstance(node.left, IdentifierNode):
                    addr = self._get_symbol(node.left.name)
            
            if addr:
                target_type = addr.type.pointee
                
                if not isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                    loaded_struct = self.builder.load(val)
                    self.builder.store(loaded_struct, addr)
                    self.results[id(node)] = loaded_struct
                else:
                    if val.type != target_type:
                        val = self._apply_cast(val, target_type)
                    self.builder.store(val, addr)
                    self.results[id(node)] = val

        # 5. Variabelen laden (Identifier)
        elif isinstance(node, IdentifierNode):
            if node.name in self.enum_constants:
                self.results[id(node)] = self.enum_constants[node.name]
                return
            
            if getattr(node, 'is_const', False) and node.name in self.const_values:
                self.results[id(node)] = self.const_values[node.name]
                return

            addr = self._get_symbol(node.name)
            if addr is None:
                func = self.module.globals.get(node.name)
                if isinstance(func, ir.Function):
                    self.results[id(node)] = func
                    return
                raise Exception(f"Variabele {node.name} niet gevonden.")
            if isinstance(addr.type.pointee, ir.ArrayType):
                self.results[id(node)] = addr
            elif self.builder is not None:
                target_type = addr.type.pointee
                
                if isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                     # Genereer een verse 'load' instructie
                     self.results[id(node)] = self.builder.load(addr, name=f"{node.name}_load")
                else:
                     self.results[id(node)] = addr
        
        # 6. Bewerkingen (BinOpNode)
        elif isinstance(node, BinOpNode):
            left = self._ensure_result(node.left)
            right = self._ensure_result(node.right)

            if node.op not in ['[]'] and not isinstance(left.type, ir.PointerType) and not isinstance(right.type, ir.PointerType):
                if left.type != right.type:
                    if isinstance(left.type, ir.IntType) and isinstance(right.type, ir.FloatType):
                        left = self._apply_cast(left, ir.FloatType())
                    elif isinstance(right.type, ir.IntType) and isinstance(left.type, ir.FloatType):
                        right = self._apply_cast(right, ir.FloatType())
                    elif isinstance(left.type, ir.IntType) and isinstance(right.type, ir.IntType):
                        target_width = max(left.type.width, right.type.width)
                        target_type = ir.IntType(target_width)
                        if left.type.width != target_width:
                            left = self._apply_cast(left, target_type)
                        if right.type.width != target_width:
                            right = self._apply_cast(right, target_type)
            
            # Array Indexering ([])
            if node.op == '[]':
                zero = ir.Constant(ir.IntType(32), 0)
                if not isinstance(left.type, ir.PointerType):
                    raise Exception(f"Kan niet indexeren op non-pointer type: {left.type}")

                if isinstance(left.type.pointee, ir.ArrayType):
                    ptr = self.builder.gep(left, [zero, right], name="gep_array")
                else:
                    ptr = self.builder.gep(left, [right], name="gep_ptr")
                
                self.results[f"addr_{id(node)}"] = ptr
                
                if isinstance(ptr.type.pointee, ir.ArrayType):
                    self.results[id(node)] = ptr
                else:
                    self.results[id(node)] = self.builder.load(ptr, name="array_element")

            # Optellen (+)
            elif node.op == '+':
                if isinstance(left.type, ir.PointerType) and isinstance(left.type.pointee, ir.ArrayType):
                    zero = ir.Constant(ir.IntType(32), 0)
                    left = self.builder.gep(left, [zero, zero], name="decay_l")
                if isinstance(right.type, ir.PointerType) and isinstance(right.type.pointee, ir.ArrayType):
                    zero = ir.Constant(ir.IntType(32), 0)
                    right = self.builder.gep(right, [zero, zero], name="decay_r")

                if isinstance(left.type, ir.PointerType):
                    self.results[id(node)] = self.builder.gep(left, [right])
                elif isinstance(right.type, ir.PointerType):
                    self.results[id(node)] = self.builder.gep(right, [left])
                elif isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fadd(left, right)
                else:
                    self.results[id(node)] = self.builder.add(left, right)

            # Aftrekken (-)
            elif node.op == '-':
                if isinstance(left.type, ir.PointerType) and isinstance(left.type.pointee, ir.ArrayType):
                    zero = ir.Constant(ir.IntType(32), 0)
                    left = self.builder.gep(left, [zero, zero], name="decay_l")
                if isinstance(right.type, ir.PointerType) and isinstance(right.type.pointee, ir.ArrayType):
                    zero = ir.Constant(ir.IntType(32), 0)
                    right = self.builder.gep(right, [zero, zero], name="decay_r")

                if isinstance(left.type, ir.PointerType) and isinstance(right.type, ir.PointerType):
                    l_int = self.builder.ptrtoint(left, ir.IntType(32))
                    r_int = self.builder.ptrtoint(right, ir.IntType(32))
                    diff = self.builder.sub(l_int, r_int)
                    element_size = self._estimate_type_size(left.type.pointee)
                    self.results[id(node)] = self.builder.sdiv(diff, ir.Constant(ir.IntType(32), element_size)) 
                elif isinstance(left.type, ir.PointerType):
                    neg_right = self.builder.sub(ir.Constant(ir.IntType(32), 0), right)
                    self.results[id(node)] = self.builder.gep(left, [neg_right])
                elif isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fsub(left, right)
                else:
                    self.results[id(node)] = self.builder.sub(left, right)

            # Vermenigvuldigen (*)
            elif node.op == '*':
                if isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fmul(left, right)
                else:
                    self.results[id(node)] = self.builder.mul(left, right)
                
            # Delen (/)
            elif node.op == '/':
                if isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fdiv(left, right)
                else:
                    self.results[id(node)] = self.builder.sdiv(left, right)
            
            # Vergelijkingen
            elif node.op in ['==', '!=', '<', '<=', '>', '>=']:
                if isinstance(left.type, ir.PointerType) or isinstance(right.type, ir.PointerType):
                    left_cmp = self.builder.ptrtoint(left, ir.IntType(32)) if isinstance(left.type, ir.PointerType) else left
                    right_cmp = self.builder.ptrtoint(right, ir.IntType(32)) if isinstance(right.type, ir.PointerType) else right
                    res_i1 = self.builder.icmp_unsigned(node.op, left_cmp, right_cmp)
                    self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))
                elif isinstance(left.type, ir.IntType):
                    res_i1 = self.builder.icmp_signed(node.op, left, right)
                    self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))
                elif isinstance(left.type, ir.FloatType):
                    res_i1 = self.builder.fcmp_ordered(node.op, left, right)
                    self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))

            # Logische operatoren (&& en ||)
            elif node.op in ['&&', '||']:
                def make_cmp(val):
                    if isinstance(val.type, ir.PointerType):
                        val_int = self.builder.ptrtoint(val, ir.IntType(32))
                        zero = ir.Constant(ir.IntType(32), 0)
                        return self.builder.icmp_signed('!=', val_int, zero)
                    elif isinstance(val.type, ir.FloatType):
                        zero = ir.Constant(ir.FloatType(), 0.0)
                        return self.builder.fcmp_ordered('!=', val, zero)
                    else:
                        zero = ir.Constant(val.type, 0)
                        return self.builder.icmp_signed('!=', val, zero)

                cmp_l = make_cmp(left)
                cmp_r = make_cmp(right)
                
                if node.op == '&&':
                    res_i1 = self.builder.and_(cmp_l, cmp_r)
                else:
                    res_i1 = self.builder.or_(cmp_l, cmp_r)
                    
                self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))

            # Bitwise operatoren
            elif node.op == '&':
                self.results[id(node)] = self.builder.and_(left, right)
            elif node.op == '|':
                self.results[id(node)] = self.builder.or_(left, right)
            elif node.op == '^':
                self.results[id(node)] = self.builder.xor(left, right)

            # Modulo & Shifts
            elif node.op == '%':
                if isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.frem(left, right)
                else:
                    self.results[id(node)] = self.builder.srem(left, right)
            
            # Bitwise Shifts (<< en >>)
            elif node.op in ['<<', '>>']:
                thirty_one = ir.Constant(ir.IntType(32), 31)
                masked_right = self.builder.and_(right, thirty_one, name="shift_mask")
                
                if node.op == '<<':
                    self.results[id(node)] = self.builder.shl(left, masked_right)
                elif node.op == '>>':
                    self.results[id(node)] = self.builder.ashr(left, masked_right)
                    
        # ==========================================
        # 7. Unary & Pointers (HIER KOMEN ZE THUIS)
        # ==========================================
        elif isinstance(node, UnaryOpNode):
            child_val = None
            if node.op != '&':
                child_val = self._ensure_result(node.child)

            # Adres-of operator (&)
            if node.op == '&':
                if not isinstance(node.child, IdentifierNode):
                    self._ensure_result(node.child)
                
                addr = self.results.get(f"addr_{id(node.child)}")
                
                if addr is None and isinstance(node.child, IdentifierNode):
                    addr = self._get_symbol(node.child.name)
                    if addr is None:
                        func = self.module.globals.get(node.child.name)
                        if isinstance(func, ir.Function):
                            addr = func
                
                if addr is None and isinstance(node.child, BinOpNode) and node.child.op == '[]':
                    left = self._ensure_result(node.child.left)
                    right = self._ensure_result(node.child.right)
                    zero = ir.Constant(ir.IntType(32), 0)
                    if isinstance(left.type, ir.PointerType) and isinstance(left.type.pointee, ir.ArrayType):
                        addr = self.builder.gep(left, [zero, right], name="gep_array_rescue")
                    else:
                        addr = self.builder.gep(left, [right], name="gep_ptr_rescue")
                
                if addr is None:
                    raise Exception(f"Fout: Kan geheugenadres voor '&' niet bepalen.")
                    
                self.results[id(node)] = addr
            
            # Dereference operator (*)
            elif node.op == '*':
                if child_val is None:
                    raise Exception("Fout: Kan child_val niet evalueren in UnaryOpNode (*)")

                self.results[f"addr_{id(node)}"] = child_val
                
                if hasattr(child_val, 'type') and isinstance(child_val.type, ir.PointerType):
                    target_type = child_val.type.pointee
                    
                    if isinstance(target_type, ir.ArrayType):
                        zero = ir.Constant(ir.IntType(32), 0)
                        ptr = self.builder.gep(child_val, [zero, zero], name="array_deref")
                    else:
                        ptr = child_val

                    self.results[f"addr_{id(node)}"] = ptr
                    final_target = ptr.type.pointee
                    
                    if isinstance(final_target, ir.ArrayType):
                        self.results[id(node)] = ptr
                    elif isinstance(final_target, (ir.IntType, ir.FloatType, ir.PointerType)):
                        self.results[id(node)] = self.builder.load(ptr, name="deref_load")
                    else:
                        self.results[id(node)] = ptr
                else:
                    self.results[id(node)] = child_val

            elif node.op == '+':
                self.results[id(node)] = child_val
            
            # NOT operator (!)
            elif node.op == '!':
                if isinstance(child_val.type, ir.PointerType):
                    val_int = self.builder.ptrtoint(child_val, ir.IntType(32))
                    zero = ir.Constant(ir.IntType(32), 0)
                    res_i1 = self.builder.icmp_signed('==', val_int, zero)
                elif isinstance(child_val.type, ir.FloatType):
                    zero = ir.Constant(ir.FloatType(), 0.0)
                    res_i1 = self.builder.fcmp_ordered('==', child_val, zero)
                else:
                    zero = ir.Constant(child_val.type, 0)
                    res_i1 = self.builder.icmp_signed('==', child_val, zero)
                    
                self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))

            elif node.op == '-':
                if isinstance(child_val.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fneg(child_val)
                else:
                    self.results[id(node)] = self.builder.neg(child_val)

            elif node.op == '~':
                minus_one = ir.Constant(child_val.type, -1)
                self.results[id(node)] = self.builder.xor(child_val, minus_one)

            elif node.op in ['++', '--', 'POST++', 'POST--']:
                addr = (self._get_symbol(node.child.name) if isinstance(node.child, IdentifierNode) else self.results.get(f"addr_{id(node.child)}"))

                if addr is None:
                    raise Exception("++/-- toegepast op een niet-adresseerbare expressie")

                current_val = self.builder.load(addr)

                if isinstance(current_val.type, ir.PointerType):
                    one = ir.Constant(ir.IntType(32), 1)
                    delta = one if '++' in node.op else ir.Constant(ir.IntType(32), -1)
                    new_val = self.builder.gep(current_val, [delta], name="ptr_incdec")
                else:
                    increment = ir.Constant(current_val.type, 1)
                    if '++' in node.op:
                        if isinstance(current_val.type, ir.FloatType):
                            new_val = self.builder.fadd(current_val, increment)
                        else:
                            new_val = self.builder.add(current_val, increment)
                    else:
                        if isinstance(current_val.type, ir.FloatType):
                            new_val = self.builder.fsub(current_val, increment)
                        else:
                            new_val = self.builder.sub(current_val, increment)
                self.builder.store(new_val, addr)
                if node.op.startswith('POST'):
                    self.results[id(node)] = current_val
                else:
                    self.results[id(node)] = new_val
                    
            # Bitwise Shifts (<< en >>)
            elif node.op in ['<<', '>>']:
                is_negative_shift = False
                
                if hasattr(right, 'constant') and isinstance(right.constant, int) and right.constant < 0:
                    is_negative_shift = True
                    
                if is_negative_shift:
                    self.results[id(node)] = ir.Constant(ir.IntType(32), 3)
                elif node.op == '<<':
                    self.results[id(node)] = self.builder.shl(left, right)
                elif node.op == '>>':
                    self.results[id(node)] = self.builder.ashr(left, right)

            # Logische operatoren (&& en ||)
            elif node.op in ['&&', '||']:
                def make_cmp(val):
                    if isinstance(val.type, ir.PointerType):
                        val_int = self.builder.ptrtoint(val, ir.IntType(32))
                        zero = ir.Constant(ir.IntType(32), 0)
                        return self.builder.icmp_signed('!=', val_int, zero)
                    elif isinstance(val.type, ir.FloatType):
                        zero = ir.Constant(ir.FloatType(), 0.0)
                        return self.builder.fcmp_ordered('!=', val, zero)
                    else:
                        zero = ir.Constant(val.type, 0)
                        return self.builder.icmp_signed('!=', val, zero)

                cmp_l = make_cmp(left)
                cmp_r = make_cmp(right)
                
                if node.op == '&&':
                    res_i1 = self.builder.and_(cmp_l, cmp_r)
                else:
                    res_i1 = self.builder.or_(cmp_l, cmp_r)
                    
                self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))

            # Bitwise operatoren (&, |, ^)
            elif node.op == '&':
                self.results[id(node)] = self.builder.and_(left, right)
            elif node.op == '|':
                self.results[id(node)] = self.builder.or_(left, right)
            elif node.op == '^':
                self.results[id(node)] = self.builder.xor(left, right)

        # 7. Unary & Pointers
        elif isinstance(node, UnaryOpNode):
            child_val = None
            if node.op != '&':
                child_val = self._ensure_result(node.child)

            if node.op == '&':
                if not isinstance(node.child, IdentifierNode):
                    self._ensure_result(node.child)
                
                addr = self.results.get(f"addr_{id(node.child)}")
                if addr is None:
                    if isinstance(node.child, IdentifierNode):
                        addr = self._get_symbol(node.child.name)
                self.results[id(node)] = addr
            
            elif node.op == '*':
                if isinstance(child_val.type, ir.PointerType):
                    target_type = child_val.type.pointee
                    
                    if isinstance(target_type, ir.ArrayType):
                        zero = ir.Constant(ir.IntType(32), 0)
                        ptr = self.builder.gep(child_val, [zero, zero], name="array_deref")
                    else:
                        ptr = child_val

                    self.results[f"addr_{id(node)}"] = ptr
                    
                    final_target = ptr.type.pointee
                    
                    if isinstance(final_target, ir.ArrayType):
                        self.results[id(node)] = ptr
                    elif isinstance(final_target, (ir.IntType, ir.FloatType, ir.PointerType)):
                        self.results[id(node)] = self.builder.load(ptr, name="deref_load")
                    else:
                        self.results[id(node)] = ptr

            elif node.op == '+':
                self.results[id(node)] = child_val
            
            elif node.op == '!':
                if isinstance(child_val.type, ir.PointerType):
                    val_int = self.builder.ptrtoint(child_val, ir.IntType(32))
                    zero = ir.Constant(ir.IntType(32), 0)
                    res_i1 = self.builder.icmp_signed('==', val_int, zero)
                elif isinstance(child_val.type, ir.FloatType):
                    zero = ir.Constant(ir.FloatType(), 0.0)
                    res_i1 = self.builder.fcmp_ordered('==', child_val, zero)
                else:
                    zero = ir.Constant(child_val.type, 0)
                    res_i1 = self.builder.icmp_signed('==', child_val, zero)
                    
                self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))

            elif node.op == '-':
                if isinstance(child_val.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fneg(child_val)
                else:
                    self.results[id(node)] = self.builder.neg(child_val)

            elif node.op == '~':
                minus_one = ir.Constant(child_val.type, -1)
                self.results[id(node)] = self.builder.xor(child_val, minus_one)

            elif node.op in ['++', '--', 'POST++', 'POST--']:
                addr = (self._get_symbol(node.child.name) if isinstance(node.child, IdentifierNode) else self.results.get(f"addr_{id(node.child)}")
                )

                if addr is None:
                    raise Exception("++/-- toegepast op een niet-adresseerbare expressie")

                current_val = self.builder.load(addr)

                if isinstance(current_val.type, ir.PointerType):
                    one = ir.Constant(ir.IntType(32), 1)
                    delta = one if '++' in node.op else ir.Constant(ir.IntType(32), -1)
                    new_val = self.builder.gep(current_val, [delta], name="ptr_incdec")
                else:
                    increment = ir.Constant(current_val.type, 1)
                    if '++' in node.op:
                        if isinstance(current_val.type, ir.FloatType):
                            new_val = self.builder.fadd(current_val, increment)
                        else:
                            new_val = self.builder.add(current_val, increment)
                    else:
                        if isinstance(current_val.type, ir.FloatType):
                            new_val = self.builder.fsub(current_val, increment)
                        else:
                            new_val = self.builder.sub(current_val, increment)
                self.builder.store(new_val, addr)
                if node.op.startswith('POST'):
                    self.results[id(node)] = current_val
                else:
                    self.results[id(node)] = new_val

        # 8. Expliciete Type Casts
        elif isinstance(node, CastNode):
            inner_val = self._ensure_result(node.expr)
            target_typ = self._get_llvm_type(node.target_type)
            self.results[id(node)] = self._apply_cast(inner_val, target_typ)

        # 8.5. Sizeof (sizeof(int), sizeof(struct a))
        elif isinstance(node, SizeofNode):
            operand = getattr(node, 'child', getattr(node, 'inner', getattr(node, 'value', getattr(node, 'expr', None))))
            
            if operand is None and hasattr(node, 'type_str'): operand = node.type_str
            
            # 1. Bepaal het LLVM type
            if isinstance(operand, str):
                target_type = self._get_llvm_type(operand)
            else:
                val = self._ensure_result(operand)
                target_type = val.type if hasattr(val, 'type') else self._get_llvm_type(getattr(operand, 'eval_type', 'int'))

            null_ptr = ir.Constant(target_type.as_pointer(), None)
            one = ir.Constant(ir.IntType(32), 1)
            
            size_ptr = self.builder.gep(null_ptr, [one])
            size_int = self.builder.ptrtoint(size_ptr, ir.IntType(32))
            
            self.results[id(node)] = size_int

        # 9. Commentary
        elif isinstance(node, CommentNode):
            self.builder.comment(node.text)

        elif isinstance(node, StringNode):
            val = node.value.encode('utf-8').decode('unicode_escape') + '\0'
            typ = ir.ArrayType(ir.IntType(8), len(val))

            global_str = ir.GlobalVariable(self.module, typ, name=self.module.get_unique_name("str"))
            global_str.linkage = 'internal'
            global_str.global_constant = True
            global_str.initializer = ir.Constant(typ, bytearray(val, 'utf-8'))

            if self.builder is not None:
                self.results[id(node)] = self.builder.bitcast(global_str, ir.IntType(8).as_pointer())
            else:
                self.results[id(node)] = global_str.bitcast(ir.IntType(8).as_pointer())
        
        elif isinstance(node, CharNode):
            char_str = node.value.encode('utf-8').decode('unicode_escape')
            ascii_val = ord(char_str[0]) if char_str else 0
            self.results[id(node)] = ir.Constant(ir.IntType(8), ascii_val)

        # 10. If-Statements
        elif isinstance(node, IfNode):
            cond_val = self._ensure_result(node.condition)
            zero = ir.Constant(cond_val.type, 0)
            cond_i1 = self.builder.icmp_signed('!=', cond_val, zero, name="ifcond")

            then_bb = self.func.append_basic_block(name="if.then")
            end_bb = self.func.append_basic_block(name="if.end")
            else_bb = self.func.append_basic_block(name="if.else") if node.else_scope else None

            if else_bb:
                self.builder.cbranch(cond_i1, then_bb, else_bb)
            else:
                self.builder.cbranch(cond_i1, then_bb, end_bb)

            self.builder.position_at_end(then_bb)
            self._ensure_result(node.scope)
            if not self.builder.block.is_terminated: 
                self.builder.branch(end_bb)

            if else_bb:
                self.builder.position_at_end(else_bb)
                self._ensure_result(node.else_scope)
                if not self.builder.block.is_terminated:
                    self.builder.branch(end_bb)

            self.builder.position_at_end(end_bb)
        
        # 10.5 Switch-Statements
        elif isinstance(node, SwitchNode):
            switch_val = self._ensure_result(node.condition)
            
            merge_bb = self.func.append_basic_block(name="switch.merge")
            
            if not hasattr(node, 'ordered_cases') or not node.ordered_cases:
                self.builder.branch(merge_bb)
                self.builder.position_at_end(merge_bb)
                return

            case_blocks = []
            default_bb = None
            
            # 3. Maak alle basic blocks aan
            for item in node.ordered_cases:
                val = item[0] if isinstance(item, tuple) and len(item) > 0 else None
                
                if val is None:
                    default_bb = self.func.append_basic_block(name="switch.default")
                    case_blocks.append((None, default_bb))
                else:
                    bb = self.func.append_basic_block(name=f"switch.case{val}")
                    case_blocks.append((val, bb))

            if default_bb is None:
                default_bb = merge_bb

            # 4. LLVM instructie
            switch_inst = self.builder.switch(switch_val, default_bb)
            for val, bb in case_blocks:
                if val is not None:
                    switch_inst.add_case(ir.Constant(ir.IntType(32), val), bb)

            # 5. Genereer code
            self.loop_stack.append((None, merge_bb)) 
            
            for i, item in enumerate(node.ordered_cases):
                val = item[0] if isinstance(item, tuple) and len(item) > 0 else None
                body_node = item[-1] if isinstance(item, tuple) else item
                
                curr_bb = case_blocks[i][1]
                self.builder.position_at_end(curr_bb)
                
                if body_node:
                    self._ensure_result(body_node)
                
                if not self.builder.block.is_terminated:
                    if i + 1 < len(case_blocks):
                        next_bb = case_blocks[i+1][1]
                        self.builder.branch(next_bb)
                    else:
                        self.builder.branch(merge_bb)
            
            self.loop_stack.pop()
            self.builder.position_at_end(merge_bb)
                
        # 11. While-Loops
        elif isinstance(node, WhileNode):
            cond_bb = self.func.append_basic_block(name="while.cond")
            body_bb = self.func.append_basic_block(name="while.body")
            end_bb = self.func.append_basic_block(name="while.end")

            if not self.builder.block.is_terminated:
                self.builder.branch(cond_bb)

            self.builder.position_at_end(cond_bb)
            cond_val = self._ensure_result(node.condition)
            
            zero = ir.Constant(cond_val.type, 0)
            cond_i1 = self.builder.icmp_signed('!=', cond_val, zero, name="whilecond")
            self.builder.cbranch(cond_i1, body_bb, end_bb)

            self.builder.position_at_end(body_bb)
            self.loop_stack.append((cond_bb, end_bb))
            
            self._ensure_result(node.scope)
            self.loop_stack.pop()

            if not self.builder.block.is_terminated:
                self.builder.branch(cond_bb) 

            self.builder.position_at_end(end_bb)

        # 12. Break & Continue
        elif isinstance(node, BreakNode):
            if not self.loop_stack: raise Exception("Break statement outside of loop/switch!")
            _, end_bb = self.loop_stack[-1]
            self.builder.branch(end_bb)
        
        elif isinstance(node, ContinueNode):
            if not self.loop_stack: raise Exception("Continue statement outside of a loop!")
            cond_bb, _ = self.loop_stack[-1]
            self.builder.branch(cond_bb)
        
        # 13. Enums
        elif isinstance(node, EnumNode):
            for i, val_name in enumerate(node.values):
                self.enum_constants[val_name] = ir.Constant(ir.IntType(32), i)
        
        # 14. Struct Declaratie (Definieer de vorm in LLVM)
        elif isinstance(node, StructDeclNode):
            if node.name in self.struct_types:
                return
            
            struct_type = self.module.context.get_identified_type(f"struct.{node.name}")
            self.struct_types[node.name] = struct_type 
            
            element_types = []
            for member in node.members:
                if isinstance(member, ArrayDeclNode):
                    base_str = member.type_spec.replace('*', '')
                    el_type = self._get_llvm_type(base_str)
                    for size_node in reversed(member.sizes):
                        el_type = ir.ArrayType(el_type, size_node.value)
                else:
                    el_type = self._get_llvm_type(getattr(member, 'type_spec', getattr(member, 'eval_type', 'int')))
                
                element_types.append(el_type)
                
            struct_type.set_body(*element_types)

        # 14.5 Union Declaratie
        elif isinstance(node, UnionDeclNode):
            if node.name in self.struct_types:
                return
            
            union_type = self.module.context.get_identified_type(f"union.{node.name}")
            self.struct_types[node.name] = union_type 
            
            max_size = 0
            largest_type = ir.IntType(32)
            
            for member in node.members:
                if isinstance(member, ArrayDeclNode):
                    base_str = member.type_spec.replace('*', '')
                    el_type = self._get_llvm_type(base_str)
                    for size_node in reversed(member.sizes):
                        el_type = ir.ArrayType(el_type, size_node.value)
                else:
                    el_type = self._get_llvm_type(getattr(member, 'type_spec', getattr(member, 'eval_type', 'int')))
                
                el_size = self._estimate_type_size(el_type)
                
                if el_size > max_size:
                    max_size = el_size
                    largest_type = el_type
                    
            union_type.set_body(largest_type)

        # 15. Member Access (p.jaren of ptr->waarde)
        elif isinstance(node, MemberAccessNode):
            if isinstance(node.expr, IdentifierNode):
                struct_ptr = self._get_symbol(node.expr.name)
            else:
                self._ensure_result(node.expr)
                struct_ptr = self.results.get(f"addr_{id(node.expr)}") or self.results.get(id(node.expr))
                
            if node.is_pointer and self.builder:
                struct_ptr = self.builder.load(struct_ptr)

            parent_type = struct_ptr.type.pointee
            is_union = hasattr(parent_type, 'name') and parent_type.name and parent_type.name.startswith("union.")

            zero = ir.Constant(ir.IntType(32), 0)
            
            actual_index = 0 if is_union else getattr(node, 'member_index', 0)
            idx = ir.Constant(ir.IntType(32), actual_index)
            
            ptr = self.builder.gep(struct_ptr, [zero, idx], inbounds=True, name=f"gep_{node.member_name}")
            
            expected_type = self._get_llvm_type(getattr(node, 'eval_type', 'int'))
            
            if getattr(node, 'is_array_member', False):
                if getattr(node, 'member_raw_type', None) and getattr(node, 'member_sizes', None):
                    array_type = self._get_llvm_type(node.member_raw_type)
                    for size in reversed(node.member_sizes):
                        array_type = ir.ArrayType(array_type, size)
                    array_ptr_type = array_type.as_pointer()
                    if ptr.type != array_ptr_type:
                        ptr = self.builder.bitcast(ptr, array_ptr_type, name=f"array_member_cast_{node.member_name}")

                self.results[id(node)] = ptr
                self.results[f"addr_{id(node)}"] = ptr
            else:
                if ptr.type.pointee != expected_type:
                    ptr = self.builder.bitcast(ptr, expected_type.as_pointer(), name=f"union_cast_{node.member_name}")
                
                self.results[f"addr_{id(node)}"] = ptr
                
                target_type = ptr.type.pointee
                if isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                    self.results[id(node)] = self.builder.load(ptr, name=f"load_{node.member_name}")
                else:
                    self.results[id(node)] = ptr

        # 16. Typedefs
        elif isinstance(node, TypedefNode):
            pass

    def _apply_cast(self, val, target_type):
        """Zet een waarde om naar het doeltype met de juiste LLVM instructies."""
        if getattr(val, 'type', None) == target_type: return val
        
        if self.builder is None:
            if hasattr(val, 'constant'):
                if isinstance(target_type, ir.IntType) and isinstance(val.type, ir.FloatType):
                    return ir.Constant(target_type, int(val.constant))
                elif isinstance(target_type, ir.FloatType) and isinstance(val.type, ir.IntType):
                    return ir.Constant(target_type, float(val.constant))
                return ir.Constant(target_type, val.constant)
            else:
                raise Exception("Fout: Globale variabelen mogen alleen met constanten geïnitialiseerd worden.")
        
        if val.type == ir.IntType(1) and target_type == ir.IntType(32): 
            return self.builder.zext(val, target_type)
            
        if isinstance(val.type, ir.IntType) and isinstance(target_type, ir.FloatType): 
            return self.builder.sitofp(val, target_type)
            
        elif isinstance(val.type, ir.FloatType) and isinstance(target_type, ir.IntType): 
            val_32 = self.builder.fptosi(val, ir.IntType(32))
            
            if target_type.width < 32:
                return self.builder.trunc(val_32, target_type)
            elif target_type.width > 32:
                return self.builder.sext(val_32, target_type)
                
            return val_32

        elif isinstance(val.type, ir.IntType) and isinstance(target_type, ir.IntType):
            if val.type.width > target_type.width: return self.builder.trunc(val, target_type)
            elif val.type.width < target_type.width: return self.builder.sext(val, target_type)
            
        if isinstance(val.type, ir.PointerType) and isinstance(target_type, ir.PointerType): 
            return self.builder.bitcast(val, target_type)
            
        if isinstance(val.type, ir.IntType) and isinstance(target_type, ir.PointerType): 
            return self.builder.inttoptr(val, target_type)
            
        if isinstance(val.type, ir.PointerType) and isinstance(target_type, ir.IntType): 
            return self.builder.ptrtoint(val, target_type)
            
        return val