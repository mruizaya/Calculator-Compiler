%{
#include "calc.tab.h"  
#include <stdlib.h>
%}

%%

[0-9]+        { yylval = atoi(yytext); return NUM; }

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
