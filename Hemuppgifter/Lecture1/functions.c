#include <stdio.h>
#include <math.h>
#include "functions.h"

void newline(){
    printf("\n");
    }

void printStuff(char arr[], int times){
     for(int i = 0; i<times; i++){
        	printf(arr);
        }
     newline();
    }
    
void reverseStuff(char strArr[]){
    int stringLength = strlen(strArr);
    char reversedString[stringLength];
    
    int j = 0;
    for(int i = stringLength-1; i>=0; i--){
        reversedString[j] = strArr[i];
        j = j + 1;
        }
    
    reversedString[stringLength] = '\0';
    printStuff(reversedString, 3);
    }
    
void convertCharToByte(char byte){
    
    for(int i=7; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
        }
        newline();
    }
    
void convertShortToByte(short byte){
    
    for(int i=15; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
        }
  newline();
    }
    
void convertIntToByte(int byte){
    
    for(int i=31; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
        }
        newline();
    }
    
void convertBitsToInt(unsigned char byte[]){
    unsigned char value = 0;
    for(int i = 0; i<8; i++){
        if(byte[i] == '1'){
            int tempValue = 1<<(7-i);
            value |= tempValue;
            }
            
    }
    printf("%d", value);newline();
    }
    
    
void setBits135To1(unsigned char byte){
    unsigned char result = byte | 42;
    printf("%d", result);newline();
    }
   
void hexToDecimal(unsigned char hex){
    printf("%x\n", hex);
    } 
    
void flipBitsOfSignedChar(signed char x){
    x = ~x;
    x = x + 0x01;
    printf("%d\n", x);
    }
    
    
//Exampel Solutions to things: 
void printBinary(unsigned char byte)
    {
    for(int i=7; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
    }
}
   
void setBitsToStuff2CoolForSchool(unsigned char byte){
    printBinary(byte); printf("\n");
    byte |= (1<<1 | 1<<3 | 1<<5);
    printBinary(byte); printf("\n");
    printf("%d\n", byte);
    
    }
    

    
