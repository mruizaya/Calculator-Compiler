%{
#include "bin_calc.tab.h"
#include <stdlib.h>
#include <string.h>

int bin_a_dec(const char *bin) {
    int result = 0;
    while (*bin) {
        result = result * 2 + (*bin - '0');
        bin++;
    }
    return result;
}
%}

%%

[01]+         { yylval = bin_a_dec(yytext); return NUM; }

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
