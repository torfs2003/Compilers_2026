# Generated from Cmm.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .CmmParser import CmmParser
else:
    from CmmParser import CmmParser

#include "TypeSpecifier.hpp"


# This class defines a complete generic visitor for a parse tree produced by CmmParser.

class CmmVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by CmmParser#compilationUnit.
    def visitCompilationUnit(self, ctx:CmmParser.CompilationUnitContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#translationUnit.
    def visitTranslationUnit(self, ctx:CmmParser.TranslationUnitContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#typeSpecifier.
    def visitTypeSpecifier(self, ctx:CmmParser.TypeSpecifierContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#blockItemList.
    def visitBlockItemList(self, ctx:CmmParser.BlockItemListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#blockItem.
    def visitBlockItem(self, ctx:CmmParser.BlockItemContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#value.
    def visitValue(self, ctx:CmmParser.ValueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#externalDeclaration.
    def visitExternalDeclaration(self, ctx:CmmParser.ExternalDeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#declaration.
    def visitDeclaration(self, ctx:CmmParser.DeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#functionParameterList.
    def visitFunctionParameterList(self, ctx:CmmParser.FunctionParameterListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#functionDefinition.
    def visitFunctionDefinition(self, ctx:CmmParser.FunctionDefinitionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#parameterTypeList.
    def visitParameterTypeList(self, ctx:CmmParser.ParameterTypeListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#functionCall.
    def visitFunctionCall(self, ctx:CmmParser.FunctionCallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#functionReturn.
    def visitFunctionReturn(self, ctx:CmmParser.FunctionReturnContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#statement.
    def visitStatement(self, ctx:CmmParser.StatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#printfStatement.
    def visitPrintfStatement(self, ctx:CmmParser.PrintfStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#compoundStatement.
    def visitCompoundStatement(self, ctx:CmmParser.CompoundStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#expressionStatement.
    def visitExpressionStatement(self, ctx:CmmParser.ExpressionStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#ifElseStatement.
    def visitIfElseStatement(self, ctx:CmmParser.IfElseStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#ifStatement.
    def visitIfStatement(self, ctx:CmmParser.IfStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#elseIfStatement.
    def visitElseIfStatement(self, ctx:CmmParser.ElseIfStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#elseStatement.
    def visitElseStatement(self, ctx:CmmParser.ElseStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#iterationStatement.
    def visitIterationStatement(self, ctx:CmmParser.IterationStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#assignmentStatement.
    def visitAssignmentStatement(self, ctx:CmmParser.AssignmentStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#jumpStatement.
    def visitJumpStatement(self, ctx:CmmParser.JumpStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#unaryIncrementStatement.
    def visitUnaryIncrementStatement(self, ctx:CmmParser.UnaryIncrementStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#unaryDecrementStatement.
    def visitUnaryDecrementStatement(self, ctx:CmmParser.UnaryDecrementStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#unarySquareStatement.
    def visitUnarySquareStatement(self, ctx:CmmParser.UnarySquareStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#identifierList.
    def visitIdentifierList(self, ctx:CmmParser.IdentifierListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#bitExpr.
    def visitBitExpr(self, ctx:CmmParser.BitExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#primExpr.
    def visitPrimExpr(self, ctx:CmmParser.PrimExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#mulDivExpr.
    def visitMulDivExpr(self, ctx:CmmParser.MulDivExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#addminExpr.
    def visitAddminExpr(self, ctx:CmmParser.AddminExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#primaryExpression.
    def visitPrimaryExpression(self, ctx:CmmParser.PrimaryExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#basicConditionalExpr.
    def visitBasicConditionalExpr(self, ctx:CmmParser.BasicConditionalExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#negatedConditionalExpr.
    def visitNegatedConditionalExpr(self, ctx:CmmParser.NegatedConditionalExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#connectedConditionalExpr.
    def visitConnectedConditionalExpr(self, ctx:CmmParser.ConnectedConditionalExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#parenthesizedConditionalExpr.
    def visitParenthesizedConditionalExpr(self, ctx:CmmParser.ParenthesizedConditionalExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by CmmParser#assignmentExpression.
    def visitAssignmentExpression(self, ctx:CmmParser.AssignmentExpressionContext):
        return self.visitChildren(ctx)



del CmmParser