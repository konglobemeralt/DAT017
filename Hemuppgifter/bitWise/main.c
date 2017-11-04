#include <stdio.h>

void convertShortToByte(short byte){
    
    for(int i=15; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
        }
    }

int main(int argc, char **argv)
{
	system("clear");
    short var = 0x8000; 
    
    do{
        convertShortToByte(var);
        short tempBitmask = ~var;
        var = var >> 1;
        var &= tempBitmask; 
        getchar();
    }
    while(1);
        
	return 0;
}


