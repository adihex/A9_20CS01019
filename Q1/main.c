#include <stdio.h>
#include <stdlib.h>

#include "lex.yy.c"
#include "parser.tab.h"

int main(void) {
	extern FILE *yyin;
	yyin = fopen("./input.txt", "r");
	if (yyin == NULL) {
		printf("Error!! Opening the file \n");
		return EXIT_FAILURE;
	}
	printf("Parsing the file\n");
	if (yyparse() == 0) {
		printf("Parsing the file successful\n");
		return EXIT_SUCCESS;
	} else {
		printf("Syntax error!!\n");
		return yyerror();
	}
}
