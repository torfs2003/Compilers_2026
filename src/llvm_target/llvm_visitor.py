from llvmlite import ir
from src.parser.AST import *

class LLVMVisitor:
    def __init__(self):
        self.module = ir.Module(name="cmm_module")
        self.builder = None
        self.func = None
        self.symbol_table = {}
        self.results = {}
        self.stdio_declared = False

    def _init_array(self, base_ptr, array_node, current_indices):
        """Recursief initialiseren van (multi-dimensionele) arrays."""
        zero = ir.Constant(ir.IntType(32), 0)
        for i, val_node in enumerate(array_node.values):
            idx = ir.Constant(ir.IntType(32), i)
            path = [zero] + current_indices + [idx]
            
            if isinstance(val_node, ArrayInitNode):
                self._init_array(base_ptr, val_node, current_indices + [idx])
            else:
                ptr = self.builder.gep(base_ptr, path)
                self.builder.store(self.results[id(val_node)], ptr)

    def _declare_stdio(self):
        if self.stdio_declared: return
        voidptr_ty = ir.IntType(8).as_pointer()
        printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.printf = ir.Function(self.module, printf_ty, name="printf")
        scanf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.scanf = ir.Function(self.module, scanf_ty, name="scanf")
        self.stdio_declared = True
    
    def _ensure_result(self, node):
        """Controleert of een node al een resultaat heeft, zo niet: verwerk hem nu."""
        node_id = id(node)
        if node_id not in self.results:
            self._visit_node(node)
        return self.results[node_id]
    
    def _allocate_variable(self, node):
        """Maakt de geheugenplek aan VOORDAT we de rest van de expressie evalueren."""
        if node.name in self.symbol_table: return
        
        if "int" in node.type_spec: base_typ = ir.IntType(32)
        elif "float" in node.type_spec: base_typ = ir.FloatType()
        else: base_typ = ir.IntType(8) # char

        typ = base_typ
        if isinstance(node, ArrayDeclNode):
            sizes = node.sizes if hasattr(node, 'sizes') else []
            for size_node in reversed(sizes): 
                typ = ir.ArrayType(typ, size_node.value)
        else:
            for _ in range(node.type_spec.count('*')): typ = typ.as_pointer()
        
        addr = self.builder.alloca(typ, name=node.name)
        self.symbol_table[node.name] = addr

    def generate(self, root_node):
        stack = [(root_node, False)]
        while stack:
            node, is_post_order = stack.pop()
            
            if not is_post_order:
                # --- PRE-ORDER: Discovery ---
                
                if isinstance(node, (IntNode, FloatNode, CharNode, StringNode)):
                    self._visit_node(node)

                if isinstance(node, IncludeNode) and node.header == 'stdio.h':
                    self._declare_stdio()
                elif isinstance(node, FunctionNode):
                    func_type = ir.FunctionType(ir.IntType(32), [])
                    self.func = ir.Function(self.module, func_type, name=node.name)
                    self.builder = ir.IRBuilder(self.func.append_basic_block(name="entry"))

                if isinstance(node, (DeclNode, ArrayDeclNode)):
                    self._allocate_variable(node)

                stack.append((node, True))
                
                if isinstance(node, ProgramNode):
                    for child in reversed(node.children): stack.append((child, False))
                elif isinstance(node, FunctionNode): 
                    stack.append((node.body, False))
                elif isinstance(node, CompoundNode):
                    for item in reversed(node.items): stack.append((item, False))
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
                        self.builder.ret(ir.Constant(ir.IntType(32), 0))
                
                elif not isinstance(node, (CompoundNode, IncludeNode, IntNode, FloatNode, CharNode, StringNode)):
                    if self.builder:
                        if hasattr(node, 'user_comments') and node.user_comments:
                            for c in node.user_comments:
                                for line in c.splitlines():
                                    if line.strip():
                                        self.builder.comment(f" User Comment: {line.strip()}")
                        
                        if hasattr(node, 'original_c_code') and node.original_c_code:
                            for line in node.original_c_code.splitlines():
                                if line.strip():
                                    self.builder.comment(f" Source: {line.strip()}")
                    
                    self._visit_node(node)
                    
        return str(self.module)

    def _visit_node(self, node):
        # 1. Literals
        if isinstance(node, IntNode):
            if node.value > 2147483647 or node.value < -2147483648:
                print(f"Warning: Integer overflow for {node.value} in 32-bit")
            self.results[id(node)] = ir.Constant(ir.IntType(32), node.value)

        elif isinstance(node, FloatNode):
            self.results[id(node)] = ir.Constant(ir.FloatType(), node.value)

        # 2. Declaraties
        elif isinstance(node, (DeclNode, ArrayDeclNode)):
            addr = self.symbol_table.get(node.name)

            if getattr(node, 'init_expr', None):
                if isinstance(node.init_expr, ArrayInitNode):
                    self._init_array(addr, node.init_expr, [])
                else:
                    val = self.results.get(id(node.init_expr))
                    if val is not None:
                        target_type = addr.type.pointee
                        if val.type != target_type:
                            val = self._apply_cast(val, target_type)
                        self.builder.store(val, addr)

        # 3. Functie aanroepen & Return
        elif isinstance(node, FuncCallNode):
            args = []
            for arg_node in node.args:
                if node.name == 'scanf' and isinstance(arg_node, IdentifierNode):
                    args.append(self.symbol_table.get(arg_node.name))
                else:
                    arg_val = self.results[id(arg_node)]
                    if node.name == 'printf' and isinstance(arg_val.type, ir.FloatType):
                        arg_val = self.builder.fpext(arg_val, ir.DoubleType())
                    args.append(arg_val)
            
            func = self.printf if node.name == 'printf' else (self.scanf if node.name == 'scanf' else self.module.get_global(node.name))
            self.results[id(node)] = self.builder.call(func, args)

        # 4. Toewijzingen (a = 5, *p = 10, arr[i] = 2)
        elif isinstance(node, AssignNode):
            val = self.results[id(node.right)]
            addr = self.results.get(f"addr_{id(node.left)}")
            if addr is None:
                if isinstance(node.left, IdentifierNode):
                    addr = self.symbol_table.get(node.left.name)
            
            if addr:
                target_type = addr.type.pointee
                if val.type != target_type:
                    val = self._apply_cast(val, target_type)
                self.builder.store(val, addr)
                self.results[id(node)] = val

        # 5. Variabelen laden (Identifier)
        elif isinstance(node, IdentifierNode):
            addr = self.symbol_table.get(node.name)
            if addr is None: raise Exception(f"Variabele {node.name} niet gevonden.")
            
            if isinstance(addr.type.pointee, ir.ArrayType):
                self.results[id(node)] = addr
            else:
                self.results[id(node)] = self.builder.load(addr, name=node.name)

        # 6. Bewerkingen (BinOpNode)
        elif isinstance(node, BinOpNode):
            left = self._ensure_result(node.left)
            right = self._ensure_result(node.right)

            # --- IMPLICIETE TYPE CONVERSIE VOOR BINAIRE BEWERKINGEN ---
            if node.op not in ['[]'] and not isinstance(left.type, ir.PointerType) and not isinstance(right.type, ir.PointerType):
                # Als de types niet gelijk zijn, is één van de twee een float en de ander een int
                if left.type != right.type:
                    # Is left een int? Cast hem dan naar float (want float is 'richer')
                    if isinstance(left.type, ir.IntType) and isinstance(right.type, ir.FloatType):
                        left = self._apply_cast(left, ir.FloatType())
                    # Anders is right de int, dus cast die naar float
                    elif isinstance(right.type, ir.IntType) and isinstance(left.type, ir.FloatType):
                        right = self._apply_cast(right, ir.FloatType())
            
            
            # 1. Array Indexering ([])
            if node.op == '[]':
                zero = ir.Constant(ir.IntType(32), 0)
                
                if not isinstance(left.type, ir.PointerType):
                    raise Exception(f"Kan niet indexeren op non-pointer type: {left.type}")

                if isinstance(left.type.pointee, ir.ArrayType):
                    ptr = self.builder.gep(left, [zero, right], name="gep_array")
                else:
                    ptr = self.builder.gep(left, [right], name="gep_ptr")
                
                # Sla het adres op (L-value)
                self.results[f"addr_{id(node)}"] = ptr
                
                if isinstance(ptr.type.pointee, ir.ArrayType):
                    self.results[id(node)] = ptr
                else:
                    self.results[id(node)] = self.builder.load(ptr, name="array_element")

            # 2. Optellen (+)
            elif node.op == '+':
                if isinstance(left.type, ir.PointerType):
                    self.results[id(node)] = self.builder.gep(left, [right])
                elif isinstance(right.type, ir.PointerType):
                    self.results[id(node)] = self.builder.gep(right, [left])
                elif isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fadd(left, right)
                else:
                    self.results[id(node)] = self.builder.add(left, right)

            # 3. Aftrekken (-)
            elif node.op == '-':
                if isinstance(left.type, ir.PointerType) and isinstance(right.type, ir.PointerType):
                    l_int = self.builder.ptrtoint(left, ir.IntType(32))
                    r_int = self.builder.ptrtoint(right, ir.IntType(32))
                    diff = self.builder.sub(l_int, r_int)
                    self.results[id(node)] = self.builder.sdiv(diff, ir.Constant(ir.IntType(32), 1))
                elif isinstance(left.type, ir.PointerType):
                    neg_right = self.builder.sub(ir.Constant(ir.IntType(32), 0), right)
                    self.results[id(node)] = self.builder.gep(left, [neg_right])
                elif isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fsub(left, right)
                else:
                    self.results[id(node)] = self.builder.sub(left, right)

            # 4. Vermenigvuldigen (*)
            elif node.op == '*':
                if isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fmul(left, right)
                else:
                    self.results[id(node)] = self.builder.mul(left, right)
                
            # 5. Delen (/)
            elif node.op == '/':
                if isinstance(left.type, ir.FloatType) or isinstance(right.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fdiv(left, right)
                else:
                    self.results[id(node)] = self.builder.sdiv(left, right)
            
            elif node.op in ['==', '!=', '<', '<=', '>', '>=']:
                if isinstance(left.type, ir.PointerType) or isinstance(right.type, ir.PointerType):
                    # Converteer pointers naar 32-bit integers voor de vergelijking
                    left_cmp = self.builder.ptrtoint(left, ir.IntType(32)) if isinstance(left.type, ir.PointerType) else left
                    right_cmp = self.builder.ptrtoint(right, ir.IntType(32)) if isinstance(right.type, ir.PointerType) else right
                    
                    # Gebruik unsigned vergelijking (geheugenadressen zijn altijd positief)
                    res_i1 = self.builder.icmp_unsigned(node.op, left_cmp, right_cmp)
                    self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))
                elif isinstance(left.type, ir.IntType):
                    res_i1 = self.builder.icmp_signed(node.op, left, right)
                    self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))
                elif isinstance(left.type, ir.FloatType):
                    res_i1 = self.builder.fcmp_ordered(node.op, left, right)
                    self.results[id(node)] = self.builder.zext(res_i1, ir.IntType(32))

            # Logische & Bitwise operatoren
            elif node.op == '&&' or node.op == '&':
                self.results[id(node)] = self.builder.and_(left, right)
            elif node.op == '||' or node.op == '|':
                self.results[id(node)] = self.builder.or_(left, right)
            elif node.op == '^':
                self.results[id(node)] = self.builder.xor(left, right)

            # Modulo & Shifts
            elif node.op == '%':
                self.results[id(node)] = self.builder.srem(left, right)
            elif node.op == '<<':
                self.results[id(node)] = self.builder.shl(left, right)
            elif node.op == '>>':
                self.results[id(node)] = self.builder.ashr(left, right)

        # 7. Unary & Pointers
        elif isinstance(node, UnaryOpNode):
            child_val = None
            if node.op != '&':
                child_val = self.results.get(id(node.child))

            if node.op == '&':
                addr = self.results.get(f"addr_{id(node.child)}")
                if addr is None:
                    if isinstance(node.child, IdentifierNode):
                        addr = self.symbol_table.get(node.child.name)
                self.results[id(node)] = addr
            
            elif node.op == '*':
                self.results[f"addr_{id(node)}"] = child_val
                if isinstance(child_val.type, ir.PointerType):
                    self.results[id(node)] = self.builder.load(child_val, name="deref_load")

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
                # Haal het adres op
                addr = self.symbol_table.get(node.child.name) if isinstance(node.child, IdentifierNode) else self.results.get(f"addr_{id(node.child)}")
                
                current_val = self.builder.load(addr)
                increment = ir.Constant(current_val.type, 1)
                
                if '++' in node.op:
                    new_val = self.builder.add(current_val, increment)
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
            target_str = node.target_type 
            
            if "int" in target_str:
                target_typ = ir.IntType(32)
            elif "float" in target_str:
                target_typ = ir.FloatType()
            else:
                target_typ = ir.IntType(8) # char
                
            # Add this line to restore pointers for casts!
            for _ in range(target_str.count('*')): 
                target_typ = target_typ.as_pointer()
                
            self.results[id(node)] = self._apply_cast(inner_val, target_typ)

        # 9. Commentary
        elif isinstance(node, CommentNode):
            self.builder.comment(node.text)

        elif isinstance(node, StringNode):
            val = node.value.encode('utf-8').decode('unicode_escape') + '\0'
            typ = ir.ArrayType(ir.IntType(8), len(val))
            
            # Globale constante aanmaken
            global_str = ir.GlobalVariable(self.module, typ, name=self.module.get_unique_name("str"))
            global_str.linkage = 'internal'
            global_str.global_constant = True
            global_str.initializer = ir.Constant(typ, bytearray(val, 'utf-8'))
            
            # Bitcast naar i8* (char*) voor printf
            self.results[id(node)] = self.builder.bitcast(global_str, ir.IntType(8).as_pointer())
        
        elif isinstance(node, CharNode):
            # Zet de string (bijv. 'a' of een escape sequence zoals '\n') om naar zijn ASCII integer waarde
            char_str = node.value.encode('utf-8').decode('unicode_escape')
            ascii_val = ord(char_str[0]) if char_str else 0
            
            # Een char in C is een 8-bit integer
            self.results[id(node)] = ir.Constant(ir.IntType(8), ascii_val)

    def _apply_cast(self, val, target_typ):
        """Zet een waarde om naar het doeltype met de juiste LLVM instructies."""

        if val.type == target_typ:
            return val
        
        if val.type == ir.IntType(1) and target_typ == ir.IntType(32):
            return self.builder.zext(val, target_typ)
    
        if isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.FloatType):
            return self.builder.sitofp(val, target_typ)
        
        elif isinstance(val.type, ir.FloatType) and isinstance(target_typ, ir.IntType):
            return self.builder.fptosi(val, target_typ)
        
        elif isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.IntType):
            if val.type.width > target_typ.width:
                return self.builder.trunc(val, target_typ)
            elif val.type.width < target_typ.width:
                return self.builder.sext(val, target_typ)
        
        if isinstance(val.type, ir.PointerType) and isinstance(target_typ, ir.PointerType):
            return self.builder.bitcast(val, target_typ)
                    
        if isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.PointerType):
            return self.builder.inttoptr(val, target_typ)
            
        if isinstance(val.type, ir.PointerType) and isinstance(target_typ, ir.IntType):
            return self.builder.ptrtoint(val, target_typ)
            

        return val