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
    def pre_visit_ReturnNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_FunctionDeclNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_ArrayInitNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_IdentifierNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_IntNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_FloatNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_CharNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_StringNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_IfNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_WhileNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_ForNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_BreakNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_ContinueNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_SwitchNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_EnumNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_TypedefNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_StructDeclNode(self, node): self.node_ids[id(node)] = self.generate_id()
    def pre_visit_MemberAccessNode(self, node): self.node_ids[id(node)] = self.generate_id()

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
        my_id = self.node_ids.get(id(node))
        if not my_id:
            return
        const_str = "const " if getattr(node, 'is_const', False) else ""
        label = self._get_label(node, f"Decl\\n{const_str}{node.type_spec}\\n{node.name}")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box, color=blue];')
        
        if getattr(node, 'init_expr', None) and id(node.init_expr) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.init_expr)]} [label=" init", fontcolor=blue];')

    def visit_ArrayDeclNode(self, node):
        my_id = self.node_ids[id(node)]
        const_str = "const " if getattr(node, 'is_const', False) else ""        
        dims_placeholder = "[]" * len(node.sizes)
        label = self._get_label(node, f"ArrayDecl\\n{const_str}{node.type_spec}{dims_placeholder}\\n{node.name}")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box, color=blue];')
        for idx, size_node in enumerate(node.sizes):
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(size_node)]} [label=" dim{idx}"];')     
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

    def visit_ReturnNode(self, node):
        my_id = self.node_ids[id(node)]
        
        # Forceer het tekenen van de return-expressie (bijv. de '0' in 'return 0;')
        if node.expr and id(node.expr) not in self.node_ids:
            if hasattr(self, 'visit'):
                self.visit(node.expr)

        # Teken het blokje voor Return
        self.dot_content.append(f'  {my_id} [label="Return", shape=ellipse, fillcolor=lightpink, style=filled];')
        
        # Trek een pijl van 'Return' naar de expressie
        if node.expr and id(node.expr) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.expr)]};')

    def visit_FunctionDeclNode(self, node):
        my_id = self.node_ids[id(node)]
        # Teken een blokje voor de forward declaration
        self.dot_content.append(f'  {my_id} [label="FuncDecl\\n{node.return_type} {node.name}()", shape=invhouse, fillcolor=lightgreen, style=filled];')

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
    
    def visit_IfNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="If", shape=diamond, fillcolor=orange, style=filled];')
        
        if id(node.condition) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.condition)]} [label=" cond"];')
        if id(node.scope) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.scope)]} [label=" then"];')
        if getattr(node, 'else_scope', None) and id(node.else_scope) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.else_scope)]} [label=" else"];')

    def visit_WhileNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="While", shape=hexagon, fillcolor=orange, style=filled];')
        if id(node.condition) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.condition)]} [label=" cond"];')
        if id(node.scope) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.scope)]} [label=" body"];')

    def visit_ForNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="For", shape=hexagon, fillcolor=orange, style=filled];')
        if node.init and id(node.init) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.init)]} [label=" init"];')
        if node.condition and id(node.condition) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.condition)]} [label=" cond"];')
        if node.update and id(node.update) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.update)]} [label=" update"];')
        if id(node.body) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.body)]} [label=" body"];')

    def visit_SwitchNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="Switch", shape=diamond, fillcolor=orange, style=filled];')
        if id(node.condition) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.condition)]} [label=" cond"];')
        for val, body in node.cases:
            if id(body) in self.node_ids:
                self.dot_content.append(f'  {my_id} -> {self.node_ids[id(body)]} [label=" case {val}"];')
        if node.default_case and id(node.default_case) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.default_case)]} [label=" default"];')

    def visit_BreakNode(self, node):
        self.dot_content.append(f'  {self.node_ids[id(node)]} [label="Break", shape=box, fillcolor=red, style=filled];')

    def visit_ContinueNode(self, node):
        self.dot_content.append(f'  {self.node_ids[id(node)]} [label="Continue", shape=box, fillcolor=yellow, style=filled];')

    def visit_EnumNode(self, node):
        label = f"Enum\\n{node.name}\\n{', '.join(node.values)}"
        self.dot_content.append(f'  {self.node_ids[id(node)]} [label="{label}", shape=box, fillcolor=purple, style=filled];')

    def visit_TypedefNode(self, node):
        my_id = self.node_ids[id(node)]
        arr_info = f"[{node.array_size}]" if node.is_array else ""
        label = f"Typedef\\n{node.original_type} -> {node.new_name}{arr_info}"
        self.dot_content.append(f'  {my_id} [label="{label}", shape=box, style=filled, fillcolor=lightyellow];')

    def visit_StructDeclNode(self, node):
        my_id = self.node_ids[id(node)]
        self.dot_content.append(f'  {my_id} [label="StructDef\\n{node.name}", shape=box, style=filled, fillcolor=lightpink];')
        for member in node.members:
            if id(member) in self.node_ids:
                self.dot_content.append(f'  {my_id} -> {self.node_ids[id(member)]};')

    def visit_MemberAccessNode(self, node):
        my_id = self.node_ids[id(node)]
        op = "->" if node.is_pointer else "."
        label = self._get_label(node, f"Access\\n{op}{node.member_name}")
        self.dot_content.append(f'  {my_id} [label="{label}", shape=ellipse, style=filled, fillcolor=lightblue];')
        if id(node.expr) in self.node_ids:
            self.dot_content.append(f'  {my_id} -> {self.node_ids[id(node.expr)]};')    