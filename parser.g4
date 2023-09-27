parser grammar TacParser;
options { tokenVocab=TacLexer; }


compilation_unit :
	( source_line )*
	;
	
source_line :
	( label COLON )? assignment
	|
	( label COLON )? control_flow
	|
	( label COLON )? function_call
	|
	( label COLON )
	|
	function_definition
	;
	
label :
	IDENTIFIER
	;
	
assignment :
	left_hand_side EQUALS expression
	;
	
left_hand_side :
    ( ASTERISK )? IDENTIFIER
	|
	( ASTERISK )? OPENING_BRACKET expression CLOSEING_BRACKET
    ;
	
expression :
    operand
    |
	operand binary_operator operand
	|
	unary_operator operand
	;
	
unary_operator :
	AMPERSAND
	|
	ASTERISK
	|
	MINUS
	|
	PLUS
	;
	
binary_operator :
	'+'
	|
	'-'
	|
	'*'
	|
	'/'
	|
	or_operator
	|
	and_operator
	|
	equals_operator
	|
	LT
	|
	GT
	|
	LTE
	|
	GTE
	;
	
or_operator :
    BAR BAR
    ;
	
and_operator :
    AMPERSAND AMPERSAND
    ;
	
equals_operator :
	EQUALS EQUALS
	;
	
operand :
    NUMBER
	|
	IDENTIFIER
	|
	STRING
	|
	function_call
	|
	OPENING_BRACKET expression CLOSEING_BRACKET
	;
	
function_call :
	IDENTIFIER OPENING_BRACKET ( expression )? CLOSEING_BRACKET
	;
	
control_flow :
	( predicate )? GOTO IDENTIFIER
	|
	CALL IDENTIFIER
	|
	RETURN
	;
	
predicate :
	IF OPENING_BRACKET expression CLOSEING_BRACKET
	;
	
function_definition :
	BEGINFUNC IDENTIFIER
		function_body
	ENDFUNC
	;
	
function_body :
	( source_line )+
	;