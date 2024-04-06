#include "parser.h"
#include <stdio.h>

extern int yyparse();
extern FILE *yyin;

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("fopen");
        return 1;
    }

    yyin = file;
    return yyparse();
}