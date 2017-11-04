#include <stdio.h>

void convertShortToByte(short byte){
    
    for(int i=15; i>=0; i--) {
        int bit = (byte >> i) & 0x01;
        printf("%d", bit);
        }
    }
    
void printCurrentOffset(short var2){
    for(int i = 1; i< var2; i++){
        printf(" ");
        }
    }

int main(int argc, char **argv)
{
	system("clear");
    short var = 0x8000; 
    short var2 = 0x01;
    
    do{
        //printCurrentOffset(var2); //offset with whatever is in var2 to animate
        convertShortToByte(var | var2);
        
        short tempBitmask = ~var;
        var = var >> 1;
        var &= tempBitmask; 
    
        var2 = var2 << 1;
        
        
        if(var == 0x00){
            var = 0x8000; 
            var2 = 0x01;
        }
        
        getchar();
        system("clear");
    }
    while(1);
        
	return 0;
}


