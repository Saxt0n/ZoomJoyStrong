%{
#include "zoomjoystrong.h"
#include <stdio.h>

void do_point(int a, int b);
void do_line(int a, int b, int c, int d);
void do_circle(int a, int b, int r);
void do_rectangle(int a, int b, int c, int d);
void do_color(int r, int g, int b);
void yyerror (char const *s);
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
	|	statement
	;

statement:	point
	|	line
	|	circle
	|	rectangle
	|	setcolor
	;

point:		POINT INT INT END_STATEMENT
		{
		do_point($2, $3);
		}		
	

line:		LINE INT INT INT INT END_STATEMENT
		{
		do_line($2, $3, $4, $5);
		}
	

circle:		CIRCLE INT INT INT END_STATEMENT
		{
		do_circle($2, $3, $4);
		}
	

rectangle:	RECTANGLE INT INT INT INT END_STATEMENT
		{
		do_rectangle($2, $3, $4, $5);
		}
	

setcolor:	SET_COLOR INT INT INT END_STATEMENT
		{
		set_color($2, $3, $4);
		}
		
%%

int main(int argc, char** argv ) {
	setup();
	yyparse();
	return 0;
}


void yyerror (char const *s) {
	fprintf (stderr, "%s\n", s);
}

/* Helper function for making point */
void do_point(int a, int b) {
	if (a > -1 && a <= WIDTH && b > -1 && b <= HEIGHT) {
		point(a, b);
	} else {
		fprintf(stderr, "Invalid input");
	}
}

/* Helper function for making line */
void do_line(int a, int b, int c, int d) {
	if (a > -1 && a <= WIDTH && b > -1 && b <= HEIGHT
	&& c > -1 && c <= WIDTH && d > -1 && d <= HEIGHT) {
		line(a, b, c, d);
	} else {
		fprintf(stderr, "Invalid input");
	}									
}

/* Helper function for making circle */
void do_circle(int a, int b, int r) {
	if (a > -1 && a <= WIDTH && b > -1 && b <= HEIGHT) {
		circle(a, b, r);
	} else {
		fprintf(stderr, "Invalid input");
	}
}

/* Helper function for making rectangle */
void do_rectangle(int a, int b, int c, int d) {
	if (a > -1 && a <= WIDTH && b > -1 && b <= HEIGHT
	&& c > -1 && c <= WIDTH && d > -1 && d <= HEIGHT) {
		rectangle(a, b, c, d);
	} else {
		fprintf(stderr, "Invalid input");
	}									
}

/* Helper function for setting color */
void do_color(int r, int g, int b) {
	if (r < 0 || g < 0 || b < 0 || r > 255
	|| g > 255 || b > 255) {
		fprintf(stderr, "Invalid input");
	} else {
		set_color(r, g, b);
	}
}
