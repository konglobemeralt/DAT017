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
    short var2 = 0x01;
    
    do{
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


