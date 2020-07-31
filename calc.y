%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    int add(int x, int y);
    int multiplicate(int x, int y);
    int convertOctalToDecimal(long int octal);
    int convertDecimalToOctal(long int decimal);
    int power(int x, int y);
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
    expr EOL { printResult($1); return 0; } |
    EOL;

expr:
    term { $$ = $1; } |
    term OPERATOR_PLUS expr { $$ = add($1, $3); } |
    ;

term:
    factor { $$ = $1; } |
    factor OPERATOR_MULT term { $$ = multiplicate($1, $3); };

factor: 
    BRACKET_OPEN expr BRACKET_CLOSE { $$ = $2; } |
    function { $$ = $1; } |
    number { $$ = $1; };

function: 
    FUN_TO_DEC BRACKET_OPEN numberOctal BRACKET_CLOSE { $$ = $3; } |
    FUN_TO_OCT BRACKET_OPEN numberDecimal BRACKET_CLOSE { $$ = $3; } |
    FUN_POWER BRACKET_OPEN factor COMMA factor BRACKET_CLOSE { $$ = power($3,$5); } |
    FUN_SWITCH_OPS BRACKET_OPEN expr BRACKET_CLOSE { $$ = $3; };

number: 
    numberOctal { $$ = convertOctalToDecimal($1); } |
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

void printResult(int result) {
    printf("result=%d\n",$1);
} 

int add(int x, int y) {
    int result = x + y;
    return result;
}

int multiplicate(int x, int y) {
    int result = x * y;
    return result; 
}

int convertOctalToDecimal(long int octal) {
    int i = 0;
    long int decimal = 0;
    while (octal != 0) {
        decimal =  decimal +(octal % 10)* pow(8, i++);
        octal = octal / 10;
    }
    return (int)decimal;
}   

int convertDecimalToOctal(long int decimal) {
    int result = (int)decimal;
    /**
     *  does nothing, because internally the compiler 
     *  only works with decimal values
     */
    return result;
}

int power(int x, int y) {
    int result = (int)pow((double)x, (double)y);
    return result;
}
