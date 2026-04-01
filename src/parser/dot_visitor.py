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

    # --- Helper methodes (bespaart enorm veel regels!) ---
    def _add_node(self, node, label, shape="box", fillcolor="white", style="filled", color="black", fontcolor="black"):
        my_id = self.node_ids.get(id(node))
        if my_id:
            self.dot_content.append(f'  {my_id} [label="{label}", shape={shape}, style="{style}", fillcolor="{fillcolor}", color="{color}", fontcolor="{fontcolor}"];')

    def _add_edge(self, source, target, label="", style="solid", color="black", fontcolor="black"):
        src_id = self.node_ids.get(id(source))
        tgt_id = self.node_ids.get(id(target))
        if src_id and tgt_id:
            edge_attr = f'style="{style}", color="{color}"'
            if label: 
                edge_attr += f', label=" {label}", fontcolor="{fontcolor}"'
            self.dot_content.append(f'  {src_id} -> {tgt_id} [{edge_attr}];')

    def generate(self, root_node):
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

    # --- FASE 2: POST-ORDER (Terug naar jouw originele styling!) ---
    def visit_IncludeNode(self, node):
        self._add_node(node, f"Include\\n<{node.header}>", shape="note", fillcolor="lightyellow")

    def visit_CommentNode(self, node):
        self._add_node(node, "Comment", shape="plaintext", fontcolor="gray")

    def visit_ProgramNode(self, node):
        self._add_node(node, "Program", fillcolor="lightblue")
        for child in node.children: self._add_edge(node, child)

    def visit_FunctionNode(self, node):
        label = self._get_label(node, f"Func\\n{node.return_type} {node.name}()")
        self._add_node(node, label, shape="invhouse", fillcolor="lightgreen")
        self._add_edge(node, node.body)

    def visit_CompoundNode(self, node):
        self._add_node(node, "Block", shape="diamond", fillcolor="none")
        for item in node.items: self._add_edge(node, item)

    def visit_DeclNode(self, node):
        const_str = "const " if getattr(node, 'is_const', False) else ""
        label = self._get_label(node, f"Decl\\n{const_str}{node.type_spec}\\n{node.name}")
        self._add_node(node, label, color="blue", fillcolor="none")
        if getattr(node, 'init_expr', None):
            self._add_edge(node, node.init_expr, label="init", fontcolor="blue")

    def visit_ArrayDeclNode(self, node):
        const_str = "const " if getattr(node, 'is_const', False) else ""        
        dims = "[]" * len(node.sizes)
        label = self._get_label(node, f"ArrayDecl\\n{const_str}{node.type_spec}{dims}\\n{node.name}")
        self._add_node(node, label, color="blue", fillcolor="none")
        for idx, size_node in enumerate(node.sizes):
            self._add_edge(node, size_node, label=f"dim{idx}")     
        if getattr(node, 'init_expr', None):
            self._add_edge(node, node.init_expr, label="init", fontcolor="blue")
            
    def visit_ArrayInitNode(self, node):
        self._add_node(node, "ArrayInit", style="dashed", fillcolor="none")
        for val in node.values: self._add_edge(node, val)

    def visit_FuncCallNode(self, node):
        label = self._get_label(node, f"Call: {node.name}()")
        self._add_node(node, label, shape="ellipse", fillcolor="lightpink")
        for idx, arg in enumerate(node.args):
            self._add_edge(node, arg, label=f"arg{idx}")

    def visit_ReturnNode(self, node):
        if node.expr and id(node.expr) not in self.node_ids:
            if hasattr(self, 'visit'): self.visit(node.expr)
        self._add_node(node, "Return", shape="ellipse", fillcolor="lightpink")
        if node.expr: self._add_edge(node, node.expr)

    def visit_FunctionDeclNode(self, node):
        self._add_node(node, f"FuncDecl\\n{node.return_type} {node.name}()", shape="invhouse", fillcolor="lightgreen")

    def visit_StringNode(self, node):
        safe_str = node.value.replace('"', '\\"').replace('\n', '\\n')
        label = self._get_label(node, f'\\"{safe_str}\\"')
        self._add_node(node, label, fillcolor="none")

    def visit_AssignNode(self, node):
        label = self._get_label(node, "=")
        self._add_node(node, label, shape="circle", fillcolor="none")
        self._add_edge(node, node.left)
        self._add_edge(node, node.right)

    def visit_BinOpNode(self, node):
        label = self._get_label(node, node.op)
        self._add_node(node, label, shape="circle", fillcolor="none")
        self._add_edge(node, node.left)
        self._add_edge(node, node.right)

    def visit_UnaryOpNode(self, node):
        label = self._get_label(node, node.op)
        self._add_node(node, label, shape="circle", fillcolor="none")
        self._add_edge(node, node.child)

    def visit_CastNode(self, node):
        self._add_node(node, f"Cast\\n({node.target_type})", shape="ellipse", fillcolor="none")
        self._add_edge(node, node.expr)

    def visit_IdentifierNode(self, node):
        label = self._get_label(node, f"ID: {node.name}")
        self._add_node(node, label, fillcolor="lightgrey")

    def visit_IntNode(self, node):
        label = self._get_label(node, str(node.value))
        self._add_node(node, label, fillcolor="none")

    def visit_FloatNode(self, node):
        label = self._get_label(node, str(node.value))
        self._add_node(node, label, fillcolor="none")

    def visit_CharNode(self, node):
        label = self._get_label(node, f"\'{node.value}\'")
        self._add_node(node, label, fillcolor="none")
    
    def visit_IfNode(self, node):
        self._add_node(node, "If", shape="diamond", fillcolor="orange")
        self._add_edge(node, node.condition, label="cond")
        self._add_edge(node, node.scope, label="then")
        if getattr(node, 'else_scope', None):
            self._add_edge(node, node.else_scope, label="else")

    def visit_WhileNode(self, node):
        self._add_node(node, "While", shape="hexagon", fillcolor="orange")
        self._add_edge(node, node.condition, label="cond")
        self._add_edge(node, node.scope, label="body")

    def visit_ForNode(self, node):
        self._add_node(node, "For", shape="hexagon", fillcolor="orange")
        if node.init: self._add_edge(node, node.init, label="init")
        if node.condition: self._add_edge(node, node.condition, label="cond")
        if node.update: self._add_edge(node, node.update, label="update")
        self._add_edge(node, node.body, label="body")

    def visit_SwitchNode(self, node):
        self._add_node(node, "Switch", shape="diamond", fillcolor="orange")
        self._add_edge(node, node.condition, label="cond")
        for val, body in node.cases:
            self._add_edge(node, body, label=f"case {val}")
        if getattr(node, 'default_case', None):
            self._add_edge(node, node.default_case, label="default")

    def visit_BreakNode(self, node):
        self._add_node(node, "Break", fillcolor="red")

    def visit_ContinueNode(self, node):
        self._add_node(node, "Continue", fillcolor="yellow")

    def visit_EnumNode(self, node):
        label = f"Enum\\n{node.name}\\n{', '.join(node.values)}"
        self._add_node(node, label, fillcolor="purple")

    def visit_TypedefNode(self, node):
        arr_info = f"[{node.array_size}]" if node.is_array else ""
        label = f"Typedef\\n{node.original_type} -> {node.new_name}{arr_info}"
        self._add_node(node, label, fillcolor="lightyellow")

    def visit_StructDeclNode(self, node):
        self._add_node(node, f"StructDef\\n{node.name}", fillcolor="lightpink")
        for member in node.members: self._add_edge(node, member)

    def visit_MemberAccessNode(self, node):
        op = "->" if node.is_pointer else "."
        label = self._get_label(node, f"Access\\n{op}{node.member_name}")
        self._add_node(node, label, shape="ellipse", fillcolor="lightblue")
        self._add_edge(node, node.expr)