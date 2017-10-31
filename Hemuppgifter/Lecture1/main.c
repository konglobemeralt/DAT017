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
   
   convertBitsToInt("00000101");
}
