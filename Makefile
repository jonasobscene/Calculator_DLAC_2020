FILENAME=calc

all: clear calc

clear: 
	rm -f calc lex.yy.c y.tab.c y.tab.h

calc: calc.y calc.l
	yacc -d calc.y
	lex calc.l
	gcc lex.yy.c y.tab.c -o calc -ll -lm
