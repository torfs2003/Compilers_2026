class ASTNode:
    pass

class IntNode(ASTNode):
    def __init__(self, value: int):
        self.value = value

    def __repr__(self):
        return f"IntNode({self.value})"

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