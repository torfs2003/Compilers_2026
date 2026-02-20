from src.parser.AST import IntNode, BinOpNode, UnaryOpNode
from src.parser.base_visitor import BaseVisitor

class DOTVisitor(BaseVisitor):
    def __init__(self):
        # Lijst om DOT-regels te verzamelen
        self.dot_content = []
        self.node_count = 0

    def generate_id(self):
        self.node_count += 1
        return f"node{self.node_count}"

    def visit_IntNode(self, node):
        node_id = self.generate_id()
        # Getallen worden weergegeven in een box
        self.dot_content.append(f'  {node_id} [label="{node.value}", shape=box];')
        return node_id

    def visit_BinOpNode(self, node):
        node_id = self.generate_id()
        # Operatoren worden weergegeven in een cirkel
        self.dot_content.append(f'  {node_id} [label="{node.op}", shape=circle];')
        
        # Bezoek recursief de linker- en rechterkinderen om hun ID's te krijgen
        left_id = self.visit(node.left)
        right_id = self.visit(node.right)
        
        # Trek de verbindingslijnen in de AST
        self.dot_content.append(f'  {node_id} -> {left_id};')
        self.dot_content.append(f'  {node_id} -> {right_id};')
        return node_id

    def visit_UnaryOpNode(self, node):
        node_id = self.generate_id()            
        self.dot_content.append(f'  {node_id} [label="{node.op}", shape=circle];')   

        child_id = self.visit(node.child)            
        self.dot_content.append(f'  {node_id} -> {child_id};')
        return node_id
    
    def get_dot_graph(self, ast_root):
        """Zet de hele boom om in een string in DOT formaat."""
        self.dot_content.append("digraph AST {")
        self.visit(ast_root)
        self.dot_content.append("}")
        return "\n".join(self.dot_content)