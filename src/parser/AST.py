class ASTNode:
    def __init__(self):
        self.eval_type = None
        self.line = 0
        self.column = 0
        self.original_c_code = ""
        self.user_comments = []

class ProgramNode(ASTNode):
    def __init__(self, children):
        super().__init__()
        self.children = children
    def __repr__(self):
        return f"ProgramNode({len(self.children)} nodes)"

class IncludeNode(ASTNode):
    def __init__(self, header: str):
        super().__init__()
        self.header = header
    def __repr__(self):
        return f"IncludeNode(<{self.header}>)"

class IntNode(ASTNode):
    def __init__(self, value: int):
        super().__init__()
        self.value = value
    def __repr__(self):
        return f"IntNode({self.value})"

class FloatNode(ASTNode):
    def __init__(self, value: float):
        super().__init__()
        self.value = value
    def __repr__(self): 
        return f"FloatNode({self.value})"

class CharNode(ASTNode):
    def __init__(self, value: str):
        super().__init__()
        self.value = value
    def __repr__(self): 
        return f"CharNode('{self.value}')"

class StringNode(ASTNode):
    def __init__(self, value: str):
        super().__init__()
        self.value = value
    def __repr__(self):
        return f"StringNode(\"{self.value}\")"

class IdentifierNode(ASTNode):
    def __init__(self, name: str):
        super().__init__()
        self.name = name
    def __repr__(self): 
        return f"IdentifierNode('{self.name}')"

class BinOpNode(ASTNode):
    def __init__(self, left, op: str, right):
        super().__init__()
        self.left = left
        self.op = op
        self.right = right
    def __repr__(self):
        return f"BinOpNode({self.left}, '{self.op}', {self.right})"

class UnaryOpNode(ASTNode):
    def __init__(self, op: str, child):
        super().__init__()
        self.op = op
        self.child = child
    def __repr__(self):
        return f"UnaryOpNode('{self.op}', {self.child})"
    
class AssignNode(ASTNode):
    def __init__(self, left, right):
        super().__init__()
        self.left = left
        self.right = right
    def __repr__(self): 
        return f"AssignNode({self.left} = {self.right})"

class DeclNode(ASTNode):
    def __init__(self, is_const: bool, type_spec: str, name: str, init_expr=None):
        super().__init__()
        self.is_const = is_const
        self.type_spec = type_spec
        self.name = name
        self.init_expr = init_expr
    def __repr__(self): 
        c = "const " if self.is_const else ""
        return f"DeclNode({c}{self.type_spec} {self.name})"

class ArrayDeclNode(ASTNode):
    def __init__(self, is_const: bool, type_spec: str, name: str, sizes: list, init_expr=None):
        super().__init__()
        self.is_const = is_const
        self.type_spec = type_spec
        self.name = name
        self.sizes = sizes
        self.init_expr = init_expr
    def __repr__(self):
        dims = "".join([f"[{s}]" for s in self.sizes])
        return f"ArrayDeclNode({self.type_spec} {self.name}{dims})"

class ArrayInitNode(ASTNode):
    def __init__(self, values: list):
        super().__init__()
        self.values = values
    def __repr__(self):
        return f"ArrayInitNode({len(self.values)} values)"

class CompoundNode(ASTNode):
    def __init__(self, items: list):
        super().__init__()
        self.items = items
    def __repr__(self): 
        return f"CompoundNode({len(self.items)} items)"

class FunctionNode(ASTNode):
    def __init__(self, return_type: str, name: str, body, params: list = None):
        super().__init__()
        self.return_type = return_type
        self.name = name
        self.body = body
        self.params = params or []
    def __repr__(self): 
        return f"FunctionNode({self.return_type} {self.name})"

class FuncCallNode(ASTNode):
    def __init__(self, name: str, args: list):
        super().__init__()
        self.name = name
        self.args = args
    def __repr__(self):
        return f"FuncCallNode({self.name}, {len(self.args)} args)"

class CastNode(ASTNode):
    def __init__(self, target_type: str, expr):
        super().__init__()
        self.target_type = target_type
        self.expr = expr
    def __repr__(self): 
        return f"CastNode(({self.target_type}) {self.expr})"

class FunctionDeclNode(ASTNode):
    def __init__(self, return_type: str, name: str, params: list = None):
        super().__init__()
        self.return_type = return_type
        self.name = name
        self.params = params or []
    def __repr__(self):
        return f"FunctionDeclNode({self.return_type} {self.name})"

class ReturnNode(ASTNode):
    def __init__(self, expr=None):
        super().__init__()
        self.expr = expr
    def __repr__(self):
        if self.expr:
            return f"ReturnNode({self.expr})"
        return "ReturnNode(void)"

class CommentNode(ASTNode):
    def __init__(self, text: str):
        super().__init__()
        self.text = text
    def __repr__(self):
        return f"CommentNode('{self.text[:20]}...')"

class IfNode(ASTNode):
    def __init__(self, condition, scope, else_scope=None):
        super().__init__()
        self.condition = condition
        self.scope = scope
        self.else_scope = else_scope
    def __repr__(self):
        return f"IfNode({self.condition}->{self.scope}, else {self.else_scope})"
class WhileNode(ASTNode):
    def __init__(self, condition, scope):
        super().__init__()
        self.condition = condition
        self.scope = scope
    def __repr__(self):
        return f"WhileNode({self.condition}->{self.scope})"
class ForNode(ASTNode):
    def __init__(self, init, condition, update, body):
        super().__init__()
        self.init = init
        self.condition = condition
        self.update = update
        self.body = body
    def __repr__(self):
        return f"ForNode(({self.init};{self.condition};{self.update})->body={self.body})"
class BreakNode(ASTNode):
    def __init__(self):
        super().__init__()
    def __repr__(self):
        return f"BreakNode()"
class ContinueNode(ASTNode):
    def __init__(self):
        super().__init__()
    def __repr__(self):
        return f"ContinueNode()"
class EnumNode(ASTNode):
    def __init__(self, name, values):
        super().__init__()
        self.name = name
        self.values = values
    def __repr__(self):
        return f"EnumNode({self.name}: {self.values})"
class SwitchNode(ASTNode):
    def __init__(self, condition, cases, default_case=None):
        super().__init__()
        self.condition = condition
        self.cases = cases
        self.default_case = default_case
    def __repr__(self):
        return f"SwitchNode({self.condition},{len(self.cases)},{self.default_case})"
class StructDeclNode(ASTNode):
    def __init__(self, name, members):
        super().__init__()
        self.name = name
        self.members = members
    def __repr__(self):
        return f"StructDeclNode({self.name}, {len(self.members)} members)"

class TypedefNode(ASTNode):
    def __init__(self, original_type, new_name, is_array=False, array_size=0):
        super().__init__()
        self.original_type = original_type
        self.new_name = new_name
        self.is_array = is_array
        self.array_size = array_size
    def __repr__(self):
        return f"TypedefNode({self.original_type} -> {self.new_name})"

class MemberAccessNode(ASTNode):
    def __init__(self, expr, member_name, is_pointer=False):
        super().__init__()
        self.expr = expr
        self.member_name = member_name
        self.is_pointer = is_pointer
    def __repr__(self):
        op = "->" if self.is_pointer else "."
        return f"MemberAccessNode({self.expr}{op}{self.member_name})"