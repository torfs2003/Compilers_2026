# src/parser/dot_visitor.py

from src.parser.base_visitor import BaseVisitor
from src.parser.AST import *

class DOTVisitor(BaseVisitor):
    def __init__(self):
        self.dot_content = []
        self.node_count = 0
        self.node_ids = {}

    def generate_id(self):
        self.node_count += 1
        return f"node{self.node_count}"

    def _get_label(self, node, main_text):
        etype = getattr(node, 'eval_type', None)
        if etype:
            return f"{main_text}\\n({etype})"
        return main_text

    def generate(self, root_node):
        """Wrapper om de volledige DOT file te genereren."""
        self.dot_content = ["digraph AST {", "  node [fontname=\"Arial\"];"]
        self.visit(root_node)
        self.dot_content.append("}")
        return "\n".join(self.dot_content)

    # --- FASE 1: PRE-ORDER (Discovery) ---    
    def pre_visit_IncludeNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_CommentNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_ProgramNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_FunctionNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_CompoundNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_DeclNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_ArrayDeclNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_AssignNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_BinOpNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_UnaryOpNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_CastNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_FuncCallNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_ArrayInitNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_IdentifierNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_IntNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_FloatNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_CharNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_StringNode(self, node): self.node_ids[id(node)] = self.generate_id()

    # --- FASE 2: POST-ORDER ---
    def visit_IncludeNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="Include\\n<{node.header}>", shape=note, fillcolor=lightyellow, style=filled];')

    def visit_CommentNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="Comment", shape=plaintext, fontcolor=gray];')

    def visit_ProgramNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="Program", shape=box, style=filled, fillcolor=lightblue];')
        for child in node.children:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(child)]};')

    def visit_FunctionNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, f"Func\\n{node.return_type} {node.name}()")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=invhouse, style=filled, fillcolor=lightgreen];')
        self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.body)]};')

    def visit_CompoundNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="Block", shape=diamond];')
        for item in node.items:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(item)]};')

    def visit_DeclNode(self, node):
        my_id = self.node_ids[id(node)]
        const_str = "const " if getattr(node, 'is_const', False) else ""
        label = self._get_label(node, f"Decl\\n{const_str}{node.type_spec}\\n{node.name}")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box, color=blue];')
        if node.init_expr:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.init_expr)]} [label=" init", fontcolor=blue];')

    def visit_ArrayDeclNode(self, node):
        my_id = self.node_ids[id(node)]
        const_str = "const " if getattr(node, 'is_const', False) else ""
        dims = "".join([f"[{s}]" for s in node.sizes])
        label = self._get_label(node, f"ArrayDecl\\n{const_str}{node.type_spec}{dims}\\n{node.name}")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box, color=blue];')
        if getattr(node, 'init_expr', None):
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.init_expr)]} [label=" init", fontcolor=blue];')

    def visit_ArrayInitNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="ArrayInit", shape=box, style=dashed];')
        for val in node.values:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(val)]};')

    def visit_FuncCallNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, f"Call: {node.name}()")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=ellipse, style=filled, fillcolor=lightpink];')
        for idx, arg in enumerate(node.args):
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(arg)]} [label=" arg{idx}"];')

    def visit_StringNode(self, node):
        my_id = self.node_ids[id(node)]
        safe_str = node.value.replace('"', '\\"').replace('\n', '\\n')
        label = self._get_label(node, f'\\"{safe_str}\\"')
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box];')

    def visit_AssignNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, "=")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=circle];')
        self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.left)]};')
        self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.right)]};')

    def visit_BinOpNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, node.op)
        self.dot_content.append(f'  {my_id} [label="{label}", shape=circle];')
        self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.left)]};')
        self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.right)]};')

    def visit_UnaryOpNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, node.op)
        self.dot_content.append(f'  {my_id} [label="{label}", shape=circle];')
        self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.child)]};')

    def visit_CastNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="Cast\\n({node.target_type})", shape=ellipse];')
        self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.expr)]};')

    def visit_IdentifierNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, f"ID: {node.name}")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box, style=filled, fillcolor=lightgrey];')

    def visit_IntNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, str(node.value))
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box];')

    def visit_FloatNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, str(node.value))
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box];')

    def visit_CharNode(self, node):
        my_id = self.node_ids[id(node)]
        label = self._get_label(node, f"\'{node.value}\'")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box];')