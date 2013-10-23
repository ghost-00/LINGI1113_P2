/*-------------------------------------------------------------------------
 integer to string conversion

 Written by:   Bela Torok, 1999
               bela.torok@kssg.ch
 usage:

 _ultoa(unsigned long value, char* string, int radix)
 _ltoa(long value, char* string, int radix)

 value  ->  Number to be converted
 string ->  Result
 radix  ->  Base of value (e.g.: 2 for binary, 10 for decimal, 16 for hex)
---------------------------------------------------------------------------*/

/* "11110000111100001111000011110000" base 2 */
/* "37777777777" base 8 */
/* "4294967295" base 10 */
#define NUMBER_OF_DIGITS 32	/* eventually adapt if base 2 not needed */

#if NUMBER_OF_DIGITS < 32
# warning _ltoa() and _ultoa() are not save for radix 2
#endif

#if defined (SDCC_mcs51) && defined (SDCC_MODEL_SMALL) && !defined (SDCC_STACK_AUTO)
# define MEMSPACE_BUFFER __idata	/* eventually __pdata or __xdata */
# pragma nogcse
#else
# define MEMSPACE_BUFFER
#endif

void _ultoa(unsigned long value, char* string, unsigned char radix)
{
  char MEMSPACE_BUFFER buffer[NUMBER_OF_DIGITS];  /* no space for '\0' */
  unsigned char index = NUMBER_OF_DIGITS;

  do {
    unsigned char c = '0' + (value % radix);
    if (c > (unsigned char)'9')
       c += 'A' - '9' - 1;
    buffer[--index] = c;
    value /= radix;
  } while (value);

  do {
    *string++ = buffer[index];
  } while ( ++index != NUMBER_OF_DIGITS );

  *string = 0;  /* string terminator */
}

void _ltoa(long value, char* string, unsigned char radix)
{
  if (value < 0 && radix == 10) {
    *string++ = '-';
    value = -value;
  }
  _ultoa(value, string, radix);
}