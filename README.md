#Calculator_DLAC_2020
##The Task
The goal was to implement a working compiler frontend, that could parse a simple calculator language. To achieve this, there were five tasks to be completed, these are:
1. Propose modifications to the functionality of a given calculator
1. Write the according EBNF grammar
1. Write the lexical analyzer
1. Write the syntactical analyzer, that only checks for syntactical correct input
1. Modify the syntactical analyzer, so that it evaluates all input expressions correctly
The results of all those tasks can be viewed in this repository.
##Modifications
* Usage of octal values
    * marked with the letter 'o' after the number
* Type Conversion
    * from octal to decimal
    * from decimal to octal
* Power operation
    * simple mathematical power operation 
* Switch operation
    * Switches additon and multiplication operator inside whole expression inside brackets
    * my lecturer and i agreed, that this is to be left out of further implementation ("to complicated")
##EBNF Grammar
```
expr = term, expr1;
expr1 = "+", term, expr1 |;
term = factor, term1;
term1 = "*", factor, term1 |;
factor = "(", expr , ")" | function | number;
function = "convertToDecimal(", numberOctal, ")" | "convertToOctal(", numberDecimal, ")" | "power(", factor, ",", factor, ")" | "switchOperators(", expr, ")";
number = numberDecimal | numberOctal;
numberDecimal = zero | nonzeroDigit, {digit};
numberOctal = zero | "o", nonzeroOctal, {octal};
zero = "0";
nonzeroDigit = "1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9";
nonzeroOctal = "1"|"2"|"3"|"4"|"5"|"6"|"7";
digit = "1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"|"0";
octal = "1"|"2"|"3"|"4"|"5"|"6"|"7"|"0";
syntax = expr;
```
##Compilation
* To clear all previous compilation output use following command:
```
make clear
```
* To build the whole project use the following command:
```
make calc
```
* To make a full clean build (clear and build afterwards) use the following command:
```
make all
```
##Usage
Simply start the calculator using following command
```
./calc
```
type your expression afterwards and you will get the result immediately. 
