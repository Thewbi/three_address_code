lexer grammar TacLexer;

fragment A:[aA];
fragment B:[bB];
fragment C:[cC];
fragment D:[dD];
fragment E:[eE];
fragment F:[fF];
fragment G:[gG];
fragment H:[hH];
fragment I:[iI];
fragment J:[jJ];
fragment K:[kK];
fragment L:[lL];
fragment M:[mM];
fragment N:[nN];
fragment O:[oO];
fragment P:[pP];
fragment Q:[qQ];
fragment R:[rR];
fragment S:[sS];
fragment T:[tT];
fragment U:[uU];
fragment V:[vV];
fragment W:[wW];
fragment X:[xX];
fragment Y:[yY];
fragment Z:[zZ];


AMPERSAND : '&' ;
ASTERISK : '*' ;
AT : '@' ;

BACKSLASH : '\\' ;
BAR : '|' ;
BEGINFUNC : B E G I N F U N C ;

CALL : C A L L ;
CLOSEING_BRACKET : ')' ;
COLON : ':' ;
COMMA : ',' ;

DOT : '.' ;

ELSE : 'else' ;
ENDIF : 'endif' ;
ENDFUNC : E N D F U N C ;
EQUALS : '=' ;

GOTO : G O T O ;
GT : '>' ;
GTE : '>=' ;

HASH_TAG : '#' ;

IF : 'if' ;
INCLUDE : 'include' ;

LEFT_SHIFT : '<<' ;
LT : '<' ;
LTE : '<=' ;

MACRO : 'macro' ;
MINUS : '-' ;

OPENING_BRACKET : '(' ;

PLUS : '+' ;

RETURN : R E T U R N ;
RIGHT_SHIFT : '>>' ;

SLASH : '/' ;

NEWLINE : '\r'? '\n' -> channel(HIDDEN) ;

//WS : [ \t\n\r\f]+ -> channel(HIDDEN) ;
WS : [ \t\f]+ -> channel(HIDDEN) ;
//WS : [ \t\n\r\f]+ -> skip  ;


//LINE_COMMENT : ';' ~[\r\n]* -> channel(HIDDEN) ;
LINE_COMMENT 
    : 
    ';' ~[\r\n]* -> channel(HIDDEN)
    ;

//BLOCK_COMMENT 
//    : 
    // non-greedy
//    '/*' .*? '*/' -> skip 
    // greedy
    //'/*' .* '*/' -> skip 
//    ;
BLOCK_COMMENT : '/*' (BLOCK_COMMENT|.)*? '*/' -> channel(HIDDEN) ;

DOUBLE_SLASH_LINE_COMMENT : '//' .*? '\n' -> channel(HIDDEN) ;

STRING : '"' ( '""' | ~'"' )* '"' ; // quote-quote is an escaped quote
CHAR : '\'' (.) '\'' ;
ESCAPED_CHAR : '\'' '\\' (.) '\'' ;

NUMBER : ( PLUS | MINUS )?[0-9]+ ;
HEX_NUMBER : ('0' 'x' | '$') [a-fA-F0-9]+ ;
BINARY_NUMBER : '0' 'b' [0,1]+ ;

IDENTIFIER : [a-zA-Z_]([a-zA-Z0-9_])* ;