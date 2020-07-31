%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    int yyerror(char *);
    int yylex(void);
%}
%token NUMBER_OCT
%token NUMBER_DEC
%token OPERATOR_PLUS
%token OPERATOR_MULT
%token BRACKET_OPEN
%token BRACKET_CLOSE
%token COMMA
%token FUN_TO_DEC
%token FUN_TO_OCT
%token FUN_POWER
%token FUN_SWITCH_OPS
%token EOL
%%
result:
    expr EOL { printf("result=%d\n",$1); return 0; } |
    EOL;

expr:
    term { $$ = $1; } |
    term OPERATOR_PLUS expr { $$ = $1 + $3; } |
    ;

term:
    factor { $$ = $1; } |
    factor OPERATOR_MULT term { $$ = $1 * $3; };

factor: 
    BRACKET_OPEN expr BRACKET_CLOSE { $$ = $2; } |
    function { $$ = $1; } |
    number { $$ = $1; };

function: 
    FUN_TO_DEC BRACKET_OPEN numberOctal BRACKET_CLOSE { $$ = $3; } |
    FUN_TO_OCT BRACKET_OPEN numberDecimal BRACKET_CLOSE { $$ = $3; } |
    FUN_POWER BRACKET_OPEN factor COMMA factor BRACKET_CLOSE { $$ = (int)pow((double)$3, (double)$5); } |
    FUN_SWITCH_OPS BRACKET_OPEN expr BRACKET_CLOSE { $$ = $3; };

number: 
    numberOctal {       int i = 0;
                        long int decimal = 0;
                        long int octal = $1;
                        while (octal != 0) {
                            decimal =  decimal +(octal % 10)* pow(8, i++);
                            octal = octal / 10;
                        }
                        $$ = (int)decimal; } |
    numberDecimal { $$ = $1; };

numberOctal: 
    NUMBER_OCT { $$ = $1; }; 

numberDecimal: 
    NUMBER_DEC { $$ = $1; };
%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int main(void) {
    yyparse();
    return 0;
}    
