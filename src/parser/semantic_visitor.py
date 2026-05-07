from typing import Optional

from src.parser.base_visitor import BaseVisitor
from src.parser.symbol_table import SymbolTable
from src.parser.AST import *
import os


class SemanticVisitor(BaseVisitor):
    def __init__(self, include_paths=None):
        self.symbol_table = SymbolTable()
        self.errors = []
        self.warnings = []
        self.stdio_included = False
        self.type_richness = {'void': 0, 'char': 1, 'int': 2, 'float': 3}
        self.current_function_return_type = None
        self.include_paths = include_paths or []

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
        seen = set()
        for p_type, p_name in node.params:
            if p_name in seen:
                self.get_Error(node, f"variabele '{p_name}' in functie '{node.name}' wordt meer keer gebruikt.")
                break
            seen.add(p_name)

        existing = self.symbol_table.get(node.name)
        if existing and existing.get('type') == 'function':
            if existing.get('return_type') != node.return_type:
                self.get_Error(node,
                               f"functie '{node.name}' was gedefineerd als '{existing.get('return_type')}' en is hergedefineerd als '{node.return_type}'.")
                return
            old_params = existing.get('params', [])
            new_params = node.params
            if len(old_params) != len(new_params):
                self.get_Error(node,
                               f"functie '{node.name}' is origineel met '{len(old_params)}' parameters gedefineerd en is hergedefineerd met '{len(new_params)}' parameters.")
                return
            for i in range(len(old_params)):
                old_type = old_params[i][0]
                new_type = new_params[i][0]
                if old_type != new_type:
                    self.get_Error(node,
                                   f"Functie '{node.name}' is origineel gedeclareerd met parameter {i + 1} van type '{old_type}' en is hergedeclareerd met parameter {i + 1} van type '{new_type}'.")
                    break

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
                            self.get_Error(node,
                                           f"Type van parameter {i + 1} van '{node.name}' verschilt van declaratie.")
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
        self.symbol_table.enter_scope()

        seen_statement = False

        for item in node.items:

            # DECLARATION
            if isinstance(item, (DeclNode, ArrayDeclNode)):
                if seen_statement:
                    self.get_Warning(
                        item,
                        "ISO C90 forbids mixed declarations and code"
                    )

            # STATEMENT
            else:
                seen_statement = True

            # bezoek kind normaal verder
            self.visit(item)

        self.symbol_table.exit_scope()

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
        base_type = node.type_spec.replace('*', '').replace('const', '').strip()
        primitives = {'int', 'float', 'char', 'void'}
        if base_type not in primitives and not base_type.startswith('struct'):
            sym = self.symbol_table.get(base_type)
            if not sym or sym.get('type') != 'typedef':
                self.get_Error(node, f"Onbekend type '{base_type}'.")

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

        if (not hasattr(node, 'sizes') or not node.sizes) and node.init_expr:
            if isinstance(node.init_expr, ArrayInitNode):
                # We vullen node.sizes aan met een dummy IntNode met de juiste lengte
                from src.parser.AST import IntNode
                node.sizes = [IntNode(len(node.init_expr.values))]

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
                if member.type_spec.startswith("struct") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("struct", "struct ", 1)

                resolved_type = self.symbol_table.resolve_type(member.type_spec)

                if resolved_type.startswith("struct ") and "*" not in resolved_type:

                    if resolved_type == f"struct {node.name}":
                        self.get_Error(member,
                                       f"Struct '{node.name}' kan zichzelf niet 'by value' bevatten (resulteert in oneindige grootte). Gebruik een pointer.")

                    else:
                        target_struct = self.symbol_table.get(resolved_type)
                        if not target_struct or target_struct.get('type') != 'struct_def':
                            self.get_Error(member,
                                           f"Geneste struct '{resolved_type}' is onbekend of nog niet gedefinieerd. Structs 'by value' vereisen een eerdere definitie.")

                member_dict[member.name] = {
                    'type': resolved_type,
                    'index': index
                }

            elif isinstance(member, ArrayDeclNode):
                if member.type_spec.startswith("struct") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("struct", "struct ", 1)

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

    def pre_visit_UnionDeclNode(self, node):
        member_dict = {}
        for index, member in enumerate(node.members):
            if isinstance(member, DeclNode):
                if member.type_spec.startswith("union") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("union", "union ", 1)
                elif member.type_spec.startswith("struct") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("struct", "struct ", 1)

                resolved_type = self.symbol_table.resolve_type(member.type_spec)

                # Controleer recursieve definitie (union in union)
                if resolved_type.startswith("union ") and "*" not in resolved_type:
                    if resolved_type == f"union {node.name}":
                        self.get_Error(member,
                                       f"Union '{node.name}' kan zichzelf niet 'by value' bevatten. Gebruik een pointer.")
                    else:
                        target_union = self.symbol_table.get(resolved_type)
                        if not target_union or target_union.get('type') != 'union_def':
                            self.get_Error(member, f"Geneste union '{resolved_type}' is onbekend.")

                member_dict[member.name] = {
                    'type': resolved_type,
                    'index': 0
                }

            elif isinstance(member, ArrayDeclNode):
                if member.type_spec.startswith("union") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("union", "union ", 1)
                elif member.type_spec.startswith("struct") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("struct", "struct ", 1)

                member_dict[member.name] = {
                    'type': self.symbol_table.resolve_type(member.type_spec) + "*",
                    'index': 0  # <--- CRUCIAAL: Altijd 0.
                }

        success = self.symbol_table.put(f"union {node.name}", {
            'type': 'union_def',
            'members': member_dict
        })
        if not success:
            self.get_Error(node, f"Union '{node.name}' is al gedefinieerd.")

        self.symbol_table.enter_scope()

    def _check_type_compatibility(self, node, l_type, r_type, right_expr):
        # Voorkom NoneType crashes
        l_type = l_type or 'void'
        r_type = r_type or 'void'

        if l_type == r_type:
            return

        # 1. POINTER MISMATCH -> Harde Error (voor GCC compliance)
        if '*' in l_type or '*' in r_type:
            # Uitzondering: 0 (NULL) toewijzen aan een pointer mag altijd
            is_null = isinstance(right_expr, IntNode) and right_expr.value == 0
            if not is_null and not isinstance(right_expr, CastNode):
                self.get_Error(node, f"Incompatibele types: '{r_type}' aan '{l_type}'.")

        # 2. NUMERIEKE MISMATCH -> Waarschuwing (informatieverlies)
        # Dit lost Test 10 & 11 op (int naar char)
        elif self.get_richness(r_type) > self.get_richness(l_type):
            self.get_Warning(node, f"Informatieverlies: {r_type} naar {l_type}.")

    # ==========================================
    # FASE 2: POST-ORDER METHODES
    # ==========================================

    def visit_ProgramNode(self, node):
        main_sym = self.symbol_table.get("main")
        if not main_sym or main_sym.get('type') != 'function':
            self.get_Error(node, "Missing 'main' function.")

    def visit_IncludeNode(self, node):
        header: Optional[str] = getattr(node, 'header', None)
        if header is None:
            return

        found = False
        if header == "stdio.h":
            self.stdio_included = True
            return
        if not found:
            for base in self.include_paths:
                to_search = os.path.join(base, header)
                if os.path.isfile(to_search):
                    found = True
                    break
        if not found:
            self.get_Error(node, f"'{header}' niet gevonden")

    def visit_FunctionNode(self, node):
        self.symbol_table.exit_scope()
        self.current_function_return_type = None

    def visit_ReturnNode(self, node):
        # 1. Controleer of we wel binnen een functie-body zijn
        if self.current_function_return_type is None:
            self.get_Error(node, "Return statement buiten een functie.")
            return

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

        if node.init_expr:
            init_type = getattr(node.init_expr, 'eval_type', 'void')
            if init_type is None:
                init_type = 'void'

            if isinstance(node.init_expr, ArrayInitNode):
                self.get_Warning(
                    node,
                    f"scalar variabele '{node.name}' geïnitialiseerd met initializer list (C89 extension / non-portable)"
                )
                return

            is_null_ptr = isinstance(node.init_expr, IntNode) and node.init_expr.value == 0

            if node.eval_type != init_type and not isinstance(node.init_expr, CastNode):
                # 1. Check Pointers
                if '*' in node.eval_type or '*' in init_type:
                    is_null_ptr = isinstance(node.init_expr, IntNode) and node.init_expr.value == 0
                    if not is_null_ptr:
                        # Maak er een Warning van voor Folder 3, of een Error zonder sys.exit
                        self.get_Warning(node,
                                         f"Incompatibele types bij initialisatie: '{init_type}' aan '{node.eval_type}'.")

                # 2. Check Informatieverlies (Richness)
                elif self.get_richness(init_type) > self.get_richness(node.eval_type):
                    # Specifieke check voor char overflow
                    if node.eval_type == 'char' and init_type == 'int' and isinstance(node.init_expr, IntNode):
                        val = node.init_expr.value
                        if val < -128 or val > 127:
                            # GEBRUIK get_Error, GEEN sys.exit(1)!
                            # Zo kan de compiler de fout loggen zonder zelf te crashen.
                            self.get_Error(node, f"Overflow: Waarde {val} past niet in een 'char' (-128 tot 127).")
                    else:
                        self.get_Warning(node,
                                         f"Informatieverlies bij initialisatie van {node.name}: {init_type} naar {node.eval_type}.")

    def visit_ArrayDeclNode(self, node):
        if node.sizes:
            for s in node.sizes:
                s_type = getattr(s, "eval_type", None)
                if s_type is None:
                    continue
                if s_type != "int":
                    self.get_Error(node, f"size moet een int zijn! Kreeg '{s_type}'")
                    break

        num_dimensions = len(node.sizes) if hasattr(node, 'sizes') and node.sizes else 1

        if hasattr(node, 'sizes') and node.sizes:
            for size_node in node.sizes:
                size_type = getattr(size_node, 'eval_type', 'void')
                if size_type != 'int':
                    self.get_Error(node, f"Array grootte moet een 'int' zijn, kreeg '{size_type}'.")

        resolved_base = self.symbol_table.resolve_type(node.type_spec)
        node.eval_type = resolved_base + ("*" * num_dimensions)

        if node.init_expr:
            if isinstance(node.init_expr, ArrayInitNode):

                def check_constant_init(init_node):
                    for val in init_node.values:
                        if isinstance(val, ArrayInitNode):
                            check_constant_init(val)  # Recursief voor 2D/3D arrays
                        elif isinstance(val, (IdentifierNode, UnaryOpNode, FuncCallNode)):
                            # Zodra we een variabele, '&' operator of functie zien: BAM! Error.
                            self.get_Warning(node, "initializer element is not a compile-time constant (C89 extension)")

                check_constant_init(node.init_expr)

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

        # Alleen huidige scope checken, niet outer scopes!
        current_scope = self.symbol_table.scopes[-1]
        existing = current_scope.get(node.new_name)

        if existing and existing.get('type') == 'typedef':
            existing_type = existing.get('original_type')
            if existing_type != resolved_type:
                self.get_Error(node,
                               f"Conflicting types for typedef '{node.new_name}': '{existing_type}' vs '{resolved_type}'.")
            else:
                self.get_Warning(node, f"Redefinition of typedef '{node.new_name}'.")
            return

        success = self.symbol_table.put(node.new_name, {
            'type': 'typedef',
            'original_type': resolved_type,
            'is_array': node.is_array,
            'array_size': node.array_size
        })
        if not success:
            self.get_Error(node, f"Typedef naam '{node.new_name}' botst met een bestaande declaratie.")

    def is_nullptr_constant_expr(self, expr):
        """Helper om te checken of een expressie een NULL-pointer constante is (zoals 0 of NULL)"""
        if expr is None: return False
        if isinstance(expr, IntNode): return expr.value == 0
        if isinstance(expr, IdentifierNode): return expr.name == "NULL"
        if isinstance(expr, UnaryOpNode) and expr.op in ['+']:
            return self.is_nullptr_constant_expr(expr.child)
        if isinstance(expr, CastNode):
            return self.is_nullptr_constant_expr(expr.expr)

        # Check recursief in geneste attributen
        for attr in ("expr", "child", "inner", "value_node"):
            inner = getattr(expr, attr, None)
            if inner is not None and inner is not expr:
                if self.is_nullptr_constant_expr(inner): return True
        return False

    def visit_AssignNode(self, node):
        is_lvalue = False
        # Hier begint de L-value check (wordt vervolgd in de rest van de functie)
        if isinstance(node.left, IdentifierNode):
            is_lvalue = True
        elif isinstance(node.left, UnaryOpNode) and node.left.op == '*':
            is_lvalue = True
        elif isinstance(node.left, MemberAccessNode):
            is_lvalue = True
        elif isinstance(node.left, BinOpNode) and node.left.op == '[]':
            is_lvalue = True

            # --- CONST CHECK VOOR ARRAYS (OOK 2D/3D) ---
            # Graaf naar de basis-identifier (de naam van de array)
            base_node = node.left.left
            while isinstance(base_node, BinOpNode) and base_node.op == '[]':
                base_node = base_node.left

            if isinstance(base_node, IdentifierNode):
                if getattr(base_node, 'points_to_const', False) or getattr(base_node, 'is_const', False):
                    self.get_Error(node,
                                   f"Toewijzing aan element van const array '{base_node.name}' is niet toegestaan.")
                    return

        # 2. R-VALUE ERROR
        if not is_lvalue:
            self.get_Error(node, "Toewijzing aan een rvalue is niet toegestaan.")
            return

        # 3. CONST CHECKS
        # Check of we naar een 'const' variabele schrijven of naar een pointer die naar 'const' wijst
        is_const_target = getattr(node.left, 'is_const', False)
        if isinstance(node.left, UnaryOpNode) and node.left.op == '*':
            # Bijv: *ptr = 5; check of ptr naar const wijst
            target = node.left.child
            is_const_target = getattr(target, 'points_to_const', False) or getattr(target, 'is_const', False)

        if is_const_target:
            name = node.left.name if isinstance(node.left, IdentifierNode) else "expressie"
            self.get_Error(node, f"Toewijzing aan constante '{name}' is niet toegestaan.")

        # 4. TYPE CHECKING
        l_type = getattr(node.left, 'eval_type', 'void')
        r_type = getattr(node.right, 'eval_type', 'void')

        if l_type != r_type and not isinstance(node.right, CastNode):
            # Check pointers (wees mild voor Folder 3 -> Warning)
            if '*' in l_type or '*' in r_type:
                is_null_ptr = isinstance(node.right, IntNode) and node.right.value == 0
                if not is_null_ptr:
                    self.get_Warning(node, f"Incompatibele types bij toewijzing: '{r_type}' aan '{l_type}'.")

            # Check informatieverlies (bijv. float -> int of int -> char)
            elif self.get_richness(r_type) > self.get_richness(l_type):
                # Jouw specifieke char overflow check
                if l_type == 'char' and r_type == 'int' and isinstance(node.right, IntNode):
                    val = node.right.value
                    if val < -128 or val > 127:
                        # Error loggen, maar GEEN sys.exit! De compiler moet blijven draaien.
                        self.get_Error(node, f"Overflow: Waarde {val} past niet in een 'char' (-128 tot 127).")
                else:
                    self.get_Warning(node, f"Informatieverlies bij toewijzing van {r_type} naar {l_type}.")

    def visit_BinOpNode(self, node):
        l_type = getattr(node.left, 'eval_type', 'void') or 'void'
        r_type = getattr(node.right, 'eval_type', 'void') or 'void'

        # --- 1. Bitwise Shift Checks (ANSI C89) ---
        if node.op in ['<<', '>>']:
            if hasattr(node.right, 'value') and node.right.value < 0:
                self.get_Error(node, "Semantic Error: Bitwise shift by a negative amount is invalid C89!")
                # GEEN sys.exit(1) - laat de compiler de fout rapporteren en doorgaan

        # --- 2. Pointer Rekenkunde ---
        if '*' in l_type or '*' in r_type:
            bitwise_ops = ['&', '|', '^', '<<', '>>', '%']
            if node.op in bitwise_ops:
                self.get_Error(node, f"Operator '{node.op}' is niet toegestaan op pointer types.")

            elif node.op == '+':
                if '*' in l_type and '*' in r_type:
                    self.get_Error(node, "Optellen van twee pointers is niet toegestaan.")
                    node.eval_type = 'void'
                    return

            elif node.op == '-':
                if '*' in l_type and '*' in r_type:
                    if l_type != r_type:
                        self.get_Warning(node,
                                         f"Aftrekken van pointers met verschillende types: '{l_type}' en '{r_type}'.")
                    node.eval_type = 'int'  # De afstand tussen pointers is een integer
                    return

        # --- 3. Array Indexering ([]) ---
        if node.op == '[]':
            if r_type != 'int':
                self.get_Error(node, f"Array index moet een 'int' zijn, kreeg '{r_type}'.")

            if '*' in l_type:
                node.eval_type = l_type.replace('*', '', 1)

                node.is_lvalue = True

                node.points_to_const = getattr(node.left, 'points_to_const', False)
            else:
                self.get_Error(node, f"Type '{l_type}' kan niet worden geïndexeerd.")
                node.eval_type = 'void'

            return
        # --- 4. Vergelijkingen en Logica ---
        comparison_and_logical_ops = ['==', '!=', '<', '>', '<=', '>=', '&&', '||']
        if node.op in comparison_and_logical_ops:
            node.eval_type = 'int'
            return

        # 4. PRIORITEIT 2: Array Indexering ([])
        if node.op == '[]':
            if r_type != 'int':
                self.get_Error(node, f"Array index moet een 'int' zijn, kreeg '{r_type}'.")

            if '*' in l_type:
                # Verwijder één sterretje (dereference door indexering)
                node.eval_type = l_type.replace('*', '', 1)

                # --- DIT IS DE CRUCIALE REGEL ---
                # Een array-element is ALTIJD een l-value (je kunt er naar schrijven)
                node.is_lvalue = True
                # -------------------------------
            else:
                self.get_Error(node, f"Type '{l_type}' kan niet worden geïndexeerd.")
                node.eval_type = 'void'
            return

        # 5. PRIORITEIT 3: Pointer Wiskunde (+ en -)
        is_l_ptr = '*' in l_type
        is_r_ptr = '*' in r_type

        if is_l_ptr or is_r_ptr:
            # Geval A: Twee pointers
            if is_l_ptr and is_r_ptr:
                if node.op == '+':
                    self.get_Error(node, "Optellen van twee pointers is niet toegestaan.")
                    node.eval_type = 'void'
                elif node.op == '-':
                    # Pointer - Pointer resulteert in een afstand (integer)
                    node.eval_type = 'int'
                return

            # Geval B: Pointer +/- Integer
            if is_l_ptr and r_type == 'int':
                if node.op in ['+', '-']:
                    node.eval_type = l_type  # Uitkomst is zelfde pointer type
                    return

            # Geval C: Integer + Pointer
            if l_type == 'int' and is_r_ptr:
                if node.op == '+':
                    node.eval_type = r_type  # Uitkomst is zelfde pointer type
                    return

        # 6. PRIORITEIT 4: Standaard Numerieke Wiskunde (+, -, *, /, %, <<, >>, etc.)
        # Gebruik de richness om te bepalen of het bijv. float of int wordt.
        if self.get_richness(l_type) >= self.get_richness(r_type):
            node.eval_type = l_type
            node.points_to_const = getattr(node.left, 'points_to_const', False)  # <-- FIX
        elif l_type == 'int' and '*' in r_type:
            node.eval_type = r_type
            node.points_to_const = getattr(node.right, 'points_to_const', False)  # <-- FIX
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
        child_type = getattr(node.child, 'eval_type', 'void') or 'void'

        if node.op == '&':
            node.eval_type = child_type + "*"
        elif node.op == '*':
            if '*' in child_type:
                node.eval_type = child_type.rsplit('*', 1)[0]
                node.is_const = getattr(node.child, 'points_to_const', False)
                node.is_lvalue = True
            else:
                self.get_Error(node, f"Kan type '{child_type}' niet dereferencen.")
                node.eval_type = 'void'
        elif node.op == '!':
            node.eval_type = 'int'

        elif node.op == '~':
            if '*' in child_type:
                self.get_Error(node, f"Bitwise operator '~' is niet toegestaan op pointer type '{child_type}'.")
                import sys
                sys.exit(1)
            node.eval_type = child_type

        else:
            node.eval_type = child_type

    def visit_FuncCallNode(self, node):
        if node.name in ['printf', 'scanf', 'malloc', 'free', 'fgets', 'fputs']:
            if node.name in ['printf', 'scanf', 'fgets', 'fputs'] and not self.stdio_included:
                self.get_Error(node, f"Gebruik van '{node.name}' vereist #include <stdio.h>.")

            if node.name == 'malloc':
                node.eval_type = 'void*'
            elif node.name == 'free':
                node.eval_type = 'void'
            elif node.name == 'fgets':
                node.eval_type = 'char*'
            elif node.name == 'fputs':
                node.eval_type = 'void'
            else:
                node.eval_type = 'int'  # printf/scanf
            return

        func_sym = self.symbol_table.get(node.name)
        if not func_sym or func_sym.get('type') != 'function':
            self.get_Error(node, f"Functie '{node.name}' niet gedeclareerd voor aanroep.")
            node.eval_type = 'void'
            return

        expected_params = func_sym['params']
        if len(node.args) != len(expected_params):
            self.get_Error(node,
                           f"Functie '{node.name}' verwacht {len(expected_params)} argumenten, kreeg {len(node.args)}.")
        else:
            for i, arg in enumerate(node.args):
                arg_type = getattr(arg, 'eval_type', 'void')
                exp_type = expected_params[i][0]  # Type is index 0 in the tuple (type, name)
                if '*' in exp_type and '*' not in arg_type and not (isinstance(arg, IntNode) and arg.value == 0):
                    self.get_Error(node,
                                   f"Argument {i + 1} van '{node.name}' verwacht pointer '{exp_type}', kreeg '{arg_type}'.")
                elif '*' not in exp_type and '*' not in arg_type:
                    if self.get_richness(arg_type) > self.get_richness(exp_type):
                        self.get_Warning(node,
                                         f"Informatieverlies bij aanroep argument {i + 1}: {arg_type} naar {exp_type}.")

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
        base_type = getattr(node.expr, 'eval_type', 'void')

        if base_type.startswith("struct") and " " not in base_type:
            base_type = base_type.replace("struct", "struct ", 1)
        elif base_type.startswith("union") and " " not in base_type:
            base_type = base_type.replace("union", "union ", 1)

        base_type = self.symbol_table.resolve_type(base_type)

        if node.is_pointer:
            if not base_type.endswith('*'):
                self.get_Error(node, f"Operator '->' vereist een pointer, maar kreeg '{base_type}'.")
                node.eval_type = 'void'
                return
            compound_name = base_type.rstrip('*')
        else:
            if base_type.endswith('*'):
                self.get_Error(node,
                               f"Operator '.' vereist een struct of union by value, maar kreeg een pointer '{base_type}'. Gebruik '->'.")
                node.eval_type = 'void'
                return
            compound_name = base_type

        compound_def = self.symbol_table.get(compound_name)

        if not compound_def or compound_def.get('type') not in ['struct_def', 'union_def']:
            self.get_Error(node, f"Type '{compound_name}' is geen bekende struct of union.")
            node.eval_type = 'void'
            return

        members = compound_def.get('members', {})
        if node.member_name not in members:
            self.get_Error(node, f"Type '{compound_name}' heeft geen member genaamd '{node.member_name}'.")
            node.eval_type = 'void'
            return

        member_info = members[node.member_name]
        node.eval_type = member_info['type']
        node.member_index = member_info['index']

    def visit_StructDeclNode(self, node):
        self.symbol_table.exit_scope()

    def visit_UnionDeclNode(self, node):
        self.symbol_table.exit_scope()

    def visit_CastNode(self, node):
        node.eval_type = node.target_type

    def visit_IntNode(self, node):
        node.eval_type = 'int'

    def visit_FloatNode(self, node):
        node.eval_type = 'float'

    def visit_CharNode(self, node):
        node.eval_type = 'char'

    def visit_StringNode(self, node):
        node.eval_type = 'char*'

    def visit_SizeofNode(self, node):
        node.eval_type = 'int'