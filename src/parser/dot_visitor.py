from src.parser.base_visitor import BaseVisitor
from src.parser.AST import *

class DOTVisitor(BaseVisitor):
    def __init__(self):
        self.dot_content = []
        self.node_count = 0

    def generate_id(self):
        self.node_count += 1
        return f"node{self.node_count}"

    # Helper om labels met types te maken
    def _get_label(self, node, main_text):
        etype = getattr(node, 'eval_type', None)
        if etype:
            return f"{main_text}\\n({etype})"
        return main_text

    def visit_FunctionNode(self, node):
        node_id = self.generate_id()
        self.dot_content.append(f'  {node_id} [label="Func\\n{node.return_type} {node.name}()", shape=invhouse, style=filled, fillcolor=lightgreen];')
        body_id = self.visit(node.body)
        self.dot_content.append(f'  {node_id} -> {body_id};')
        return node_id

    def visit_CompoundNode(self, node):
        node_id = self.generate_id()
        self.dot_content.append(f'  {node_id} [label="Block", shape=diamond];')
        for item in node.items:
            child_id = self.visit(item)
            self.dot_content.append(f'  {node_id} -> {child_id};')
        return node_id

    def visit_DeclNode(self, node):
        node_id = self.generate_id()
        const_str = "const " if node.is_const else ""
        label = f"Decl\\n{const_str}{node.type_spec}\\n{node.name}"
        self.dot_content.append(f'  {node_id} [label="{label}", shape=box, color=blue];')
        if node.init_expr:
            expr_id = self.visit(node.init_expr)
            self.dot_content.append(f'  {node_id} -> {expr_id} [label=" init", fontcolor=blue];')
        return node_id

    def visit_AssignNode(self, node):
        node_id = self.generate_id()
        label = self._get_label(node, "=")
        self.dot_content.append(f'  {node_id} [label="{label}", shape=circle];')
        left_id = self.visit(node.left)
        right_id = self.visit(node.right)
        self.dot_content.append(f'  {node_id} -> {left_id};')
        self.dot_content.append(f'  {node_id} -> {right_id};')
        return node_id

    def visit_BinOpNode(self, node):
        node_id = self.generate_id()
        label = self._get_label(node, node.op)
        self.dot_content.append(f'  {node_id} [label="{label}", shape=circle];')
        
        left_id = self.visit(node.left)
        right_id = self.visit(node.right)
        self.dot_content.append(f'  {node_id} -> {left_id};')
        self.dot_content.append(f'  {node_id} -> {right_id};')
        return node_id

    def visit_UnaryOpNode(self, node):
        node_id = self.generate_id()
        label = self._get_label(node, node.op)
        self.dot_content.append(f'  {node_id} [label="{label}", shape=circle];')
        child_id = self.visit(node.child)
        self.dot_content.append(f'  {node_id} -> {child_id};')
        return node_id

    def visit_CastNode(self, node):
        node_id = self.generate_id()
        self.dot_content.append(f'  {node_id} [label="Cast\\n({node.target_type})", shape=ellipse];')
        child_id = self.visit(node.expr)
        self.dot_content.append(f'  {node_id} -> {child_id};')
        return node_id

    def visit_IdentifierNode(self, node):
        node_id = self.generate_id()
        label = self._get_label(node, f"ID: {node.name}")
        self.dot_content.append(f'  {node_id} [label="{label}", shape=box, style=filled, fillcolor=lightgrey];')
        return node_id

    def visit_IntNode(self, node):
        node_id = self.generate_id()
        label = self._get_label(node, str(node.value))
        self.dot_content.append(f'  {node_id} [label="{label}", shape=box];')
        return node_id

    def visit_FloatNode(self, node):
        node_id = self.generate_id()
        label = self._get_label(node, str(node.value))
        self.dot_content.append(f'  {node_id} [label="{label}", shape=box];')
        return node_id

    def visit_CharNode(self, node):
        node_id = self.generate_id()
        label = self._get_label(node, f"\'{node.value}\'")
        self.dot_content.append(f'  {node_id} [label="{label}", shape=box];')
        return node_id