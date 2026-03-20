# Generated from Cmm.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .CmmParser import CmmParser
else:
    from CmmParser import CmmParser

# This class defines a complete generic visitor for a parse tree produced by CmmParser.

class CmmVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by CmmParser#compilationUnit.
    def visitCompilationUnit(self, ctx:CmmParser.CompilationUnitContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#includeDirective.
    def visitIncludeDirective(self, ctx:CmmParser.IncludeDirectiveContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#functionDefinition.
    def visitFunctionDefinition(self, ctx:CmmParser.FunctionDefinitionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#parameterList.
    def visitParameterList(self, ctx:CmmParser.ParameterListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#compoundStatement.
    def visitCompoundStatement(self, ctx:CmmParser.CompoundStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#declaration.
    def visitDeclaration(self, ctx:CmmParser.DeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#statement.
    def visitStatement(self, ctx:CmmParser.StatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#typeSpecifier.
    def visitTypeSpecifier(self, ctx:CmmParser.TypeSpecifierContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#expression.
    def visitExpression(self, ctx:CmmParser.ExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#ifStatement.
    def visitIfStatement(self, ctx:CmmParser.IfStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#whileStatement.
    def visitWhileStatement(self, ctx:CmmParser.WhileStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#forStatement.
    def visitForStatement(self, ctx:CmmParser.ForStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#breakStatement.
    def visitBreakStatement(self, ctx:CmmParser.BreakStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#continueStatement.
    def visitContinueStatement(self, ctx:CmmParser.ContinueStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#switchStatement.
    def visitSwitchStatement(self, ctx:CmmParser.SwitchStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#caseBlock.
    def visitCaseBlock(self, ctx:CmmParser.CaseBlockContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#enumDeclaration.
    def visitEnumDeclaration(self, ctx:CmmParser.EnumDeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#enumList.
    def visitEnumList(self, ctx:CmmParser.EnumListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#assignment_expression.
    def visitAssignment_expression(self, ctx:CmmParser.Assignment_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#logical_or_expression.
    def visitLogical_or_expression(self, ctx:CmmParser.Logical_or_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#logical_and_expression.
    def visitLogical_and_expression(self, ctx:CmmParser.Logical_and_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#inclusive_or_expression.
    def visitInclusive_or_expression(self, ctx:CmmParser.Inclusive_or_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#exclusive_or_expression.
    def visitExclusive_or_expression(self, ctx:CmmParser.Exclusive_or_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#and_expression.
    def visitAnd_expression(self, ctx:CmmParser.And_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#equality_expression.
    def visitEquality_expression(self, ctx:CmmParser.Equality_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#relational_expression.
    def visitRelational_expression(self, ctx:CmmParser.Relational_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#shift_expression.
    def visitShift_expression(self, ctx:CmmParser.Shift_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#additive_expression.
    def visitAdditive_expression(self, ctx:CmmParser.Additive_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#cast_expression.
    def visitCast_expression(self, ctx:CmmParser.Cast_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#multiplicative_expression.
    def visitMultiplicative_expression(self, ctx:CmmParser.Multiplicative_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#unary_expression.
    def visitUnary_expression(self, ctx:CmmParser.Unary_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#postfix_expression.
    def visitPostfix_expression(self, ctx:CmmParser.Postfix_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#argumentList.
    def visitArgumentList(self, ctx:CmmParser.ArgumentListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#primary_expression.
    def visitPrimary_expression(self, ctx:CmmParser.Primary_expressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#array_initializer.
    def visitArray_initializer(self, ctx:CmmParser.Array_initializerContext):
        return self.visitChildren(ctx)



del CmmParser