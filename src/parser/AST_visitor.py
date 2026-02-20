from src.antlr_files.CmmVisitor import CmmVisitor
from src.antlr_files.CmmParser import CmmParser
from src.parser.AST import IntNode, BinOpNode, UnaryOpNode

class ASTVisitor(CmmVisitor):
    def visitCompilationUnit(self, ctx: CmmParser.CompilationUnitContext):
        statements = []
        for child in ctx.children:
            if child.getText() != "<EOF>":
                statements.append(self.visit(child))
        return statements

    def visitStatement(self, ctx: CmmParser.StatementContext):
        return self.visit(ctx.expression())

    def _visit_binary_list(self, ctx):
        """
        Deze helper verwerkt regels zoals: A (OP A)*
        Het zorgt voor correcte left-associativity (bijv. 10 - 5 - 2 wordt (10 - 5) - 2)
        """
        # Als er maar 1 kind is, is er geen operator. Schuif gewoon door naar beneden.
        if ctx.getChildCount() == 1:
            return self.visit(ctx.getChild(0))
        
        # Als er meerdere kinderen zijn, bouwen we de boom van links naar rechts op.
        node = self.visit(ctx.getChild(0))
        
        # Loop over de rest van de kinderen
        for i in range(1, ctx.getChildCount(), 2):
            op = ctx.getChild(i).getText()
            right = self.visit(ctx.getChild(i+1))
            node = BinOpNode(node, op, right)
            
        return node

    #Presedence levels
    def visitExpression(self, ctx: CmmParser.ExpressionContext):
        return self.visit(ctx.getChild(0))

    def visitLogical_or_expression(self, ctx: CmmParser.Logical_or_expressionContext):
        return self._visit_binary_list(ctx)

    def visitLogical_and_expression(self, ctx: CmmParser.Logical_and_expressionContext):
        return self._visit_binary_list(ctx)

    def visitInclusive_or_expression(self, ctx: CmmParser.Inclusive_or_expressionContext):
        return self._visit_binary_list(ctx)

    def visitExclusive_or_expression(self, ctx: CmmParser.Exclusive_or_expressionContext):
        return self._visit_binary_list(ctx)

    def visitAnd_expression(self, ctx: CmmParser.And_expressionContext):
        return self._visit_binary_list(ctx)

    def visitEquality_expression(self, ctx: CmmParser.Equality_expressionContext):
        return self._visit_binary_list(ctx)

    def visitRelational_expression(self, ctx: CmmParser.Relational_expressionContext):
        return self._visit_binary_list(ctx)

    def visitShift_expression(self, ctx: CmmParser.Shift_expressionContext):
        return self._visit_binary_list(ctx)

    def visitAdditive_expression(self, ctx: CmmParser.Additive_expressionContext):
        return self._visit_binary_list(ctx)

    def visitMultiplicative_expression(self, ctx: CmmParser.Multiplicative_expressionContext):
        return self._visit_binary_list(ctx)

    # Unaire Expressies
    def visitUnary_expression(self, ctx: CmmParser.Unary_expressionContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.getChild(0))
        else:
            op = ctx.getChild(0).getText()
            child_node = self.visit(ctx.getChild(1))
            return UnaryOpNode(op, child_node)

    # Primaire Expressies
    def visitPrimary_expression(self, ctx: CmmParser.Primary_expressionContext):
        
        if ctx.getChildCount() == 3:
            return self.visit(ctx.getChild(1))
        
        token_text = ctx.getText()
        return self._parse_constant(token_text)

    # Helper: Constanten Parsen
    def _parse_constant(self, text: str):
        clean_text = text.rstrip("uUlL")
        
        try:
            val = int(clean_text, 0)
            return IntNode(val)
        except ValueError:
            print(f"Waarschuwing: Kon '{text}' niet parsen als integer.")
            return IntNode(0)