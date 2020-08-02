/**
 *      This functions takes the result of the calcuclation
 *      and displays it in a user friendly formatted way
 *      E.g.: "result = 16"
 */
void printResult(int result);

/**
 *      This functions provides the functionality
 *      of a simple mathematical addition
 *      E.g.: add(2,3) = 2 + 3 = 5
 */
int add(int x, int y);

/**
 *      This function provides the functionality
 *      of a simple mathematical multiplication
 *      E.g.: multiplicate(2,3) = 2 * 3 = 6
 */
int multiplicate(int x, int y);

/**
 *      This function converts octal values
 *      to decimal integer values. The compiler internally
 *      calculates with decimal values only, so this
 *      function should always be called, when the user
 *      enters an octal value.
 */
int convertOctalToDecimal(long int octal);

/**
 *      This function converts decimal integer values
 *      to octal values. The compiler internally 
 *      works with decimal values only, so this
 *      function has no use in it's current form. 
 */
int convertDecimalToOctal(long int decimal);

/**
 *      This function provides the functionality
 *      of a simple mathematical power operation.
 *      E.g.: power(2,3) = 2^3 = 8
 */
int power(int x, int y);

