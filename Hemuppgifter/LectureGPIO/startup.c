#define GPIO_D 0x40020C00

#define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
/*
 * 	startup.c
 *
 */
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

void init_app()
    {
        *GPIO_MODER &= ~3;  // ~3 = 1100 vilket andat med vad som nollstaller bit 0 och 1
        *GPIO_MODER |= 1;  // or med 0001 vilket satter bit 0 till en etta. 
        *GPIO_OTYPER &= ~1; // set bit 0 to 0 in otyper.
    
    }

void main(void)
{
}

