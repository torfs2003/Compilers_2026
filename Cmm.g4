grammar Cmm;

// ==========================================
// PARSER RULES
// ==========================================

compilationUnit
<<<<<<< HEAD
    : (includeDirective | enumDeclaration | structDeclaration | unionDeclaration | typedefDeclaration | declaration | functionDeclaration | functionDefinition)* EOF
=======
    : (includeDirective | enumDeclaration | structDeclaration | typedefDeclaration
      | declaration | functionDeclaration | functionDefinition | SEMI)* EOF
>>>>>>> 88a73e8e0b9bdae62f18ddd33bbf348af3016d93
    ;

includeDirective
    : INCLUDE HEADER
    ;

functionDefinition
    : typeSpecifier MUL* (MAIN | IDENTIFIER) LPAREN parameterList? RPAREN compoundStatement
    ;

functionDeclaration
    : typeSpecifier MUL* (MAIN | IDENTIFIER) LPAREN parameterList? RPAREN SEMI
    ;

parameterList
    : parameterDeclaration (COMMA parameterDeclaration)*
    ;

parameterDeclaration
    : CONST? typeSpecifier MUL* CONST? IDENTIFIER
    ;

compoundStatement
: LBRACE (declaration | typedefDeclaration | statement)* RBRACE
    ;

initDeclaratorList
    : initDeclarator (COMMA initDeclarator)*
    ;

initDeclarator
    : CONST? MUL* CONST? IDENTIFIER (LBRACKET expression? RBRACKET)* (ASSIGN (expression | array_initializer))?
    ;

declaration
    : CONST? typeSpecifier initDeclaratorList SEMI
    | typeSpecifier LPAREN MUL IDENTIFIER RPAREN LPAREN typeList? RPAREN (ASSIGN expression)? SEMI  // <-- NIEUW: Function Pointer
    ;

typeList
    : typeSpecifier MUL* (COMMA typeSpecifier MUL*)*
    ;

typedefDeclaration
    : TYPEDEF CONST? typeSpecifier CONST? MUL* CONST? IDENTIFIER (LBRACKET INT_LITERAL RBRACKET)* SEMI
    ;

structDeclaration
    : STRUCT IDENTIFIER LBRACE declaration* RBRACE SEMI
    ;

unionDeclaration
    : UNION IDENTIFIER LBRACE declaration* RBRACE SEMI
    ;

statement
    : expression SEMI
    | compoundStatement
    | ifStatement
    | whileStatement
    | forStatement
    | breakStatement
    | continueStatement
    | switchStatement
    | returnStatement
    | SEMI
    ;

typeSpecifier
    : INT 
    | FLOAT 
    | CHAR 
    | VOID 
    | ENUM IDENTIFIER
    | STRUCT IDENTIFIER
    | UNION IDENTIFIER
    | IDENTIFIER
    ;

expression
    : assignment_expression
    ;

// Loops and Conditions
ifStatement
    : IF LPAREN expression RPAREN compoundStatement (ELSE (compoundStatement | ifStatement))?
    ;

whileStatement
    : WHILE LPAREN expression RPAREN compoundStatement
    ;

forStatement
    : FOR LPAREN forInit? SEMI expression? SEMI expression? RPAREN compoundStatement
    ;

forInit
    : declarationFor
    | expression
    ;

declarationFor
    : CONST? typeSpecifier initDeclaratorList
    ;

breakStatement
    : BREAK SEMI
    ;

continueStatement
    : CONTINUE SEMI
    ;

switchStatement
    : SWITCH LPAREN expression RPAREN LBRACE caseBlock* RBRACE
    ;

returnStatement
    : RETURN expression? SEMI
    ;

caseBlock
    : CASE INT_LITERAL COLON (statement | declaration)*
    | DEFAULT COLON (statement | declaration)*
    ;

enumDeclaration
    : ENUM IDENTIFIER LBRACE enumList RBRACE SEMI
    ;

enumList
    : IDENTIFIER (COMMA IDENTIFIER)* COMMA?
    ;


assignment_expression
    : logical_or_expression
    | unary_expression (ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN) assignment_expression
    ;

logical_or_expression
    : logical_and_expression
    | logical_or_expression OR logical_and_expression
    ;

logical_and_expression
    : inclusive_or_expression
    | logical_and_expression AND inclusive_or_expression
    ;

inclusive_or_expression
    : exclusive_or_expression
    | inclusive_or_expression BITOR exclusive_or_expression
    ;

exclusive_or_expression
    : and_expression
    | exclusive_or_expression BITXOR and_expression
    ;

and_expression
    : equality_expression
    | and_expression BITAND equality_expression
    ;

equality_expression
    : relational_expression
    | equality_expression EQ relational_expression
    | equality_expression NEQ relational_expression
    ;

relational_expression
    : shift_expression
    | relational_expression LESS shift_expression
    | relational_expression GREATER shift_expression
    | relational_expression LESSEQ shift_expression
    | relational_expression GREATEREQ shift_expression
    ;

shift_expression
    : additive_expression
    | shift_expression LSHIFT additive_expression
    | shift_expression RSHIFT additive_expression
    ;

additive_expression
    : multiplicative_expression
    | additive_expression PLUS multiplicative_expression
    | additive_expression MINUS multiplicative_expression
    ;

cast_expression
    : LPAREN CONST? typeSpecifier MUL* RPAREN cast_expression
    | unary_expression
    ;

multiplicative_expression
    : cast_expression
    | multiplicative_expression MUL cast_expression
    | multiplicative_expression DIV cast_expression
    | multiplicative_expression MOD cast_expression
    ;

unary_expression
    : postfix_expression
    | PLUS unary_expression
    | MINUS unary_expression
    | NOT unary_expression
    | BITNOT unary_expression
    | MUL cast_expression
    | BITAND cast_expression
    | INC unary_expression
    | DEC unary_expression
    ;

postfix_expression
    : primary_expression
    | postfix_expression LPAREN argumentList? RPAREN
    | postfix_expression INC
    | postfix_expression DEC
    | postfix_expression LBRACKET expression RBRACKET
    | postfix_expression DOT IDENTIFIER
    | postfix_expression ARROW IDENTIFIER
    ;

argumentList
    : expression (COMMA expression)*
    ;

primary_expression
    : INT_LITERAL
    | FLOAT_LITERAL
    | CHAR_LITERAL
    | STRING_LITERAL
    | IDENTIFIER
    | LPAREN expression RPAREN
    ;

array_initializer
    : LBRACE (initializer_list)? RBRACE
    ;

initializer_list
    : initializer_element (COMMA initializer_element)* COMMA?
    ;

initializer_element
    : expression
    | array_initializer
    ;

// ==========================================
// LEXER RULES
// ==========================================

// Preprocessor
INCLUDE : '#include';
HEADER  : '<' [a-zA-Z0-9._]+ '>';

// Keywords
IF        : 'if';
ELSE      : 'else';
WHILE     : 'while';
FOR       : 'for';
UNION     : 'union';
BREAK     : 'break';
CONTINUE  : 'continue';
ENUM      : 'enum';
CONST     : 'const';
INT       : 'int';
FLOAT     : 'float';
CHAR      : 'char';
VOID      : 'void';
MAIN      : 'main';
SWITCH    : 'switch';
CASE      : 'case';
RETURN    : 'return';
DEFAULT   : 'default';
STRUCT    : 'struct';
TYPEDEF   : 'typedef';

// Operators
LPAREN    : '(' ;
RPAREN    : ')' ;
LBRACE    : '{' ;
RBRACE    : '}' ;
LBRACKET  : '[' ;
RBRACKET  : ']' ;
COMMA     : ',' ;
SEMI      : ';' ;

ASSIGN        : '=' ;
PLUS_ASSIGN   : '+=' ;
MINUS_ASSIGN  : '-=' ;

COLON     : ':' ;
DOT       : '.';
ARROW     : '->';

PLUS      : '+' ;
MINUS     : '-' ;
MUL       : '*' ;
DIV       : '/' ;
MOD       : '%' ;

LESS      : '<' ;
GREATER   : '>' ;
LESSEQ    : '<=' ;
GREATEREQ : '>=' ;
EQ        : '==' ;
NEQ       : '!=' ;

AND       : '&&' ;
OR        : '||' ;
NOT       : '!' ;

BITAND    : '&' ;
BITOR     : '|' ;
BITXOR    : '^' ;
BITNOT    : '~' ;

LSHIFT    : '<<' ;
RSHIFT    : '>>' ;

INC       : '++' ;
DEC       : '--' ;

// Characters
CHAR_LITERAL
    : '\'' ( ~['\\] | '\\' . ) '\''
    ;

// Floats
FLOAT_LITERAL
    : [0-9]+ '.' [0-9]*
    | '.' [0-9]+
    ;

// Integers
INT_LITERAL
    : HEX_LITERAL
    | OCT_LITERAL
    | DEC_LITERAL
    ;

// Strings
STRING_LITERAL
    : '"' ( ~["\\] | '\\' . )* '"'
    ;

fragment HEX_LITERAL
	: '0' [xX] [a-fA-F0-9]+ [uUlL]*
	;
fragment OCT_LITERAL
	: '0' [0-7]+ [uUlL]*
	;
fragment DEC_LITERAL
	: '0'
	| [1-9] [0-9]* [uUlL]*
	;

IDENTIFIER
    : [a-zA-Z_] [a-zA-Z0-9_]*
    ;

MULTI_LINE_COMMENT
    : '/*' .*? '*/' -> channel(HIDDEN)
    ;
    
SINGLE_LINE_COMMENT
    : '//' ~[\r\n]* -> channel(HIDDEN)
    ;

WS
	: [ \t\r\n]+ -> skip
	;