from src.parser.base_visitor import BaseVisitor
from src.parser.symbol_table import SymbolTable
from src.parser.AST import *

class SemanticVisitor(BaseVisitor):
    def __init__(self):
        self.symbol_table = SymbolTable()
        self.errors = []
        self.warnings = []
        self.stdio_included = False
        self.type_richness = {'void': 0, 'char': 1, 'int': 2, 'float': 3}

    def get_Error(self, node, error):
        self.errors.append(f"[ Error ] line {node.line}, position {node.column}: {error}")

    def get_Warning(self, node, warning):
        self.warnings.append(f"[ Warning ] line {node.line}, position {node.column}: {warning}")

    def get_richness(self, type_str):
        if not type_str: return 0
        if '*' in type_str: return 10
        return self.type_richness.get(type_str, 0)

    # ==========================================
    # FASE 1: PRE-ORDER METHODES
    # ==========================================

    def pre_visit_FunctionNode(self, node):
        self.symbol_table.enter_scope()
        for p_type, p_name in node.params:
            self.symbol_table.put(p_name, {'type': p_type, 'is_const': False})

    def visit_CompoundNode(self, node):
        found_statement = False
        for item in node.items:
            if isinstance(item, (DeclNode, ArrayDeclNode)):
                if found_statement:
                    self.errors.append(f"Line {item.line}: ANSI C89 forbids mixed declarations and code")
            else:
                found_statement = True

    def pre_visit_DeclNode(self, node):
        type_str = node.type_spec
        if type_str == 'char' and isinstance(getattr(node, 'init_expr', None), StringNode):
            type_str = 'char*'
        
        is_const_var = node.is_const
        points_to_const = False
        
        if '*' in type_str:
            if node.is_const:
                is_const_var = False
                points_to_const = True
            
            if getattr(node, 'is_const_ptr', False):
                is_const_var = True
        else:
            if getattr(node, 'is_const_ptr', False):
                is_const_var = True

        success = self.symbol_table.put(node.name, {
            'type': type_str, 
            'is_const': is_const_var,
            'points_to_const': points_to_const
        })
        
        if not success:
            self.get_Error(node, f"Variabele '{node.name}' is al gedeclareerd in deze scope.")
            
    def pre_visit_ArrayDeclNode(self, node):
        num_dimensions = len(node.sizes) if hasattr(node, 'sizes') and node.sizes else 1
        type_str = node.type_spec + ("*" * num_dimensions)
        
        if type_str == 'char*' and isinstance(getattr(node, 'init_expr', None), StringNode):
            if not node.sizes:
                node.sizes = [len(node.init_expr.value) + 1]

        success = self.symbol_table.put(node.name, {
            'type': type_str, 
            'is_const': node.is_const,
            'points_to_const': node.is_const 
        })
        if not success:
            self.get_Error(node, f"Array '{node.name}' is al gedeclareerd in deze scope.")

    # ==========================================
    # FASE 2: POST-ORDER METHODES (Uitvoeren NADAT kinderen zijn bezocht)
    # ==========================================

    def visit_IncludeNode(self, node):
        if hasattr(node, 'header') and node.header == "stdio.h":
            self.stdio_included = True
    
    def visit_FunctionNode(self, node):
        self.symbol_table.exit_scope()

    def visit_IdentifierNode(self, node):
        symbol = self.symbol_table.get(node.name)
        if not symbol:
            self.get_Error(node, f"Variabele '{node.name}' niet gedeclareerd.")
            node.eval_type = 'void'
            node.is_const = False
            node.points_to_const = False
        else:
            node.eval_type = symbol.get('type', 'void')            
            node.is_const = symbol.get('is_const', False)
            node.points_to_const = symbol.get('points_to_const', False)
            
            symbol['used'] = True

    def visit_DeclNode(self, node):
        node.eval_type = node.type_spec
        if node.eval_type == 'char' and isinstance(getattr(node, 'init_expr', None), StringNode):
            node.eval_type = 'char*'
            
        if node.init_expr:
            init_type = getattr(node.init_expr, 'eval_type', 'void')
            
            # NEW: Check if the initialized value is literally the integer 0 (null pointer)
            is_null_ptr = isinstance(node.init_expr, IntNode) and node.init_expr.value == 0
            
            # UPDATED: Ignore the strict pointer check if it's a null pointer
            if ('*' in node.eval_type or '*' in init_type) and not is_null_ptr:
                if node.eval_type != init_type and not isinstance(node.init_expr, CastNode):
                    self.get_Error(node, f"Incompatibele types bij initialisatie: '{init_type}' aan '{node.eval_type}'.")
            
            elif self.get_richness(init_type) > self.get_richness(node.eval_type) and not (node.eval_type == 'char*' and init_type == 'char*'):
                self.get_Warning(node, f"Informatieverlies bij initialisatie van {node.name}: {init_type} naar {node.eval_type}.")

    def visit_ArrayDeclNode(self, node):
        num_dimensions = len(node.sizes) if hasattr(node, 'sizes') and node.sizes else 1
        node.eval_type = node.type_spec + ("*" * num_dimensions)
        
        if node.init_expr:
            if isinstance(node.init_expr, ArrayInitNode):
                # Safely extract the integer value from the AST Node
                declared_size = 0
                if node.sizes and hasattr(node.sizes[0], 'value'):
                    declared_size = node.sizes[0].value
                elif node.sizes and isinstance(node.sizes[0], IntNode): # Fallback check
                    declared_size = node.sizes[0].value
                
                actual_size = len(node.init_expr.values)
                if declared_size > 0 and actual_size > declared_size:
                    self.get_Error(node, f"Te veel initializers voor array '{node.name}'.")

    def visit_AssignNode(self, node):
        # 1. L-Value (rvalue) Check
        is_lvalue = False
        
        if isinstance(node.left, IdentifierNode):
            is_lvalue = True
        elif isinstance(node.left, UnaryOpNode) and node.left.op == '*':
            is_lvalue = True
        elif isinstance(node.left, BinOpNode) and node.left.op == '[]':
            is_lvalue = True

        if not is_lvalue:
            self.get_Error(node, "Toewijzing aan een rvalue is niet toegestaan.")
        else:
            if isinstance(node.left, UnaryOpNode) and node.left.op == '*':
                target = node.left.child
                if isinstance(target, IdentifierNode) and getattr(target, 'points_to_const', False):
                    self.get_Error(node, f"Toewijzing aan de waarde waar '{target.name}' naar wijst is niet toegestaan (const).")
            elif isinstance(node.left, IdentifierNode) and getattr(node.left, 'is_const', False):
                self.get_Error(node, f"Toewijzing aan const variabele '{node.left.name}' is niet toegestaan.")

        l_type = getattr(node.left, 'eval_type', 'void')
        r_type = getattr(node.right, 'eval_type', 'void')
        
        if l_type and r_type:
            if '*' in l_type or '*' in r_type:
                if l_type != r_type and not isinstance(node.right, CastNode):
                    self.get_Error(node, f"Incompatibele types bij toewijzing: '{r_type}' aan '{l_type}'.")
            
            elif self.get_richness(r_type) > self.get_richness(l_type):
                self.get_Warning(node, f"Informatieverlies bij toewijzing van {r_type} aan {l_type}.")

    def visit_BinOpNode(self, node):
        l_type = getattr(node.left, 'eval_type', 'void')
        r_type = getattr(node.right, 'eval_type', 'void')

        if '*' in l_type and '*' in r_type:
            if node.op == '+':
                self.get_Error(node, "Optellen van twee pointers is niet toegestaan.")
                node.eval_type = 'void'
                return
            elif node.op == '-' and l_type != r_type:
                self.get_Error(node, f"Aftrekken van pointers met verschillende types: '{l_type}' en '{r_type}'.")
                node.eval_type = 'int'
                return
            elif node.op == '-':
                node.eval_type = 'int' 
                return
            
        if node.op == '[]':
            if r_type != 'int':
                self.get_Error(node, f"Array index moet een 'int' zijn, kreeg '{r_type}'.")
            if '*' in l_type:
                node.eval_type = l_type.replace('*', '', 1)
            else:
                self.get_Error(node, f"Type '{l_type}' kan niet worden geïndexeerd.")
                node.eval_type = 'void'
        elif '*' in l_type and r_type == 'int':
            node.eval_type = l_type
        elif l_type == 'int' and '*' in r_type:
            node.eval_type = r_type
        elif '*' in l_type and '*' in r_type and node.op == '-':
            node.eval_type = 'int'
        else:
            node.eval_type = l_type if self.get_richness(l_type) >= self.get_richness(r_type) else r_type
        
        comparison_ops = ['==', '!=', '<', '>', '<=', '>=', '&&', '||']
        
        if node.op in comparison_ops:
            node.eval_type = 'int'
        else:
            node.eval_type = l_type if self.get_richness(l_type) >= self.get_richness(r_type) else r_type

    def visit_UnaryOpNode(self, node):
        child_type = getattr(node.child, 'eval_type', 'void')
        
        if node.op == '&':
            node.eval_type = child_type + "*"
        elif node.op == '*':
            if '*' in child_type:

                node.eval_type = child_type.rsplit('*', 1)[0]
                node.is_const = getattr(node.child, 'points_to_const', False)
            else:
                self.get_Error(node, f"Kan type '{child_type}' niet dereferencen.")
                node.eval_type = 'void'
        else:
            node.eval_type = child_type

    def visit_FuncCallNode(self, node):
        if node.name in ['printf', 'scanf']:
            if not self.stdio_included:
                self.get_Error(node, f"Gebruik van '{node.name}' vereist #include <stdio.h>.")
            node.eval_type = 'int'
            if node.name == 'scanf':
                for i, arg in enumerate(node.args):
                    if i > 0: 
                        arg_type = getattr(arg, 'eval_type', 'void')
                        if '*' not in arg_type:
                            self.get_Error(arg, f"Scanf verwacht een pointer (adres), kreeg '{arg_type}'.")
        else:
            node.eval_type = 'void'

    def visit_CastNode(self, node): node.eval_type = node.target_type
    def visit_IntNode(self, node): node.eval_type = 'int'
    def visit_FloatNode(self, node): node.eval_type = 'float'
    def visit_CharNode(self, node): node.eval_type = 'char'
    def visit_StringNode(self, node): node.eval_type = 'char*'