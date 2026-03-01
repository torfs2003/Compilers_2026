class ASTNode:
    def __init__(self):
        self.eval_type = None

class IntNode(ASTNode):
    def __init__(self, value: int):
        self.value = value
    def __repr__(self):
        return f"IntNode({self.value})"

class FloatNode(ASTNode):
    def __init__(self, value: float):
        self.value = value
    def __repr__(self): 
        return f"FloatNode({self.value})"

class CharNode(ASTNode):
    def __init__(self, value: str):
        self.value = value
    def __repr__(self): 
        return f"CharNode('{self.value}')"

class IdentifierNode(ASTNode):
    def __init__(self, name: str):
        self.name = name
    def __repr__(self): 
        return f"IdentifierNode('{self.name}')"

class BinOpNode(ASTNode):
    def __init__(self, left: ASTNode, op: str, right: ASTNode):
        self.left = left
        self.op = op
        self.right = right
    def __repr__(self):
        return f"BinOpNode({self.left}, '{self.op}', {self.right})"

class UnaryOpNode(ASTNode):
    def __init__(self, op: str, child: ASTNode):
        self.op = op
        self.child = child
    def __repr__(self):
        return f"UnaryOpNode('{self.op}', {self.child})"
    
class AssignNode(ASTNode):
    def __init__(self, left: ASTNode, right: ASTNode):
        self.left = left
        self.right = right
    def __repr__(self): 
        return f"AssignNode({self.left} = {self.right})"

class DeclNode(ASTNode):
    def __init__(self, is_const: bool, type_spec: str, name: str, init_expr: ASTNode = None):
        self.is_const = is_const
        self.type_spec = type_spec
        self.name = name
        self.init_expr = init_expr # Kan None zijn als er geen '=' in de declaratie staat
    def __repr__(self): 
        const_str = "const " if self.is_const else ""
        init_str = f" = {self.init_expr}" if self.init_expr else ""
        return f"DeclNode({const_str}{self.type_spec} {self.name}{init_str})"

class CompoundNode(ASTNode):
    def __init__(self, items: list):
        self.items = items # Lijst van statements en declaraties
    def __repr__(self): 
        return f"CompoundNode({len(self.items)} items)"

class FunctionNode(ASTNode):
    def __init__(self, return_type: str, name: str, body: CompoundNode):
        self.return_type = return_type
        self.name = name
        self.body = body
    def __repr__(self): 
        return f"FunctionNode({self.return_type} {self.name})"

class CastNode(ASTNode):
    def __init__(self, target_type: str, expr: ASTNode):
        self.target_type = target_type
        self.expr = expr
    def __repr__(self): 
        return f"CastNode(({self.target_type}) {self.expr})"
#class StringNode(ASTNode):