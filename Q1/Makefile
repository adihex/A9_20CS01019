LEX=flex
YACC=bison
CC=gcc
ADDITIONAL_CFLAGS=-std=C99 -O2 -Wall -D_POSIC_C_SOURCE=200809L
BINS=

all: $(BINS)

$(BINS): $(CC) $(CFLAGS) $(ADDITIONAL_CFLAGS) -o $@ $^ -lfl

%.c: %.l
	$(LEX) -o $@ $($(<)_header_file) $<

%.tab.c: %.y
	$(CC) -o $@ -d $<

.PHONY: clean

clean: 
	rm -rf *.c *.h $(BINS)
