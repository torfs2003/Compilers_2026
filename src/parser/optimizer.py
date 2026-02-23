from src.parser.base_visitor import BaseVisitor
from src.parser.AST import *

class ConstantFoldingVisitor(BaseVisitor):
    def __init__(self):
        # Tabel om waarden van const-variabelen in op te slaan voor propagation
        self.constants = {} 

    # Traversal Logica
    def visit_FunctionNode(self, node):
        node.body = self.visit(node.body)
        return node

    def visit_CompoundNode(self, node):
        optimized_items = []
        for item in node.items:
            res = self.visit(item)
            if res:
                optimized_items.append(res)
        node.items = optimized_items
        return node


    def visit_DeclNode(self, node):
        if node.init_expr:
            node.init_expr = self.visit(node.init_expr)
            
            if node.is_const and isinstance(node.init_expr, (IntNode, FloatNode, CharNode)):
                self.constants[node.name] = node.init_expr.value
        
        return node

    def visit_IdentifierNode(self, node):
        # Vervang de identifier door een literal als de waarde bekend is (propagation)
        if node.name in self.constants:
            val = self.constants[node.name]
            if isinstance(val, int): return IntNode(val)
            if isinstance(val, float): return FloatNode(val)
            if isinstance(val, str): return CharNode(val)
        return node


    def visit_BinOpNode(self, node):
        node.left = self.visit(node.left)
        node.right = self.visit(node.right)

        # Ondersteun zowel IntNode als FloatNode
        if isinstance(node.left, (IntNode, FloatNode)) and isinstance(node.right, (IntNode, FloatNode)):
            l_val = node.left.value
            r_val = node.right.value
            
            try:
                if node.op == '+': res = l_val + r_val
                elif node.op == '-': res = l_val - r_val
                elif node.op == '*': res = l_val * r_val
                elif node.op == '/': 
                    # Integer division voor ints, normale division voor floats
                    res = l_val // r_val if isinstance(l_val, int) and isinstance(r_val, int) else l_val / r_val
                else: return node

                # Retourneer de juiste node op basis van het resultaat
                return FloatNode(float(res)) if isinstance(res, float) else IntNode(int(res))
            except ZeroDivisionError:
                return node 

        return node

    def visit_UnaryOpNode(self, node):
        node.child = self.visit(node.child)
        if isinstance(node.child, (IntNode, FloatNode)):
            if node.op == '-':
                node.child.value = -node.child.value
                return node.child
            elif node.op == '+':
                return node.child
        return node


    def visit_AssignNode(self, node):
        node.right = self.visit(node.right)
        return node

    def visit_CastNode(self, node):
        node.expr = self.visit(node.expr)
        return node

    def visit_IntNode(self, node): return node
    def visit_FloatNode(self, node): return node
    def visit_CharNode(self, node): return node