grammar Cmm;

// ==========================================
// PARSER RULES
// ==========================================

compilationUnit
    : includeDirective* functionDefinition* EOF
    ;

includeDirective
    : INCLUDE HEADER
    ;

functionDefinition
    : typeSpecifier (MAIN | IDENTIFIER) LPAREN parameterList? RPAREN compoundStatement
    ;

parameterList
    : typeSpecifier IDENTIFIER (COMMA typeSpecifier IDENTIFIER)*
    ;

compoundStatement
    : LBRACE declaration* statement* RBRACE  // C89 Strikte volgorde overgenomen uit Versie 2
    ;

declaration
    : CONST? typeSpecifier IDENTIFIER (LBRACKET INT_LITERAL? RBRACKET)* (ASSIGN (expression | array_initializer))? SEMI
    ;
    
statement
    : expression SEMI
    | compoundStatement
    | SEMI
    ;

typeSpecifier
    : INT | FLOAT | CHAR | VOID
    | typeSpecifier MUL
    ;

expression
    : assignment_expression
    ;

assignment_expression
    : logical_or_expression
    | unary_expression ASSIGN assignment_expression
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
    : LPAREN typeSpecifier RPAREN cast_expression
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
    : LBRACE (expression (COMMA expression)*)? RBRACE
    | LBRACE (array_initializer (COMMA array_initializer)*)? RBRACE
    ;

// ==========================================
// LEXER RULES
// ==========================================

// Preprocessor
INCLUDE : '#include';
HEADER  : '<' [a-zA-Z0-9._]+ '>';

// Keywords
CONST     : 'const';
INT       : 'int';
FLOAT     : 'float';
CHAR      : 'char';
VOID      : 'void';
MAIN      : 'main';

// Operators
LPAREN    : '(' ;
RPAREN    : ')' ;
LBRACE    : '{' ;
RBRACE    : '}' ;
LBRACKET  : '[' ;
RBRACKET  : ']' ;
COMMA     : ',' ;
SEMI      : ';' ;
ASSIGN    : '=' ;

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
	: '0' [0-9]+ [uUlL]*
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

WS
	: [ \t\r\n]+ -> skip
	;