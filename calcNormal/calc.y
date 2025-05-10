%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    double dec;
}

%token <dec> NUM
%token MAS MENOS MULT DIV
%token LPAREN RPAREN

%left MAS MENOS
%left MULT DIV

%%

input:
    /* empty */
  | input line
  ;

line:
    expr '\n'    { printf("= %d\n", $1); }
  ;

expr:
    expr MAS expr    { $$ = $1 + $3; }
  | expr MENOS expr   { $$ = $1 - $3; }
  | expr MULT expr    { $$ = $1 * $3; }
  | expr DIV expr  {$$ = $1 / $3;}
  | LPAREN expr RPAREN { $$ = $2; }
  | NUM             { $$ = $1; }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Calc (CTRL+D para salir)\n");
    return yyparse();
}
