from src.parser.base_visitor import BaseVisitor
from src.parser.AST import *

class ConstantFoldingVisitor(BaseVisitor):
    def __init__(self, enabled=True):
        self.enabled = enabled
        self.constants = {} 
        self.results = {}

    def visit_IdentifierNode(self, node):
        if not self.enabled:
            self.results[id(node)] = node
            return

        if node.name in self.constants:
            self.results[id(node)] = self.constants[node.name]
        else:
            self.results[id(node)] = node

    def visit_DeclNode(self, node):
        if node.init_expr:
            node.init_expr = self.results.get(id(node.init_expr), node.init_expr)
            
            if node.is_const and isinstance(node.init_expr, (IntNode, FloatNode, CharNode)):
                self.constants[node.name] = node.init_expr
        
        self.results[id(node)] = node

    def visit_BinOpNode(self, node):
        left = self.results.get(id(node.left), node.left)
        right = self.results.get(id(node.right), node.right)
        node.left, node.right = left, right

        if self.enabled and isinstance(left, (IntNode, FloatNode)) and isinstance(right, (IntNode, FloatNode)):
            l_val, r_val = left.value, right.value
            res = None
            op = node.op

            try:
                if op == '+':   res = l_val + r_val
                elif op == '-': res = l_val - r_val
                elif op == '*': res = l_val * r_val
                elif op == '/': res = int(l_val / r_val) if isinstance(l_val, int) and isinstance(r_val, int) else l_val / r_val
                elif op == '%': res = l_val % r_val
                elif op == '>':  res = 1 if l_val > r_val else 0
                elif op == '<':  res = 1 if l_val < r_val else 0
                elif op == '==': res = 1 if l_val == r_val else 0
                elif op == '!=': res = 1 if l_val != r_val else 0
                elif op == '&&': res = 1 if (l_val and r_val) else 0
                elif op == '||': res = 1 if (l_val or r_val) else 0
                elif op == '<<': res = l_val << r_val
                elif op == '>>': res = l_val >> r_val
                elif op == '>=': res = 1 if l_val >= r_val else 0
                elif op == '<=': res = 1 if l_val <= r_val else 0
                elif op == '&':  res = l_val & r_val
                elif op == '|':  res = l_val | r_val
                elif op == '^':  res = l_val ^ r_val
            except (ZeroDivisionError, ValueError):
                pass

            if res is not None:
                new_node = FloatNode(float(res)) if isinstance(res, float) else IntNode(int(res))
                new_node.eval_type = "int" if isinstance(res, int) else "float"
                self.results[id(node)] = new_node
                return

        self.results[id(node)] = node

    def visit_UnaryOpNode(self, node):
        node.child = self.results.get(id(node.child), node.child)
        
        if self.enabled and isinstance(node.child, (IntNode, FloatNode)):
            if node.op == '-':
                node.child.value = -node.child.value
                self.results[id(node)] = node.child
                return
            elif node.op == '+':
                self.results[id(node)] = node.child
                return
            elif node.op == '!':
                val = 1 if not node.child.value else 0
                self.results[id(node)] = IntNode(val)
                return
            elif node.op == '~':
                self.results[id(node)] = IntNode(~int(node.child.value))
                return
        
        self.results[id(node)] = node

    def visit_CastNode(self, node):
        node.expr = self.results.get(id(node.expr), node.expr)
        
        if self.enabled and isinstance(node.expr, (IntNode, FloatNode)):
            val = node.expr.value
            if node.target_type == 'int':
                self.results[id(node)] = IntNode(int(val))
                return
            elif node.target_type == 'float':
                self.results[id(node)] = FloatNode(float(val))
                return
        
        self.results[id(node)] = node

    def generic_visit(self, node):
        if hasattr(node, 'body'): node.body = self.results.get(id(node.body), node.body)
        if hasattr(node, 'items'): node.items = [self.results.get(id(i), i) for i in node.items]
        if hasattr(node, 'right'): node.right = self.results.get(id(node.right), node.right)
        
        self.results[id(node)] = node