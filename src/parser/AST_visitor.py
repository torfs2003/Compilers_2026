from antlr4.tree.Tree import TerminalNodeImpl
from antlr4 import Token
from src.parser.AST import *

class ASTVisitor:
    def __init__(self, token_stream):
        self.token_stream = token_stream
        self.warnings = []

    def get_loc(self, node, ctx):
        node.line = ctx.start.line
        node.column = ctx.start.column
        return node

    def _get_source_text(self, ctx):
        """Haalt de originele broncode op inclusief originele spaties en inspringingen."""
        if not self.token_stream or not ctx.start or not ctx.stop:
            return ctx.getText()
        return self.token_stream.getText(ctx.start.tokenIndex, ctx.stop.tokenIndex)

    def _get_hidden_comments(self, ctx):
        """Vist de comments (/* ... */ en //) op die net voor deze node in de HIDDEN channel staan."""
        if not self.token_stream or not ctx.start:
            return []
        
        hidden_tokens = self.token_stream.getHiddenTokensToLeft(ctx.start.tokenIndex, channel=Token.HIDDEN_CHANNEL)
        comments = []
        if hidden_tokens:
            for token in hidden_tokens:
                text = token.text.strip()
                if text.startswith("/*"):
                    comments.append(text)
                elif text.startswith("//"):
                    comments.append(text)
                    
                    warning_msg = f"[Warning] line {token.line}:{token.column}: Single-line comments (//) are a C99 extension."
                    if warning_msg not in self.warnings:
                        self.warnings.append(warning_msg)
        return comments

    def visit(self, root_ctx):
        stack = [(root_ctx, False)]
        # Map to store generated AST nodes: id(CST_context) -> AST_node
        results = {}

        while stack:
            ctx, is_post_order = stack.pop()

            if not is_post_order:
                # PHASE 1: Pre-order (Discover children)
                stack.append((ctx, True))
                if hasattr(ctx, 'children') and ctx.children:
                    for child in reversed(ctx.children):
                        if not isinstance(child, TerminalNodeImpl):
                            stack.append((child, False))
            else:
                # PHASE 2: Post-order (Build AST node)
                class_name = type(ctx).__name__
                res = None

                # 1. High-level structures
                if class_name == "CompilationUnitContext":
                    nodes = []
                    # Verzamel alle includes
                    if hasattr(ctx, 'includeDirective'):
                        for inc in ctx.includeDirective():
                            nodes.append(results[id(inc)])
                    
                    # Verzamel alle functies
                    if hasattr(ctx, 'functionDefinition'):
                        for func in ctx.functionDefinition():
                            nodes.append(results[id(func)])
                    
                    # Geef een ProgramNode terug met de hele lijst
                    res = self.get_loc(ProgramNode(nodes), ctx)

                elif class_name == "FunctionDefinitionContext":
                    name = ctx.MAIN().getText() if ctx.MAIN() else ctx.IDENTIFIER().getText()
                    body = results[id(ctx.compoundStatement())]
                    
                    # Verzamel parameters: [(type, naam), ...]
                    params = []
                    if ctx.parameterList():
                        p_list = ctx.parameterList()
                        for i in range(len(p_list.IDENTIFIER())):
                            p_type = p_list.typeSpecifier(i).getText()
                            p_name = p_list.IDENTIFIER(i).getText()
                            params.append((p_type, p_name))
                        
                    node = FunctionNode(ctx.typeSpecifier().getText(), name, body, params)
                    res = self.get_loc(node, ctx)

                elif class_name == "CompoundStatementContext":
                    items = []
                    if ctx.children:
                        for child in ctx.children:
                            if id(child) in results:
                                items.append(results[id(child)])
                    res = self.get_loc(CompoundNode(items), ctx)
                
                elif class_name == "IncludeDirectiveContext":
                    header = ctx.HEADER().getText()[1:-1]
                    res = self.get_loc(IncludeNode(header), ctx)

                # 2. Declarations
                elif class_name == "DeclarationContext":
                    base_type = ctx.typeSpecifier().getText()
                    pointer_stars = "*" * len(ctx.MUL())
                    full_type = base_type + pointer_stars
                    
                    all_exprs = ctx.expression()
                    sizes = []
                    init = None
                    
                    if ctx.ASSIGN():
                        if ctx.array_initializer():
                            init = results[id(ctx.array_initializer())]
                            dimension_exprs = all_exprs
                        else:
                            init = results[id(all_exprs[-1])]
                            dimension_exprs = all_exprs[:-1]
                    else:
                        dimension_exprs = all_exprs
                        
                    for dim_ctx in dimension_exprs:
                        sizes.append(results[id(dim_ctx)])
                        
                    const_tokens = ctx.CONST()
                    is_const = False     
                    is_const_ptr = False

                    if len(const_tokens) == 2:
                        is_const = True
                        is_const_ptr = True
                    elif len(const_tokens) == 1:
                        const_token_idx = const_tokens[0].getSymbol().tokenIndex
                        type_token_idx = ctx.typeSpecifier().start.tokenIndex
                        if const_token_idx < type_token_idx:
                            is_const = True
                        else:
                            is_const_ptr = True

                    identifier = ctx.IDENTIFIER().getText()
                    
                    if sizes or ctx.LBRACKET(): 
                        node = ArrayDeclNode(is_const, full_type, identifier, sizes, init)
                    else:
                        node = DeclNode(is_const, full_type, identifier, init)
                    
                    node.is_const_ptr = is_const_ptr
                    
                    res = self.get_loc(node, ctx)

                elif class_name == "StatementContext":
                    if ctx.expression():
                        res = results.get(id(ctx.expression()))
                    elif ctx.compoundStatement():
                        res = results.get(id(ctx.compoundStatement()))

                # 3. Expressions & Assignments
                elif class_name == "ExpressionContext":
                    res = results[id(ctx.assignment_expression())]

                elif class_name == "Assignment_expressionContext":
                    if ctx.getChildCount() == 3:
                        left = results[id(ctx.unary_expression())]
                        right = results[id(ctx.assignment_expression())]
                        res = self.get_loc(AssignNode(left, right), ctx)
                    else:
                        res = results[id(ctx.logical_or_expression())]

                # 4. Binary Operations
                elif class_name in ["Logical_or_expressionContext", "Logical_and_expressionContext", 
                                  "Inclusive_or_expressionContext", "Exclusive_or_expressionContext",
                                  "And_expressionContext", "Equality_expressionContext", 
                                  "Relational_expressionContext", "Shift_expressionContext", 
                                  "Additive_expressionContext", "Multiplicative_expressionContext"]:
                    res = self._handle_binary(ctx, results)

                # 5. Casts
                elif class_name == "Cast_expressionContext":
                    if ctx.LPAREN():
                        target = ctx.typeSpecifier().getText()
                        inner = results[id(ctx.cast_expression())]
                        res = self.get_loc(CastNode(target, inner), ctx)
                    else:
                        res = results[id(ctx.unary_expression())]

                # 6. Unary Operations
                elif class_name == "Unary_expressionContext":
                    if ctx.getChildCount() == 1:
                        res = results[id(ctx.postfix_expression())]
                    else:
                        if ctx.MUL() or ctx.BITAND():
                            op = ctx.getChild(0).getText()
                            inner_node = results[id(ctx.cast_expression())]
                            res = self.get_loc(UnaryOpNode(op, inner_node), ctx)
                        else:                           
                            op = ctx.getChild(0).getText()
                            inner_node = results[id(ctx.unary_expression())]
                            res = self.get_loc(UnaryOpNode(op, inner_node), ctx)

                # 7. Postfix
                elif class_name == "Postfix_expressionContext":
                    if ctx.getChildCount() == 1:
                        res = results[id(ctx.primary_expression())]
                    elif ctx.LPAREN():
                        func_name_node = results[id(ctx.postfix_expression())]
                        args = []
                        if ctx.argumentList():
                            arg_ctx = ctx.argumentList()
                            for child in arg_ctx.getChildren():
                                if id(child) in results:
                                    args.append(results[id(child)])
                        res = self.get_loc(FuncCallNode(func_name_node.name, args), ctx)

                    elif ctx.LBRACKET():
                        left = results[id(ctx.postfix_expression())]
                        index = results[id(ctx.expression())]
                        res = self.get_loc(BinOpNode(left, "[]", index), ctx)

                    else:
                        # Suffix INC/DEC (a++ or a--)
                        op = ctx.getChild(1).getText()
                        inner = results[id(ctx.postfix_expression())]
                        res = self.get_loc(UnaryOpNode(f"POST{op}", inner), ctx)

                # 8. Primary Expressions (Leaves)
                elif class_name == "Primary_expressionContext":
                    if ctx.LPAREN():
                        res = results[id(ctx.expression())]
                    elif ctx.IDENTIFIER():
                        res = self.get_loc(IdentifierNode(ctx.IDENTIFIER().getText()), ctx)
                    elif ctx.INT_LITERAL():
                        text_val = ctx.INT_LITERAL().getText().rstrip("uUlL")
                        try:
                            # Check of het een C-stijl octaal is (begint met 0, langer dan 1 karakter, geen hex)
                            if text_val.startswith('0') and len(text_val) > 1 and not text_val.lower().startswith('0x'):
                                val = int(text_val, 8) # Forceer octaal (base 8)
                            else:
                                val = int(text_val, 0) # Base 0 is prima voor decimaal en hexadecimaal (0x...)
                            res = self.get_loc(IntNode(val), ctx)
                        except ValueError:
                            print(f"[Error] line {ctx.start.line}, position {ctx.start.column}: Invalid integer literal '{text_val}'")
                            import sys
                            sys.exit(1)
                    elif ctx.FLOAT_LITERAL():
                        res = self.get_loc(FloatNode(float(ctx.FLOAT_LITERAL().getText())), ctx)
                    elif ctx.CHAR_LITERAL():
                        res = self.get_loc(CharNode(ctx.CHAR_LITERAL().getText()[1:-1]), ctx)
                    elif ctx.STRING_LITERAL():
                        res = self.get_loc(StringNode(ctx.STRING_LITERAL().getText()[1:-1]), ctx)

                elif class_name == "Array_initializerContext":
                    values = []
                    for child in ctx.children:
                        if id(child) in results:
                            values.append(results[id(child)])
                    res = self.get_loc(ArrayInitNode(values), ctx)

                elif class_name == "IfStatementContext":
                    condition = results[id(ctx.expression())]
                    scope = results[id(ctx.compoundStatement(0))]
                    else_scope = None
                    if ctx.ELSE():
                        else_scope = results[id(ctx.compoundStatement(1))]
                    res = self.get_loc(IfNode(condition,scope,else_scope),ctx)

                elif class_name == "WhileStatementContext":
                    condition = results[id(ctx.expression())]
                    scope = results[id(ctx.compoundStatement())]
                    res = self.get_loc(WhileNode(condition,scope),ctx)

                elif class_name == "ForStatementContext":
                    init = results[id(ctx.expression(0))] if ctx.expression(0) else None
                    condition = results[id(ctx.expression(1))] if ctx.expression(1) else None
                    update = results[id(ctx.expression(2))] if ctx.expression(2) else None
                    body = results[id(ctx.compoundStatement())]
                    res = self.get_loc(ForNode(init, condition, update, body), ctx)

                elif class_name == "BreakStatementContext":
                    res = self.get_loc(BreakNode(),ctx)

                elif class_name == "ContinueStatementContext":
                    res = self.get_loc(ContinueNode(),ctx)


                elif class_name == "EnumDeclarationContext":
                    name = ctx.IDENTIFIER().getText()
                    values = []
                    for ident in ctx.enumList().IDENTIFIER():
                        values.append(ident.getText())
                    res = self.get_loc(EnumNode(name, values),ctx)

                elif class_name == "SwitchStatementContext":
                    change = results[id(ctx.expression())]
                    cases = []
                    default_case = None
                    for case in ctx.caseBlock():
                        if case.CASE():
                            value = int(case.INT_LITERAL().getText())
                            body = results[id(case)]
                            cases.append((value,body))
                        elif case.DEFAULT():
                            default_case = results[id(case)]
                    res = self.get_loc(SwitchNode(change,cases,default_case),ctx)

                elif class_name == "CaseBlockContext":
                    statements = []
                    for child in ctx.children:
                        if id(child) in results:
                            statements.append(results[id(child)])
                    res = self.get_loc(CompoundNode(statements), ctx)

                if res:
                    if class_name in ["DeclarationContext", "Assignment_expressionContext", "Postfix_expressionContext", "StatementContext"]:
                        res.original_c_code = self._get_source_text(ctx)
                        res.user_comments = self._get_hidden_comments(ctx)
                    
                    results[id(ctx)] = res

        return results[id(root_ctx)]

    def _handle_binary(self, ctx, results):
        """Helper to flatten left-recursive binary operations iteratively."""
        if ctx.getChildCount() == 1:
            return results[id(ctx.getChild(0))]
        
        left = results[id(ctx.getChild(0))]
        op = ctx.getChild(1).getText()
        right = results[id(ctx.getChild(2))]
        
        node = BinOpNode(left, op, right)
        node.line = ctx.start.line
        node.column = ctx.start.column
        return node