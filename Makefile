OUT_FILE:=calc
SRC_FILE:=./src/calc
LIB_FUNCTIONS:=./lib/functions.c

all: clear calc

clear: 
	rm -f $(FILENAME) lex.yy.c y.tab.c y.tab.h

calc: $(SRC_FILE).y $(SRC_FILE).l
	yacc -d $(SRC_FILE).y
	lex $(SRC_FILE).l
	gcc lex.yy.c y.tab.c $(LIB_FUNCTIONS) -o $(OUT_FILE) -ll -lm
