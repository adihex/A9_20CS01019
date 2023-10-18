#include <stdio.h>
#include <stdlib.h>

#include "parse.tab.h"

int main(int argc, char *argv[]) {
	if (argc != 0) {
		extern FILE *yyin;
		yyin = fopen(argv[1], "r");
		if (yyin == NULL) {
			printf("Error!! Opening the file %s\n", argv[1]);
			return EXIT_FAILURE;
		}
		printf("Parsing the file\n");
		if (yyparse() == 0) {
			printf("Parsing the file successful\n");
		}
	}
	return EXIT_SUCCESS;
}
