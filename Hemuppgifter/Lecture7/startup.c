/*
 * 	startup.c
 *
 */
 #define GPIO_D 0x40020C00
 #define GPIO_E 0x40021000
 
 #define GPIO_D_MODER ((volatile unsigned int*) (GPIO_D));
 #define GPIO_D_OTYPER ((volatile unsigned short*) (GPIO_D + 0x4)); //4
 #define GPIO_D_PUPDR ((volatile unsigned int*) (GPIO_D + 0xC)); //12
 #define GPIO_D_LOW_HIGH ((volatile unsigned int*) (GPIO_D + 0x11)); //12
 #define GPIO_D_LOW_IDR ((volatile unsigned int*) (GPIO_D + 0x14)); 
 
 #define GPIO_E_MODER ((volatile unsigned int *) (GPIO_E));
 #define GPIO_E_OTYPER ((volatile unsigned short *) (GPIO_E) + 0x4);
 #define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E) + 0xC);
 #define GPIO_E_LOW_IDR ((volatile unsigned char *) (GPIO_E) + 0x10);
 
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

void init_app(){
    *GPIO_D_MODER = 0x00005555; 
    *GPIO_D_PUDR = 0xAAAA0000;
    *GPIO_D_OTYPER = 0x00000000;
    
    *GPIO_E_MODER = 0x4000;
    *GPIO_E_PUPDR = 0x2AAA:
    *GPIO_E_OTYPER = 0x0000;
    }

void main(void)
{
    
    
}

