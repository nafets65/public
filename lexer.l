%option noyywrap
%option noinput
%option nounput
%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <stdbool.h>

    #include "y.tab.h"
%}

%%
True {yylval.vr = 1; return TRUE; }
False {yylval.vr = 0; return FALSE;}
"/\\"  { return I;}
":=" {return DOD;}
"<=>" {return EKV;}
"\\/" {return ILI; }
"=>" { return SLEDI;}
"!" {return *yytext;}
"(" {return *yytext;}
")" {return *yytext;}
[A-Za-z][A-Za-z0-9]* {yylval.niska = strdup(yytext); return ID;}
[\n\t ] {}
. {
    fprintf(stderr, "Error in lexer: %s\n" , yytext);
    exit(EXIT_FAILURE);
}


%%
