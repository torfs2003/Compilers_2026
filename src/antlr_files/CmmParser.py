# Generated from Cmm.g4 by ANTLR 4.13.2
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO


#include "TypeSpecifier.hpp"

def serializedATN():
    return [
        4,1,92,319,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        2,14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,
        7,20,2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,
        2,27,7,27,2,28,7,28,2,29,7,29,1,0,3,0,62,8,0,1,0,1,0,1,1,1,1,1,1,
        1,1,1,1,5,1,71,8,1,10,1,12,1,74,9,1,1,2,1,2,1,3,1,3,1,3,1,3,1,3,
        5,3,83,8,3,10,3,12,3,86,9,3,1,4,1,4,1,4,3,4,91,8,4,1,5,1,5,1,6,1,
        6,1,6,3,6,98,8,6,1,7,1,7,1,7,1,7,5,7,104,8,7,10,7,12,7,107,9,7,1,
        7,1,7,1,7,1,7,1,7,1,7,5,7,115,8,7,10,7,12,7,118,9,7,1,7,1,7,3,7,
        122,8,7,1,8,1,8,1,8,1,8,1,8,1,8,5,8,130,8,8,10,8,12,8,133,9,8,1,
        9,1,9,1,9,1,9,1,9,1,10,1,10,3,10,142,8,10,1,10,1,10,1,11,1,11,1,
        11,3,11,149,8,11,1,11,1,11,1,11,1,12,1,12,1,12,3,12,157,8,12,1,12,
        1,12,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,3,13,171,
        8,13,1,14,1,14,1,14,1,14,1,14,5,14,178,8,14,10,14,12,14,181,9,14,
        1,14,1,14,1,14,1,15,1,15,3,15,188,8,15,1,15,1,15,1,16,3,16,193,8,
        16,1,16,1,16,1,17,1,17,5,17,199,8,17,10,17,12,17,202,9,17,1,17,5,
        17,205,8,17,10,17,12,17,208,9,17,1,18,1,18,1,18,1,18,1,18,1,18,1,
        19,1,19,1,19,1,19,1,19,1,19,1,19,1,20,1,20,1,20,1,21,1,21,1,21,1,
        21,1,21,1,21,1,22,1,22,1,22,1,23,1,23,3,23,237,8,23,1,23,1,23,1,
        24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,3,24,251,8,24,1,
        25,1,25,1,25,5,25,256,8,25,10,25,12,25,259,9,25,1,26,1,26,1,26,1,
        26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,1,26,5,26,273,8,26,10,26,12,
        26,276,9,26,1,27,1,27,1,27,1,27,1,27,1,27,1,27,3,27,285,8,27,1,28,
        1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,
        3,28,301,8,28,1,28,1,28,1,28,5,28,306,8,28,10,28,12,28,309,9,28,
        1,29,1,29,1,29,1,29,1,29,1,29,3,29,317,8,29,1,29,0,4,2,6,52,56,30,
        0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,
        46,48,50,52,54,56,58,0,5,6,0,13,13,16,16,18,18,21,21,24,24,36,36,
        2,0,80,81,87,87,1,0,54,56,2,0,50,50,52,52,2,0,48,49,57,60,330,0,
        61,1,0,0,0,2,65,1,0,0,0,4,75,1,0,0,0,6,77,1,0,0,0,8,90,1,0,0,0,10,
        92,1,0,0,0,12,97,1,0,0,0,14,121,1,0,0,0,16,123,1,0,0,0,18,134,1,
        0,0,0,20,139,1,0,0,0,22,145,1,0,0,0,24,153,1,0,0,0,26,170,1,0,0,
        0,28,172,1,0,0,0,30,185,1,0,0,0,32,192,1,0,0,0,34,196,1,0,0,0,36,
        209,1,0,0,0,38,215,1,0,0,0,40,222,1,0,0,0,42,225,1,0,0,0,44,231,
        1,0,0,0,46,234,1,0,0,0,48,250,1,0,0,0,50,252,1,0,0,0,52,260,1,0,
        0,0,54,284,1,0,0,0,56,300,1,0,0,0,58,316,1,0,0,0,60,62,3,2,1,0,61,
        60,1,0,0,0,61,62,1,0,0,0,62,63,1,0,0,0,63,64,5,0,0,1,64,1,1,0,0,
        0,65,66,6,1,-1,0,66,67,3,12,6,0,67,72,1,0,0,0,68,69,10,1,0,0,69,
        71,3,12,6,0,70,68,1,0,0,0,71,74,1,0,0,0,72,70,1,0,0,0,72,73,1,0,
        0,0,73,3,1,0,0,0,74,72,1,0,0,0,75,76,7,0,0,0,76,5,1,0,0,0,77,78,
        6,3,-1,0,78,79,3,8,4,0,79,84,1,0,0,0,80,81,10,1,0,0,81,83,3,8,4,
        0,82,80,1,0,0,0,83,86,1,0,0,0,84,82,1,0,0,0,84,85,1,0,0,0,85,7,1,
        0,0,0,86,84,1,0,0,0,87,91,3,26,13,0,88,91,3,14,7,0,89,91,3,22,11,
        0,90,87,1,0,0,0,90,88,1,0,0,0,90,89,1,0,0,0,91,9,1,0,0,0,92,93,7,
        1,0,0,93,11,1,0,0,0,94,98,3,18,9,0,95,98,3,14,7,0,96,98,5,63,0,0,
        97,94,1,0,0,0,97,95,1,0,0,0,97,96,1,0,0,0,98,13,1,0,0,0,99,100,3,
        4,2,0,100,105,5,87,0,0,101,102,5,64,0,0,102,104,5,87,0,0,103,101,
        1,0,0,0,104,107,1,0,0,0,105,103,1,0,0,0,105,106,1,0,0,0,106,108,
        1,0,0,0,107,105,1,0,0,0,108,109,5,63,0,0,109,122,1,0,0,0,110,111,
        3,4,2,0,111,116,3,58,29,0,112,113,5,64,0,0,113,115,3,58,29,0,114,
        112,1,0,0,0,115,118,1,0,0,0,116,114,1,0,0,0,116,117,1,0,0,0,117,
        119,1,0,0,0,118,116,1,0,0,0,119,120,5,63,0,0,120,122,1,0,0,0,121,
        99,1,0,0,0,121,110,1,0,0,0,122,15,1,0,0,0,123,124,3,4,2,0,124,131,
        5,87,0,0,125,126,5,64,0,0,126,127,3,4,2,0,127,128,5,87,0,0,128,130,
        1,0,0,0,129,125,1,0,0,0,130,133,1,0,0,0,131,129,1,0,0,0,131,132,
        1,0,0,0,132,17,1,0,0,0,133,131,1,0,0,0,134,135,3,4,2,0,135,136,5,
        87,0,0,136,137,3,20,10,0,137,138,3,30,15,0,138,19,1,0,0,0,139,141,
        5,38,0,0,140,142,3,16,8,0,141,140,1,0,0,0,141,142,1,0,0,0,142,143,
        1,0,0,0,143,144,5,39,0,0,144,21,1,0,0,0,145,146,5,87,0,0,146,148,
        5,38,0,0,147,149,3,50,25,0,148,147,1,0,0,0,148,149,1,0,0,0,149,150,
        1,0,0,0,150,151,5,39,0,0,151,152,5,63,0,0,152,23,1,0,0,0,153,154,
        5,87,0,0,154,156,5,38,0,0,155,157,3,50,25,0,156,155,1,0,0,0,156,
        157,1,0,0,0,157,158,1,0,0,0,158,159,5,39,0,0,159,25,1,0,0,0,160,
        171,3,30,15,0,161,171,3,32,16,0,162,171,3,34,17,0,163,171,3,42,21,
        0,164,171,3,44,22,0,165,171,3,46,23,0,166,167,3,48,24,0,167,168,
        5,63,0,0,168,171,1,0,0,0,169,171,3,28,14,0,170,160,1,0,0,0,170,161,
        1,0,0,0,170,162,1,0,0,0,170,163,1,0,0,0,170,164,1,0,0,0,170,165,
        1,0,0,0,170,166,1,0,0,0,170,169,1,0,0,0,171,27,1,0,0,0,172,173,5,
        10,0,0,173,174,5,38,0,0,174,179,5,88,0,0,175,176,5,64,0,0,176,178,
        3,10,5,0,177,175,1,0,0,0,178,181,1,0,0,0,179,177,1,0,0,0,179,180,
        1,0,0,0,180,182,1,0,0,0,181,179,1,0,0,0,182,183,5,39,0,0,183,184,
        5,63,0,0,184,29,1,0,0,0,185,187,5,42,0,0,186,188,3,6,3,0,187,186,
        1,0,0,0,187,188,1,0,0,0,188,189,1,0,0,0,189,190,5,43,0,0,190,31,
        1,0,0,0,191,193,3,52,26,0,192,191,1,0,0,0,192,193,1,0,0,0,193,194,
        1,0,0,0,194,195,5,63,0,0,195,33,1,0,0,0,196,200,3,36,18,0,197,199,
        3,38,19,0,198,197,1,0,0,0,199,202,1,0,0,0,200,198,1,0,0,0,200,201,
        1,0,0,0,201,206,1,0,0,0,202,200,1,0,0,0,203,205,3,40,20,0,204,203,
        1,0,0,0,205,208,1,0,0,0,206,204,1,0,0,0,206,207,1,0,0,0,207,35,1,
        0,0,0,208,206,1,0,0,0,209,210,5,23,0,0,210,211,5,38,0,0,211,212,
        3,56,28,0,212,213,5,39,0,0,213,214,3,26,13,0,214,37,1,0,0,0,215,
        216,5,19,0,0,216,217,5,23,0,0,217,218,5,38,0,0,218,219,3,56,28,0,
        219,220,5,39,0,0,220,221,3,26,13,0,221,39,1,0,0,0,222,223,5,19,0,
        0,223,224,3,26,13,0,224,41,1,0,0,0,225,226,5,37,0,0,226,227,5,38,
        0,0,227,228,3,56,28,0,228,229,5,39,0,0,229,230,3,26,13,0,230,43,
        1,0,0,0,231,232,3,58,29,0,232,233,5,63,0,0,233,45,1,0,0,0,234,236,
        5,28,0,0,235,237,3,52,26,0,236,235,1,0,0,0,236,237,1,0,0,0,237,238,
        1,0,0,0,238,239,5,63,0,0,239,47,1,0,0,0,240,241,5,51,0,0,241,251,
        5,87,0,0,242,243,5,53,0,0,243,251,5,87,0,0,244,245,5,87,0,0,245,
        251,5,51,0,0,246,247,5,87,0,0,247,251,5,53,0,0,248,249,5,87,0,0,
        249,251,5,5,0,0,250,240,1,0,0,0,250,242,1,0,0,0,250,244,1,0,0,0,
        250,246,1,0,0,0,250,248,1,0,0,0,251,49,1,0,0,0,252,257,3,52,26,0,
        253,254,5,64,0,0,254,256,3,52,26,0,255,253,1,0,0,0,256,259,1,0,0,
        0,257,255,1,0,0,0,257,258,1,0,0,0,258,51,1,0,0,0,259,257,1,0,0,0,
        260,261,6,26,-1,0,261,262,3,54,27,0,262,274,1,0,0,0,263,264,10,4,
        0,0,264,265,7,2,0,0,265,273,3,52,26,5,266,267,10,3,0,0,267,268,7,
        3,0,0,268,273,3,52,26,4,269,270,10,2,0,0,270,271,7,4,0,0,271,273,
        3,52,26,3,272,263,1,0,0,0,272,266,1,0,0,0,272,269,1,0,0,0,273,276,
        1,0,0,0,274,272,1,0,0,0,274,275,1,0,0,0,275,53,1,0,0,0,276,274,1,
        0,0,0,277,285,5,87,0,0,278,285,5,80,0,0,279,285,5,81,0,0,280,281,
        5,38,0,0,281,282,3,52,26,0,282,283,5,39,0,0,283,285,1,0,0,0,284,
        277,1,0,0,0,284,278,1,0,0,0,284,279,1,0,0,0,284,280,1,0,0,0,285,
        55,1,0,0,0,286,287,6,28,-1,0,287,288,3,52,26,0,288,289,5,2,0,0,289,
        290,3,52,26,0,290,301,1,0,0,0,291,292,5,38,0,0,292,293,3,56,28,0,
        293,294,5,39,0,0,294,301,1,0,0,0,295,296,5,84,0,0,296,297,5,38,0,
        0,297,298,3,56,28,0,298,299,5,39,0,0,299,301,1,0,0,0,300,286,1,0,
        0,0,300,291,1,0,0,0,300,295,1,0,0,0,301,307,1,0,0,0,302,303,10,3,
        0,0,303,304,5,1,0,0,304,306,3,56,28,4,305,302,1,0,0,0,306,309,1,
        0,0,0,307,305,1,0,0,0,307,308,1,0,0,0,308,57,1,0,0,0,309,307,1,0,
        0,0,310,311,5,87,0,0,311,312,5,65,0,0,312,317,3,52,26,0,313,314,
        5,87,0,0,314,315,5,65,0,0,315,317,3,24,12,0,316,310,1,0,0,0,316,
        313,1,0,0,0,317,59,1,0,0,0,27,61,72,84,90,97,105,116,121,131,141,
        148,156,170,179,187,192,200,206,236,250,257,272,274,284,300,307,
        316
    ]

class CmmParser ( Parser ):

    grammarFileName = "Cmm.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "'??'", "'@'", 
                     "'**'", "'_'", "'namespace'", "'::'", "'\"'", "'printf'", 
                     "'break'", "'case'", "'char'", "'const'", "'continue'", 
                     "'bool'", "'default'", "'double'", "'else'", "'extern'", 
                     "'float'", "'for'", "'if'", "'int'", "'uint32_t'", 
                     "'int32_t'", "'long'", "'return'", "'short'", "'signed'", 
                     "'sizeof'", "'static'", "'switch'", "'typedef'", "'unsigned'", 
                     "'void'", "'while'", "'('", "')'", "'['", "']'", "'{'", 
                     "'}'", "'<'", "'<='", "'>'", "'>='", "'<<'", "'>>'", 
                     "'+'", "'++'", "'-'", "'--'", "'*'", "'/'", "'%'", 
                     "'&'", "'|'", "'~'", "'^'", "'?'", "':'", "';'", "','", 
                     "'='", "'*='", "'/='", "'%='", "'+='", "'-='", "'<<='", 
                     "'>>='", "'&='", "'^='", "'|='", "'~='", "'->'", "'.'", 
                     "'...'" ]

    symbolicNames = [ "<INVALID>", "ConditionalConnectOperator", "ConditionalOperator", 
                      "Coalescing", "Bit", "Power", "IgnoreWildCard", "Namespace", 
                      "ScopeResolution", "DoubleQuote", "Printf", "Break", 
                      "Case", "Char", "Const", "Continue", "Bool", "Default", 
                      "Double", "Else", "Extern", "Float", "For", "If", 
                      "Int", "Uint32", "Int32", "Long", "Return", "Short", 
                      "Signed", "Sizeof", "Static", "Switch", "Typedef", 
                      "Unsigned", "Void", "While", "LeftParen", "RightParen", 
                      "LeftBracket", "RightBracket", "LeftBrace", "RightBrace", 
                      "Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", 
                      "RightShift", "Plus", "PlusPlus", "Minus", "MinusMinus", 
                      "Star", "Div", "Mod", "And", "Or", "Negate", "Caret", 
                      "Question", "Colon", "Semi", "Comma", "Assign", "StarAssign", 
                      "DivAssign", "ModAssign", "PlusAssign", "MinusAssign", 
                      "LeftShiftAssign", "RightShiftAssign", "AndAssign", 
                      "XorAssign", "OrAssign", "NegateAssign", "Arrow", 
                      "Dot", "Ellipsis", "IntegerConstant", "FloatConstant", 
                      "AndAnd", "OrOr", "Not", "Equal", "NotEqual", "Identifier", 
                      "String", "Whitespace", "Newline", "BlockComment", 
                      "LineComment" ]

    RULE_compilationUnit = 0
    RULE_translationUnit = 1
    RULE_typeSpecifier = 2
    RULE_blockItemList = 3
    RULE_blockItem = 4
    RULE_value = 5
    RULE_externalDeclaration = 6
    RULE_declaration = 7
    RULE_functionParameterList = 8
    RULE_functionDefinition = 9
    RULE_parameterTypeList = 10
    RULE_functionCall = 11
    RULE_functionReturn = 12
    RULE_statement = 13
    RULE_printfStatement = 14
    RULE_compoundStatement = 15
    RULE_expressionStatement = 16
    RULE_ifElseStatement = 17
    RULE_ifStatement = 18
    RULE_elseIfStatement = 19
    RULE_elseStatement = 20
    RULE_iterationStatement = 21
    RULE_assignmentStatement = 22
    RULE_jumpStatement = 23
    RULE_unaryStatement = 24
    RULE_identifierList = 25
    RULE_expression = 26
    RULE_primaryExpression = 27
    RULE_conditionalExpression = 28
    RULE_assignmentExpression = 29

    ruleNames =  [ "compilationUnit", "translationUnit", "typeSpecifier", 
                   "blockItemList", "blockItem", "value", "externalDeclaration", 
                   "declaration", "functionParameterList", "functionDefinition", 
                   "parameterTypeList", "functionCall", "functionReturn", 
                   "statement", "printfStatement", "compoundStatement", 
                   "expressionStatement", "ifElseStatement", "ifStatement", 
                   "elseIfStatement", "elseStatement", "iterationStatement", 
                   "assignmentStatement", "jumpStatement", "unaryStatement", 
                   "identifierList", "expression", "primaryExpression", 
                   "conditionalExpression", "assignmentExpression" ]

    EOF = Token.EOF
    ConditionalConnectOperator=1
    ConditionalOperator=2
    Coalescing=3
    Bit=4
    Power=5
    IgnoreWildCard=6
    Namespace=7
    ScopeResolution=8
    DoubleQuote=9
    Printf=10
    Break=11
    Case=12
    Char=13
    Const=14
    Continue=15
    Bool=16
    Default=17
    Double=18
    Else=19
    Extern=20
    Float=21
    For=22
    If=23
    Int=24
    Uint32=25
    Int32=26
    Long=27
    Return=28
    Short=29
    Signed=30
    Sizeof=31
    Static=32
    Switch=33
    Typedef=34
    Unsigned=35
    Void=36
    While=37
    LeftParen=38
    RightParen=39
    LeftBracket=40
    RightBracket=41
    LeftBrace=42
    RightBrace=43
    Less=44
    LessEqual=45
    Greater=46
    GreaterEqual=47
    LeftShift=48
    RightShift=49
    Plus=50
    PlusPlus=51
    Minus=52
    MinusMinus=53
    Star=54
    Div=55
    Mod=56
    And=57
    Or=58
    Negate=59
    Caret=60
    Question=61
    Colon=62
    Semi=63
    Comma=64
    Assign=65
    StarAssign=66
    DivAssign=67
    ModAssign=68
    PlusAssign=69
    MinusAssign=70
    LeftShiftAssign=71
    RightShiftAssign=72
    AndAssign=73
    XorAssign=74
    OrAssign=75
    NegateAssign=76
    Arrow=77
    Dot=78
    Ellipsis=79
    IntegerConstant=80
    FloatConstant=81
    AndAnd=82
    OrOr=83
    Not=84
    Equal=85
    NotEqual=86
    Identifier=87
    String=88
    Whitespace=89
    Newline=90
    BlockComment=91
    LineComment=92

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.2")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class CompilationUnitContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def EOF(self):
            return self.getToken(CmmParser.EOF, 0)

        def translationUnit(self):
            return self.getTypedRuleContext(CmmParser.TranslationUnitContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_compilationUnit

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterCompilationUnit" ):
                listener.enterCompilationUnit(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitCompilationUnit" ):
                listener.exitCompilationUnit(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitCompilationUnit" ):
                return visitor.visitCompilationUnit(self)
            else:
                return visitor.visitChildren(self)




    def compilationUnit(self):

        localctx = CmmParser.CompilationUnitContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_compilationUnit)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 61
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & -9223371968116088832) != 0):
                self.state = 60
                self.translationUnit(0)


            self.state = 63
            self.match(CmmParser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class TranslationUnitContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def externalDeclaration(self):
            return self.getTypedRuleContext(CmmParser.ExternalDeclarationContext,0)


        def translationUnit(self):
            return self.getTypedRuleContext(CmmParser.TranslationUnitContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_translationUnit

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTranslationUnit" ):
                listener.enterTranslationUnit(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTranslationUnit" ):
                listener.exitTranslationUnit(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitTranslationUnit" ):
                return visitor.visitTranslationUnit(self)
            else:
                return visitor.visitChildren(self)



    def translationUnit(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = CmmParser.TranslationUnitContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 2
        self.enterRecursionRule(localctx, 2, self.RULE_translationUnit, _p)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 66
            self.externalDeclaration()
            self._ctx.stop = self._input.LT(-1)
            self.state = 72
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,1,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = CmmParser.TranslationUnitContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_translationUnit)
                    self.state = 68
                    if not self.precpred(self._ctx, 1):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                    self.state = 69
                    self.externalDeclaration() 
                self.state = 74
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,1,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class TypeSpecifierContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Void(self):
            return self.getToken(CmmParser.Void, 0)

        def Bool(self):
            return self.getToken(CmmParser.Bool, 0)

        def Char(self):
            return self.getToken(CmmParser.Char, 0)

        def Int(self):
            return self.getToken(CmmParser.Int, 0)

        def Float(self):
            return self.getToken(CmmParser.Float, 0)

        def Double(self):
            return self.getToken(CmmParser.Double, 0)

        def getRuleIndex(self):
            return CmmParser.RULE_typeSpecifier

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTypeSpecifier" ):
                listener.enterTypeSpecifier(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTypeSpecifier" ):
                listener.exitTypeSpecifier(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitTypeSpecifier" ):
                return visitor.visitTypeSpecifier(self)
            else:
                return visitor.visitChildren(self)




    def typeSpecifier(self):

        localctx = CmmParser.TypeSpecifierContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_typeSpecifier)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 75
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 68738686976) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class BlockItemListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def blockItem(self):
            return self.getTypedRuleContext(CmmParser.BlockItemContext,0)


        def blockItemList(self):
            return self.getTypedRuleContext(CmmParser.BlockItemListContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_blockItemList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBlockItemList" ):
                listener.enterBlockItemList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBlockItemList" ):
                listener.exitBlockItemList(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBlockItemList" ):
                return visitor.visitBlockItemList(self)
            else:
                return visitor.visitChildren(self)



    def blockItemList(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = CmmParser.BlockItemListContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 6
        self.enterRecursionRule(localctx, 6, self.RULE_blockItemList, _p)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 78
            self.blockItem()
            self._ctx.stop = self._input.LT(-1)
            self.state = 84
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,2,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = CmmParser.BlockItemListContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_blockItemList)
                    self.state = 80
                    if not self.precpred(self._ctx, 1):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                    self.state = 81
                    self.blockItem() 
                self.state = 86
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,2,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class BlockItemContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def statement(self):
            return self.getTypedRuleContext(CmmParser.StatementContext,0)


        def declaration(self):
            return self.getTypedRuleContext(CmmParser.DeclarationContext,0)


        def functionCall(self):
            return self.getTypedRuleContext(CmmParser.FunctionCallContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_blockItem

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBlockItem" ):
                listener.enterBlockItem(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBlockItem" ):
                listener.exitBlockItem(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBlockItem" ):
                return visitor.visitBlockItem(self)
            else:
                return visitor.visitChildren(self)




    def blockItem(self):

        localctx = CmmParser.BlockItemContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_blockItem)
        try:
            self.state = 90
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,3,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 87
                self.statement()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 88
                self.declaration()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 89
                self.functionCall()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ValueContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def IntegerConstant(self):
            return self.getToken(CmmParser.IntegerConstant, 0)

        def FloatConstant(self):
            return self.getToken(CmmParser.FloatConstant, 0)

        def getRuleIndex(self):
            return CmmParser.RULE_value

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterValue" ):
                listener.enterValue(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitValue" ):
                listener.exitValue(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitValue" ):
                return visitor.visitValue(self)
            else:
                return visitor.visitChildren(self)




    def value(self):

        localctx = CmmParser.ValueContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_value)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 92
            _la = self._input.LA(1)
            if not(((((_la - 80)) & ~0x3f) == 0 and ((1 << (_la - 80)) & 131) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExternalDeclarationContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def functionDefinition(self):
            return self.getTypedRuleContext(CmmParser.FunctionDefinitionContext,0)


        def declaration(self):
            return self.getTypedRuleContext(CmmParser.DeclarationContext,0)


        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def getRuleIndex(self):
            return CmmParser.RULE_externalDeclaration

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExternalDeclaration" ):
                listener.enterExternalDeclaration(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExternalDeclaration" ):
                listener.exitExternalDeclaration(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitExternalDeclaration" ):
                return visitor.visitExternalDeclaration(self)
            else:
                return visitor.visitChildren(self)




    def externalDeclaration(self):

        localctx = CmmParser.ExternalDeclarationContext(self, self._ctx, self.state)
        self.enterRule(localctx, 12, self.RULE_externalDeclaration)
        try:
            self.state = 97
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,4,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 94
                self.functionDefinition()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 95
                self.declaration()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 96
                self.match(CmmParser.Semi)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class DeclarationContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.type_ = None
            self.type_letter = 0

        def typeSpecifier(self):
            return self.getTypedRuleContext(CmmParser.TypeSpecifierContext,0)


        def Identifier(self, i:int=None):
            if i is None:
                return self.getTokens(CmmParser.Identifier)
            else:
                return self.getToken(CmmParser.Identifier, i)

        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def Comma(self, i:int=None):
            if i is None:
                return self.getTokens(CmmParser.Comma)
            else:
                return self.getToken(CmmParser.Comma, i)

        def assignmentExpression(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.AssignmentExpressionContext)
            else:
                return self.getTypedRuleContext(CmmParser.AssignmentExpressionContext,i)


        def getRuleIndex(self):
            return CmmParser.RULE_declaration

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDeclaration" ):
                listener.enterDeclaration(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDeclaration" ):
                listener.exitDeclaration(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitDeclaration" ):
                return visitor.visitDeclaration(self)
            else:
                return visitor.visitChildren(self)




    def declaration(self):

        localctx = CmmParser.DeclarationContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.state = 121
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,7,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 99
                self.typeSpecifier()
                self.state = 100
                self.match(CmmParser.Identifier)
                self.state = 105
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while _la==64:
                    self.state = 101
                    self.match(CmmParser.Comma)
                    self.state = 102
                    self.match(CmmParser.Identifier)
                    self.state = 107
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)

                self.state = 108
                self.match(CmmParser.Semi)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 110
                self.typeSpecifier()
                self.state = 111
                self.assignmentExpression()
                self.state = 116
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while _la==64:
                    self.state = 112
                    self.match(CmmParser.Comma)
                    self.state = 113
                    self.assignmentExpression()
                    self.state = 118
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)

                self.state = 119
                self.match(CmmParser.Semi)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FunctionParameterListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.type_ = None
            self.type_letter = 0

        def typeSpecifier(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.TypeSpecifierContext)
            else:
                return self.getTypedRuleContext(CmmParser.TypeSpecifierContext,i)


        def Identifier(self, i:int=None):
            if i is None:
                return self.getTokens(CmmParser.Identifier)
            else:
                return self.getToken(CmmParser.Identifier, i)

        def Comma(self, i:int=None):
            if i is None:
                return self.getTokens(CmmParser.Comma)
            else:
                return self.getToken(CmmParser.Comma, i)

        def getRuleIndex(self):
            return CmmParser.RULE_functionParameterList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunctionParameterList" ):
                listener.enterFunctionParameterList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunctionParameterList" ):
                listener.exitFunctionParameterList(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunctionParameterList" ):
                return visitor.visitFunctionParameterList(self)
            else:
                return visitor.visitChildren(self)




    def functionParameterList(self):

        localctx = CmmParser.FunctionParameterListContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_functionParameterList)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 123
            self.typeSpecifier()
            self.state = 124
            self.match(CmmParser.Identifier)
            self.state = 131
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==64:
                self.state = 125
                self.match(CmmParser.Comma)
                self.state = 126
                self.typeSpecifier()
                self.state = 127
                self.match(CmmParser.Identifier)
                self.state = 133
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FunctionDefinitionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.function_header = None
            self.args = None
            self.return_type = None
            self.num_local_vars = 0
            self.stack_size = 0

        def typeSpecifier(self):
            return self.getTypedRuleContext(CmmParser.TypeSpecifierContext,0)


        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def parameterTypeList(self):
            return self.getTypedRuleContext(CmmParser.ParameterTypeListContext,0)


        def compoundStatement(self):
            return self.getTypedRuleContext(CmmParser.CompoundStatementContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_functionDefinition

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunctionDefinition" ):
                listener.enterFunctionDefinition(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunctionDefinition" ):
                listener.exitFunctionDefinition(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunctionDefinition" ):
                return visitor.visitFunctionDefinition(self)
            else:
                return visitor.visitChildren(self)




    def functionDefinition(self):

        localctx = CmmParser.FunctionDefinitionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 18, self.RULE_functionDefinition)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 134
            self.typeSpecifier()
            self.state = 135
            self.match(CmmParser.Identifier)
            self.state = 136
            self.parameterTypeList()
            self.state = 137
            self.compoundStatement()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ParameterTypeListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def functionParameterList(self):
            return self.getTypedRuleContext(CmmParser.FunctionParameterListContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_parameterTypeList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterParameterTypeList" ):
                listener.enterParameterTypeList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitParameterTypeList" ):
                listener.exitParameterTypeList(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitParameterTypeList" ):
                return visitor.visitParameterTypeList(self)
            else:
                return visitor.visitChildren(self)




    def parameterTypeList(self):

        localctx = CmmParser.ParameterTypeListContext(self, self._ctx, self.state)
        self.enterRule(localctx, 20, self.RULE_parameterTypeList)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 139
            self.match(CmmParser.LeftParen)
            self.state = 141
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & 68738686976) != 0):
                self.state = 140
                self.functionParameterList()


            self.state = 143
            self.match(CmmParser.RightParen)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FunctionCallContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def identifierList(self):
            return self.getTypedRuleContext(CmmParser.IdentifierListContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_functionCall

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunctionCall" ):
                listener.enterFunctionCall(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunctionCall" ):
                listener.exitFunctionCall(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunctionCall" ):
                return visitor.visitFunctionCall(self)
            else:
                return visitor.visitChildren(self)




    def functionCall(self):

        localctx = CmmParser.FunctionCallContext(self, self._ctx, self.state)
        self.enterRule(localctx, 22, self.RULE_functionCall)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 145
            self.match(CmmParser.Identifier)
            self.state = 146
            self.match(CmmParser.LeftParen)
            self.state = 148
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 38)) & ~0x3f) == 0 and ((1 << (_la - 38)) & 576144092954625) != 0):
                self.state = 147
                self.identifierList()


            self.state = 150
            self.match(CmmParser.RightParen)
            self.state = 151
            self.match(CmmParser.Semi)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FunctionReturnContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def identifierList(self):
            return self.getTypedRuleContext(CmmParser.IdentifierListContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_functionReturn

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunctionReturn" ):
                listener.enterFunctionReturn(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunctionReturn" ):
                listener.exitFunctionReturn(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunctionReturn" ):
                return visitor.visitFunctionReturn(self)
            else:
                return visitor.visitChildren(self)




    def functionReturn(self):

        localctx = CmmParser.FunctionReturnContext(self, self._ctx, self.state)
        self.enterRule(localctx, 24, self.RULE_functionReturn)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 153
            self.match(CmmParser.Identifier)
            self.state = 154
            self.match(CmmParser.LeftParen)
            self.state = 156
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 38)) & ~0x3f) == 0 and ((1 << (_la - 38)) & 576144092954625) != 0):
                self.state = 155
                self.identifierList()


            self.state = 158
            self.match(CmmParser.RightParen)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class StatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def compoundStatement(self):
            return self.getTypedRuleContext(CmmParser.CompoundStatementContext,0)


        def expressionStatement(self):
            return self.getTypedRuleContext(CmmParser.ExpressionStatementContext,0)


        def ifElseStatement(self):
            return self.getTypedRuleContext(CmmParser.IfElseStatementContext,0)


        def iterationStatement(self):
            return self.getTypedRuleContext(CmmParser.IterationStatementContext,0)


        def assignmentStatement(self):
            return self.getTypedRuleContext(CmmParser.AssignmentStatementContext,0)


        def jumpStatement(self):
            return self.getTypedRuleContext(CmmParser.JumpStatementContext,0)


        def unaryStatement(self):
            return self.getTypedRuleContext(CmmParser.UnaryStatementContext,0)


        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def printfStatement(self):
            return self.getTypedRuleContext(CmmParser.PrintfStatementContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_statement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStatement" ):
                listener.enterStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStatement" ):
                listener.exitStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitStatement" ):
                return visitor.visitStatement(self)
            else:
                return visitor.visitChildren(self)




    def statement(self):

        localctx = CmmParser.StatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 26, self.RULE_statement)
        try:
            self.state = 170
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,12,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 160
                self.compoundStatement()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 161
                self.expressionStatement()
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 162
                self.ifElseStatement()
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 163
                self.iterationStatement()
                pass

            elif la_ == 5:
                self.enterOuterAlt(localctx, 5)
                self.state = 164
                self.assignmentStatement()
                pass

            elif la_ == 6:
                self.enterOuterAlt(localctx, 6)
                self.state = 165
                self.jumpStatement()
                pass

            elif la_ == 7:
                self.enterOuterAlt(localctx, 7)
                self.state = 166
                self.unaryStatement()
                self.state = 167
                self.match(CmmParser.Semi)
                pass

            elif la_ == 8:
                self.enterOuterAlt(localctx, 8)
                self.state = 169
                self.printfStatement()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class PrintfStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.format_string = None
            self.args = None

        def Printf(self):
            return self.getToken(CmmParser.Printf, 0)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def String(self):
            return self.getToken(CmmParser.String, 0)

        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def Comma(self, i:int=None):
            if i is None:
                return self.getTokens(CmmParser.Comma)
            else:
                return self.getToken(CmmParser.Comma, i)

        def value(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ValueContext)
            else:
                return self.getTypedRuleContext(CmmParser.ValueContext,i)


        def getRuleIndex(self):
            return CmmParser.RULE_printfStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrintfStatement" ):
                listener.enterPrintfStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrintfStatement" ):
                listener.exitPrintfStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrintfStatement" ):
                return visitor.visitPrintfStatement(self)
            else:
                return visitor.visitChildren(self)




    def printfStatement(self):

        localctx = CmmParser.PrintfStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 28, self.RULE_printfStatement)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 172
            self.match(CmmParser.Printf)
            self.state = 173
            self.match(CmmParser.LeftParen)
            self.state = 174
            self.match(CmmParser.String)
            self.state = 179
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==64:
                self.state = 175
                self.match(CmmParser.Comma)
                self.state = 176
                self.value()
                self.state = 181
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 182
            self.match(CmmParser.RightParen)
            self.state = 183
            self.match(CmmParser.Semi)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class CompoundStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.scope_name = "Anonymous"

        def LeftBrace(self):
            return self.getToken(CmmParser.LeftBrace, 0)

        def RightBrace(self):
            return self.getToken(CmmParser.RightBrace, 0)

        def blockItemList(self):
            return self.getTypedRuleContext(CmmParser.BlockItemListContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_compoundStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterCompoundStatement" ):
                listener.enterCompoundStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitCompoundStatement" ):
                listener.exitCompoundStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitCompoundStatement" ):
                return visitor.visitCompoundStatement(self)
            else:
                return visitor.visitChildren(self)




    def compoundStatement(self):

        localctx = CmmParser.CompoundStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 30, self.RULE_compoundStatement)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 185
            self.match(CmmParser.LeftBrace)
            self.state = 187
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & -9212108158407465984) != 0) or ((((_la - 80)) & ~0x3f) == 0 and ((1 << (_la - 80)) & 131) != 0):
                self.state = 186
                self.blockItemList(0)


            self.state = 189
            self.match(CmmParser.RightBrace)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExpressionStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def expression(self):
            return self.getTypedRuleContext(CmmParser.ExpressionContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_expressionStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpressionStatement" ):
                listener.enterExpressionStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpressionStatement" ):
                listener.exitExpressionStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitExpressionStatement" ):
                return visitor.visitExpressionStatement(self)
            else:
                return visitor.visitChildren(self)




    def expressionStatement(self):

        localctx = CmmParser.ExpressionStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 32, self.RULE_expressionStatement)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 192
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 38)) & ~0x3f) == 0 and ((1 << (_la - 38)) & 576144092954625) != 0):
                self.state = 191
                self.expression(0)


            self.state = 194
            self.match(CmmParser.Semi)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class IfElseStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def ifStatement(self):
            return self.getTypedRuleContext(CmmParser.IfStatementContext,0)


        def elseIfStatement(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ElseIfStatementContext)
            else:
                return self.getTypedRuleContext(CmmParser.ElseIfStatementContext,i)


        def elseStatement(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ElseStatementContext)
            else:
                return self.getTypedRuleContext(CmmParser.ElseStatementContext,i)


        def getRuleIndex(self):
            return CmmParser.RULE_ifElseStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIfElseStatement" ):
                listener.enterIfElseStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIfElseStatement" ):
                listener.exitIfElseStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitIfElseStatement" ):
                return visitor.visitIfElseStatement(self)
            else:
                return visitor.visitChildren(self)




    def ifElseStatement(self):

        localctx = CmmParser.IfElseStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 34, self.RULE_ifElseStatement)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 196
            self.ifStatement()
            self.state = 200
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,16,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 197
                    self.elseIfStatement() 
                self.state = 202
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,16,self._ctx)

            self.state = 206
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,17,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 203
                    self.elseStatement() 
                self.state = 208
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,17,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class IfStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def If(self):
            return self.getToken(CmmParser.If, 0)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def conditionalExpression(self):
            return self.getTypedRuleContext(CmmParser.ConditionalExpressionContext,0)


        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def statement(self):
            return self.getTypedRuleContext(CmmParser.StatementContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_ifStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIfStatement" ):
                listener.enterIfStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIfStatement" ):
                listener.exitIfStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitIfStatement" ):
                return visitor.visitIfStatement(self)
            else:
                return visitor.visitChildren(self)




    def ifStatement(self):

        localctx = CmmParser.IfStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 36, self.RULE_ifStatement)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 209
            self.match(CmmParser.If)
            self.state = 210
            self.match(CmmParser.LeftParen)
            self.state = 211
            self.conditionalExpression(0)
            self.state = 212
            self.match(CmmParser.RightParen)
            self.state = 213
            self.statement()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ElseIfStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.id_ = 0

        def Else(self):
            return self.getToken(CmmParser.Else, 0)

        def If(self):
            return self.getToken(CmmParser.If, 0)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def conditionalExpression(self):
            return self.getTypedRuleContext(CmmParser.ConditionalExpressionContext,0)


        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def statement(self):
            return self.getTypedRuleContext(CmmParser.StatementContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_elseIfStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterElseIfStatement" ):
                listener.enterElseIfStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitElseIfStatement" ):
                listener.exitElseIfStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitElseIfStatement" ):
                return visitor.visitElseIfStatement(self)
            else:
                return visitor.visitChildren(self)




    def elseIfStatement(self):

        localctx = CmmParser.ElseIfStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 38, self.RULE_elseIfStatement)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 215
            self.match(CmmParser.Else)
            self.state = 216
            self.match(CmmParser.If)
            self.state = 217
            self.match(CmmParser.LeftParen)
            self.state = 218
            self.conditionalExpression(0)
            self.state = 219
            self.match(CmmParser.RightParen)
            self.state = 220
            self.statement()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ElseStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Else(self):
            return self.getToken(CmmParser.Else, 0)

        def statement(self):
            return self.getTypedRuleContext(CmmParser.StatementContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_elseStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterElseStatement" ):
                listener.enterElseStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitElseStatement" ):
                listener.exitElseStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitElseStatement" ):
                return visitor.visitElseStatement(self)
            else:
                return visitor.visitChildren(self)




    def elseStatement(self):

        localctx = CmmParser.ElseStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 40, self.RULE_elseStatement)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 222
            self.match(CmmParser.Else)
            self.state = 223
            self.statement()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class IterationStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def While(self):
            return self.getToken(CmmParser.While, 0)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def conditionalExpression(self):
            return self.getTypedRuleContext(CmmParser.ConditionalExpressionContext,0)


        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def statement(self):
            return self.getTypedRuleContext(CmmParser.StatementContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_iterationStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIterationStatement" ):
                listener.enterIterationStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIterationStatement" ):
                listener.exitIterationStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitIterationStatement" ):
                return visitor.visitIterationStatement(self)
            else:
                return visitor.visitChildren(self)




    def iterationStatement(self):

        localctx = CmmParser.IterationStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 42, self.RULE_iterationStatement)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 225
            self.match(CmmParser.While)
            self.state = 226
            self.match(CmmParser.LeftParen)
            self.state = 227
            self.conditionalExpression(0)
            self.state = 228
            self.match(CmmParser.RightParen)
            self.state = 229
            self.statement()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class AssignmentStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def assignmentExpression(self):
            return self.getTypedRuleContext(CmmParser.AssignmentExpressionContext,0)


        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def getRuleIndex(self):
            return CmmParser.RULE_assignmentStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAssignmentStatement" ):
                listener.enterAssignmentStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAssignmentStatement" ):
                listener.exitAssignmentStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAssignmentStatement" ):
                return visitor.visitAssignmentStatement(self)
            else:
                return visitor.visitChildren(self)




    def assignmentStatement(self):

        localctx = CmmParser.AssignmentStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 44, self.RULE_assignmentStatement)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 231
            self.assignmentExpression()
            self.state = 232
            self.match(CmmParser.Semi)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class JumpStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Return(self):
            return self.getToken(CmmParser.Return, 0)

        def Semi(self):
            return self.getToken(CmmParser.Semi, 0)

        def expression(self):
            return self.getTypedRuleContext(CmmParser.ExpressionContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_jumpStatement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterJumpStatement" ):
                listener.enterJumpStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitJumpStatement" ):
                listener.exitJumpStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitJumpStatement" ):
                return visitor.visitJumpStatement(self)
            else:
                return visitor.visitChildren(self)




    def jumpStatement(self):

        localctx = CmmParser.JumpStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 46, self.RULE_jumpStatement)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 234
            self.match(CmmParser.Return)
            self.state = 236
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 38)) & ~0x3f) == 0 and ((1 << (_la - 38)) & 576144092954625) != 0):
                self.state = 235
                self.expression(0)


            self.state = 238
            self.match(CmmParser.Semi)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class UnaryStatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.type_ = None
            self.type_letter = '?'


        def getRuleIndex(self):
            return CmmParser.RULE_unaryStatement

     
        def copyFrom(self, ctx:ParserRuleContext):
            super().copyFrom(ctx)
            self.type_ = ctx.type_
            self.type_letter = ctx.type_letter



    class UnaryDecrementStatementContext(UnaryStatementContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.UnaryStatementContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def MinusMinus(self):
            return self.getToken(CmmParser.MinusMinus, 0)
        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterUnaryDecrementStatement" ):
                listener.enterUnaryDecrementStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitUnaryDecrementStatement" ):
                listener.exitUnaryDecrementStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitUnaryDecrementStatement" ):
                return visitor.visitUnaryDecrementStatement(self)
            else:
                return visitor.visitChildren(self)


    class UnaryIncrementStatementContext(UnaryStatementContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.UnaryStatementContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def PlusPlus(self):
            return self.getToken(CmmParser.PlusPlus, 0)
        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterUnaryIncrementStatement" ):
                listener.enterUnaryIncrementStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitUnaryIncrementStatement" ):
                listener.exitUnaryIncrementStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitUnaryIncrementStatement" ):
                return visitor.visitUnaryIncrementStatement(self)
            else:
                return visitor.visitChildren(self)


    class UnarySquareStatementContext(UnaryStatementContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.UnaryStatementContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)
        def Power(self):
            return self.getToken(CmmParser.Power, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterUnarySquareStatement" ):
                listener.enterUnarySquareStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitUnarySquareStatement" ):
                listener.exitUnarySquareStatement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitUnarySquareStatement" ):
                return visitor.visitUnarySquareStatement(self)
            else:
                return visitor.visitChildren(self)



    def unaryStatement(self):

        localctx = CmmParser.UnaryStatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 48, self.RULE_unaryStatement)
        try:
            self.state = 250
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,19,self._ctx)
            if la_ == 1:
                localctx = CmmParser.UnaryIncrementStatementContext(self, localctx)
                self.enterOuterAlt(localctx, 1)
                self.state = 240
                self.match(CmmParser.PlusPlus)
                self.state = 241
                self.match(CmmParser.Identifier)
                pass

            elif la_ == 2:
                localctx = CmmParser.UnaryDecrementStatementContext(self, localctx)
                self.enterOuterAlt(localctx, 2)
                self.state = 242
                self.match(CmmParser.MinusMinus)
                self.state = 243
                self.match(CmmParser.Identifier)
                pass

            elif la_ == 3:
                localctx = CmmParser.UnaryIncrementStatementContext(self, localctx)
                self.enterOuterAlt(localctx, 3)
                self.state = 244
                self.match(CmmParser.Identifier)
                self.state = 245
                self.match(CmmParser.PlusPlus)
                pass

            elif la_ == 4:
                localctx = CmmParser.UnaryDecrementStatementContext(self, localctx)
                self.enterOuterAlt(localctx, 4)
                self.state = 246
                self.match(CmmParser.Identifier)
                self.state = 247
                self.match(CmmParser.MinusMinus)
                pass

            elif la_ == 5:
                localctx = CmmParser.UnarySquareStatementContext(self, localctx)
                self.enterOuterAlt(localctx, 5)
                self.state = 248
                self.match(CmmParser.Identifier)
                self.state = 249
                self.match(CmmParser.Power)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class IdentifierListContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expression(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ExpressionContext)
            else:
                return self.getTypedRuleContext(CmmParser.ExpressionContext,i)


        def Comma(self, i:int=None):
            if i is None:
                return self.getTokens(CmmParser.Comma)
            else:
                return self.getToken(CmmParser.Comma, i)

        def getRuleIndex(self):
            return CmmParser.RULE_identifierList

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIdentifierList" ):
                listener.enterIdentifierList(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIdentifierList" ):
                listener.exitIdentifierList(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitIdentifierList" ):
                return visitor.visitIdentifierList(self)
            else:
                return visitor.visitChildren(self)




    def identifierList(self):

        localctx = CmmParser.IdentifierListContext(self, self._ctx, self.state)
        self.enterRule(localctx, 50, self.RULE_identifierList)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 252
            self.expression(0)
            self.state = 257
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==64:
                self.state = 253
                self.match(CmmParser.Comma)
                self.state = 254
                self.expression(0)
                self.state = 259
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExpressionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.type_ = None
            self.expr_operator = None
            self.type_letter = '?'


        def getRuleIndex(self):
            return CmmParser.RULE_expression

     
        def copyFrom(self, ctx:ParserRuleContext):
            super().copyFrom(ctx)
            self.type_ = ctx.type_
            self.expr_operator = ctx.expr_operator
            self.type_letter = ctx.type_letter


    class BitExprContext(ExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ExpressionContext
            super().__init__(parser)
            self.opr = None # Token
            self.copyFrom(ctx)

        def expression(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ExpressionContext)
            else:
                return self.getTypedRuleContext(CmmParser.ExpressionContext,i)

        def LeftShift(self):
            return self.getToken(CmmParser.LeftShift, 0)
        def RightShift(self):
            return self.getToken(CmmParser.RightShift, 0)
        def And(self):
            return self.getToken(CmmParser.And, 0)
        def Or(self):
            return self.getToken(CmmParser.Or, 0)
        def Negate(self):
            return self.getToken(CmmParser.Negate, 0)
        def Caret(self):
            return self.getToken(CmmParser.Caret, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBitExpr" ):
                listener.enterBitExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBitExpr" ):
                listener.exitBitExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBitExpr" ):
                return visitor.visitBitExpr(self)
            else:
                return visitor.visitChildren(self)


    class PrimExprContext(ExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ExpressionContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def primaryExpression(self):
            return self.getTypedRuleContext(CmmParser.PrimaryExpressionContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrimExpr" ):
                listener.enterPrimExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrimExpr" ):
                listener.exitPrimExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrimExpr" ):
                return visitor.visitPrimExpr(self)
            else:
                return visitor.visitChildren(self)


    class MulDivExprContext(ExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ExpressionContext
            super().__init__(parser)
            self.opr = None # Token
            self.copyFrom(ctx)

        def expression(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ExpressionContext)
            else:
                return self.getTypedRuleContext(CmmParser.ExpressionContext,i)

        def Star(self):
            return self.getToken(CmmParser.Star, 0)
        def Div(self):
            return self.getToken(CmmParser.Div, 0)
        def Mod(self):
            return self.getToken(CmmParser.Mod, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterMulDivExpr" ):
                listener.enterMulDivExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitMulDivExpr" ):
                listener.exitMulDivExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitMulDivExpr" ):
                return visitor.visitMulDivExpr(self)
            else:
                return visitor.visitChildren(self)


    class AddminExprContext(ExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ExpressionContext
            super().__init__(parser)
            self.opr = None # Token
            self.copyFrom(ctx)

        def expression(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ExpressionContext)
            else:
                return self.getTypedRuleContext(CmmParser.ExpressionContext,i)

        def Plus(self):
            return self.getToken(CmmParser.Plus, 0)
        def Minus(self):
            return self.getToken(CmmParser.Minus, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAddminExpr" ):
                listener.enterAddminExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAddminExpr" ):
                listener.exitAddminExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAddminExpr" ):
                return visitor.visitAddminExpr(self)
            else:
                return visitor.visitChildren(self)



    def expression(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = CmmParser.ExpressionContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 52
        self.enterRecursionRule(localctx, 52, self.RULE_expression, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            localctx = CmmParser.PrimExprContext(self, localctx)
            self._ctx = localctx
            _prevctx = localctx

            self.state = 261
            self.primaryExpression()
            self._ctx.stop = self._input.LT(-1)
            self.state = 274
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,22,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 272
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,21,self._ctx)
                    if la_ == 1:
                        localctx = CmmParser.MulDivExprContext(self, CmmParser.ExpressionContext(self, _parentctx, _parentState))
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expression)
                        self.state = 263
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 264
                        localctx.opr = self._input.LT(1)
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 126100789566373888) != 0)):
                            localctx.opr = self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 265
                        self.expression(5)
                        pass

                    elif la_ == 2:
                        localctx = CmmParser.AddminExprContext(self, CmmParser.ExpressionContext(self, _parentctx, _parentState))
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expression)
                        self.state = 266
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 267
                        localctx.opr = self._input.LT(1)
                        _la = self._input.LA(1)
                        if not(_la==50 or _la==52):
                            localctx.opr = self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 268
                        self.expression(4)
                        pass

                    elif la_ == 3:
                        localctx = CmmParser.BitExprContext(self, CmmParser.ExpressionContext(self, _parentctx, _parentState))
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expression)
                        self.state = 269
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 270
                        localctx.opr = self._input.LT(1)
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 2162572246067970048) != 0)):
                            localctx.opr = self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 271
                        self.expression(3)
                        pass

             
                self.state = 276
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,22,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class PrimaryExpressionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.type_letter = '?'
            self.current_nesting_level = 0

        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def IntegerConstant(self):
            return self.getToken(CmmParser.IntegerConstant, 0)

        def FloatConstant(self):
            return self.getToken(CmmParser.FloatConstant, 0)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)

        def expression(self):
            return self.getTypedRuleContext(CmmParser.ExpressionContext,0)


        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def getRuleIndex(self):
            return CmmParser.RULE_primaryExpression

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrimaryExpression" ):
                listener.enterPrimaryExpression(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrimaryExpression" ):
                listener.exitPrimaryExpression(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrimaryExpression" ):
                return visitor.visitPrimaryExpression(self)
            else:
                return visitor.visitChildren(self)




    def primaryExpression(self):

        localctx = CmmParser.PrimaryExpressionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 54, self.RULE_primaryExpression)
        try:
            self.state = 284
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [87]:
                self.enterOuterAlt(localctx, 1)
                self.state = 277
                self.match(CmmParser.Identifier)
                pass
            elif token in [80]:
                self.enterOuterAlt(localctx, 2)
                self.state = 278
                self.match(CmmParser.IntegerConstant)
                pass
            elif token in [81]:
                self.enterOuterAlt(localctx, 3)
                self.state = 279
                self.match(CmmParser.FloatConstant)
                pass
            elif token in [38]:
                self.enterOuterAlt(localctx, 4)
                self.state = 280
                self.match(CmmParser.LeftParen)
                self.state = 281
                self.expression(0)
                self.state = 282
                self.match(CmmParser.RightParen)
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ConditionalExpressionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.iteration_name = None
            self.opr = None
            self.opcode = None


        def getRuleIndex(self):
            return CmmParser.RULE_conditionalExpression

     
        def copyFrom(self, ctx:ParserRuleContext):
            super().copyFrom(ctx)
            self.iteration_name = ctx.iteration_name
            self.opr = ctx.opr
            self.opcode = ctx.opcode


    class BasicConditionalExprContext(ConditionalExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ConditionalExpressionContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def expression(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ExpressionContext)
            else:
                return self.getTypedRuleContext(CmmParser.ExpressionContext,i)

        def ConditionalOperator(self):
            return self.getToken(CmmParser.ConditionalOperator, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBasicConditionalExpr" ):
                listener.enterBasicConditionalExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBasicConditionalExpr" ):
                listener.exitBasicConditionalExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBasicConditionalExpr" ):
                return visitor.visitBasicConditionalExpr(self)
            else:
                return visitor.visitChildren(self)


    class NegatedConditionalExprContext(ConditionalExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ConditionalExpressionContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def Not(self):
            return self.getToken(CmmParser.Not, 0)
        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)
        def conditionalExpression(self):
            return self.getTypedRuleContext(CmmParser.ConditionalExpressionContext,0)

        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterNegatedConditionalExpr" ):
                listener.enterNegatedConditionalExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitNegatedConditionalExpr" ):
                listener.exitNegatedConditionalExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitNegatedConditionalExpr" ):
                return visitor.visitNegatedConditionalExpr(self)
            else:
                return visitor.visitChildren(self)


    class ConnectedConditionalExprContext(ConditionalExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ConditionalExpressionContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def conditionalExpression(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(CmmParser.ConditionalExpressionContext)
            else:
                return self.getTypedRuleContext(CmmParser.ConditionalExpressionContext,i)

        def ConditionalConnectOperator(self):
            return self.getToken(CmmParser.ConditionalConnectOperator, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterConnectedConditionalExpr" ):
                listener.enterConnectedConditionalExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitConnectedConditionalExpr" ):
                listener.exitConnectedConditionalExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitConnectedConditionalExpr" ):
                return visitor.visitConnectedConditionalExpr(self)
            else:
                return visitor.visitChildren(self)


    class ParenthesizedConditionalExprContext(ConditionalExpressionContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a CmmParser.ConditionalExpressionContext
            super().__init__(parser)
            self.copyFrom(ctx)

        def LeftParen(self):
            return self.getToken(CmmParser.LeftParen, 0)
        def conditionalExpression(self):
            return self.getTypedRuleContext(CmmParser.ConditionalExpressionContext,0)

        def RightParen(self):
            return self.getToken(CmmParser.RightParen, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterParenthesizedConditionalExpr" ):
                listener.enterParenthesizedConditionalExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitParenthesizedConditionalExpr" ):
                listener.exitParenthesizedConditionalExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitParenthesizedConditionalExpr" ):
                return visitor.visitParenthesizedConditionalExpr(self)
            else:
                return visitor.visitChildren(self)



    def conditionalExpression(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = CmmParser.ConditionalExpressionContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 56
        self.enterRecursionRule(localctx, 56, self.RULE_conditionalExpression, _p)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 300
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,24,self._ctx)
            if la_ == 1:
                localctx = CmmParser.BasicConditionalExprContext(self, localctx)
                self._ctx = localctx
                _prevctx = localctx

                self.state = 287
                self.expression(0)
                self.state = 288
                self.match(CmmParser.ConditionalOperator)
                self.state = 289
                self.expression(0)
                pass

            elif la_ == 2:
                localctx = CmmParser.ParenthesizedConditionalExprContext(self, localctx)
                self._ctx = localctx
                _prevctx = localctx
                self.state = 291
                self.match(CmmParser.LeftParen)
                self.state = 292
                self.conditionalExpression(0)
                self.state = 293
                self.match(CmmParser.RightParen)
                pass

            elif la_ == 3:
                localctx = CmmParser.NegatedConditionalExprContext(self, localctx)
                self._ctx = localctx
                _prevctx = localctx
                self.state = 295
                self.match(CmmParser.Not)
                self.state = 296
                self.match(CmmParser.LeftParen)
                self.state = 297
                self.conditionalExpression(0)
                self.state = 298
                self.match(CmmParser.RightParen)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 307
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,25,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = CmmParser.ConnectedConditionalExprContext(self, CmmParser.ConditionalExpressionContext(self, _parentctx, _parentState))
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_conditionalExpression)
                    self.state = 302
                    if not self.precpred(self._ctx, 3):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                    self.state = 303
                    self.match(CmmParser.ConditionalConnectOperator)
                    self.state = 304
                    self.conditionalExpression(4) 
                self.state = 309
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,25,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class AssignmentExpressionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.type_ = None
            self.type_letter = 0
            self.current_nesting_level = 0

        def Identifier(self):
            return self.getToken(CmmParser.Identifier, 0)

        def Assign(self):
            return self.getToken(CmmParser.Assign, 0)

        def expression(self):
            return self.getTypedRuleContext(CmmParser.ExpressionContext,0)


        def functionReturn(self):
            return self.getTypedRuleContext(CmmParser.FunctionReturnContext,0)


        def getRuleIndex(self):
            return CmmParser.RULE_assignmentExpression

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAssignmentExpression" ):
                listener.enterAssignmentExpression(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAssignmentExpression" ):
                listener.exitAssignmentExpression(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAssignmentExpression" ):
                return visitor.visitAssignmentExpression(self)
            else:
                return visitor.visitChildren(self)




    def assignmentExpression(self):

        localctx = CmmParser.AssignmentExpressionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 58, self.RULE_assignmentExpression)
        try:
            self.state = 316
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,26,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 310
                self.match(CmmParser.Identifier)
                self.state = 311
                self.match(CmmParser.Assign)
                self.state = 312
                self.expression(0)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 313
                self.match(CmmParser.Identifier)
                self.state = 314
                self.match(CmmParser.Assign)
                self.state = 315
                self.functionReturn()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx



    def sempred(self, localctx:RuleContext, ruleIndex:int, predIndex:int):
        if self._predicates == None:
            self._predicates = dict()
        self._predicates[1] = self.translationUnit_sempred
        self._predicates[3] = self.blockItemList_sempred
        self._predicates[26] = self.expression_sempred
        self._predicates[28] = self.conditionalExpression_sempred
        pred = self._predicates.get(ruleIndex, None)
        if pred is None:
            raise Exception("No predicate with index:" + str(ruleIndex))
        else:
            return pred(localctx, predIndex)

    def translationUnit_sempred(self, localctx:TranslationUnitContext, predIndex:int):
            if predIndex == 0:
                return self.precpred(self._ctx, 1)
         

    def blockItemList_sempred(self, localctx:BlockItemListContext, predIndex:int):
            if predIndex == 1:
                return self.precpred(self._ctx, 1)
         

    def expression_sempred(self, localctx:ExpressionContext, predIndex:int):
            if predIndex == 2:
                return self.precpred(self._ctx, 4)
         

            if predIndex == 3:
                return self.precpred(self._ctx, 3)
         

            if predIndex == 4:
                return self.precpred(self._ctx, 2)
         

    def conditionalExpression_sempred(self, localctx:ConditionalExpressionContext, predIndex:int):
            if predIndex == 5:
                return self.precpred(self._ctx, 3)
         




