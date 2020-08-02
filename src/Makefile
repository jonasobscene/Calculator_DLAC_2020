FILENAME:=calc
LIB_FUNCTIONS:=./../lib/functions.c

all: clear calc

clear: 
	rm -f $(FILENAME) lex.yy.c y.tab.c y.tab.h

calc: $(FILENAME).y $(FILENAME).l
	yacc -d $(FILENAME).y
	lex $(FILENAME).l
	gcc lex.yy.c y.tab.c $(LIB_FUNCTIONS) -o $(FILENAME) -ll -lm
