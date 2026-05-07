from llvmlite import ir
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
        self.local_vars = {}
        self.results = {}
        self.stdio_declared = False
        self.loop_stack = []
        self.enum_constants = {}
        self.struct_types = {}

    def _get_llvm_type(self, type_str):
        if not type_str: return ir.IntType(32)
        base = type_str.replace('*', '').strip()
        
        if base.startswith("struct "):
            struct_name = base.replace("struct ", "")
            t = self.struct_types.get(struct_name, ir.IntType(32))
            
        elif base.startswith("union "):
            union_name = base.replace("union ", "")
            t = self.struct_types.get(union_name, ir.IntType(32))
        
        elif base == 'int': t = ir.IntType(32)
        # ... rest van de types ...
        elif base == 'float': t = ir.FloatType()
        elif base == 'char': t = ir.IntType(8)
        elif base == 'void': t = ir.VoidType()
        elif base == 'FILE': t = ir.IntType(8)
        else: t = ir.IntType(32)
        
        for _ in range(type_str.count('*')):
            t = t.as_pointer()
        return t

    def _get_symbol(self, name):
        """Zoekt eerst in lokale variabelen, dan in globale."""
        return self.local_vars.get(name) or self.global_vars.get(name)

    def _init_array(self, base_ptr, array_node, current_indices):
        """Recursief initialiseren van (multi-dimensionele) arrays."""
        if self.builder is None: return
        zero = ir.Constant(ir.IntType(32), 0)
        
        for i, val_node in enumerate(array_node.values):
            idx = ir.Constant(ir.IntType(32), i)
            path = [zero] + current_indices + [idx] 
            
            if isinstance(val_node, ArrayInitNode):
                self._init_array(base_ptr, val_node, current_indices + [idx])
            else:
                ptr = self.builder.gep(base_ptr, path)
                val = self._ensure_result(val_node)
                
                target_type = ptr.type.pointee
                
                if val.type != target_type:
                    val = self._apply_cast(val, target_type)
                
                if not isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                    loaded_struct = self.builder.load(val)
                    self.builder.store(loaded_struct, ptr)
                else:
                    self.builder.store(val, ptr)

    def _declare_stdio(self):
        if self.stdio_declared: return
        voidptr_ty = ir.IntType(8).as_pointer()
        
        # Bestaande printf en scanf
        printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.printf = ir.Function(self.module, printf_ty, name="printf")
        
        scanf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.scanf = ir.Function(self.module, scanf_ty, name="scanf")
        
        # FILE *fopen(const char *filename, const char *mode)
        fopen_ty = ir.FunctionType(voidptr_ty, [voidptr_ty, voidptr_ty])
        self.fopen = ir.Function(self.module, fopen_ty, name="fopen")
        
        # char *fgets(char *str, int n, FILE *stream)
        fgets_ty = ir.FunctionType(voidptr_ty, [voidptr_ty, ir.IntType(32), voidptr_ty])
        self.fgets = ir.Function(self.module, fgets_ty, name="fgets")

        # int fputs(const char *str, FILE *stream)
        fputs_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty, voidptr_ty])
        self.fputs = ir.Function(self.module, fputs_ty, name="fputs")

        # int fclose(FILE *stream)
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
        
        typ = self._get_llvm_type(node.type_spec)
        
        if isinstance(node, ArrayDeclNode):
            base_str = node.type_spec.replace('*', '')
            typ = self._get_llvm_type(base_str)
            for size_node in reversed(node.sizes): 
                typ = ir.ArrayType(typ, size_node.value)

        # GLOBALE ALLOCATIE
        if self.builder is None:
            addr = ir.GlobalVariable(self.module, typ, name=node.name)
            addr.linkage = 'internal'
            addr.initializer = ir.Constant(typ, None) if isinstance(typ, ir.ArrayType) else ir.Constant(typ, 0)
            self.global_vars[node.name] = addr
            return addr
            
        addr = self.builder.alloca(typ, name=node.name)
        self.local_vars[node.name] = addr
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

        # === PASS 1: Function signatures (NU werkt struct map*) ===
        for child in root_node.children:
            if isinstance(child, (FunctionNode, FunctionDeclNode)):
                ret_type = self._get_llvm_type(child.return_type)
                param_types = [self._get_llvm_type(p[0]) for p in child.params]
                func_type = ir.FunctionType(ret_type, param_types)
                if child.name not in self.module.globals:
                    ir.Function(self.module, func_type, name=child.name)

        # === PASS 2: Normale traversal (jouw bestaande stack-based loop) ===
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
                    self.local_vars = {} # Reset lokale variabelen voor de nieuwe functie!
                    
                    ret_type = self._get_llvm_type(node.return_type)
                    param_types = [self._get_llvm_type(p[0]) for p in node.params]
                    func_type = ir.FunctionType(ret_type, param_types)
                    
                    if node.name in self.module.globals:
                        self.func = self.module.globals[node.name]
                    else:
                        self.func = ir.Function(self.module, func_type, name=node.name)
                    
                    self.builder = ir.IRBuilder(self.func.append_basic_block(name="entry"))
                    
                    # Alloceer alle parameters als lokale variabelen in het geheugen
                    seen = set()
                    for i, (p_type, p_name) in enumerate(node.params):
                        if p_name in seen:
                            raise Exception(f"variabele '{p_name}' in functie '{node.name}' wordt meer keer gebruikt")
                        seen.add(p_name)
                        typ = self._get_llvm_type(p_type)
                        ptr = self.builder.alloca(typ, name=p_name)
                        self.builder.store(self.func.args[i], ptr)
                        self.local_vars[p_name] = ptr

                if isinstance(node, (DeclNode, ArrayDeclNode)):
                    self._allocate_variable(node)
                    if getattr(node, 'init_expr', None):
                        self._visit_node(node)
                elif isinstance(node, ProgramNode):
                    for child in reversed(node.children): stack.append((child, False))
                elif isinstance(node, FunctionNode): 
                    stack.append((node.body, False))
                elif isinstance(node, CompoundNode):
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
                elif isinstance(node, (DeclNode, ArrayDeclNode)) and getattr(node, 'init_expr', None):
                    stack.append((node.init_expr, False))
                
                
            else:
                # --- POST-ORDER: Genereren ---
                if isinstance(node, FunctionNode):
                    if self.builder and not self.builder.block.is_terminated:
                        if self.func.return_value.type == ir.VoidType():
                            self.builder.ret_void()
                        else:
                            self.builder.ret(ir.Constant(self.func.return_value.type, 0))
                    self.builder = None # Reset de builder zodat code erna globaal is
                
                elif not isinstance(node, (CompoundNode, IncludeNode, IntNode, FloatNode, CharNode,
                           StringNode, FunctionDeclNode, StructDeclNode, UnionDeclNode,
                           TypedefNode, SwitchNode, DeclNode, ArrayDeclNode)):
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
        
        # 0. CompoundNode
        if isinstance(node, CompoundNode):
            for item in node.items:
                self._ensure_result(item)
            return
        
        # 1. Literals
        if isinstance(node, IntNode):
            if node.value > 2147483647 or node.value < -2147483648:
                print(f"Warning: Integer overflow for {node.value} in 32-bit")
            self.results[id(node)] = ir.Constant(ir.IntType(32), node.value)

        elif isinstance(node, FloatNode):
            self.results[id(node)] = ir.Constant(ir.FloatType(), node.value)

        # 2. Declaraties (Lokaal & Globaal)
        elif isinstance(node, (DeclNode, ArrayDeclNode)):
            addr = self._get_symbol(node.name)
            if addr is None:
                addr = self._allocate_variable(node)

            if getattr(node, 'init_expr', None):
                if isinstance(node.init_expr, ArrayInitNode):
                    self._init_array(addr, node.init_expr, [])
                else:
                    val = self._ensure_result(node.init_expr)
                    if val is not None:
                        target_type = addr.type.pointee

                        if (isinstance(target_type, ir.ArrayType)
                                and target_type.element == ir.IntType(8)
                                and isinstance(val.type, ir.PointerType)
                                and val.type.pointee == ir.IntType(8)):
                            zero = ir.Constant(ir.IntType(32), 0)
                            for i in range(target_type.count):
                                src_ptr = self.builder.gep(val, [ir.Constant(ir.IntType(32), i)], name=f"str_src_{i}")
                                dst_ptr = self.builder.gep(addr, [zero, ir.Constant(ir.IntType(32), i)], name=f"str_dst_{i}")
                                ch = self.builder.load(src_ptr, name=f"ch_{i}")
                                self.builder.store(ch, dst_ptr)

                        elif not isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                            if self.builder is not None:
                                loaded_struct = self.builder.load(val)
                                self.builder.store(loaded_struct, addr)
                            else:
                                addr.initializer = val
                        else:
                            if val.type != target_type:
                                val = self._apply_cast(val, target_type)
                            if self.builder is None:
                                addr.initializer = val
                            else:
                                self.builder.store(val, addr)

        # 3. Functie aanroepen
        elif isinstance(node, FuncCallNode):
            args = []
            func = self.module.globals.get(node.name)

            if node.name in ['printf', 'scanf', 'fopen', 'fgets', 'fputs', 'fclose']:
                func = getattr(self, node.name, self.module.globals.get(node.name))
                for arg_node in node.args:
                    if node.name == 'scanf' and isinstance(arg_node, IdentifierNode):
                        arg_val = self._get_symbol(arg_node.name)
                    else:
                        arg_val = self._ensure_result(arg_node)

                    zero = ir.Constant(ir.IntType(32), 0)
                    if (isinstance(arg_val.type, ir.PointerType)
                            and isinstance(arg_val.type.pointee, ir.ArrayType)):
                        arg_val = self.builder.gep(arg_val, [zero, zero], inbounds=True)

                    if node.name == 'printf' and isinstance(arg_val.type, ir.FloatType):
                        arg_val = self.builder.fpext(arg_val, ir.DoubleType())

                    args.append(arg_val)
            else:
                # Custom User Functions
                for i, arg_node in enumerate(node.args):
                    arg_val = self._ensure_result(arg_node)
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
                self.builder.ret_void()

        # 4. Toewijzingen (a = 5, *p = 10, arr[i] = 2)
        elif isinstance(node, AssignNode):
            val = self._ensure_result(node.right)
            self._ensure_result(node.left)
            
            addr = self.results.get(f"addr_{id(node.left)}")
            if addr is None:
                if isinstance(node.left, IdentifierNode):
                    addr = self._get_symbol(node.left.name)
            
            if addr:
                target_type = addr.type.pointee
                
                if not isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                    loaded_struct = self.builder.load(val) # val is hier de pointer van de rvalue (perier)
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
            
            addr = self._get_symbol(node.name)
            if addr is None: raise Exception(f"Variabele {node.name} niet gevonden.")
            
            if isinstance(addr.type.pointee, ir.ArrayType):
                self.results[id(node)] = addr
            elif self.builder is not None:
                # OOK HIER NIET LADEN ALS HET EEN STRUCT IS!
                target_type = addr.type.pointee
                if not isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                     self.results[id(node)] = addr
                else:
                     self.results[id(node)] = self.builder.load(addr, name=node.name)

        # 6. Bewerkingen (BinOpNode)
        elif isinstance(node, BinOpNode):
            left = self._ensure_result(node.left)
            right = self._ensure_result(node.right)

            # IMPLICIETE TYPE CONVERSIE VOOR BINAIRE BEWERKINGEN
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
                if isinstance(left.type, ir.PointerType) and isinstance(right.type, ir.PointerType):
                    l_int = self.builder.ptrtoint(left, ir.IntType(32))
                    r_int = self.builder.ptrtoint(right, ir.IntType(32))
                    diff = self.builder.sub(l_int, r_int)
                    self.results[id(node)] = self.builder.sdiv(diff, ir.Constant(ir.IntType(32), 1)) # Kan aangepast worden afhankelijk van pointer struct grootte
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
            
            # Modulo (%)
            elif node.op == '%':
                if isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.frem(left, right)
                else:
                    self.results[id(node)] = self.builder.srem(left, right)
            
            # Bitwise Shifts (<< en >>)
            elif node.op == '<<':
                self.results[id(node)] = self.builder.shl(left, right)
            elif node.op == '>>':
                # ashr = arithmetic shift right (behoudt het tekenbit voor signed integers)
                self.results[id(node)] = self.builder.ashr(left, right)

            # Logische operatoren (&& en ||)
            elif node.op in ['&&', '||']:
                # 1. Vergelijk links met 0 of 0.0 -> geeft een i1 (boolean)
                zero_l = ir.Constant(left.type, 0.0 if isinstance(left.type, ir.FloatType) else 0)
                cmp_l = self.builder.fcmp_ordered('!=', left, zero_l) if isinstance(left.type, ir.FloatType) else self.builder.icmp_signed('!=', left, zero_l)
                
                # 2. Vergelijk rechts met 0 of 0.0 -> geeft een i1 (boolean)
                zero_r = ir.Constant(right.type, 0.0 if isinstance(right.type, ir.FloatType) else 0)
                cmp_r = self.builder.fcmp_ordered('!=', right, zero_r) if isinstance(right.type, ir.FloatType) else self.builder.icmp_signed('!=', right, zero_r)
                
                # 3. Pas de bitwise AND/OR toe op de i1 booleans
                if node.op == '&&':
                    res_i1 = self.builder.and_(cmp_l, cmp_r)
                else:
                    res_i1 = self.builder.or_(cmp_l, cmp_r)
                    
                # 4. Promoveer de i1 boolean terug naar een standaard C integer (i32)
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
                self.results[f"addr_{id(node)}"] = child_val
                if isinstance(child_val.type, ir.PointerType):
                    target_type = child_val.type.pointee
                    
                    # CHECK: Laad geen complete structs in!
                    if isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType)):
                        self.results[id(node)] = self.builder.load(child_val, name="deref_load")
                    else:
                        self.results[id(node)] = child_val

            elif node.op == '+':
                self.results[id(node)] = child_val
            
            elif node.op == '!':
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
            # Probeer de meest gangbare namen te pakken die je in AST.py gebruikt kan hebben
            operand = getattr(node, 'child', getattr(node, 'inner', getattr(node, 'value', getattr(node, 'expr', None))))
            
            # Als je in AST.py specifieke namen hebt (zoals type_str), probeer die ook:
            if operand is None and hasattr(node, 'type_str'): operand = node.type_str
            
            # 1. Bepaal het LLVM type
            if isinstance(operand, str):
                # Het is een string, dus sizeof(type), bv. sizeof("struct v")
                target_type = self._get_llvm_type(operand)
            else:
                # Het is een AST-knoop, dus sizeof(expressie), bv. sizeof(a)
                val = self._ensure_result(operand)
                target_type = val.type if hasattr(val, 'type') else self._get_llvm_type(getattr(operand, 'eval_type', 'int'))

            # 2. LLVM GEP truc om de grootte in bytes op te vragen
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
            
            self.results[id(node)] = self.builder.bitcast(global_str, ir.IntType(8).as_pointer())
        
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
            # 1. Evalueer de conditie
            switch_val = self._ensure_result(node.condition)
            
            # 2. Maak merge blok aan
            merge_bb = self.func.append_basic_block(name="switch.merge")
            
            # Controle: zijn er überhaupt cases?
            if not hasattr(node, 'ordered_cases') or not node.ordered_cases:
                self.builder.branch(merge_bb)
                self.builder.position_at_end(merge_bb)
                return

            case_blocks = []
            default_bb = None
            
            # 3. Maak alle basic blocks aan
            for item in node.ordered_cases:
                # Veilige unpacking voor het geval ASTVisitor iets anders teruggeeft
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
                # Haal de body op (kan op index 1 of 2 staan afhankelijk van je AST)
                body_node = item[-1] if isinstance(item, tuple) else item
                
                curr_bb = case_blocks[i][1]
                self.builder.position_at_end(curr_bb)
                
                # Zorg dat de body code gegenereerd wordt
                if body_node:
                    self._ensure_result(body_node)
                
                # Fall-through logica
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
                el_type = self._get_llvm_type(getattr(member, 'eval_type', 'int'))
                element_types.append(el_type)
                
            struct_type.set_body(*element_types)

        # 14.5 Union Declaratie
        elif isinstance(node, UnionDeclNode):
            if node.name in self.struct_types:
                return
            
            union_type = self.module.context.get_identified_type(f"union.{node.name}")
            self.struct_types[node.name] = union_type 
            
            element_types = []
            for member in node.members:
                el_type = self._get_llvm_type(getattr(member, 'eval_type', 'int'))
                element_types.append(el_type)
                
            union_type.set_body(*element_types)

        # 15. Member Access (p.jaren of ptr->waarde)
        elif isinstance(node, MemberAccessNode):
            if isinstance(node.expr, IdentifierNode):
                struct_ptr = self._get_symbol(node.expr.name)
            else:
                self._ensure_result(node.expr)
                struct_ptr = self.results.get(f"addr_{id(node.expr)}") or self.results.get(id(node.expr))
                
            if node.is_pointer and self.builder:
                struct_ptr = self.builder.load(struct_ptr)

            zero = ir.Constant(ir.IntType(32), 0)
            idx = ir.Constant(ir.IntType(32), getattr(node, 'member_index', 0))
            
            ptr = self.builder.gep(struct_ptr, [zero, idx], inbounds=True, name=f"gep_{node.member_name}")
            
            expected_type = self._get_llvm_type(getattr(node, 'eval_type', 'int'))
            
            if getattr(node, 'is_array_member', False):
                if ptr.type != expected_type:
                    ptr = self.builder.bitcast(ptr, expected_type)
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

        # 16. Typedefs (Puurt tekstueel in C, dus LLVM negeert dit)
        elif isinstance(node, TypedefNode):
            pass

    def _apply_cast(self, val, target_typ):
        """Zet een waarde om naar het doeltype met de juiste LLVM instructies."""
        if val.type == target_typ: return val
        if val.type == ir.IntType(1) and target_typ == ir.IntType(32): return self.builder.zext(val, target_typ)
        if isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.FloatType): return self.builder.sitofp(val, target_typ)
        elif isinstance(val.type, ir.FloatType) and isinstance(target_typ, ir.IntType): return self.builder.fptosi(val, target_typ)
        elif isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.IntType):
            if val.type.width > target_typ.width: return self.builder.trunc(val, target_typ)
            elif val.type.width < target_typ.width: return self.builder.sext(val, target_typ)
        if isinstance(val.type, ir.PointerType) and isinstance(target_typ, ir.PointerType): return self.builder.bitcast(val, target_typ)
        if isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.PointerType): return self.builder.inttoptr(val, target_typ)
        if isinstance(val.type, ir.PointerType) and isinstance(target_typ, ir.IntType): return self.builder.ptrtoint(val, target_typ)
        return val