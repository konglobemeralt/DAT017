/*
 * 	startup.c
 *
 */
#define GPIO_D 0x40020C00

#define PORT_MODER((volatile)unsigned int* (GPIO_D))
#define PORT_OTYPER ((volatile)unsigned short* (GPIO_D) + 0x4)
// #define PORT_OSPEEDR ((volatile)unsigned short* (GPIO_D) + 0x8)
#define PORT_PUPDR ((volatile)unsigned short* (GPIO_D) + 0xC)
#define PORT_IDR_LOW ((volatile)unsigned char* (GPIO_D) + 0x10)
#define PORT_IDR_HIGH ((volatile)unsigned char* (GPIO_D) + 0x11)
#define PORT_ODR_LOW ((volatile)unsigned char* (GPIO_D) + 0x14)
#define PORT_ODR_HIGH ((volatile)unsigned char* (GPIO_D) + 0x15)

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}



void main(void)
{
}

void app_init(void)
{    
    //Define high bits as out and low as input.
    
    PORT_MODER = 0x55005555;
    //set all bits as push pull
    PORT_OTYPER &= 0x0000FFFF;   
    PORT_OTYPER |= 0x00000000;   
    //
    PORT_PUPDR = 0xzz55zzzz;   
}

unsigned char keyb(void){
        unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
        int row, col;
        for(row = 1; row <= 4; row++)
            {
            kbdAcvtivate(row);
            if(col = kbdGetCol())
                {
                kbdActivate(0);
                return key[4*(row-1) + (col-1)]
                }
            }
        kbdActivate(0);
        return 0xFF;
}


