%%

"+"         { printf("PLUS");}
"-"         { printf("MINUS");}
"*"         { printf("TIMES");}
"/"         { printf("DIVIDE");}
"|"         { printf("ABS");}
"[0-9]+"    { printf("NUMBER %s\n", yytext);}
\n          { printf("NEWLINE\n");}
[ \t]       { }
.           { printf("Scanner error: Unrecognised character: %s\n", yytext);}

%%