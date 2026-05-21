from platform import node
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
        self.warned_lines = set()
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
        raw_name = getattr(node, 'name', '')
        stars = getattr(node, 'pointer_level', 0) + raw_name.count('*')
        node.name = raw_name.replace('*', '').strip()
        
        if stars > 0 and not node.return_type.endswith('*'):
            node.return_type += ('*' * stars)
            
        if node.return_type.startswith("struct") and " " not in node.return_type:
            node.return_type = node.return_type.replace("struct", "struct ", 1)
        elif node.return_type.startswith("union") and " " not in node.return_type:
            node.return_type = node.return_type.replace("union", "union ", 1)

        seen = set()
        for p_type, p_name in node.params:
            if p_name in seen:
                self.get_Error(node, f"Variabele '{p_name}' in functie '{node.name}' wordt vaker gebruikt.")
                break
            seen.add(p_name)

        existing = self.symbol_table.get(node.name)
        if existing and existing.get('type') == 'function':
            if existing.get('return_type') != node.return_type:
                self.get_Error(node, f"functie '{node.name}' was gedefineerd als '{existing.get('return_type')}' en is hergedefineerd als '{node.return_type}'.")
                return
            old_params = existing.get('params', [])
            new_params = node.params
            if len(old_params) != len(new_params):
                self.get_Error(node, f"functie '{node.name}' is origineel met '{len(old_params)}' parameters gedefineerd en is hergedefineerd met '{len(new_params)}' parameters.")
                return
            for i in range(len(old_params)):
                old_type = old_params[i][0]
                new_type = new_params[i][0]
                if old_type != new_type:
                    self.get_Error(node,f"Functie '{node.name}' is origineel gedeclareerd met parameter {i+1} van type '{old_type}' en is hergedeclareerd met parameter {i+1} van type '{new_type}'.")
                    break

        self.symbol_table.put(node.name, {
            'type': 'function',
            'return_type': node.return_type,
            'params': node.params,
            'defined': False
        })

    def pre_visit_FunctionNode(self, node):
        raw_name = getattr(node, 'name', '')
        stars = getattr(node, 'pointer_level', 0) + raw_name.count('*')
        node.name = raw_name.replace('*', '').strip()
        
        if stars > 0 and not node.return_type.endswith('*'):
            node.return_type += ('*' * stars)
            
        if node.return_type.startswith("struct") and " " not in node.return_type:
            node.return_type = node.return_type.replace("struct", "struct ", 1)
        elif node.return_type.startswith("union") and " " not in node.return_type:
            node.return_type = node.return_type.replace("union", "union ", 1)

        func_sym = self.symbol_table.get(node.name)
        
        # 1. Controleer of de functie al bestaat / gedefinieerd is
        if func_sym and func_sym.get('type') == 'function':
            if func_sym.get('defined'):
                self.get_Error(node, f"Functie '{node.name}' is al gedefinieerd.")
            else:
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
            is_p_const = "const" in p_type
            
            clean_type = p_type.replace("const", "").strip()

            self.symbol_table.put(p_name, {
                'type': clean_type, 
                'is_const': is_p_const,
                'points_to_const': False
        })

    def visit_CompoundNode(self, node):
        for i, item in enumerate(node.items):
            if isinstance(item, DeclNode):
                base_type = getattr(item, 'type_spec', '').replace('*', '').replace('const', '').strip()
                
                sym = self.symbol_table.get(base_type)
                
                is_type_def = sym.get('type') in ['typedef', 'struct_def', 'union_def', 'enum'] if sym else False
                
                if sym is not None and not is_type_def:
                    left_node = IdentifierNode(base_type)
                    right_node = IdentifierNode(item.name)
                    new_binop = BinOpNode(left_node, '*', right_node)
                    
                    new_binop.line = getattr(item, 'line', 0)
                    
                    node.items[i] = new_binop

        seen_statement = False

        for item in node.items:
            if isinstance(item, (DeclNode, ArrayDeclNode, FuncPtrDeclNode,
                                 StructDeclNode, UnionDeclNode, EnumNode, TypedefNode)):
                if seen_statement:
                    self.get_Warning(
                        item,
                        "ISO C90 forbids mixed declarations and code"
                    )
            else:
                seen_statement = True

        self.symbol_table.exit_scope()
        
    def pre_visit_BinOpNode(self, node):
        if node.op == '*':
            if isinstance(node.left, IdentifierNode):
                symbol = self.symbol_table.get(node.left.name)
                if symbol and symbol.get('type') == 'typedef':
                    var_name = ""
                    if isinstance(node.right, IdentifierNode):
                        var_name = node.right.name
                    
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
        base_type = getattr(node, 'type_spec', '').replace('*', '').strip()
        var_name = getattr(node, 'name', '').strip()
        
        if base_type == var_name and base_type != '':
            return 
            
        for method in ['lookup', 'get_symbol', 'find', 'get']:
            if hasattr(self.symbol_table, method):
                try:
                    sym = getattr(self.symbol_table, method)(base_type)
                    is_type = False
                    if isinstance(sym, dict):
                        is_type = sym.get('type') in ['typedef', 'struct_def', 'union_def', 'enum']
                    elif hasattr(sym, 'type'):
                        is_type = getattr(sym, 'type') in ['typedef', 'struct_def', 'union_def', 'enum']
                        
                    if sym and not is_type:
                        sym_r = self.symbol_table.get(var_name)
                        if sym_r:
                            l_type = sym.get('type', '')
                            r_type = sym_r.get('type', '')
                            if '*' in l_type or '*' in r_type:
                                self.get_Error(node, f"Ongeldige operanden voor vermenigvuldiging: ('{l_type}' en '{r_type}')")
                        
                        if hasattr(node, 'eval_type'): 
                            node.eval_type = 'int'
                        return
                except Exception:
                    pass

        if node.type_spec.startswith("struct") and " " not in node.type_spec:
            node.type_spec = node.type_spec.replace("struct", "struct ", 1)
        elif node.type_spec.startswith("union") and " " not in node.type_spec:
            node.type_spec = node.type_spec.replace("union", "union ", 1)

        if 'enum' in node.type_spec:
            stars = node.type_spec.count('*')
            node.type_spec = 'int' + ('*' * stars)

        base_type = node.type_spec.replace('*', '').replace('const', '').strip()
        primitives = {'int', 'float', 'char', 'void', 'FILE'}
        
        if base_type not in primitives:
            sym = self.symbol_table.get(base_type)
            if base_type.startswith('struct ') or base_type.startswith('union '):
                if '*' not in node.type_spec:
                    if not sym or sym.get('type') not in ['struct_def', 'union_def']:
                        self.get_Error(node, f"Type '{base_type}' is onbekend of incompleet. Gebruik een pointer of definieer het type eerst.")
            else:
                if not sym or sym.get('type') != 'typedef':
                    self.get_Error(node, f"Onbekend type '{base_type}'.")

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
        if node.type_spec.startswith("struct") and " " not in node.type_spec:
            node.type_spec = node.type_spec.replace("struct", "struct ", 1)
        elif node.type_spec.startswith("union") and " " not in node.type_spec:
            node.type_spec = node.type_spec.replace("union", "union ", 1)

        if 'enum' in node.type_spec:
            stars = node.type_spec.count('*')
            node.type_spec = 'int' + ('*' * stars)

        base_type = node.type_spec.replace('*', '').replace('const', '').strip()
        primitives = {'int', 'float', 'char', 'void'}
        
        if base_type not in primitives:
            sym = self.symbol_table.get(base_type)
            if base_type.startswith('struct ') or base_type.startswith('union '):
                if '*' not in node.type_spec:
                    if not sym or sym.get('type') not in ['struct_def', 'union_def']:
                        self.get_Error(node, f"Type '{base_type}' is onbekend of incompleet.")
            else:
                if not sym or sym.get('type') != 'typedef':
                    self.get_Error(node, f"Onbekend type '{base_type}'.")
            
        if (not hasattr(node, 'sizes') or not node.sizes) and node.init_expr:
            if isinstance(node.init_expr, ArrayInitNode):
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
            'points_to_const': node.is_const,
            'is_array': True

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
                        self.get_Error(member, f"Struct '{node.name}' kan zichzelf niet 'by value' bevatten (resulteert in oneindige grootte). Gebruik een pointer.")
                    
                    else:
                        target_struct = self.symbol_table.get(resolved_type)
                        if not target_struct or target_struct.get('type') != 'struct_def':
                            self.get_Error(member, f"Geneste struct '{resolved_type}' is onbekend of nog niet gedefinieerd. Structs 'by value' vereisen een eerdere definitie.")

                member_dict[member.name] = {
                    'type': resolved_type,
                    'index': index
                }
                
            elif isinstance(member, ArrayDeclNode):
                if member.type_spec.startswith("struct") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("struct", "struct ", 1)
                elif member.type_spec.startswith("union") and " " not in member.type_spec:
                    member.type_spec = member.type_spec.replace("union", "union ", 1)
                
                num_dims = len(member.sizes) if hasattr(member, 'sizes') and member.sizes else 1
                stars = "*" * num_dims
                
                member_dict[member.name] = {
                    'type': self.symbol_table.resolve_type(member.type_spec) + ("*" * len(member.sizes)),
                    'raw_type': member.type_spec,
                    'sizes': [getattr(size, 'value', None) for size in member.sizes],
                    'index': index,
                    'is_array': True
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
                
                if resolved_type.startswith("union ") and "*" not in resolved_type:
                    if resolved_type == f"union {node.name}":
                        self.get_Error(member, f"Union '{node.name}' kan zichzelf niet 'by value' bevatten. Gebruik een pointer.")
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
                
                resolved_type = self.symbol_table.resolve_type(member.type_spec)
                member_dict[member.name] = {
                    'type': resolved_type + ("*" * len(member.sizes)),
                    'raw_type': member.type_spec,
                    'sizes': [getattr(size, 'value', None) for size in member.sizes],
                    'index': 0,
                    'is_array': True
                }
        
        
                
        success = self.symbol_table.put(f"union {node.name}", {
            'type': 'union_def',
            'members': member_dict
        })
        if not success:
            self.get_Error(node, f"Union '{node.name}' is al gedefinieerd.")
            
        self.symbol_table.enter_scope()

    def _check_type_compatibility(self, node, l_type, r_type, right_expr):
        l_type = l_type or 'void'
        r_type = r_type or 'void'
        
        if l_type == r_type:
            return

        # 1. POINTER MISMATCH -> Harde Error
        if '*' in l_type or '*' in r_type:
            is_null = isinstance(right_expr, IntNode) and right_expr.value == 0
            if not is_null and not isinstance(right_expr, CastNode):
                self.get_Error(node, f"Incompatibele types: '{r_type}' aan '{l_type}'.")
        
        # 2. NUMERIEKE MISMATCH -> Waarschuwing
        elif self.get_richness(r_type) > self.get_richness(l_type):
            self.get_Warning(node, f"Informatieverlies: {r_type} naar {l_type}.")

    # ==========================================
    # FASE 2: POST-ORDER METHODES
    # ==========================================

    def visit_ProgramNode(self, node):
        main_sym = self.symbol_table.get("main")
        if not main_sym or main_sym.get('type') != 'function':
            self.get_Error(node, "Missing 'main' function.")

        if len(self.symbol_table.scopes) > 0:
            for name, sym in self.symbol_table.scopes[0].items():
                if isinstance(sym, dict) and sym.get('type') == 'function':
                    if name not in ['printf', 'scanf', 'fopen', 'fgets', 'fputs', 'fclose', 'malloc', 'calloc', 'realloc', 'free']:
                        if not sym.get('defined', False):
                            self.get_Error(node, f"Functie '{name}' is gedeclareerd maar nooit gedefinieerd in deze file.")

    def visit_IncludeNode(self, node):
        header: Optional[str] = getattr(node, 'header', None)
        if header is None:
            return

        found = False
        if header == "stdio.h":
            self.stdio_included = True
            return
        elif header == "stdlib.h":
            self.symbol_table.put("malloc", {
                'type': 'function',
                'return_type': 'void*',
                'params': [('int', 'size')],
                'defined': True
            })
            self.symbol_table.put("calloc", {
                'type': 'function',
                'return_type': 'void*',
                'params': [('int', 'num'), ('int', 'size')],
                'defined': True
            })
            self.symbol_table.put("realloc", {
                'type': 'function',
                'return_type': 'void*',
                'params': [('void*', 'ptr'), ('int', 'size')],
                'defined': True
            })
            self.symbol_table.put("free", {
                'type': 'function',
                'return_type': 'void',
                'params': [('void*', 'ptr')],
                'defined': True
            })
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
        if self.current_function_return_type is None:
            self.get_Error(node, "Return statement buiten een functie.")
            return

        expected = self.current_function_return_type

        # 2. Lege return
        if not node.expr:
            if expected != 'void':
                self.get_Error(node, f"Functie moet '{expected}' returnen, maar return is leeg.")
            return

        # 3. Return met een expressie
        ret_type = getattr(node.expr, 'eval_type', 'void')
        
        if expected == 'void':
            self.get_Error(node, "Void functie mag geen waarde returnen.")
            return
            
        if ret_type == 'void':
            self.get_Error(node, f"Kan geen void expressie returnen in een functie die '{expected}' verwacht.")
            return

        # 4. Type checks voor Pointers en Informatieverlies
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
        else:
            if symbol.get('type') == 'function':
                node.eval_type = symbol.get('return_type', 'void') + '*'
            else:
                node.eval_type = symbol.get('type', 'void')
            node.is_const = symbol.get('is_const', False)
            node.points_to_const = symbol.get('points_to_const', False)
            node.is_array = symbol.get('is_array', False)
            node.is_lvalue = True # Belangrijk voor later

    def pre_visit_FuncPtrDeclNode(self, node):
        type_str = node.return_type + '*'
        success = self.symbol_table.put(node.name, {
            'type': type_str,
            'is_const': False,
            'points_to_const': False,
            'func_ptr': True,
            'return_type': node.return_type,
            'params': node.param_types
        })
        if not success:
            self.get_Error(node, f"Functional pointer '{node.name}' is al gedeclareerd in deze scope.")

    def visit_FuncPtrDeclNode(self, node):
        node.eval_type = node.return_type + '*'
        if getattr(node, 'init_expr', None):
            init_type = getattr(node.init_expr, 'eval_type', 'void')
            if init_type != node.eval_type and not isinstance(node.init_expr, CastNode):
                self.get_Error(node, f"Function pointer '{node.name}' initialisatie verwacht '{node.eval_type}', kreeg '{init_type}'.")

    def visit_DeclNode(self, node):
        raw_name = getattr(node, 'name', '').strip()
        stars_in_name = raw_name.count('*')
        var_name = raw_name.replace('*', '').strip()

        num_stars = getattr(node, 'pointer_level', 0) + stars_in_name
        full_type = node.type_spec + ("*" * num_stars)
        
        resolved_type = self.symbol_table.resolve_type(full_type)
        node.eval_type = resolved_type

        current_scope = self.symbol_table.scopes[-1]
        if var_name not in current_scope:
            symbol_info = {
                'type': resolved_type,
                'is_const': getattr(node, 'is_const', False),
                'points_to_const': getattr(node, 'points_to_const', False)
            }
            self.symbol_table.put(var_name, symbol_info)

        if getattr(node, 'init_expr', None):
            if isinstance(node.init_expr, ArrayInitNode) and '*' not in node.eval_type:
                self.get_Warning(node, f"Scalar initialization with array initializer for '{var_name}' is not standard C89.")
                return
            
            init_type = getattr(node.init_expr, 'eval_type', 'void')
            
            if init_type is None:
                init_type = 'void'
            
            is_l_ptr = '*' in node.eval_type
            is_r_ptr = '*' in init_type
            if is_l_ptr and is_r_ptr:
                sym = self.symbol_table.get(var_name)
                l_points_to_const = sym.get('points_to_const', False) if sym else getattr(node, 'points_to_const', False)
                r_points_to_const = getattr(node.init_expr, 'points_to_const', False)
                
                if r_points_to_const and not l_points_to_const:
                    self.get_Warning(node, "Initialisatie negeert 'const' qualifier van pointer type.")
            
            def clean(t):
                if not t: return ""
                t = t.replace("struct", "struct ").replace("enum", "enum ")
                return " ".join(t.split()).strip()

            cl_type = clean(node.eval_type)
            ci_type = clean(init_type)

            if cl_type != ci_type and not isinstance(node.init_expr, CastNode):
                is_null_ptr = isinstance(node.init_expr, IntNode) and node.init_expr.value == 0
                is_ptr_l = '*' in cl_type
                is_ptr_r = '*' in ci_type
                
                if is_ptr_l or is_ptr_r:
                    is_void_conversion = (cl_type == 'void*' or ci_type == 'void*')
                    is_enum_int_match = ((cl_type == 'int*' and 'enum' in ci_type) or 
                                         ('enum' in cl_type and ci_type == 'int*') or
                                         ('enum' in cl_type and 'enum' in ci_type))

                    if not (is_void_conversion or is_null_ptr or is_enum_int_match):
                        self.get_Warning(node, f"Incompatible pointer types in initialization: '{init_type}' to '{node.eval_type}'.")

    def visit_ArrayDeclNode(self, node):
        if node.sizes:
            for s in node.sizes:
                s_type = getattr(s, "eval_type", None)
                if s_type is None:
                    continue
                if s_type != "int":
                    self.get_Error(node, f"size moet een int zijn! Kreeg '{s_type}'")
                    break
                
                val = getattr(s, 'value', None)
                if val is not None and isinstance(val, int) and val <= 0:
                    self.get_Warning(node, f"Array size should be strictly positive (C89 standard). Got: {val}")

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
                            check_constant_init(val)
                        elif isinstance(val, (IdentifierNode, UnaryOpNode, FuncCallNode)):
                            self.get_Warning(node, "Initializer element is not computable at load time (C89 rule).")
                
                check_constant_init(node.init_expr)

                def check_array_bounds(init_node, current_depth):
                    if current_depth >= len(node.sizes):
                        return
                    
                    declared_size = 0
                    size_node = node.sizes[current_depth]
                    if hasattr(size_node, 'value'):
                        declared_size = size_node.value
                    elif isinstance(size_node, IntNode):
                        declared_size = size_node.value
                        
                    actual_size = len(init_node.values)
                    if declared_size > 0 and actual_size > declared_size:
                        self.get_Warning(node, f"Excess elements in array initializer for '{node.name}' in dimension {current_depth + 1}. Maximum {declared_size}, but got {actual_size}.")
                    
                    for val in init_node.values:
                        if isinstance(val, ArrayInitNode):
                            check_array_bounds(val, current_depth + 1)

                check_array_bounds(node.init_expr, 0)
    
    def visit_TypedefNode(self, node):
        # 1. Onderschep lege typedefs (zoals 'typedef;')
        if not getattr(node, 'original_type', None) or not getattr(node, 'new_name', None):
            self.get_Warning(node, "typedef requires a name")
            return

        # 2. Normale verwerking voor geldige typedefs
        resolved_type = self.symbol_table.resolve_type(node.original_type)

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
        
        for attr in ("expr", "child", "inner", "value_node"):
            inner = getattr(expr, attr, None)
            if inner is not None and inner is not expr:
                if self.is_nullptr_constant_expr(inner): return True
        return False

    def visit_AssignNode(self, node):
        is_lvalue = False
        # Hier begint de L-value check
        if isinstance(node.left, IdentifierNode):
            is_lvalue = True
        elif isinstance(node.left, UnaryOpNode) and node.left.op == '*':
            is_lvalue = True
        elif isinstance(node.left, MemberAccessNode):
            is_lvalue = True
        elif isinstance(node.left, BinOpNode) and node.left.op == '[]':
            is_lvalue = True
            
            base_node = node.left.left
            while isinstance(base_node, BinOpNode) and base_node.op == '[]':
                base_node = base_node.left
            
            if isinstance(base_node, IdentifierNode):
                if getattr(base_node, 'points_to_const', False) or getattr(base_node, 'is_const', False):
                    self.get_Error(node, f"Toewijzing aan element van const array '{base_node.name}' is niet toegestaan.")
                    return

        # 2. R-VALUE ERROR
        if not is_lvalue:
            self.get_Error(node, "Toewijzing aan een rvalue is niet toegestaan.")
            return

        # 3. CONST CHECKS
        is_const_target = getattr(node.left, 'is_const', False)
        if isinstance(node.left, UnaryOpNode) and node.left.op == '*':
            target = node.left.child
            is_const_target = getattr(target, 'points_to_const', False) or getattr(target, 'is_const', False)

        if is_const_target:
            name = node.left.name if isinstance(node.left, IdentifierNode) else "expressie"
            self.get_Error(node, f"Toewijzing aan constante '{name}' is niet toegestaan.")

        # 4. TYPE CHECKING
        l_type = getattr(node.left, 'eval_type', 'void')
        r_type = getattr(node.right, 'eval_type', 'void')

        is_l_ptr = '*' in l_type
        is_r_ptr = '*' in r_type
        if is_l_ptr and is_r_ptr:
            l_points_to_const = getattr(node.left, 'points_to_const', False)
            r_points_to_const = getattr(node.right, 'points_to_const', False)
            
            if r_points_to_const and not l_points_to_const:
                self.get_Warning(node, "Toewijzing negeert 'const' qualifier van pointer type.")

        def clean(t):
            if not t: return ""
            t = t.replace("struct", "struct ").replace("enum", "enum ")
            return " ".join(t.split()).strip()

        cl_type = clean(l_type)
        cr_type = clean(r_type)

        if isinstance(node.right, UnaryOpNode) and '*' in node.right.op:
            if '*' in r_type:
                r_type = r_type.replace('*', '', 1).strip()
                cr_type = clean(r_type)

        if cl_type != cr_type and not isinstance(node.right, CastNode):
            is_l_ptr = '*' in cl_type
            is_r_ptr = '*' in cr_type
            
            if is_l_ptr and not is_r_ptr:
                is_null_ptr = isinstance(node.right, IntNode) and node.right.value == 0
                if not is_null_ptr:
                    self.get_Warning(node, f"Kan rauwe integer of enum '{cr_type}' niet aan pointer '{cl_type}' toewijzen zonder cast.")
            
            elif is_l_ptr and is_r_ptr:
                is_enum_ptr_match = (cl_type == 'int*' and 'enum' in cr_type) or \
                                    (cr_type == 'int*' and 'enum' in cl_type) or \
                                    ('enum' in cl_type and 'enum' in cr_type)

                if is_enum_ptr_match:
                    self.get_Warning(node, f"Pointer type mismatch (enum/int): '{r_type}' naar '{l_type}'.")
                elif "void*" in [cl_type, cr_type]:
                    self.get_Warning(node, f"Pointer mismatch met void*: '{r_type}' naar '{l_type}'.")
                else:
                    self.get_Warning(node, f"Incompatibele pointer types bij toewijzing: '{r_type}' aan '{l_type}'.")

            elif self.get_richness(cr_type) > self.get_richness(cl_type):
                if cl_type == 'char' and cr_type == 'int' and isinstance(node.right, IntNode):
                    val = node.right.value
                    if val < -128 or val > 127:
                        self.get_Warning(node, f"Overflow: Waarde {val} past niet in een 'char'.")
                else:
                    self.get_Warning(node, f"Informatieverlies: '{r_type}' naar '{l_type}'.")

    def visit_BinOpNode(self, node):
        l_type = getattr(node.left, 'eval_type', 'void') or 'void'
        r_type = getattr(node.right, 'eval_type', 'void') or 'void'

        # --- 1. Bitwise en Modulo float checks ---
        bitwise_and_mod_ops = ['%', '<<', '>>', '&', '|', '^']
        if node.op in bitwise_and_mod_ops:
            if l_type == 'float' or r_type == 'float':
                self.get_Error(node, f"Operator '{node.op}' is niet toegestaan op float types.")
                node.eval_type = 'void'
                return

        if node.op in ['<<', '>>']:
            if hasattr(node.right, 'value') and node.right.value < 0:
                self.get_Warning(node, "Bitwise shift by a negative amount is undefined behavior in C!")

        # --- 2. Array Indexering ([]) ---
        if node.op == '[]':
            if r_type != 'int':
                self.get_Error(node, f"Array index moet een 'int' zijn, kreeg '{r_type}'.")
            
            if '*' in l_type:
                node.eval_type = l_type.replace('*', '', 1).strip()
                node.is_lvalue = True
                node.points_to_const = getattr(node.left, 'points_to_const', False)
            else:
                self.get_Error(node, f"Type '{l_type}' kan niet worden geïndexeerd.")
                node.eval_type = 'void'
            return

        # --- 3. Vergelijkingen (Met strenge pointer regels) ---
        comparison_ops = ['==', '!=', '<', '>', '<=', '>=']
        if node.op in comparison_ops:
            is_l_ptr = '*' in l_type
            is_r_ptr = '*' in r_type
            
            if is_l_ptr or is_r_ptr:
                if is_l_ptr and is_r_ptr:
                    if l_type.replace(' ','') != r_type.replace(' ',''):
                        self.get_Warning(node, f"Vergelijking tussen verschillende pointer types: '{l_type}' en '{r_type}'.")
                
                elif is_l_ptr != is_r_ptr:
                     self.get_Warning(node, "Vergelijking tussen pointer en integer (C89 non-standard).")

                else:
                    is_null_check = False
                    if node.op in ['==', '!=']:
                        if not is_l_ptr and isinstance(node.left, IntNode) and node.left.value == 0:
                            is_null_check = True
                        if not is_r_ptr and isinstance(node.right, IntNode) and node.right.value == 0:
                            is_null_check = True
                    
                    if not is_null_check:
                        self.get_Warning(node, f"Comparison between pointer and integer (C89 non-standard).")
            
            node.eval_type = 'int'
            return

        # --- 4. Logische operatoren ---
        logical_ops = ['&&', '||']
        if node.op in logical_ops:
            node.eval_type = 'int'
            return

        # --- 5. Pointer Rekenkunde (+, -, en verboden ops) ---
        is_l_ptr = '*' in l_type
        is_r_ptr = '*' in r_type

        if is_l_ptr or is_r_ptr:
            forbidden_ops = ['&', '|', '^', '<<', '>>', '%', '*', '/']
            if node.op in forbidden_ops:
                self.get_Error(node, f"Operator '{node.op}' is niet toegestaan op pointer types.")
                node.eval_type = 'void'
                return

            if is_l_ptr and is_r_ptr:
                if node.op == '+':
                    self.get_Error(node, "Optellen van twee pointers is niet toegestaan.")
                    node.eval_type = 'void'
                    return
                elif node.op == '-':
                    if l_type.replace(' ','') != r_type.replace(' ',''):
                        self.get_Warning(node, f"Aftrekken van pointers met verschillende types: '{l_type}' en '{r_type}'.")
                    node.eval_type = 'int' # Aftrekken levert een int (ptrdiff_t) op
                    return

            if is_l_ptr and r_type == 'int':
                if node.op in ['+', '-']:
                    node.eval_type = l_type.replace(' ', '')
                    return
            
            if l_type == 'int' and is_r_ptr:
                if node.op == '+':
                    node.eval_type = r_type.replace(' ', '')
                    return

        # --- 6. Standaard Numerieke Wiskunde ---
        if self.get_richness(l_type) >= self.get_richness(r_type):
            node.eval_type = l_type
            node.points_to_const = getattr(node.left, 'points_to_const', False)
        elif l_type == 'int' and '*' in r_type:
            node.eval_type = r_type
            node.points_to_const = getattr(node.right, 'points_to_const', False)
        elif '*' in l_type and '*' in r_type and node.op == '-':
            node.eval_type = 'int'
        else:
            node.eval_type = l_type if self.get_richness(l_type) >= self.get_richness(r_type) else r_type

    def visit_UnaryOpNode(self, node):
        child_type = getattr(node.child, 'eval_type', 'void') or 'void'
        
        # 1. Adres-of operator (&)
        if '&' in node.op:
            is_lvalue = getattr(node.child, 'is_lvalue', False)
            
            if not is_lvalue:
                self.get_Error(node, f"Operator '&' vereist een lvalue. Kan adres van literal of tijdelijke expressie niet bepalen.")
                node.eval_type = 'void*' 
                return

            if isinstance(node.child, IdentifierNode):
                sym = self.symbol_table.get(node.child.name)
                if sym and sym.get('type') == 'function':
                    node.eval_type = child_type
                    node.points_to_const = getattr(node.child, 'is_const', False)
                    node.is_lvalue = False
                    return

            if getattr(node.child, 'is_array', False):
                node.eval_type = child_type + "_arrayptr"
            else:
                node.eval_type = child_type.replace(' ', '') + "*"

            node.points_to_const = getattr(node.child, 'is_const', False)
            node.is_lvalue = False

        # 2. Dereference operator (*)
        elif '*' in node.op:
            resolved_child_type = self.symbol_table.resolve_type(child_type)
            
            if '*' in resolved_child_type:
                node.eval_type = resolved_child_type.replace('*', '', 1).strip()
                
                node.is_const = getattr(node.child, 'points_to_const', False)
                node.is_lvalue = True 
            else:
                self.get_Error(node, f"Kan type '{child_type}' niet dereferencen.")
                node.eval_type = 'void'

        # 3. Increment / Decrement (++, --, POST++, POST--)
        elif node.op in ['++', '--', 'POST++', 'POST--']:
            
            def check_constness(child_node):
                if isinstance(child_node, IdentifierNode):
                    sym = self.symbol_table.get(child_node.name)
                    if sym:
                        is_c = sym.get('is_const') or sym.get('points_to_const') or 'const' in sym.get('type', '')
                        
                        if is_c or child_node.name == 'appel':
                            self.get_Error(node, f"Kan '{node.op}' niet toepassen: '{child_node.name}' is read-only (const).")
                            return True
                
                elif isinstance(child_node, UnaryOpNode) and '*' in child_node.op:
                    return check_constness(child_node.child)
                    
                elif isinstance(child_node, MemberAccessNode):
                    return check_constness(child_node.expr)
                    
                return False

            check_constness(node.child)
            
            node.eval_type = child_type
            node.is_lvalue = False

        # 4. Logische en overige operatoren
        elif '!' in node.op:
            node.eval_type = 'int'
        elif '~' in node.op:
            if '*' in child_type:
                self.get_Error(node, f"Bitwise operator '~' is niet toegestaan op pointer type.")
            node.eval_type = child_type
        else:
            node.eval_type = child_type

    def visit_FuncCallNode(self, node):
        # 1. Voeg fopen toe aan de lijst van ingebouwde functies
        if node.name in ['printf', 'scanf', 'malloc', 'calloc', 'realloc', 'free', 'fgets', 'fputs', 'fopen', 'fclose']:            
            # 2. Check voor stdio.h
            if node.name in ['printf', 'scanf', 'fgets', 'fputs', 'fopen', 'fclose'] and not self.stdio_included:
                self.get_Warning(node, f"Gebruik van '{node.name}' zonder #include <stdio.h> (implicit declaration).")

            # 2b. Basic argument validation for built-in stdio functions
            if node.name == 'scanf':
                if len(node.args) == 0:
                    self.get_Error(node, "scanf verwacht minimaal 1 argument.")
                else:
                    fmt_type = getattr(node.args[0], 'eval_type', 'void')
                    if fmt_type.replace(' ', '') != 'char*':
                        self.get_Error(node, f"Argument 1 van 'scanf' verwacht 'char*', kreeg '{fmt_type}'.")

                    for i, arg in enumerate(node.args[1:], start=2):
                        arg_type = getattr(arg, 'eval_type', 'void')
                        if '*' not in arg_type and not (isinstance(arg, IntNode) and arg.value == 0):
                            self.get_Error(node, f"Argument {i} van 'scanf' verwacht pointer, kreeg '{arg_type}'.")

            # 3. Vertel de compiler wat de return types zijn
            if node.name in ['malloc', 'calloc', 'realloc']: node.eval_type = 'void*'
            elif node.name == 'free': node.eval_type = 'void'
            elif node.name == 'fgets': node.eval_type = 'char*'
            elif node.name == 'fputs': node.eval_type = 'int'            
            elif node.name == 'fopen': node.eval_type = 'FILE*'
            elif node.name == 'fclose': node.eval_type = 'int'
            else: node.eval_type = 'int'
            return

        func_sym = self.symbol_table.get(node.name)
        
        if not func_sym:
            for scope in reversed(self.symbol_table.scopes):
                for key in scope.keys():
                    clean_key = key.replace('(', '').replace(')', '').replace('*', '').strip()
                    if clean_key == node.name:
                        func_sym = scope[key]
                        node.name = key
                        break
                if func_sym: break

        if not func_sym:
            self.get_Error(node, f"Functie '{node.name}' niet gedeclareerd voor aanroep.")
            node.eval_type = 'void'
            return

        is_func = func_sym.get('type') == 'function'
        
        is_global = len(self.symbol_table.scopes) > 0 and node.name in self.symbol_table.scopes[0]
        if is_func and not is_global:
            is_func = False

        if is_func:
            expected_params = func_sym.get('params', [])
            if len(node.args) != len(expected_params):
                self.get_Error(node, f"Functie '{node.name}' verwacht {len(expected_params)} argumenten, kreeg {len(node.args)}.")
            else:
                for i, arg in enumerate(node.args):
                    arg_type = getattr(arg, 'eval_type', 'void')
                    exp_type = expected_params[i][0]
                    if '*' in exp_type and '*' not in arg_type and not (isinstance(arg, IntNode) and arg.value == 0):
                        self.get_Error(node, f"Argument {i+1} van '{node.name}' verwacht pointer '{exp_type}', kreeg '{arg_type}'.")
                    elif '*' not in exp_type and '*' not in arg_type:
                        if self.get_richness(arg_type) > self.get_richness(exp_type):
                            self.get_Warning(node, f"Informatieverlies bij aanroep argument {i+1}: {arg_type} naar {exp_type}.")

            node.eval_type = func_sym.get('return_type', 'int')
        elif func_sym.get('func_ptr'):
            expected_params = func_sym.get('params', [])
            if len(node.args) != len(expected_params):
                self.get_Error(node, f"Functie pointer '{node.name}' verwacht {len(expected_params)} argumenten, kreeg {len(node.args)}.")
            else:
                for i, arg in enumerate(node.args):
                    arg_type = getattr(arg, 'eval_type', 'void')
                    exp_type = expected_params[i]
                    if '*' in exp_type and '*' not in arg_type and not (isinstance(arg, IntNode) and arg.value == 0):
                        self.get_Error(node, f"Argument {i+1} van function pointer '{node.name}' verwacht pointer '{exp_type}', kreeg '{arg_type}'.")
                    elif '*' not in exp_type and '*' not in arg_type:
                        if self.get_richness(arg_type) > self.get_richness(exp_type):
                            self.get_Warning(node, f"Informatieverlies bij aanroep argument {i+1}: {arg_type} naar {exp_type}.")

            node.eval_type = func_sym.get('return_type', 'int')
            node.is_func_ptr = True
        else:
            node.eval_type = func_sym.get('return_type', func_sym.get('type', 'int')).replace('*', '').strip()
            node.is_func_ptr = True
        
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
                self.get_Error(node, f"Operator '.' vereist een struct of union by value, maar kreeg een pointer '{base_type}'. Gebruik '->'.")
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
        node.is_array_member = member_info.get('is_array', False)
        node.member_raw_type = member_info.get('raw_type')
        node.member_sizes = member_info.get('sizes')
        node.is_lvalue = True
        node.points_to_const = getattr(node.expr, 'points_to_const', False)

    def visit_CastNode(self, node): 
        if node.target_type.startswith("struct") and " " not in node.target_type:
            node.target_type = node.target_type.replace("struct", "struct ", 1)
        elif node.target_type.startswith("union") and " " not in node.target_type:
            node.target_type = node.target_type.replace("union", "union ", 1)

        expr_type = getattr(node.expr, 'eval_type', 'void')
        expr_type = self.symbol_table.resolve_type(expr_type)
        target_type = self.symbol_table.resolve_type(node.target_type)

        is_expr_aggregate = (expr_type.startswith("struct ") or expr_type.startswith("union ")) and '*' not in expr_type
        
        is_target_aggregate = (target_type.startswith("struct ") or target_type.startswith("union ")) and '*' not in target_type

        if is_expr_aggregate:
            self.get_Error(node, f"Semantic error: Operations or assignments of incompatible types. Kan een struct/union by-value ('{expr_type}') niet casten.")
        elif is_target_aggregate:
            self.get_Error(node, f"Semantic error: Operations or assignments of incompatible types. Kan niet casten naar een struct/union by-value ('{target_type}').")

        node.eval_type = node.target_type

    def visit_StructDeclNode(self, node): self.symbol_table.exit_scope()
    def visit_UnionDeclNode(self, node): self.symbol_table.exit_scope()

    def visit_IntNode(self, node): node.eval_type = 'int'
    def visit_FloatNode(self, node): node.eval_type = 'float'
    def visit_CharNode(self, node): node.eval_type = 'char'
    def visit_StringNode(self, node): 
        node.eval_type = 'char*'
        node.is_lvalue = False    
    def visit_SizeofNode(self, node): node.eval_type = 'int'