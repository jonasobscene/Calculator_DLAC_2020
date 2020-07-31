#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void printResult(int result) {
    printf("result=%d\n",result);
}

int add(int x, int y) {
    int result = x + y;
    return result;
}

int multiplicate(int x, int y) {
    int result = x * y;
    return result;
}

int convertOctalToDecimal(long int octal) {
    int i = 0;
    long int decimal = 0;
    while (octal != 0) {
        decimal =  decimal +(octal % 10)* pow(8, i++);
        octal = octal / 10;
    }
    return (int)decimal;
}

int convertDecimalToOctal(long int decimal) {
    int result = (int)decimal;
    /**
     *  does nothing, because internally the compiler 
     *  only works with decimal values
     */
    return result;
}

int power(int x, int y) {
    int result = (int)pow((double)x, (double)y);
    return result;
}

