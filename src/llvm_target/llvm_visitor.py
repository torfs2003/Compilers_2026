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
        """Vertaalt een C-type string naar het bijbehorende LLVM IR type."""
        if not type_str: return ir.IntType(32)
        base = type_str.replace('*', '').strip()
        
        if base.startswith("struct "):
            struct_name = base.replace("struct ", "")
            t = self.struct_types.get(struct_name, ir.IntType(32))

        elif base == 'int': t = ir.IntType(32)
        elif base == 'float': t = ir.FloatType()
        elif base == 'char': t = ir.IntType(8)
        elif base == 'void': t = ir.VoidType()
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
        return self.results.get(node_id, None)