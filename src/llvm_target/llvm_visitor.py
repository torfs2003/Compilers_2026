from llvmlite import ir
from src.parser.AST import *
import llvmlite.binding as llvm


class LLVMVisitor:
    def __init__(self):
        self.module = ir.Module(name="cmm_module")
        llvm.initialize_native_target()
        llvm.initialize_native_asmprinter()
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
        """Vertaalt een C-type string naar het bijbehorende LLVM IR type."""
        if not type_str: return ir.IntType(32)

        if '(*)' in type_str:
            parts = type_str.split('(*)')
            ret_type_str = parts[0].strip()
            param_str = parts[1].strip()[1:-1]

            ret_type = self._get_llvm_type(ret_type_str)
            param_types = []
            if param_str:
                for p in param_str.split(','):
                    param_types.append(self._get_llvm_type(p.strip()))

            func_type = ir.FunctionType(ret_type, param_types)
            return func_type.as_pointer()

        base = type_str.replace('*', '').strip()

        if base.startswith("struct "):
            struct_name = base.replace("struct ", "")
            t = self.struct_types.get(struct_name, ir.IntType(32))

        elif base == 'int':
            t = ir.IntType(32)
        elif base == 'float':
            t = ir.FloatType()
        elif base == 'char':
            t = ir.IntType(8)
        elif base == 'void':
            t = ir.VoidType()
        else:
            t = ir.IntType(32)

        for _ in range(type_str.count('*')):
            t = t.as_pointer()
        return t

    def _get_symbol(self, name):
        """Zoekt eerst in lokale variabelen, dan in globale."""
        return self.local_vars.get(name) or self.global_vars.get(name)

    def _init_array(self, base_ptr, array_node, current_indices):
        if self.builder is None:
            return

        zero = ir.Constant(ir.IntType(32), 0)

        # -------------------------------------------------
        # SAFETY CHECK: base_ptr moet een pointer zijn
        # -------------------------------------------------
        if not isinstance(base_ptr.type, ir.PointerType):
            raise Exception(
                f"_init_array verwacht een pointer, maar kreeg: {base_ptr.type}"
            )

        # Start type (pointer → element)
        current_typ = base_ptr.type.pointee

        for idx in current_indices:
            if isinstance(current_typ, ir.ArrayType):
                current_typ = current_typ.element
            else:
                # we zijn niet meer in een array → stop met graven
                break

        # Alleen arrays kunnen meerdere elementen bevatten
        if not isinstance(current_typ, ir.ArrayType):
            return

        max_count = current_typ.count

        for i, val_node in enumerate(array_node.values):

            # C semantics: extra initializers worden genegeerd
            if i >= max_count:
                break

            idx_const = ir.Constant(ir.IntType(32), i)
            new_indices = current_indices + [idx_const]

            # -------------------------------------------------
            # CASE 1: nested array initializer
            # -------------------------------------------------
            if isinstance(val_node, ArrayInitNode):
                self._init_array(base_ptr, val_node, new_indices)

            # -------------------------------------------------
            # CASE 2: scalar initializer
            # -------------------------------------------------
            else:
                target_typ = current_typ.element
                temp_indices = list(new_indices)

                # descend naar leaf type
                while isinstance(target_typ, ir.ArrayType):
                    temp_indices.append(zero)
                    target_typ = target_typ.element

                # final pointer
                ptr = self.builder.gep(base_ptr, [zero] + temp_indices)

                # compute value
                val = self._ensure_result(val_node)

                if val is None:
                    continue

                # type cast indien nodig
                if val.type != ptr.type.pointee:
                    val = self._apply_cast(val, ptr.type.pointee)

                self.builder.store(val, ptr)

    def _declare_stdlib(self):
        if getattr(self, 'stdlib_declared', False): return
        voidptr_ty = ir.IntType(8).as_pointer()

        # 1. Printf & Scanf
        printf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.printf = ir.Function(self.module, printf_ty, name="printf")
        scanf_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty], var_arg=True)
        self.scanf = ir.Function(self.module, scanf_ty, name="scanf")

        # 2. File I/O (fopen, fclose, fgets, fputs)
        fopen_ty = ir.FunctionType(voidptr_ty, [voidptr_ty, voidptr_ty])
        self.fopen = ir.Function(self.module, fopen_ty, name="fopen")

        fclose_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty])
        self.fclose = ir.Function(self.module, fclose_ty, name="fclose")

        fgets_ty = ir.FunctionType(voidptr_ty, [voidptr_ty, ir.IntType(32), voidptr_ty])
        self.stdlib_fgets = ir.Function(self.module, fgets_ty, name="fgets")

        fputs_ty = ir.FunctionType(ir.IntType(32), [voidptr_ty, voidptr_ty])
        self.stdlib_fputs = ir.Function(self.module, fputs_ty, name="fputs")

        # 3. Memory Allocation (malloc, free)
        malloc_ty = ir.FunctionType(voidptr_ty, [ir.IntType(32)])
        self.malloc = ir.Function(self.module, malloc_ty, name="malloc")

        free_ty = ir.FunctionType(ir.VoidType(), [voidptr_ty])
        self.free = ir.Function(self.module, free_ty, name="free")

        self.stdlib_declared = True

    def _create_string_constant(self, val_str):
        """Hulpfunctie om razendsnel 'r' of 'w' strings te maken voor fopen."""
        val = val_str.encode('utf-8') + b'\0'
        typ = ir.ArrayType(ir.IntType(8), len(val))
        global_str = ir.GlobalVariable(self.module, typ, name=self.module.get_unique_name("mode_str"))
        global_str.linkage = 'internal'
        global_str.global_constant = True
        global_str.initializer = ir.Constant(typ, bytearray(val))
        return self.builder.bitcast(global_str, ir.IntType(8).as_pointer())

    def _ensure_result(self, node):
        """Controleert of een node al een resultaat heeft, zo niet: verwerk hem nu."""
        node_id = id(node)
        if node_id not in self.results:
            self._visit_node(node)
        return self.results.get(node_id, None)

    def _allocate_variable(self, node):
        """Maakt de geheugenplek aan VOORDAT we de rest van de expressie evalueren."""

        # 🔥 FIX 1: geen dubbele allocas
        if node.name in self.local_vars:
            return self.local_vars[node.name]

        addr = self._get_symbol(node.name)
        if addr is not None:
            return addr

        base_typ = self._get_llvm_type(node.type_spec)
        typ = base_typ

        if isinstance(node, ArrayDeclNode):
            base_str = node.type_spec.replace('*', '')
            typ = self._get_llvm_type(base_str)

            if hasattr(node, 'sizes') and node.sizes:
                for size_node in reversed(node.sizes):
                    size = size_node.value if hasattr(size_node, 'value') else size_node
                    typ = ir.ArrayType(typ, size)

        # GLOBAL CONTEXT
        if self.builder is None:
            addr = ir.GlobalVariable(self.module, typ, name=node.name)
            addr.linkage = 'internal'
            addr.initializer = ir.Constant(typ, None) if isinstance(typ, ir.ArrayType) else ir.Constant(typ, 0)
            self.global_vars[node.name] = addr
            return addr

        # LOCAL CONTEXT
        # Always alloca in the entry block.
        # This is LLVM best-practice AND fixes a llvmlite/Python-3.12 bug where
        # AllocaInstr._StrCaching__cached_str is absent when the instruction is
        # created while the builder is positioned inside a loop or if-block.
        entry_block = self.func.blocks[0]
        current_block = self.builder.block

        self.builder.position_at_start(entry_block)
        addr = self.builder.alloca(typ, name=node.name)

        # Restore the builder to wherever it was before.
        self.builder.position_at_end(current_block)

        self.local_vars[node.name] = addr
        return addr

    def generate(self, root_node):
        stack = [(root_node, False)]
        while stack:
            node, is_post_order = stack.pop()

            if not is_post_order:
                # --- PRE-ORDER: Discovery ---
                if isinstance(node,
                              (IntNode, FloatNode, CharNode, StringNode, StructDeclNode, UnionDeclNode, TypedefNode,
                               FuncPtrDeclNode)):
                    self._visit_node(node)

                if isinstance(node, IncludeNode) and node.header == 'stdio.h':
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
                    self.local_vars = {}  # Reset lokale variabelen voor de nieuwe functie!

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

                stack.append((node, True))

                if isinstance(node, ProgramNode):
                    for child in reversed(node.children): stack.append((child, False))
                elif isinstance(node, FunctionNode):
                    stack.append((node.body, False))
                elif isinstance(node, CompoundNode) and not is_post_order:
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
                        if self.func.return_value.type == ir.VoidType():
                            self.builder.ret_void()
                        else:
                            self.builder.ret(ir.Constant(self.func.return_value.type, 0))
                    self.builder = None  # Reset de builder zodat code erna globaal is

                elif not isinstance(node, (CompoundNode, IncludeNode, IntNode, FloatNode, CharNode, StringNode,
                                           FunctionDeclNode, StructDeclNode, TypedefNode)):
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

        # 2. Declaraties (Lokaal & Globaal & Function Pointers)
        elif isinstance(node, (DeclNode, ArrayDeclNode, FuncPtrDeclNode)):
            addr = self._get_symbol(node.name)
            if addr is None:
                addr = self._allocate_variable(node)

            if getattr(node, 'init_expr', None):
                if isinstance(node.init_expr, ArrayInitNode):
                    # C standard: any initializer (even partial) must zero-fill
                    # all remaining elements.  Store a zeroinitializer first,
                    # then overwrite with the explicit values.
                    if self.builder is not None and isinstance(addr.type.pointee, ir.ArrayType):
                        self.builder.store(ir.Constant(addr.type.pointee, None), addr)
                    self._init_array(addr, node.init_expr, [])
                else:
                    val = self._ensure_result(node.init_expr)
                    if val is not None:
                        target_type = addr.type.pointee
                        if val.type != target_type:
                            val = self._apply_cast(val, target_type)

                        # Als we globaal zijn, stel dan in als initializer, anders store!
                        if self.builder is None:
                            addr.initializer = val
                        else:
                            target_type = addr.type.pointee
                            if val.type != target_type: val = self._apply_cast(val, target_type)

                        if self.builder is None:
                            addr.initializer = val
                        else:
                            self.builder.store(val, addr)

        elif isinstance(node, FuncCallNode):
            args = []

            func_var_addr = self._get_symbol(node.name)

            if func_var_addr is not None:
                func = self.builder.load(func_var_addr, name=f"load_func_ptr_{node.name}")
            else:
                func = self.module.globals.get(node.name)

            if node.name in ['printf', 'scanf']:
                self._declare_stdlib()
                func = self.printf if node.name == 'printf' else self.scanf
                for arg_node in node.args:
                    arg_val = self._ensure_result(arg_node)

                    if node.name == 'printf':
                        if arg_val.type == ir.IntType(8):
                            arg_val = self.builder.zext(arg_val, ir.IntType(32))
                        elif isinstance(arg_val.type, ir.FloatType):
                            arg_val = self.builder.fpext(arg_val, ir.DoubleType())

                    args.append(arg_val)

                self.results[id(node)] = self.builder.call(func, args)
            elif node.name == 'fgets':
                self._declare_stdlib()
                arg_buf = self._apply_cast(self._ensure_result(node.args[0]), ir.IntType(8).as_pointer())
                arg_size = self._ensure_result(node.args[1])
                arg_file = self._apply_cast(self._ensure_result(node.args[2]), ir.IntType(8).as_pointer())

                # We openen het bestand automatisch in read-mode ("r")
                mode_str = self._create_string_constant("r")
                file_ptr = self.builder.call(self.fopen, [arg_file, mode_str])

                res = self.builder.call(self.stdlib_fgets, [arg_buf, arg_size, file_ptr])
                self.builder.call(self.fclose, [file_ptr])  # En we sluiten het weer netjes!
                self.results[id(node)] = res

            elif node.name == 'fputs':
                self._declare_stdlib()
                arg_content = self._apply_cast(self._ensure_result(node.args[0]), ir.IntType(8).as_pointer())
                arg_file = self._apply_cast(self._ensure_result(node.args[1]), ir.IntType(8).as_pointer())

                # We openen het bestand in write-mode ("w")
                mode_str = self._create_string_constant("w")
                file_ptr = self.builder.call(self.fopen, [arg_file, mode_str])

                res = self.builder.call(self.stdlib_fputs, [arg_content, file_ptr])
                self.builder.call(self.fclose, [file_ptr])
                self.results[id(node)] = res

            elif node.name in ['malloc', 'free']:
                self._declare_stdlib()
                func = self.malloc if node.name == 'malloc' else self.free
                arg_val = self._ensure_result(node.args[0])

                if node.name == 'malloc' and arg_val.type != ir.IntType(32):
                    arg_val = self._apply_cast(arg_val, ir.IntType(32))
                elif node.name == 'free' and arg_val.type != ir.IntType(8).as_pointer():
                    arg_val = self._apply_cast(arg_val, ir.IntType(8).as_pointer())

                self.results[id(node)] = self.builder.call(func, [arg_val])

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
                if val.type != target_type:
                    val = self._apply_cast(val, target_type)
                self.builder.store(val, addr)
                self.results[id(node)] = val

        # 5. Variabelen laden (Identifier)
        elif isinstance(node, IdentifierNode):
            if node.name in self.enum_constants:
                self.results[id(node)] = self.enum_constants[node.name]
                return

            if node.name in self.module.globals and isinstance(self.module.globals[node.name], ir.Function):
                self.results[id(node)] = self.module.globals[node.name]
                self.results[f"addr_{id(node)}"] = self.module.globals[node.name]  # De functie ZELF is het adres
                return

            addr = self._get_symbol(node.name)
            if addr is None: raise Exception(f"Variabele {node.name} niet gevonden.")

            self.results[f"addr_{id(node)}"] = addr

            eval_t = getattr(node, 'eval_type', '')

            if isinstance(addr.type.pointee, ir.ArrayType) or (eval_t.startswith("struct ") and "*" not in eval_t):
                self.results[id(node)] = addr
            elif self.builder is not None:
                self.results[id(node)] = self.builder.load(addr, name=node.name)
            else:
                self.results[id(node)] = addr

        # 6. Bewerkingen (BinOpNode)
        elif isinstance(node, BinOpNode):

            left = self._ensure_result(node.left)
            right = self._ensure_result(node.right)

            zero32 = ir.Constant(ir.IntType(32), 0)

            # =========================================================
            # ARRAY INDEXING
            # =========================================================
            if node.op == '[]':

                base_ptr = left

                # force index type correct (LLVM REQUIREMENT)
                if right.type != ir.IntType(32):
                    right = self._apply_cast(right, ir.IntType(32))

                zero32 = ir.Constant(ir.IntType(32), 0)

                # CASE 1: array pointer
                if isinstance(base_ptr.type, ir.PointerType) and isinstance(base_ptr.type.pointee, ir.ArrayType):

                    ptr = self.builder.gep(
                        base_ptr,
                        [zero32, right],
                        name="array_index"
                    )

                # CASE 2: pointer arithmetic
                elif isinstance(base_ptr.type, ir.PointerType):

                    ptr = self.builder.gep(
                        base_ptr,
                        [right],
                        name="ptr_index"
                    )

                else:
                    raise Exception(f"Kan niet indexeren op type: {base_ptr.type}")

                self.results[f"addr_{id(node)}"] = ptr

                if isinstance(ptr.type.pointee, ir.ArrayType):
                    self.results[id(node)] = ptr
                else:
                    self.results[id(node)] = self.builder.load(ptr)

                return

            # =========================================================
            # ARRAY DECAY (NIET voor [])
            # =========================================================

            if (
                    isinstance(left.type, ir.PointerType)
                    and isinstance(left.type.pointee, ir.ArrayType)
            ):
                left = self.builder.gep(
                    left,
                    [zero32, zero32],
                    name="decay_left"
                )

            if (
                    isinstance(right.type, ir.PointerType)
                    and isinstance(right.type.pointee, ir.ArrayType)
            ):
                right = self.builder.gep(
                    right,
                    [zero32, zero32],
                    name="decay_right"
                )

            # =========================================================
            # NUMERIC PROMOTION
            # =========================================================

            if (
                    node.op not in ['[]']
                    and not isinstance(left.type, ir.PointerType)
                    and not isinstance(right.type, ir.PointerType)
            ):

                if left.type != right.type:

                    # int -> float
                    if (
                            isinstance(left.type, ir.IntType)
                            and isinstance(right.type, ir.FloatType)
                    ):
                        left = self._apply_cast(left, ir.FloatType())

                    elif (
                            isinstance(right.type, ir.IntType)
                            and isinstance(left.type, ir.FloatType)
                    ):
                        right = self._apply_cast(right, ir.FloatType())

                    # integer promotions
                    elif (
                            isinstance(left.type, ir.IntType)
                            and isinstance(right.type, ir.IntType)
                    ):

                        width = max(left.type.width, right.type.width)
                        target = ir.IntType(width)

                        if left.type.width != width:
                            left = self._apply_cast(left, target)

                        if right.type.width != width:
                            right = self._apply_cast(right, target)

            # =========================================================
            # +
            # =========================================================

            if node.op == '+':

                # pointer + int
                if isinstance(left.type, ir.PointerType):

                    if not isinstance(right.type, ir.IntType):
                        right = self._apply_cast(right, ir.IntType(32))

                    if right.type.width != 32:
                        right = self.builder.trunc(
                            right,
                            ir.IntType(32)
                        )

                    self.results[id(node)] = self.builder.gep(
                        left,
                        [right]
                    )

                # int + pointer
                elif isinstance(right.type, ir.PointerType):

                    if not isinstance(left.type, ir.IntType):
                        left = self._apply_cast(left, ir.IntType(32))

                    if left.type.width != 32:
                        left = self.builder.trunc(
                            left,
                            ir.IntType(32)
                        )

                    self.results[id(node)] = self.builder.gep(
                        right,
                        [left]
                    )

                elif isinstance(left.type, ir.FloatType):
                    self.results[id(node)] = self.builder.fadd(left, right)

                else:
                    self.results[id(node)] = self.builder.add(left, right)

            # =========================================================
            # -
            # =========================================================

            elif node.op == '-':

                # pointer - pointer
                if (
                        isinstance(left.type, ir.PointerType)
                        and isinstance(right.type, ir.PointerType)
                ):

                    l_int = self.builder.ptrtoint(left, ir.IntType(32))
                    r_int = self.builder.ptrtoint(right, ir.IntType(32))

                    diff = self.builder.sub(l_int, r_int)

                    pointee = left.type.pointee

                    size = self._get_type_size(pointee)
                    size = max(size, 1)

                    size_const = ir.Constant(ir.IntType(32), size)

                    self.results[id(node)] = self.builder.sdiv(
                        diff,
                        size_const
                    )

                # pointer - int
                elif isinstance(left.type, ir.PointerType):

                    if right.type.width != 32:
                        right = self.builder.trunc(
                            right,
                            ir.IntType(32)
                        )

                    neg = self.builder.sub(
                        ir.Constant(ir.IntType(32), 0),
                        right
                    )

                    self.results[id(node)] = self.builder.gep(
                        left,
                        [neg]
                    )

                elif (
                        isinstance(left.type, ir.FloatType)
                        or isinstance(right.type, ir.FloatType)
                ):
                    self.results[id(node)] = self.builder.fsub(left, right)

                else:
                    self.results[id(node)] = self.builder.sub(left, right)

            # =========================================================
            # *
            # =========================================================

            elif node.op == '*':

                if (
                        isinstance(left.type, ir.FloatType)
                        or isinstance(right.type, ir.FloatType)
                ):
                    self.results[id(node)] = self.builder.fmul(left, right)

                else:
                    self.results[id(node)] = self.builder.mul(left, right)

            # =========================================================
            # /
            # =========================================================

            elif node.op == '/':

                if (
                        isinstance(left.type, ir.FloatType)
                        or isinstance(right.type, ir.FloatType)
                ):
                    self.results[id(node)] = self.builder.fdiv(left, right)

                else:
                    self.results[id(node)] = self.builder.sdiv(left, right)

            # =========================================================
            # %
            # =========================================================

            elif node.op == '%':
                self.results[id(node)] = self.builder.srem(left, right)

            # =========================================================
            # SHIFTS
            # =========================================================

            elif node.op == '<<':
                self.results[id(node)] = self.builder.shl(left, right)

            elif node.op == '>>':
                self.results[id(node)] = self.builder.ashr(left, right)

            # =========================================================
            # COMPARISONS
            # =========================================================

            elif node.op in ['==', '!=', '<', '<=', '>', '>=']:

                if isinstance(left.type, ir.PointerType):
                    left = self.builder.ptrtoint(left, ir.IntType(64))

                if isinstance(right.type, ir.PointerType):
                    right = self.builder.ptrtoint(right, ir.IntType(64))

                # ── NEW: ensure both integer operands have the same bit-width.

                # This matters when one side was a pointer (now i64) and the

                # other is a plain int (i32).  icmp requires equal types.

                if isinstance(left.type, ir.IntType) and isinstance(right.type, ir.IntType):

                    if left.type.width != right.type.width:

                        target = ir.IntType(max(left.type.width, right.type.width))

                        if left.type.width < target.width:
                            left = self.builder.sext(left, target)

                        if right.type.width < target.width:
                            right = self.builder.sext(right, target)

                # ──────────────────────────────────────────────────────────────

                if isinstance(left.type, ir.FloatType):

                    cmp_val = self.builder.fcmp_ordered(

                        node.op,

                        left,

                        right

                    )

                else:

                    cmp_val = self.builder.icmp_signed(

                        node.op,

                        left,

                        right

                    )

                self.results[id(node)] = self.builder.zext(

                    cmp_val,

                    ir.IntType(32)

                )

            # =========================================================
            # LOGICAL
            # =========================================================

            elif node.op in ['&&', '||']:

                if isinstance(left.type, ir.PointerType):
                    left = self.builder.ptrtoint(left, ir.IntType(64))

                if isinstance(right.type, ir.PointerType):
                    right = self.builder.ptrtoint(right, ir.IntType(64))

                l_bool = self.builder.icmp_unsigned(
                    '!=',
                    left,
                    ir.Constant(left.type, 0)
                )

                r_bool = self.builder.icmp_unsigned(
                    '!=',
                    right,
                    ir.Constant(right.type, 0)
                )

                if node.op == '&&':
                    res = self.builder.and_(l_bool, r_bool)
                else:
                    res = self.builder.or_(l_bool, r_bool)

                self.results[id(node)] = self.builder.zext(
                    res,
                    ir.IntType(32)
                )

            # =========================================================
            # BITWISE
            # =========================================================

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
                    if isinstance(target_type, (ir.IntType, ir.FloatType, ir.PointerType, ir.ArrayType)):
                        if isinstance(target_type, ir.ArrayType):
                            zero = ir.Constant(ir.IntType(32), 0)
                            ptr = self.builder.gep(child_val, [zero, zero], name="array_deref")
                            self.results[id(node)] = self.builder.load(ptr, name="deref_load")
                        else:
                            self.results[id(node)] = self.builder.load(child_val, name="deref_load")
                    else:

                        self.results[id(node)] = child_val
            elif node.op == '+':
                self.results[id(node)] = child_val

            elif node.op == '!':
                if isinstance(child_val.type, ir.PointerType) and isinstance(child_val.type.pointee, ir.ArrayType):
                    zero_idx = ir.Constant(ir.IntType(32), 0)
                    child_val = self.builder.gep(child_val, [zero_idx, zero_idx], name="unary_decay")

                res_i1 = self.builder.icmp_unsigned('==', child_val, ir.Constant(child_val.type, None))
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
                # 1. Haal het adres van de variabele op
                addr = self._get_symbol(node.child.name) if isinstance(node.child,
                                                                       IdentifierNode) else self.results.get(
                    f"addr_{id(node.child)}")

                if addr is None:
                    raise Exception(f"{node.op} toegepast op een niet-adresseerbare expressie")

                # 2. Laad de huidige waarde
                current_val = self.builder.load(addr)

                # 3. Bepaal de nieuwe waarde op basis van het type
                if isinstance(current_val.type, ir.PointerType):
                    # Pointer rekenkunde: gebruik GEP
                    step = 1 if '++' in node.op else -1
                    new_val = self.builder.gep(current_val, [ir.Constant(ir.IntType(32), step)])
                elif isinstance(current_val.type, ir.FloatType):
                    # Float rekenkunde
                    inc = ir.Constant(current_val.type, 1.0)
                    new_val = self.builder.fadd(current_val, inc) if '++' in node.op else self.builder.fsub(current_val,
                                                                                                            inc)
                else:
                    # Integer rekenkunde
                    inc = ir.Constant(current_val.type, 1)
                    new_val = self.builder.add(current_val, inc) if '++' in node.op else self.builder.sub(current_val,
                                                                                                          inc)

                # 4. Sla de nieuwe waarde op
                self.builder.store(new_val, addr)

                # 5. Geef de juiste waarde terug (Pre vs Post)
                # Bij POST++ geef je de oude waarde terug, bij ++ de nieuwe.
                if node.op.startswith('POST'):
                    self.results[id(node)] = current_val
                else:
                    self.results[id(node)] = new_val

        # 8. Expliciete Type Casts
        elif isinstance(node, CastNode):
            inner_val = self._ensure_result(node.expr)
            target_typ = self._get_llvm_type(node.target_type)
            self.results[id(node)] = self._apply_cast(inner_val, target_typ)

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



        elif isinstance(node, SwitchNode):

            switch_val = self._ensure_result(node.condition)

            if not isinstance(switch_val.type, ir.IntType):
                switch_val = self._apply_cast(switch_val, ir.IntType(32))

            end_bb = self.func.append_basic_block(name="switch.end")

            self.loop_stack.append((None, end_bb))

            # Gebruik source-volgorde (incl. positie van default)

            ordered = getattr(node, 'ordered_cases',

                              [(v, b) for v, b in node.cases] +

                              ([(None, node.default_case)] if node.default_case else []))

            # Maak basic blocks in source-volgorde

            default_bb = end_bb

            all_blocks = []

            for val, body in ordered:

                if val is None:

                    bb = self.func.append_basic_block(name="switch.default")

                    default_bb = bb

                else:

                    bb = self.func.append_basic_block(name=f"switch.case.{val}")

                all_blocks.append((val, bb, body))

            # LLVM switch instructie

            sw = self.builder.switch(switch_val, default_bb)

            for val, bb, _ in all_blocks:

                if val is not None:
                    sw.add_case(ir.Constant(ir.IntType(32), val), bb)

            # Genereer code met fall-through in source-volgorde

            for i, (val, bb, body) in enumerate(all_blocks):

                self.builder.position_at_end(bb)

                self._ensure_result(body)

                if not self.builder.block.is_terminated:
                    next_bb = all_blocks[i + 1][1] if i + 1 < len(all_blocks) else end_bb

                    self.builder.branch(next_bb)

            self.loop_stack.pop()

            self.builder.position_at_end(end_bb)

        # 12. Break & Continue
        elif isinstance(node, BreakNode):
            if not self.loop_stack:
                # Break buiten loop — waarschijnlijk in switch-als-if, negeer gewoon
                return
            _, end_bb = self.loop_stack[-1]
            if not self.builder.block.is_terminated:
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
                type_str = getattr(member, 'type_spec', 'int')
                el_type = self._get_llvm_type(type_str)

                if isinstance(member, ArrayDeclNode):
                    base_str = type_str.replace('*', '')
                    base_typ = self._get_llvm_type(base_str)
                    for size_node in reversed(member.sizes):
                        base_typ = ir.ArrayType(base_typ, size_node.value)
                    el_type = base_typ

                element_types.append(el_type)

            struct_type.set_body(*element_types)

            self.struct_types[node.name] = struct_type

        elif isinstance(node, UnionDeclNode):
            if node.name in self.struct_types: return
            union_type = self.module.context.get_identified_type(f"union.{node.name}")
            self.struct_types[node.name] = union_type

            max_size = 0
            largest_type = ir.IntType(32)

            for member in node.members:
                type_str = getattr(member, 'type_spec', 'int')
                el_type = self._get_llvm_type(type_str)

                if isinstance(member, ArrayDeclNode):
                    base_str = type_str.replace('*', '')
                    base_typ = self._get_llvm_type(base_str)
                    for size_node in reversed(member.sizes): base_typ = ir.ArrayType(base_typ, size_node.value)
                    el_type = base_typ

                size = self._get_type_size(el_type)
                if size >= max_size:
                    max_size = size
                    largest_type = el_type

            union_type.set_body(largest_type)

        # 15. Member Access (p.veld of ptr->veld)
        elif isinstance(node, MemberAccessNode):
            # --- STAP 1: Haal de struct pointer op ---
            if isinstance(node.expr, IdentifierNode):
                struct_ptr = self._get_symbol(node.expr.name)
            else:
                self._ensure_result(node.expr)
                struct_ptr = self.results.get(f"addr_{id(node.expr)}") or self.results.get(id(node.expr))

            if struct_ptr is None:
                raise Exception(f"Member access op een None pointer voor {node.member_name}")

            if node.is_pointer and isinstance(struct_ptr.type.pointee, ir.PointerType):
                struct_ptr = self.builder.load(struct_ptr)

            zero = ir.Constant(ir.IntType(32), 0)
            idx = ir.Constant(ir.IntType(32), getattr(node, 'member_index', 0))

            ptr = self.builder.gep(struct_ptr, [zero, idx], inbounds=True, name=f"gep_{node.member_name}")

            eval_t = getattr(node, 'eval_type', '')
            if eval_t:
                expected_ptr_type = self._get_llvm_type(eval_t).as_pointer()
                if ptr.type != expected_ptr_type:
                    ptr = self.builder.bitcast(ptr, expected_ptr_type, name=f"union_cast_{node.member_name}")

            self.results[f"addr_{id(node)}"] = ptr

            is_complex = (
                    isinstance(ptr.type.pointee, ir.ArrayType) or
                    (eval_t.startswith("struct ") and "*" not in eval_t) or
                    (eval_t.startswith("union ") and "*" not in eval_t)
            )

            if is_complex:
                self.results[id(node)] = ptr
            else:
                self.results[id(node)] = self.builder.load(ptr, name=f"load_{node.member_name}")
        # 16. Typedefs (Puur tekstueel in C, dus LLVM negeert dit)
        elif isinstance(node, TypedefNode):
            pass
        # 17. SizeOf
        elif isinstance(node, SizeofNode):
            if isinstance(node.operand, str):
                llvm_type = self._get_llvm_type(node.operand)
            else:
                operand_type = getattr(node.operand, 'eval_type', 'int') or 'int'
                llvm_type = self._get_llvm_type(operand_type)
            size = self._get_type_size(llvm_type)
            self.results[id(node)] = ir.Constant(ir.IntType(32), size)

    def _apply_cast(self, val, target_typ):
        if val.type == target_typ: return val
        if val.type == ir.IntType(1) and target_typ == ir.IntType(32): return self.builder.zext(val, target_typ)
        if isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.FloatType):
            return self.builder.sitofp(val, target_typ)
        elif isinstance(val.type, ir.FloatType) and isinstance(target_typ, ir.IntType):
            return self.builder.fptosi(val, target_typ)
        elif isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.IntType):
            if val.type.width > target_typ.width:
                return self.builder.trunc(val, target_typ)
            elif val.type.width < target_typ.width:
                return self.builder.sext(val, target_typ)
        if isinstance(val.type, ir.PointerType) and isinstance(target_typ, ir.PointerType): return self.builder.bitcast(
            val, target_typ)
        if isinstance(val.type, ir.IntType) and isinstance(target_typ, ir.PointerType): return self.builder.inttoptr(
            val, target_typ)
        if isinstance(val.type, ir.PointerType) and isinstance(target_typ, ir.IntType): return self.builder.ptrtoint(
            val, target_typ)
        return val