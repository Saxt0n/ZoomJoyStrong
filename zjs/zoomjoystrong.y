%{
#include "zoomjoystrong.h"
%}

/* Union to hold values of tokens.  */
%union {
	int iVal;
	float fVal;
}

/* Tokens used in this grammar */
%start program

%token END

%token END_STATEMENT

%token POINT

%token LINE

%token CIRCLE

%token RECTANGLE

%token SET_COLOR

%token <iVal> INT

%token <fVal>  FLOAT

%%

program:	statement_list END END_STATEMENT
	;

statement_list:	statement statement_list
	|	statement;

statement:	point
	|	line
	|	circle
	|	rectangle
	|	setcolor
	;

point:		POINT INT INT END_STATEMENT
	;

line:		LINE INT INT INT INT END_STATEMENT
	;

circle:		CIRCLE INT INT INT END_STATEMENT
	;

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
	;

setcolor:	SET_COLOR INT INT INT
	;	
%%

int main(int argc, char** argv ) {
	yyparse();
	return 0;
}
