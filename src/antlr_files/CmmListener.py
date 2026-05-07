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


    # Enter a parse tree produced by CmmParser#includeDirective.
    def enterIncludeDirective(self, ctx:CmmParser.IncludeDirectiveContext):
        pass

    # Exit a parse tree produced by CmmParser#includeDirective.
    def exitIncludeDirective(self, ctx:CmmParser.IncludeDirectiveContext):
        pass


    # Enter a parse tree produced by CmmParser#functionDefinition.
    def enterFunctionDefinition(self, ctx:CmmParser.FunctionDefinitionContext):
        pass

    # Exit a parse tree produced by CmmParser#functionDefinition.
    def exitFunctionDefinition(self, ctx:CmmParser.FunctionDefinitionContext):
        pass


    # Enter a parse tree produced by CmmParser#functionDeclaration.
    def enterFunctionDeclaration(self, ctx:CmmParser.FunctionDeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#functionDeclaration.
    def exitFunctionDeclaration(self, ctx:CmmParser.FunctionDeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#parameterList.
    def enterParameterList(self, ctx:CmmParser.ParameterListContext):
        pass

    # Exit a parse tree produced by CmmParser#parameterList.
    def exitParameterList(self, ctx:CmmParser.ParameterListContext):
        pass


    # Enter a parse tree produced by CmmParser#parameterDeclaration.
    def enterParameterDeclaration(self, ctx:CmmParser.ParameterDeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#parameterDeclaration.
    def exitParameterDeclaration(self, ctx:CmmParser.ParameterDeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#compoundStatement.
    def enterCompoundStatement(self, ctx:CmmParser.CompoundStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#compoundStatement.
    def exitCompoundStatement(self, ctx:CmmParser.CompoundStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#initDeclaratorList.
    def enterInitDeclaratorList(self, ctx:CmmParser.InitDeclaratorListContext):
        pass

    # Exit a parse tree produced by CmmParser#initDeclaratorList.
    def exitInitDeclaratorList(self, ctx:CmmParser.InitDeclaratorListContext):
        pass


    # Enter a parse tree produced by CmmParser#initDeclarator.
    def enterInitDeclarator(self, ctx:CmmParser.InitDeclaratorContext):
        pass

    # Exit a parse tree produced by CmmParser#initDeclarator.
    def exitInitDeclarator(self, ctx:CmmParser.InitDeclaratorContext):
        pass


    # Enter a parse tree produced by CmmParser#declaration.
    def enterDeclaration(self, ctx:CmmParser.DeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#declaration.
    def exitDeclaration(self, ctx:CmmParser.DeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#typeList.
    def enterTypeList(self, ctx:CmmParser.TypeListContext):
        pass

    # Exit a parse tree produced by CmmParser#typeList.
    def exitTypeList(self, ctx:CmmParser.TypeListContext):
        pass


    # Enter a parse tree produced by CmmParser#structDeclaration.
    def enterStructDeclaration(self, ctx:CmmParser.StructDeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#structDeclaration.
    def exitStructDeclaration(self, ctx:CmmParser.StructDeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#typedefDeclaration.
    def enterTypedefDeclaration(self, ctx:CmmParser.TypedefDeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#typedefDeclaration.
    def exitTypedefDeclaration(self, ctx:CmmParser.TypedefDeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#unionDeclaration.
    def enterUnionDeclaration(self, ctx:CmmParser.UnionDeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#unionDeclaration.
    def exitUnionDeclaration(self, ctx:CmmParser.UnionDeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#statement.
    def enterStatement(self, ctx:CmmParser.StatementContext):
        pass

    # Exit a parse tree produced by CmmParser#statement.
    def exitStatement(self, ctx:CmmParser.StatementContext):
        pass


    # Enter a parse tree produced by CmmParser#typeSpecifier.
    def enterTypeSpecifier(self, ctx:CmmParser.TypeSpecifierContext):
        pass

    # Exit a parse tree produced by CmmParser#typeSpecifier.
    def exitTypeSpecifier(self, ctx:CmmParser.TypeSpecifierContext):
        pass


    # Enter a parse tree produced by CmmParser#expression.
    def enterExpression(self, ctx:CmmParser.ExpressionContext):
        pass

    # Exit a parse tree produced by CmmParser#expression.
    def exitExpression(self, ctx:CmmParser.ExpressionContext):
        pass


    # Enter a parse tree produced by CmmParser#ifStatement.
    def enterIfStatement(self, ctx:CmmParser.IfStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#ifStatement.
    def exitIfStatement(self, ctx:CmmParser.IfStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#whileStatement.
    def enterWhileStatement(self, ctx:CmmParser.WhileStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#whileStatement.
    def exitWhileStatement(self, ctx:CmmParser.WhileStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#forStatement.
    def enterForStatement(self, ctx:CmmParser.ForStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#forStatement.
    def exitForStatement(self, ctx:CmmParser.ForStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#forInit.
    def enterForInit(self, ctx:CmmParser.ForInitContext):
        pass

    # Exit a parse tree produced by CmmParser#forInit.
    def exitForInit(self, ctx:CmmParser.ForInitContext):
        pass


    # Enter a parse tree produced by CmmParser#declarationFor.
    def enterDeclarationFor(self, ctx:CmmParser.DeclarationForContext):
        pass

    # Exit a parse tree produced by CmmParser#declarationFor.
    def exitDeclarationFor(self, ctx:CmmParser.DeclarationForContext):
        pass


    # Enter a parse tree produced by CmmParser#breakStatement.
    def enterBreakStatement(self, ctx:CmmParser.BreakStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#breakStatement.
    def exitBreakStatement(self, ctx:CmmParser.BreakStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#continueStatement.
    def enterContinueStatement(self, ctx:CmmParser.ContinueStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#continueStatement.
    def exitContinueStatement(self, ctx:CmmParser.ContinueStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#switchStatement.
    def enterSwitchStatement(self, ctx:CmmParser.SwitchStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#switchStatement.
    def exitSwitchStatement(self, ctx:CmmParser.SwitchStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#returnStatement.
    def enterReturnStatement(self, ctx:CmmParser.ReturnStatementContext):
        pass

    # Exit a parse tree produced by CmmParser#returnStatement.
    def exitReturnStatement(self, ctx:CmmParser.ReturnStatementContext):
        pass


    # Enter a parse tree produced by CmmParser#caseBlock.
    def enterCaseBlock(self, ctx:CmmParser.CaseBlockContext):
        pass

    # Exit a parse tree produced by CmmParser#caseBlock.
    def exitCaseBlock(self, ctx:CmmParser.CaseBlockContext):
        pass


    # Enter a parse tree produced by CmmParser#enumDeclaration.
    def enterEnumDeclaration(self, ctx:CmmParser.EnumDeclarationContext):
        pass

    # Exit a parse tree produced by CmmParser#enumDeclaration.
    def exitEnumDeclaration(self, ctx:CmmParser.EnumDeclarationContext):
        pass


    # Enter a parse tree produced by CmmParser#enumList.
    def enterEnumList(self, ctx:CmmParser.EnumListContext):
        pass

    # Exit a parse tree produced by CmmParser#enumList.
    def exitEnumList(self, ctx:CmmParser.EnumListContext):
        pass


    # Enter a parse tree produced by CmmParser#assignment_expression.
    def enterAssignment_expression(self, ctx:CmmParser.Assignment_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#assignment_expression.
    def exitAssignment_expression(self, ctx:CmmParser.Assignment_expressionContext):
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


    # Enter a parse tree produced by CmmParser#cast_expression.
    def enterCast_expression(self, ctx:CmmParser.Cast_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#cast_expression.
    def exitCast_expression(self, ctx:CmmParser.Cast_expressionContext):
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


    # Enter a parse tree produced by CmmParser#postfix_expression.
    def enterPostfix_expression(self, ctx:CmmParser.Postfix_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#postfix_expression.
    def exitPostfix_expression(self, ctx:CmmParser.Postfix_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#argumentList.
    def enterArgumentList(self, ctx:CmmParser.ArgumentListContext):
        pass

    # Exit a parse tree produced by CmmParser#argumentList.
    def exitArgumentList(self, ctx:CmmParser.ArgumentListContext):
        pass


    # Enter a parse tree produced by CmmParser#primary_expression.
    def enterPrimary_expression(self, ctx:CmmParser.Primary_expressionContext):
        pass

    # Exit a parse tree produced by CmmParser#primary_expression.
    def exitPrimary_expression(self, ctx:CmmParser.Primary_expressionContext):
        pass


    # Enter a parse tree produced by CmmParser#array_initializer.
    def enterArray_initializer(self, ctx:CmmParser.Array_initializerContext):
        pass

    # Exit a parse tree produced by CmmParser#array_initializer.
    def exitArray_initializer(self, ctx:CmmParser.Array_initializerContext):
        pass


    # Enter a parse tree produced by CmmParser#initializer_list.
    def enterInitializer_list(self, ctx:CmmParser.Initializer_listContext):
        pass

    # Exit a parse tree produced by CmmParser#initializer_list.
    def exitInitializer_list(self, ctx:CmmParser.Initializer_listContext):
        pass


    # Enter a parse tree produced by CmmParser#initializer_element.
    def enterInitializer_element(self, ctx:CmmParser.Initializer_elementContext):
        pass

    # Exit a parse tree produced by CmmParser#initializer_element.
    def exitInitializer_element(self, ctx:CmmParser.Initializer_elementContext):
        pass



del CmmParser