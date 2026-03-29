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
        self.current_function_return_type = None

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

    def pre_visit_CompoundNode(self, node):
        self.symbol_table.enter_scope()

    def pre_visit_FunctionDeclNode(self, node):
        # Sla een forward declaration op in de symbol table
        existing = self.symbol_table.get(node.name)
        if existing and existing.get('type') == 'function':
            pass
        else:
            self.symbol_table.put(node.name, {
                'type': 'function',
                'return_type': node.return_type,
                'params': node.params,
                'defined': False
            })

    def pre_visit_FunctionNode(self, node):
        func_sym = self.symbol_table.get(node.name)
        
        # 1. Controleer of de functie al bestaat / gedefinieerd is
        if func_sym and func_sym.get('type') == 'function':
            if func_sym.get('defined'):
                self.get_Error(node, f"Functie '{node.name}' is al gedefinieerd.")
            else:
                # Forward declaration bestond, check of types kloppen
                if func_sym['return_type'] != node.return_type:
                    self.get_Error(node, f"Return type van '{node.name}' verschilt van declaratie.")
                if len(func_sym['params']) != len(node.params):
                    self.get_Error(node, f"Aantal parameters van '{node.name}' verschilt van declaratie.")
                else:
                    for i in range(len(node.params)):
                        if func_sym['params'][i][0] != node.params[i][0]:
                            self.get_Error(node, f"Type van parameter {i+1} van '{node.name}' verschilt van declaratie.")
                func_sym['defined'] = True
        else:
            self.symbol_table.put(node.name, {
                'type': 'function',
                'return_type': node.return_type,
                'params': node.params,
                'defined': True
            })

        # 2. Houd bij in welke functie we zitten voor het return statement
        self.current_function_return_type = node.return_type
        
        # 3. Open de scope en voeg parameters toe als lokale variabelen
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
        
        self.symbol_table.exit_scope()
    
    def pre_visit_BinOpNode(self, node):
        if node.op == '*':
            if isinstance(node.left, IdentifierNode):
                symbol = self.symbol_table.get(node.left.name)
                if symbol and symbol.get('type') == 'typedef':
                    # 1. Haal de echte var naam uit de rechterkant (rechterkant kan een Identifier zijn)
                    var_name = ""
                    if isinstance(node.right, IdentifierNode):
                        var_name = node.right.name
                    
                    # 2. Bouw het echte type op (het resolved type + pointer sterretje)
                    real_type = self.symbol_table.resolve_type(node.left.name) + "*"
                    
                    node.__class__ = DeclNode
                    node.is_const = False
                    node.type_spec = real_type
                    node.name = var_name
                    node.init_expr = None

                    if var_name:
                        self.symbol_table.put(var_name, {
                            'type': real_type,
                            'is_const': False,
                            'points_to_const': False
                        })               

    def pre_visit_DeclNode(self, node):
        if node.type_spec.startswith("struct") and " " not in node.type_spec:
            node.type_spec = node.type_spec.replace("struct", "struct ", 1)

        if 'enum' in node.type_spec:
            node.type_spec = 'int'
            
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
        if 'enum' in node.type_spec:
            node.type_spec = 'int'
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
    
    def pre_visit_StructDeclNode(self, node):
        member_dict = {}
        for index, member in enumerate(node.members):
            if isinstance(member, DeclNode):
                member_dict[member.name] = {
                    'type': self.symbol_table.resolve_type(member.type_spec),
                    'index': index
                }
            elif isinstance(member, ArrayDeclNode):
                member_dict[member.name] = {
                    'type': self.symbol_table.resolve_type(member.type_spec) + "*",
                    'index': index
                }
                
        success = self.symbol_table.put(f"struct {node.name}", {
            'type': 'struct_def',
            'members': member_dict
        })
        if not success:
            self.get_Error(node, f"Struct '{node.name}' is al gedefinieerd.")
            
        self.symbol_table.enter_scope()
    # ==========================================
    # FASE 2: POST-ORDER METHODES
    # ==========================================

    def visit_ProgramNode(self, node):
        main_sym = self.symbol_table.get("main")
        if not main_sym or main_sym.get('type') != 'function':
            self.get_Error(node, "Missing 'main' function.")

    def visit_IncludeNode(self, node):
        if hasattr(node, 'header') and node.header == "stdio.h":
            self.stdio_included = True
    
    def visit_FunctionNode(self, node):
        self.symbol_table.exit_scope()
        self.current_function_return_type = None

    def visit_ReturnNode(self, node):
        # 1. Controleer of we wel binnen een functie-body zijn
        if self.current_function_return_type is None:
            self.get_Error(node, "Return statement buiten een functie.")
            return

        if node.expr and getattr(node.expr, 'eval_type', None) is None:
            if hasattr(self, 'visit'):
                self.visit(node.expr)

        ret_type = getattr(node.expr, 'eval_type', 'void') if node.expr else 'void'
        
        if ret_type is None:
            ret_type = 'void'
            
        expected = self.current_function_return_type

        # 1. Void functies
        if expected == 'void':
            if ret_type != 'void':
                self.get_Error(node, "Void functie mag geen waarde returnen.")
            return

        # 2. Int/Float/Char functies
        if expected != 'void' and ret_type == 'void':
            self.get_Error(node, f"Functie moet '{expected}' returnen, maar return is leeg.")
            return

        # 3. Type checks voor Pointers en Informatieverlies
        if expected and ret_type:
            if '*' in expected and '*' not in ret_type:
                is_null = isinstance(node.expr, IntNode) and node.expr.value == 0
                if not is_null:
                    self.get_Error(node, f"Incompatibele return types: verwacht '{expected}', kreeg '{ret_type}'.")
            elif '*' not in expected and '*' not in ret_type:
                 if self.get_richness(ret_type) > self.get_richness(expected):
                     self.get_Warning(node, f"Informatieverlies bij return: {ret_type} naar {expected}.")

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
        node.eval_type = self.symbol_table.resolve_type(node.type_spec)
        if node.eval_type == 'char' and isinstance(getattr(node, 'init_expr', None), StringNode):
            node.eval_type = 'char*'
            
        if node.init_expr:
            init_type = getattr(node.init_expr, 'eval_type', 'void')
            
            is_null_ptr = isinstance(node.init_expr, IntNode) and node.init_expr.value == 0
            
            if ('*' in node.eval_type or '*' in init_type) and not is_null_ptr:
                if node.eval_type != init_type and not isinstance(node.init_expr, CastNode):
                    self.get_Error(node, f"Incompatibele types bij initialisatie: '{init_type}' aan '{node.eval_type}'.")
            
            elif self.get_richness(init_type) > self.get_richness(node.eval_type) and not (node.eval_type == 'char*' and init_type == 'char*'):
                self.get_Warning(node, f"Informatieverlies bij initialisatie van {node.name}: {init_type} naar {node.eval_type}.")

    def visit_ArrayDeclNode(self, node):
        num_dimensions = len(node.sizes) if hasattr(node, 'sizes') and node.sizes else 1
        
        resolved_base = self.symbol_table.resolve_type(node.type_spec)
        node.eval_type = resolved_base + ("*" * num_dimensions)
        
        if node.init_expr:
            if isinstance(node.init_expr, ArrayInitNode):
                declared_size = 0
                if node.sizes and hasattr(node.sizes[0], 'value'):
                    declared_size = node.sizes[0].value
                elif node.sizes and isinstance(node.sizes[0], IntNode):
                    declared_size = node.sizes[0].value
                
                actual_size = len(node.init_expr.values)
                if declared_size > 0 and actual_size > declared_size:
                    self.get_Error(node, f"Te veel initializers voor array '{node.name}'.")
    
    def visit_TypedefNode(self, node):
        resolved_type = self.symbol_table.resolve_type(node.original_type)
        
        # Sla op in de symbol table als een speciaal 'typedef' symbool
        success = self.symbol_table.put(node.new_name, {
            'type': 'typedef',
            'original_type': resolved_type,
            'is_array': node.is_array,
            'array_size': node.array_size
        })
        if not success:
            self.get_Error(node, f"Typedef naam '{node.new_name}' botst met een bestaande declaratie.")

    

    def visit_AssignNode(self, node):
        is_lvalue = False
        
        if isinstance(node.left, IdentifierNode):
            is_lvalue = True
        elif isinstance(node.left, UnaryOpNode) and node.left.op == '*':
            is_lvalue = True
        elif isinstance(node.left, BinOpNode) and node.left.op == '[]':
            is_lvalue = True
        elif isinstance(node.left, MemberAccessNode):
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
            return

        func_sym = self.symbol_table.get(node.name)
        if not func_sym or func_sym.get('type') != 'function':
            self.get_Error(node, f"Functie '{node.name}' niet gedeclareerd voor aanroep.")
            node.eval_type = 'void'
            return

        expected_params = func_sym['params']
        if len(node.args) != len(expected_params):
            self.get_Error(node, f"Functie '{node.name}' verwacht {len(expected_params)} argumenten, kreeg {len(node.args)}.")
        else:
            for i, arg in enumerate(node.args):
                arg_type = getattr(arg, 'eval_type', 'void')
                exp_type = expected_params[i][0] # Type is index 0 in the tuple (type, name)
                if '*' in exp_type and '*' not in arg_type and not (isinstance(arg, IntNode) and arg.value == 0):
                    self.get_Error(node, f"Argument {i+1} van '{node.name}' verwacht pointer '{exp_type}', kreeg '{arg_type}'.")
                elif '*' not in exp_type and '*' not in arg_type:
                    if self.get_richness(arg_type) > self.get_richness(exp_type):
                        self.get_Warning(node, f"Informatieverlies bij aanroep argument {i+1}: {arg_type} naar {exp_type}.")

        node.eval_type = func_sym['return_type']
        
    def visit_EnumNode(self, node):
        for val_name in node.values:
            success = self.symbol_table.put(val_name, {
                'type': 'int', 
                'is_const': True,
                'points_to_const': False
            })
            if not success:
                self.get_Error(node, f"Enum waarde '{val_name}' is al gedeclareerd in deze scope.")
    
    def visit_MemberAccessNode(self, node):
        # 1. Wat is het type van de variabele vóór de punt? (bijv. 'struct ListNode')
        base_type = getattr(node.expr, 'eval_type', 'void')
        
        if base_type.startswith("struct") and " " not in base_type:
            base_type = base_type.replace("struct", "struct ", 1)
        
        # 2. Los typedefs op, voor het geval het type via een typedef is verkregen
        base_type = self.symbol_table.resolve_type(base_type)
        
        # 3. Check pointers en operators (-> vs .)
        if node.is_pointer:
            if not base_type.endswith('*'):
                self.get_Error(node, f"Operator '->' vereist een pointer, maar kreeg '{base_type}'.")
                node.eval_type = 'void'
                return
            struct_name = base_type.rstrip('*')
        else:
            if base_type.endswith('*'):
                self.get_Error(node, f"Operator '.' vereist een struct, maar kreeg een pointer '{base_type}'. Gebruik '->'.")
                node.eval_type = 'void'
                return
            struct_name = base_type

        # 4. Zoek de struct definitie in de Symbol Table
        struct_def = self.symbol_table.get(struct_name)
        
        if not struct_def or struct_def.get('type') != 'struct_def':
            self.get_Error(node, f"Type '{struct_name}' is geen bekende struct.")
            node.eval_type = 'void'
            return

        # 5. Bestaat de gevraagde eigenschap (member) in de struct?
        members = struct_def.get('members', {})
        if node.member_name not in members:
            self.get_Error(node, f"Struct '{struct_name}' heeft geen member genaamd '{node.member_name}'.")
            node.eval_type = 'void'
            return

        # 6. Alles klopt! Geef het type én de index van de member door.
        member_info = members[node.member_name]
        node.eval_type = member_info['type']
        node.member_index = member_info['index']

    def visit_StructDeclNode(self, node): self.symbol_table.exit_scope()

    def visit_CastNode(self, node): node.eval_type = node.target_type
    def visit_IntNode(self, node): node.eval_type = 'int'
    def visit_FloatNode(self, node): node.eval_type = 'float'
    def visit_CharNode(self, node): node.eval_type = 'char'
    def visit_StringNode(self, node): node.eval_type = 'char*'