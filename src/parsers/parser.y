%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%{
    #define YYSTYPE int
    int yylex();
    void yyerror(const char *s);
    int yyparse(void);
%}

%token NUMBER
%token EOL

%%

calculation: /* empty */ | calculation line;

line: EOL
    | expr EOL { printf("%d\n", $1); }

expr: NUMBER
    | expr '+' NUMBER { $$ = $1 + $3; }
    | expr '-' NUMBER { $$ = $1 - $3; }

%%

void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}