from src.antlr_files.CmmVisitor import CmmVisitor
from src.antlr_files.CmmParser import CmmParser
from src.parser.AST import *

class ASTVisitor(CmmVisitor):

    def getLoc_andLine(self, node, ctx):
        node.line = ctx.start.line
        node.column = ctx.start.column
        return node
    # De main functie
    def visitCompilationUnit(self, ctx: CmmParser.CompilationUnitContext):
        return self.visit(ctx.functionDefinition())

    # 2. Functie definitie (int main() { ... })
    def visitFunctionDefinition(self, ctx: CmmParser.FunctionDefinitionContext):
        return_type = ctx.typeSpecifier().getText()
        name = ctx.MAIN().getText()
        
        body = self.visit(ctx.compoundStatement())

        node = FunctionNode(return_type, name, body)
        return self.getLoc_andLine(node, ctx)

    # 3. Code blokken ({ ... })
    def visitCompoundStatement(self, ctx: CmmParser.CompoundStatementContext):
        items = []
        # Loop door alle statements/declaraties in het blok
        for child in ctx.children:
            if child.getText() != '{' and child.getText() != '}':
                node = self.visit(child)
                if node: # Soms kan een statement leeg zijn
                    items.append(node)
        node = CompoundNode(items)
        return self.getLoc_andLine(node, ctx)

    # 4. Variabele Declaraties
    def visitDeclaration(self, ctx: CmmParser.DeclarationContext):
        is_const = ctx.CONST() is not None
        type_spec = ctx.typeSpecifier().getText()
        name = ctx.IDENTIFIER().getText()
        
        init_expr = None
        if ctx.ASSIGN():
            init_expr = self.visit(ctx.expression())
        node = DeclNode(is_const, type_spec, name, init_expr)
        return self.getLoc_andLine(node, ctx)

    # 5. Statements
    def visitStatement(self, ctx: CmmParser.StatementContext):
        if ctx.expression():
            return self.visit(ctx.expression())
        elif ctx.compoundStatement():
            return self.visit(ctx.compoundStatement())
        return None

    # 6. Expressies & Assignments
    def visitExpression(self, ctx: CmmParser.ExpressionContext):
        return self.visit(ctx.getChild(0))

    def visitAssignment_expression(self, ctx: CmmParser.Assignment_expressionContext):
        if ctx.getChildCount() == 3:
            left = self.visit(ctx.getChild(0))
            right = self.visit(ctx.getChild(2))
            return AssignNode(left, right)
        return self.visit(ctx.getChild(0))

    # Helper voor binaire operatoren
    def _visit_binary_list(self, ctx):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.getChild(0))
        
        node = self.visit(ctx.getChild(0))
        for i in range(1, ctx.getChildCount(), 2):
            op = ctx.getChild(i).getText()
            right = self.visit(ctx.getChild(i+1))
            node = BinOpNode(node, op, right)
        return node

    # Precedence Levels
    def visitLogical_or_expression(self, ctx: CmmParser.Logical_or_expressionContext): return self._visit_binary_list(ctx)
    def visitLogical_and_expression(self, ctx: CmmParser.Logical_and_expressionContext): return self._visit_binary_list(ctx)
    def visitInclusive_or_expression(self, ctx: CmmParser.Inclusive_or_expressionContext): return self._visit_binary_list(ctx)
    def visitExclusive_or_expression(self, ctx: CmmParser.Exclusive_or_expressionContext): return self._visit_binary_list(ctx)
    def visitAnd_expression(self, ctx: CmmParser.And_expressionContext): return self._visit_binary_list(ctx)
    def visitEquality_expression(self, ctx: CmmParser.Equality_expressionContext): return self._visit_binary_list(ctx)
    def visitRelational_expression(self, ctx: CmmParser.Relational_expressionContext): return self._visit_binary_list(ctx)
    def visitShift_expression(self, ctx: CmmParser.Shift_expressionContext): return self._visit_binary_list(ctx)
    def visitAdditive_expression(self, ctx: CmmParser.Additive_expressionContext): return self._visit_binary_list(ctx)
    def visitMultiplicative_expression(self, ctx: CmmParser.Multiplicative_expressionContext): return self._visit_binary_list(ctx)

    # 7. Casts
    def visitCast_expression(self, ctx: CmmParser.Cast_expressionContext):
        if ctx.getChildCount() == 4:
            target_type = ctx.typeSpecifier().getText()
            expr = self.visit(ctx.getChild(3))
            return CastNode(target_type, expr)
        return self.visit(ctx.getChild(0))

    # 8. Unaire operaties (+, -, !, ~, *, &, ++, --)
    def visitUnary_expression(self, ctx: CmmParser.Unary_expressionContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.getChild(0))
        else:
            op = ctx.getChild(0).getText()
            child_node = self.visit(ctx.getChild(1))
            return UnaryOpNode(op, child_node)

    # 9. Postfix (++ en --)
    def visitPostfix_expression(self, ctx: CmmParser.Postfix_expressionContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.getChild(0))
        else:
            child_node = self.visit(ctx.getChild(0))
            op = ctx.getChild(1).getText()
            return UnaryOpNode(f"POST{op}", child_node) 

    # Primaire Expressies
    def visitPrimary_expression(self, ctx: CmmParser.Primary_expressionContext):
        # '( expression )'
        if ctx.getChildCount() == 3:
            return self.visit(ctx.getChild(1))
        
        # Variabelen
        if ctx.IDENTIFIER():
            return IdentifierNode(ctx.IDENTIFIER().getText())
        
        # Literals
        elif ctx.FLOAT_LITERAL():
            return FloatNode(float(ctx.FLOAT_LITERAL().getText()))
        
        elif ctx.CHAR_LITERAL():
            # Strip de quotes: 'a' wordt a
            raw_text = ctx.CHAR_LITERAL().getText()
            char_val = raw_text[1:-1] 
            return CharNode(char_val)
        
        elif ctx.INT_LITERAL():
            return self._parse_constant(ctx.INT_LITERAL().getText())

    # Integer parsing
    def _parse_constant(self, text: str):
        clean_text = text.rstrip("uUlL") # Verwijder suffixes
        try:
            val = int(clean_text, 0)
            return IntNode(val)
        except ValueError:
            print(f"Warning: Could not parse integer '{text}'")
            return IntNode(0)