#include <stdio.h>
#include "functions.h"

int main(int argc, char **argv)
{
   char str[] = "String for stuff\n";
   
   printStuff(str, 10);
   
   reverseStuff(str);
   
   convertCharToByte(9);
      
   convertShortToByte(129);
   
   convertIntToByte(9123);
   
   convertBitsToInt("00001001");
   
   setBits135To1(128);
   setBitsToStuff2CoolForSchool(128);
   
   printf("Conversion tests: \n");
   convertBitsToInt("01100001");
   convertCharToByte(97);
   hexToDecimal(0x61);
   
   convertBitsToInt("10010111");
   convertCharToByte(151);
   hexToDecimal(0x97);
   
   convertBitsToInt("10010010");
   convertCharToByte(146);
   hexToDecimal(0x92);
   
}
