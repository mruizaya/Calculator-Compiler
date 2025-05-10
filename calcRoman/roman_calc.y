%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

void print_roman(int n) {
    if (n <= 0) {
        printf("= (número no representable en romano)\n");
        return;
    }

    struct pair { int value; const char *roman; } table[] = {
        {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
        {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"},
        {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}
    };

    printf("= ");
    for (int i = 0; i < 13; ++i) {
        while (n >= table[i].value) {
            printf("%s", table[i].roman);
            n -= table[i].value;
        }
    }
    printf("\n");
}
%}

%token NUM
%token MAS MENOS MULT DIV
%token LPAREN RPAREN

%left MAS MENOS
%left MULT DIV

%%

input:
    /* vacío */
  | input line
  ;

line:
    expr '\n' { print_roman($1); }
  ;

expr:
    expr MAS expr     { $$ = $1 + $3; }
  | expr MENOS expr    { $$ = $1 - $3; }
  | expr MULT expr     { $$ = $1 * $3; }
  | expr DIV expr   	{ $$ = $1 / $3; }
  | LPAREN expr RPAREN { $$ = $2; }
  | NUM             { $$ = $1; }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Calculadora romana (CTRL+D para salir)\n");
    return yyparse();
}
