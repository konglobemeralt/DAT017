/*
 * 	startup.c
 *
 */
 
 #define GPIO_D 0x40020C00
 
 #define GPIO_D_MODER ((volatile unsigned int *) (GPIO_D))
 #define GPIO_D_OTYPER ((volatile unsigned short *) (GPIO_D) + 0x4)
 
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
    *GPIO_D_MODER &= ~3; // set till 00
    *GPIO_D_MODER |= 1;   // set till x1
    *GPIO_D_OTYPER &= ~1;   //set to x0
    }

void main(void)
{
}

