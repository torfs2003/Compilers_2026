# Generated from Cmm.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .CmmParser import CmmParser
else:
    from CmmParser import CmmParser

# This class defines a complete listener for a parse tree produced by CmmParser.
class CmmListener(ParseTreeListener):

    # Enter a parse tree produced by CmmParser#compilationUnit.
    def enterCompilationUnit(self, ctx:CmmParser.CompilationUnitContext):
        pass

    # Exit a parse tree produced by CmmParser#compilationUnit.
    def exitCompilationUnit(self, ctx:CmmParser.CompilationUnitContext):
        pass


    # Enter a parse tree produced by CmmParser#statement.
    def enterStatement(self, ctx:CmmParser.StatementContext):
        pass

    # Exit a parse tree produced by CmmParser#statement.
    def exitStatement(self, ctx:CmmParser.StatementContext):
        pass


    # Enter a parse tree produced by CmmParser#expression.
    def enterExpression(self, ctx:CmmParser.ExpressionContext):
        pass

    # Exit a parse tree produced by CmmParser#expression.
    def exitExpression(self, ctx:CmmParser.ExpressionContext):
        pass


    # Enter a parse tree produced by CmmParser#logical_or_expression.
    def enterLogical_or_expression(self, ctx:CmmParser.Logical_or_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#logical_or_expression.
    def exitLogical_or_expression(self, ctx:CmmParser.Logical_or_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#logical_and_expression.
    def enterLogical_and_expression(self, ctx:CmmParser.Logical_and_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#logical_and_expression.
    def exitLogical_and_expression(self, ctx:CmmParser.Logical_and_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#inclusive_or_expression.
    def enterInclusive_or_expression(self, ctx:CmmParser.Inclusive_or_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#inclusive_or_expression.
    def exitInclusive_or_expression(self, ctx:CmmParser.Inclusive_or_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#exclusive_or_expression.
    def enterExclusive_or_expression(self, ctx:CmmParser.Exclusive_or_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#exclusive_or_expression.
    def exitExclusive_or_expression(self, ctx:CmmParser.Exclusive_or_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#and_expression.
    def enterAnd_expression(self, ctx:CmmParser.And_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#and_expression.
    def exitAnd_expression(self, ctx:CmmParser.And_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#equality_expression.
    def enterEquality_expression(self, ctx:CmmParser.Equality_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#equality_expression.
    def exitEquality_expression(self, ctx:CmmParser.Equality_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#relational_expression.
    def enterRelational_expression(self, ctx:CmmParser.Relational_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#relational_expression.
    def exitRelational_expression(self, ctx:CmmParser.Relational_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#shift_expression.
    def enterShift_expression(self, ctx:CmmParser.Shift_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#shift_expression.
    def exitShift_expression(self, ctx:CmmParser.Shift_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#additive_expression.
    def enterAdditive_expression(self, ctx:CmmParser.Additive_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#additive_expression.
    def exitAdditive_expression(self, ctx:CmmParser.Additive_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#multiplicative_expression.
    def enterMultiplicative_expression(self, ctx:CmmParser.Multiplicative_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#multiplicative_expression.
    def exitMultiplicative_expression(self, ctx:CmmParser.Multiplicative_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#unary_expression.
    def enterUnary_expression(self, ctx:CmmParser.Unary_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#unary_expression.
    def exitUnary_expression(self, ctx:CmmParser.Unary_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#primary_expression.
    def enterPrimary_expression(self, ctx:CmmParser.Primary_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#primary_expression.
    def exitPrimary_expression(self, ctx:CmmParser.Primary_expressionContext):
        pass



del CmmParser