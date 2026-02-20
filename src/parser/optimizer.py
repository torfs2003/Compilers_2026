from src.parser.AST import IntNode, BinOpNode, UnaryOpNode
from src.parser.base_visitor import BaseVisitor

class ConstantFoldingVisitor(BaseVisitor):
    
    def visit_IntNode(self, node):
        return node

    def visit_UnaryOpNode(self, node):
        node.child = self.visit(node.child)
        
        if isinstance(node.child, IntNode):
            if node.op == '-':
                return IntNode(-node.child.value)
            elif node.op == '+':
                return IntNode(node.child.value)
            # Later logica voor '!' of '~' kan hier toegevoegd worden
        return node

    def visit_BinOpNode(self, node):
        node.left = self.visit(node.left)
        node.right = self.visit(node.right)
        
        if isinstance(node.left, IntNode) and isinstance(node.right, IntNode):
            if node.op == '+': return IntNode(node.left.value + node.right.value)
            elif node.op == '-': return IntNode(node.left.value - node.right.value)
            elif node.op == '*': return IntNode(node.left.value * node.right.value)
            elif node.op == '/': return IntNode(node.left.value // node.right.value) # Let op: integer deling
            
        return node