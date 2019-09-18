%{
#include "parser.tab.h"
%}

%%
"+"         { return ADD;}
"-"         { return SUB;}
"*"         { return MUL;}
"/"         { return DIV;}
"|"         { return ABS;}
[0-9]+      { yylval = atoi(yytext); return NUMBER;}
"("         { return OP;}
")"         { return CP;}
"//".*      { /*Ignore comments*/ }
\n          { return EOL;}
[ \t]       { /* Just ignore whitespace*/ }
.           { printf("Scanner error: Unrecognised character: %c\n", *yytext);}
%%
