%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yyerror(char *errormessage);
int yyparse();
%}
NUM_OCT o[1-7][0-7]*
NUM_DEC 0|[1-9][0-9]*
%%
{NUM_OCT}               { 
                            char *str = yytext;
                            memmove(str, str+1, strlen(str));
                            int result=strtol(str, NULL, 8);
                            yylval=result;
                            return NUMBER_OCT;
                        }
{NUM_DEC}               { 
                            yylval=atoi(yytext);
                            return NUMBER_DEC;
                        }
"+"                     { 
                            return OPERATOR_PLUS;
                        }
"*"                     { 
                            return OPERATOR_MULT;
                        }
"("                     {  
                            return BRACKET_OPEN;
                        }
")"                     {  
                            return BRACKET_CLOSE;
                        }
","                     {  
                            return COMMA;
                        }
"convertToDecimal"      { 
                            return FUN_TO_DEC;
                        }
"convertToOctal"        { 
                            return FUN_TO_OCT;
                        }
"power"                 {  
                            return FUN_POWER;
                        }
"switchOperators"       {  
                            return FUN_SWITCH_OPS;
                        }
[\n]                    {   
                            return EOL; 
                        }
[ \t]+                  { }
"E"                     {
                            printf("Exiting the calculator.\n"); 
                            return 0; 
                        }
.                       {
                            printf("Unrecognized token: %s, Exiting!\n", yytext);
                            yyerror("Unrecognized token");
                            return 1; 
                        }
%%
int yywrap(void) {
    return 1;
}
