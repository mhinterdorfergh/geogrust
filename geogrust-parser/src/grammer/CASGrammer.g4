grammar CASGrammer;

init : expression ;
// init : '{' (value ',')* value? '}' ;

expression  : expression5 ;
expression5 : expression4 (MINUS expression4)? ;
expression4 : expression3 (PLUS expression3)? ;
expression3 : expression2 (DIV expression2)? ;
expression2 : expression1 (TIMES expression1)? ;
expression1 : expression0 (POWER expression0)? ;
expression0 : function | identifier | braced_expression ;

function : IDENTIFIER '(' expression ')' ;
identifier : IDENTIFIER | NUMBER ;
braced_expression : '(' expression ')' ;


// LEXER RULES

IDENTIFIER : [a-zA-Z]+ ;

NUMBER : NUMBER_FRAGMENT ('.' NUMBER_FRAGMENT)? ;
NUMBER_FRAGMENT : [0-9_]* [0-9]+ [0-9_]* ;

TIMES : '*' ;
DIV : '/' ;
PLUS : '+' ;
MINUS : '-' ;
POWER : '^' ;

WS : [ \t\r\n]+ -> skip ;
