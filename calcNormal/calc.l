%{
#include "calc.tab.h"  
#include <stdlib.h>
%}

%%

[0-9]+\.[0-9]+       { yylval.dec = strtod(yytext, NULL); return NUM; }
[0-9]+               { yylval.dec = strtod(yytext, NULL); return NUM; }

"+"           { return MAS; }
"-"           { return MENOS; }
"*"           { return MULT; }
"/"           { return DIV; }
"("           { return LPAREN; }
")"           { return RPAREN; }

[ \t]         ;          
\n            { return '\n'; } 

.             { printf("Caracter inválido: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
