%{
#include <stdio.h>;
#include "zoomjoystrong.tab.h"
%}

%%

end		{return END};

;		{return END_STATEMENT};

point 		{return POINT};

line 		{return LINE};

circle 		{return CIRCLE};

rectangle	{return RECTANGLE};

set_color	{return SET_COLOR};

[0-9]+		{yylval.iVal = atoi(yytext);
		return INT};

[0-9]+\.[0-9]+	{yylval.fVal = atof(yytext);
		return FLOAT};

[/n/t/r]+	;

.		{};

%%

int main() {
	yylex();
	return 0;
}

