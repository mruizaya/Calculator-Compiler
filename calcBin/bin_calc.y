%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

void print_binario(int n) {
    if (n == 0) {
        printf("= 0\n");
        return;
    }

    char bin[64];
    int i = 0;
    while (n > 0) {
        bin[i++] = '0' + (n % 2);
        n /= 2;
    }
    printf("= ");
    while (i--) putchar(bin[i]);
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
    expr '\n' { print_binario($1); }
  ;

expr:
    expr MAS expr     { $$ = $1 + $3; }
  | expr MENOS expr    { $$ = $1 - $3; }
  | expr MULT expr     { $$ = $1 * $3; }
  | expr DIV expr   { $$ = $1 / $3; }
  | LPAREN expr RPAREN { $$ = $2; }
  | NUM             { $$ = $1; }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Calculadora binaria (CTRL+D para salir)\n");
    return yyparse();
}
