#include <stdio.h>
#include "functions.h"

int main(int argc, char **argv)
{
   char str[] = "String for stuff\n";
   
   printStuff(str, 10);
   newline();
   
   reverseStuff(str);
   newline();
   
   convertCharToByte(9);
   newline();
   
   convertShortToByte(9);
   newline();
   
   convertIntToByte(9);
   newline();
}
