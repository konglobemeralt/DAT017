/*
 * 	startup.c
 *
 */
#ifdef SIMULATOR
#define DELAY_COUNT 100
#else
#define DELAY_COUNT 1000000
#endif
 
 // Port E setup
#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))

// Port D setup
#define GPIOD_D 0x40020C00
#define GPIOD_MODER ((volatile unsigned int *) (GPIOD_D))
#define GPIOD_OTYPER ((volatile unsigned short *) (GPIOD_D+0x4))
#define GPIOD_PUPDR ((volatile unsigned int *) (GPIOD_D+0xC))
#define GPIOD_IDR_LOW ((volatile unsigned char *) (GPIOD_D+0x10))
#define GPIOD_IDR_HIGH ((volatile unsigned char *) (GPIOD_D+0x11))
#define GPIOD_ODR_LOW ((volatile unsigned char *) (GPIOD_D+0x14))
#define GPIOD_ODR_HIGH ((volatile unsigned char *) (GPIOD_D+0x15))

#define STK_CTR ((volatile unsigned int *) 0xE000E010);
#define STK_LOAD ((volatile unsigned int *) STK_CTR + 0x04);
#define STK_VAL ((volatile unsigned int *) STK_CTR + 0x08);


#include "delay.h"

unsigned char systick_flag = 0; 
unsigned char delay_count = 0;

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

void systick_irq_handler(){
    //deaktivera flaggan
    systick_flag = 1;
    }

void delay_1micro(){
    systick_flag = 0;
    *STK_CTR = 0;
    *STK_LOAD = 48 * 4;
    *STK_VAL = 0;
    *STK_CTRL = 0x07;
    }
    
void delay(unsigned int delayCount){
    systick_flag = 0;
	delay_count = count;
	delay_1micro();
    }
    

void init_app(){
    *GPIO_MODER &= 0xFFFF0000;
	*GPIO_MODER |= 0x00005555;
    *((void (**) (void)) 0x2001C03C) = systick_irq_handler;
    }

void main(void)
{
    unsigned int delaySync = 0;
    
    init_app();
    *GPIOD_ODR_LOW = 0;
    delay( DELAY_COUNT );
    *GPIOD_ODR_LOW = 0xFF;
    
    while(1){
        if ( systick_flag == 1 ) 
            break;
            //kod som utfors under vantetiden  
        }      
        //Kod som vantar p[ timeout
            *GPIOD_ODR_LOW = 0;
    }


