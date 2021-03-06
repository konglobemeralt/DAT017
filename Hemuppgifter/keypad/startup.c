/*
 * 	startup.c
 *
 */
#define GPIO_D 0x40020C00

#define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void app_init(void)
{    
    //Define high bits as out and low as input.
    
    *GPIO_MODER = 0x55005555;
    //set all bits as push pull
    *GPIO_OTYPER &= 0x0000FFFF;   
    *GPIO_OTYPER |= 0x00000000;   
    //
    //PORT_PUPDR = 0xzz55zzzz;   
    *GPIO_PUPDR = 0x00550000;   
}

void kbdActivate(unsigned int row){
    switch(row)
        {
            //activate row N or deactivate with 0 
            case 1: *GPIO_ODR_HIGH = 0x10; break;
            case 2: *GPIO_ODR_HIGH = 0x20; break;
            case 3: *GPIO_ODR_HIGH = 0x40; break;
            case 4: *GPIO_ODR_HIGH = 0x80; break;
            case 0: *GPIO_ODR_HIGH = 0x00; break;
        }
    
    }
    
int kdbGetCol(void){
        unsigned char idr;
        idr = *GPIO_IDR_HIGH;
        
        if(idr & 0x8) return 4;
        if(idr & 0x4) return 3;
        if(idr & 0x2) return 2;
        if(idr & 0x1) return 1;
        return 0;
    }
    
void outSeg7(unsigned char in)
    {
        
        if(in == 0x0) *GPIO_ODR_LOW = 0x3F;
        if(in == 0x1) *GPIO_ODR_LOW = 0x06;
        if(in == 0x2) *GPIO_ODR_LOW = 0x5B;
        if(in == 0x3) *GPIO_ODR_LOW = 0x4F;
        if(in == 0x4) *GPIO_ODR_LOW = 0x66;
        if(in == 0x5) *GPIO_ODR_LOW = 0x6D;
        if(in == 0x6) *GPIO_ODR_LOW = 0x7D;
        if(in == 0x7) *GPIO_ODR_LOW = 0x07;
        if(in == 0x8) *GPIO_ODR_LOW = 0x7F;
        if(in == 0x9) *GPIO_ODR_LOW = 0x67;
        if(in == 0xA) *GPIO_ODR_LOW = 0x77;
        if(in == 0xB) *GPIO_ODR_LOW = 0x7F;
        if(in == 0xC) *GPIO_ODR_LOW = 0xFF;
        if(in == 0xD) *GPIO_ODR_LOW = 0xBF;
        if(in == 0xE) *GPIO_ODR_LOW = 0x79;
        if(in == 0xF) *GPIO_ODR_LOW = 0x71;
	else *GPIO_ODR_LOW = 0x00;
        
    }

unsigned char keyb(void){
        unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
        int row, col;
        for(row = 1; row <= 4; row++)
            {
            kbdActivate(row);
            if(col = kdbGetCol())
                {
                kbdActivate(0);
                return key[4*(row-1) + (col-1)];
                }
            }
        kbdActivate(0);
        return 0xFF;
}


void main(void)
{
    app_init();
    
    while(1){
        outSeg7(keyb());
    }
}




