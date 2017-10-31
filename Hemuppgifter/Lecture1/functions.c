#include <stdio.h>
#include "functions.h"

void newline(){
    printf("\n");
    }

void printStuff(char arr[], int times){
     for(int i = 0; i<times; i++){
        	printf(arr);
        }
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
    }
    
void convertShortToByte(char byte){
    
    for(int i=15; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
        }
    }
    
void convertIntToByte(char byte){
    
    for(int i=31; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
        }
    }