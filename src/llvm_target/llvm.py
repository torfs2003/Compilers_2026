from llvmlite import ir
from ..parser.base_visitor import BaseVisitor
from ..parser.AST import *

class LLVM(BaseVisitor):
    def __init__(self):
        self.module = ir.Module(name="llvm")
        self.builder = None
        self.function = None
        self.locals = {}
        self.functions = {}

    def get_llvm_type(self, type_str):
        if type_str == "int":
            return ir.IntType(32)
        elif type_str == "char":
            return ir.IntType(8)
        elif type_str == "float":
            return ir.FloatType()
        elif type_str.endswith("*"):
            base_type = self.get_llvm_type(type_str[:-1])
            return base_type.as_pointer()
        else:
            raise ValueError(f"Unknown type: {type_str}")

    def get_constant(self, value, type_str):
        llvm_type = self.get_llvm_type(type_str)
        if type_str == "int":
            return ir.Constant(llvm_type, value)
        elif type_str == "char":
            return ir.Constant(llvm_type, ord(value))  # store char as int8
        elif type_str == "float":
            return ir.Constant(llvm_type, value)
        else:
            raise ValueError(f"Cannot make constant of type {type_str}")

    def visit_FunctionNode(self, node: FunctionNode):
        # Create LLVM function
        ret_type = self.get_llvm_type(node.return_type)
        func_type = ir.FunctionType(ret_type, ())
        function = ir.Function(self.module, func_type, name=node.name)
        self.function = function

        # Entry block
        block = function.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)
        self.locals = {}  # clear locals for function scope

        # Visit body
        self.visit(node.body)

        return function

    def visit_CompoundNode(self, node: CompoundNode):
        for item in node.items:
            self.visit(item)

    def visit_DeclNode(self, node: DeclNode):
        llvm_type = self.get_llvm_type(node.type_spec)
        variable = self.builder.alloca(llvm_type, name=node.name)
        self.locals[node.name] = variable

        if node.init_expr:
            value = self.visit(node.init_expr)
            self.builder.store(value, variable)

        return variable

    def visit_IntNode(self, node: IntNode):
        return ir.Constant(ir.IntType(32), node.value)

    def visit_FloatNode(self, node: FloatNode):
        return ir.Constant(ir.FloatType(), node.value)

    def visit_CharNode(self, node: CharNode):
        return ir.Constant(ir.IntType(8), ord(node.value))

    def visit_StringNode(self, node: StringNode):
        # Simple global string constant
        string_const = ir.GlobalVariable(self.module, ir.ArrayType(ir.IntType(8), len(node.value) + 1), name="str")
        string_const.linkage = "internal"
        string_const.global_constant = True
        string_const.initializer = ir.Constant(ir.ArrayType(ir.IntType(8), len(node.value) + 1),
                                               bytearray(node.value.encode("utf8") + b"\0"))
        return string_const

    def visit_IdentifierNode(self, node: IdentifierNode):
        if node.name in self.locals:
            return self.builder.load(self.locals[node.name])
        else:
            raise Exception(f"Undefined variable {node.name}")

    def visit_AssignNode(self, node: AssignNode):
        value = self.visit(node.right)
        if isinstance(node.left, IdentifierNode):
            ptr = self.locals.get(node.left.name)
            if not ptr:
                raise Exception(f"Assignment to undeclared variable {node.left.name}")
            self.builder.store(value, ptr)
        else:
            raise Exception("Unsupported assignment target")
        return value

    def visit_BinOpNode(self, node: BinOpNode):
        left = self.visit(node.left)
        right = self.visit(node.right)

        # Arithmetic operators
        if node.op == '+':
            if left.type == ir.FloatType():
                return self.builder.fadd(left, right)
            else:
                return self.builder.add(left, right)
        elif node.op == '-':
            if left.type == ir.FloatType():
                return self.builder.fsub(left, right)
            else:
                return self.builder.sub(left, right)
        elif node.op == '*':
            if left.type == ir.FloatType():
                return self.builder.fmul(left, right)
            else:
                return self.builder.mul(left, right)
        elif node.op == '/':
            if left.type == ir.FloatType():
                return self.builder.fdiv(left, right)
            else:
                return self.builder.sdiv(left, right)
        else:
            raise Exception(f"Unsupported binary operator {node.op}")

    def visit_UnaryOpNode(self, node: UnaryOpNode):
        value = self.visit(node.child)
        if node.op == '-':
            if value.type == ir.FloatType():
                return self.builder.fneg(value)
            else:
                return self.builder.neg(value)
        elif node.op == '+':
            return value
        else:
            raise Exception(f"Unsupported unary operator {node.op}")

    def visit_CastNode(self, node: CastNode):
        value = self.visit(node.expr)
        target_type = self.get_llvm_type(node.target_type)
        if value.type == ir.IntType(32) and target_type == ir.FloatType():
            return self.builder.sitofp(value, target_type)
        elif value.type == ir.FloatType() and target_type == ir.IntType(32):
            return self.builder.fptosi(value, target_type)
        else:
            return value

    def dump(self):
        print(self.module)