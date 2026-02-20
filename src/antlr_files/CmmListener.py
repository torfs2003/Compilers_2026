# Generated from Cmm.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .CmmParser import CmmParser
else:
    from CmmParser import CmmParser

#include "TypeSpecifier.hpp"


# This class defines a complete listener for a parse tree produced by CmmParser.
class CmmListener(ParseTreeListener):

    # Enter a parse tree produced by CmmParser#compilationUnit.
    def enterCompilationUnit(self, ctx:CmmParser.CompilationUnitContext):
        pass

    # Exit a parse tree produced by CmmParser#compilationUnit.
    def exitCompilationUnit(self, ctx:CmmParser.CompilationUnitContext):
        pass


    # Enter a parse tree produced by CmmParser#translationUnit.
    def enterTranslationUnit(self, ctx:CmmParser.TranslationUnitContext):
        pass

    # Exit a parse tree produced by CmmParser#translationUnit.
    def exitTranslationUnit(self, ctx:CmmParser.TranslationUnitContext):
        pass


    # Enter a parse tree produced by CmmParser#typeSpecifier.
    def enterTypeSpecifier(self, ctx:CmmParser.TypeSpecifierContext):
        pass

    # Exit a parse tree produced by CmmParser#typeSpecifier.
    def exitTypeSpecifier(self, ctx:CmmParser.TypeSpecifierContext):
        pass


    # Enter a parse tree produced by CmmParser#blockItemList.
    def enterBlockItemList(self, ctx:CmmParser.BlockItemListContext):
        pass

    # Exit a parse tree produced by CmmParser#blockItemList.
    def exitBlockItemList(self, ctx:CmmParser.BlockItemListContext):
        pass


    # Enter a parse tree produced by CmmParser#blockItem.
    def enterBlockItem(self, ctx:CmmParser.BlockItemContext):
        pass

    # Exit a parse tree produced by CmmParser#blockItem.
    def exitBlockItem(self, ctx:CmmParser.BlockItemContext):
        pass


    # Enter a parse tree produced by CmmParser#value.
    def enterValue(self, ctx:CmmParser.ValueContext):
        pass

    # Exit a parse tree produced by CmmParser#value.
    def exitValue(self, ctx:CmmParser.ValueContext):
        pass


    # Enter a parse tree produced by CmmParser#externalDeclaration.
    def enterExternalDeclaration(self, ctx:CmmParser.ExternalDeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#externalDeclaration.
    def exitExternalDeclaration(self, ctx:CmmParser.ExternalDeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#declaration.
    def enterDeclaration(self, ctx:CmmParser.DeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#declaration.
    def exitDeclaration(self, ctx:CmmParser.DeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#functionParameterList.
    def enterFunctionParameterList(self, ctx:CmmParser.FunctionParameterListContext):
        pass

    # Exit a parse tree produced by CmmParser#functionParameterList.
    def exitFunctionParameterList(self, ctx:CmmParser.FunctionParameterListContext):
        pass


    # Enter a parse tree produced by CmmParser#functionDefinition.
    def enterFunctionDefinition(self, ctx:CmmParser.FunctionDefinitionContext):
        pass

    # Exit a parse tree produced by CmmParser#functionDefinition.
    def exitFunctionDefinition(self, ctx:CmmParser.FunctionDefinitionContext):
        pass


    # Enter a parse tree produced by CmmParser#parameterTypeList.
    def enterParameterTypeList(self, ctx:CmmParser.ParameterTypeListContext):
        pass

    # Exit a parse tree produced by CmmParser#parameterTypeList.
    def exitParameterTypeList(self, ctx:CmmParser.ParameterTypeListContext):
        pass


    # Enter a parse tree produced by CmmParser#functionCall.
    def enterFunctionCall(self, ctx:CmmParser.FunctionCallContext):
        pass

    # Exit a parse tree produced by CmmParser#functionCall.
    def exitFunctionCall(self, ctx:CmmParser.FunctionCallContext):
        pass


    # Enter a parse tree produced by CmmParser#functionReturn.
    def enterFunctionReturn(self, ctx:CmmParser.FunctionReturnContext):
        pass

    # Exit a parse tree produced by CmmParser#functionReturn.
    def exitFunctionReturn(self, ctx:CmmParser.FunctionReturnContext):
        pass


    # Enter a parse tree produced by CmmParser#statement.
    def enterStatement(self, ctx:CmmParser.StatementContext):
        pass

    # Exit a parse tree produced by CmmParser#statement.
    def exitStatement(self, ctx:CmmParser.StatementContext):
        pass


    # Enter a parse tree produced by CmmParser#printfStatement.
    def enterPrintfStatement(self, ctx:CmmParser.PrintfStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#printfStatement.
    def exitPrintfStatement(self, ctx:CmmParser.PrintfStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#compoundStatement.
    def enterCompoundStatement(self, ctx:CmmParser.CompoundStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#compoundStatement.
    def exitCompoundStatement(self, ctx:CmmParser.CompoundStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#expressionStatement.
    def enterExpressionStatement(self, ctx:CmmParser.ExpressionStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#expressionStatement.
    def exitExpressionStatement(self, ctx:CmmParser.ExpressionStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#ifElseStatement.
    def enterIfElseStatement(self, ctx:CmmParser.IfElseStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#ifElseStatement.
    def exitIfElseStatement(self, ctx:CmmParser.IfElseStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#ifStatement.
    def enterIfStatement(self, ctx:CmmParser.IfStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#ifStatement.
    def exitIfStatement(self, ctx:CmmParser.IfStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#elseIfStatement.
    def enterElseIfStatement(self, ctx:CmmParser.ElseIfStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#elseIfStatement.
    def exitElseIfStatement(self, ctx:CmmParser.ElseIfStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#elseStatement.
    def enterElseStatement(self, ctx:CmmParser.ElseStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#elseStatement.
    def exitElseStatement(self, ctx:CmmParser.ElseStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#iterationStatement.
    def enterIterationStatement(self, ctx:CmmParser.IterationStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#iterationStatement.
    def exitIterationStatement(self, ctx:CmmParser.IterationStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#assignmentStatement.
    def enterAssignmentStatement(self, ctx:CmmParser.AssignmentStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#assignmentStatement.
    def exitAssignmentStatement(self, ctx:CmmParser.AssignmentStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#jumpStatement.
    def enterJumpStatement(self, ctx:CmmParser.JumpStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#jumpStatement.
    def exitJumpStatement(self, ctx:CmmParser.JumpStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#unaryIncrementStatement.
    def enterUnaryIncrementStatement(self, ctx:CmmParser.UnaryIncrementStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#unaryIncrementStatement.
    def exitUnaryIncrementStatement(self, ctx:CmmParser.UnaryIncrementStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#unaryDecrementStatement.
    def enterUnaryDecrementStatement(self, ctx:CmmParser.UnaryDecrementStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#unaryDecrementStatement.
    def exitUnaryDecrementStatement(self, ctx:CmmParser.UnaryDecrementStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#unarySquareStatement.
    def enterUnarySquareStatement(self, ctx:CmmParser.UnarySquareStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#unarySquareStatement.
    def exitUnarySquareStatement(self, ctx:CmmParser.UnarySquareStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#identifierList.
    def enterIdentifierList(self, ctx:CmmParser.IdentifierListContext):
        pass

    # Exit a parse tree produced by CmmParser#identifierList.
    def exitIdentifierList(self, ctx:CmmParser.IdentifierListContext):
        pass


    # Enter a parse tree produced by CmmParser#bitExpr.
    def enterBitExpr(self, ctx:CmmParser.BitExprContext):
        pass

    # Exit a parse tree produced by CmmParser#bitExpr.
    def exitBitExpr(self, ctx:CmmParser.BitExprContext):
        pass


    # Enter a parse tree produced by CmmParser#primExpr.
    def enterPrimExpr(self, ctx:CmmParser.PrimExprContext):
        pass

    # Exit a parse tree produced by CmmParser#primExpr.
    def exitPrimExpr(self, ctx:CmmParser.PrimExprContext):
        pass


    # Enter a parse tree produced by CmmParser#mulDivExpr.
    def enterMulDivExpr(self, ctx:CmmParser.MulDivExprContext):
        pass

    # Exit a parse tree produced by CmmParser#mulDivExpr.
    def exitMulDivExpr(self, ctx:CmmParser.MulDivExprContext):
        pass


    # Enter a parse tree produced by CmmParser#addminExpr.
    def enterAddminExpr(self, ctx:CmmParser.AddminExprContext):
        pass

    # Exit a parse tree produced by CmmParser#addminExpr.
    def exitAddminExpr(self, ctx:CmmParser.AddminExprContext):
        pass


    # Enter a parse tree produced by CmmParser#primaryExpression.
    def enterPrimaryExpression(self, ctx:CmmParser.PrimaryExpressionContext):
        pass

    # Exit a parse tree produced by CmmParser#primaryExpression.
    def exitPrimaryExpression(self, ctx:CmmParser.PrimaryExpressionContext):
        pass


    # Enter a parse tree produced by CmmParser#basicConditionalExpr.
    def enterBasicConditionalExpr(self, ctx:CmmParser.BasicConditionalExprContext):
        pass

    # Exit a parse tree produced by CmmParser#basicConditionalExpr.
    def exitBasicConditionalExpr(self, ctx:CmmParser.BasicConditionalExprContext):
        pass


    # Enter a parse tree produced by CmmParser#negatedConditionalExpr.
    def enterNegatedConditionalExpr(self, ctx:CmmParser.NegatedConditionalExprContext):
        pass

    # Exit a parse tree produced by CmmParser#negatedConditionalExpr.
    def exitNegatedConditionalExpr(self, ctx:CmmParser.NegatedConditionalExprContext):
        pass


    # Enter a parse tree produced by CmmParser#connectedConditionalExpr.
    def enterConnectedConditionalExpr(self, ctx:CmmParser.ConnectedConditionalExprContext):
        pass

    # Exit a parse tree produced by CmmParser#connectedConditionalExpr.
    def exitConnectedConditionalExpr(self, ctx:CmmParser.ConnectedConditionalExprContext):
        pass


    # Enter a parse tree produced by CmmParser#parenthesizedConditionalExpr.
    def enterParenthesizedConditionalExpr(self, ctx:CmmParser.ParenthesizedConditionalExprContext):
        pass

    # Exit a parse tree produced by CmmParser#parenthesizedConditionalExpr.
    def exitParenthesizedConditionalExpr(self, ctx:CmmParser.ParenthesizedConditionalExprContext):
        pass


    # Enter a parse tree produced by CmmParser#assignmentExpression.
    def enterAssignmentExpression(self, ctx:CmmParser.AssignmentExpressionContext):
        pass

    # Exit a parse tree produced by CmmParser#assignmentExpression.
    def exitAssignmentExpression(self, ctx:CmmParser.AssignmentExpressionContext):
        pass



del CmmParser