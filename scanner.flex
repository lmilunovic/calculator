%{
    enum yytokentype {
        NUMBER = 258,
        ADD = 259,
        SUB = 260,
        MUL = 261,
        DIV = 262,
        ABS = 263,
        EOL = 264
    };    
    int yyval;
%}

%%

"+"         { return ADD;}
"-"         { return SUB;}
"*"         { return MUL;}
"/"         { return DIV;}
"|"         { return ABS;}
[0-9]+      { yyval = atoi(yytext); return NUMBER;}
\n          { return EOL;}
[ \t]       { /* Just ignore whitespace*/ }
.           { printf("Scanner error: Unrecognised character: %s\n", *yytext);}

%%

main(int argc, char **argv){

    int tok;

    while(tok = yylex()) // zero means EOF
    {   
        printf("%d", tok); 

        if(tok == NUMBER){
            printf( " = %d\n", yyval);
        }else{
            printf("\n");
        }
    }

}
