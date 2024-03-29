%{   
#include <stdio.h>  
%}

%token NUMBER
%token ADD SUB MUL DIV ABS AND
%token EOL
%token OP CP

%%

calclist: /*empty*/
    | calclist exp EOL { printf("= %d  (0x%04x) \n", $2, $2);}
    | calclist EOL 
    ;

exp: factor
    | exp ADD factor  {$$ = $1 + $3;}
    | exp SUB factor  {$$ = $1 - $3;}
    | exp ABS factor  {$$ = $1 | $3;}
    | exp AND factor  {$$ = $1 & $3;}
    ;

factor: term
    | factor MUL term {$$ = $1 * $3;}
    | factor DIV term {$$ = $1 / $3;}
    ;

term: NUMBER
    | ABS term {$$ = $2 >= 0? $2 : -$2;}
    | OP exp CP { $$ = $2; }
    ;
%%

main(int argc, char** argv){
    yyparse();
}

yyerror(char *s){
    fprintf(stderr, "error: %s\n", s);
}