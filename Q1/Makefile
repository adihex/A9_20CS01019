LEX=flex
YACC=bison
CC=gcc

run: scanner.l parser.y
	$(YACC) -d parser.y 
	$(LEX) scanner.l	
	$(CC) -o $@ parser.tab.c main.c Node.c 

clean: 
	rm -rf run parser.tab.* lex.* 
