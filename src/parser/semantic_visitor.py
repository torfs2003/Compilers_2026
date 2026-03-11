from src.parser.base_visitor import BaseVisitor
from src.parser.symbol_table import SymbolTable
from src.parser.AST import *

class SemanticVisitor(BaseVisitor):
    def __init__(self):
        self.symbol_table = SymbolTable()
        self.errors = []
        self.warnings = []
        self.type_richness = {
            'char': 1,
            'int': 2,
            'float': 3
        }

    def get_Error(self,node,error):
        self.errors.append(f"[ Error ] line {node.line}, position {node.column}: {error}")

    def get_Warning(self,node,warning):
        self.warnings.append(f"[ Warning ] line {node.line}, position {node.column}: {warning}")

    def get_richness(self, type_str):
        if not type_str:
            return 0
        if '*' in type_str:
            return 4 
        return self.type_richness.get(type_str, 0)
    
    # Startpunt is nu de FunctionNode (int main)
    def visit_FunctionNode(self, node): 
        self.symbol_table.enter_scope() # Global/Function scope
        # De body van een functie ({ ... })
        self.visit(node.body)
        self.symbol_table.exit_scope()

    # Blok met code ({ ... })
    def visit_CompoundNode(self, node):
        for item in node.items:
            self.visit(item)

    # Declaraties
    def visit_DeclNode(self, node):
        is_pointer = '*' in node.type_spec
        
        actual_const = node.is_const and not is_pointer 
        
        success = self.symbol_table.put(node.name, {
            'type': node.type_spec, 
            'is_const': actual_const, 
            'points_to_const': node.is_const if is_pointer else False
        })
        
        if not success:
            self.get_Error(node,f"Redeclaratie van variabele '{node.name}'.")

        if node.init_expr:
            self.visit(node.init_expr)

    # Variabelen checken
    def visit_IdentifierNode(self, node):
        symbol = self.symbol_table.get(node.name)
        if not symbol:
            self.get_Error(node,f"Variabele '{node.name}' niet gedeclareerd.")
            node.eval_type = 'void'
        else:
            node.eval_type = symbol['type']
            node.is_const = symbol.get('is_const', False)
            node.points_to_const = symbol.get('points_to_const', False)

    # Const Checks en Lvalue Validatie
    def visit_AssignNode(self, node):
        self.visit(node.left)
        self.visit(node.right)

        # Lvalue check (Identifier of Dereference)
        if not isinstance(node.left, (IdentifierNode, UnaryOpNode)):
             self.get_Error(node,f"Toewijzing aan een rvalue is niet toegestaan.")
             return

        # Schrijf je naar een dereference (*p = 10)?
        if isinstance(node.left, UnaryOpNode) and node.left.op == '*':
            target = node.left.child
            if isinstance(target, IdentifierNode):
                if getattr(target, 'points_to_const', False):
                    self.get_Error(node,f"Toewijzing aan de waarde waar '{target.name}' naar wijst is niet toegestaan (const).")

        # Schrijf je naar een directe constante (x = 10)?
        elif isinstance(node.left, IdentifierNode):
            if getattr(node.left, 'is_const', False):
                self.get_Error(node,f"Toewijzing aan const variabele '{node.left.name}' is niet toegestaan.")

        # Richness Warning
        if self.get_richness(node.right.eval_type) > self.get_richness(node.left.eval_type):
            self.get_Warning(node,f"Informatieverlies bij toewijzing van {node.right.eval_type} aan {node.left.eval_type}.")

    # Pointer Arithmetic Logica
    def visit_BinOpNode(self, node):
        self.visit(node.left)
        self.visit(node.right)

        l_type = node.left.eval_type
        r_type = node.right.eval_type

        # Controleer op pointer arithmetic
        if '*' in l_type and r_type == 'int':
            node.eval_type = l_type # Resultaat is nog steeds een pointer
        elif l_type == 'int' and '*' in r_type:
            node.eval_type = r_type
        elif '*' in l_type and '*' in r_type and node.op == '-':
            if l_type != r_type:
                self.get_Error(node,f"Onmogelijke bewerking tussen 2 pointers {node.op}")
            node.eval_type = 'int' # Verschil tussen pointers is een integer
        elif '*' in l_type and '*' in r_type:
            self.get_Error(node,f"Deze bewerking is onmogelijk '{node.op}: '{l_type} en {r_type}")
            node.eval_type = 'int'
        else:
            node.eval_type = l_type if self.get_richness(l_type) >= self.get_richness(r_type) else r_type

    def visit_UnaryOpNode(self, node):
        self.visit(node.child)
        if node.op == '&':
            node.eval_type = node.child.eval_type + "*"
        elif node.op == '*':
            if '*' in node.child.eval_type:
                node.eval_type = node.child.eval_type.replace("*", "", 1)
            else:
                self.get_Error(node,f"Kan een niet-pointer type '{node.child.eval_type}' niet dereferencen.")
                node.eval_type = 'void'
        else:
            node.eval_type = node.child.eval_type

    # Basis types zetten de eval_type
    def visit_IntNode(self, node): node.eval_type = 'int'
    def visit_FloatNode(self, node): node.eval_type = 'float'
    def visit_CharNode(self, node): node.eval_type = 'char'
    def visit_StringNode(self, node): node.eval_type = 'char*'
    def visit_CastNode(self, node):
        self.visit(node.expr)
        node.eval_type = node.target_type # Expliciete cast overschrijft het type