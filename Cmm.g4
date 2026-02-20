grammar Cgroep18;

// ==========================================
// PARSER RULES (altijd met kleine letter)
// ==========================================

primary_expression
	: CONSTANT
	| 'LPAREN' expression 'RPAREN'
	;
unary_expression
	: primary_expression
	| 'PLUS' unary_expression
	| 'MINUS' unary_expression
	| 'NOT' unary_expression
	| 'BITNOT' unary_expression
	;
multiplicative_expression
	: unary_expression
	| multiplicative_expression 'MUL' unary_expression
	| multiplicative_expression 'DIV' unary_expression
	| multiplicative_expression 'MOD' unary_expression
	;
additive_expression
	: multiplicative_expression
	| additive_expression 'PLUS' multiplicative_expression
	| additive_expression 'MINUS' multiplicative_expression
	;
shift_expression
	: additive_expression
	| shift_expression 'LSHIFT' additive_expression
	| shift_expression 'RSHIFT' additive_expression
	;
relational_expression
	: shift_expression
	| relational_expression 'LESS' shift_expression
	| relational_expression 'GREATER' shift_expression
	| relational_expression 'LESSEQ' shift_expression
	| relational_expression 'GREATEREQ' shift_expression
	;
equality_expression
	: relational_expression
	| equality_expression 'EQ' relational_expression
	| equality_expression 'NEQ' relational_expression
	;
and_expression
	: equality_expression
	| and_expression 'BITAND' equality_expression
	;
exclusive_or_expression
	: and_expression
	| exclusive_or_expression 'BITXOR' and_expression
	;
inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression 'BITOR' exclusive_or_expression
	;
logical_and_expression
	: inclusive_or_expression
	| logical_or_expression 'AND' inclusive_or_expression
	;
logical_or_expression
	: inclusive_and_expression
	| logical_or_expression 'OR' logical_and_expression
	;
expression
	: logical_or_expression
	;
statement
	: expression 'SEMI'
	;

// ==========================================
// LEXER RULES (altijd met HOOFDLETTERS)
// ==========================================

LPAREN    : '(' ;
RPAREN    : ')' ;
SEMI      : ';' ;
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

CONSTANT
	: HEX_LITERAL
	| OCT_LITERAL
	| DEC_LITERAL
	;
HEX_LITERAL
	: '0' [xX] [a-fA-F0-9]+ [uUlL]*
	;
OCT_LITERAL
	: '0' [0-9]+ [uUlL]*
	;
DEC_LITERAL
	: '0'
	| [1-9] [0-9]* [uUlL]*
	;
WS
	: [ \t\r\n]+ -> skip
	;