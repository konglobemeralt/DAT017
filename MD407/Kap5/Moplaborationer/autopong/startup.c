/*
 * 	startup.c
 *
 */
// Port E setup
#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))

#define SIMULATOR

#include "delay.h"
#include "graphics.h"
#include "object.h"
#include "ball.h"

extern OBJECT ball;

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
 

void init_app(void){
        *GPIO_MODER = 0x55555555;
    }

void main(void)
{
     init_app();
    graphic_initialize();
    #ifndef SIMULATOR
        graphics_clear_screen();
    #endif

    POBJECT p = &ball;
    p->set_speed(p, 4, 4);
    while(1){
        p->move(p);
        delay_milli(40);
        
        }
    
}    

