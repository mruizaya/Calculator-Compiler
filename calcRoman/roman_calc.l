%{
#include "roman_calc.tab.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int roman_a_int(const char *s) {
    int total = 0;
    while (*s) {
        if (!strncmp(s, "CM", 2)) { total += 900; s += 2; }
        else if (!strncmp(s, "CD", 2)) { total += 400; s += 2; }
        else if (!strncmp(s, "XC", 2)) { total += 90; s += 2; }
        else if (!strncmp(s, "XL", 2)) { total += 40; s += 2; }
        else if (!strncmp(s, "IX", 2)) { total += 9; s += 2; }
        else if (!strncmp(s, "IV", 2)) { total += 4; s += 2; }
        else if (*s == 'M') { total += 1000; s++; }
        else if (*s == 'D') { total += 500; s++; }
        else if (*s == 'C') { total += 100; s++; }
        else if (*s == 'L') { total += 50; s++; }
        else if (*s == 'X') { total += 10; s++; }
        else if (*s == 'V') { total += 5; s++; }
        else if (*s == 'I') { total += 1; s++; }
        else return -1;
    }
    return total;
}
%}

%%

[MCDXLVI]+     { yylval = roman_a_int(yytext); return NUM; }

"+"            { return MAS; }
"-"            { return MENOS; }
"*"            { return MULT; }
"/"            { return DIV; }
"("            { return LPAREN; }
")"            { return RPAREN; }

[ \t]          ;
\n             { return '\n'; }

.              { printf("Caracter inválido: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
	

