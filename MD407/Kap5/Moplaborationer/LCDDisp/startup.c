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

    graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
    graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
    graphic_write_data(0xFF, B_CS1 | B_CS2);
    
    //Rita horisontell linje
    for(int i=0; i < 128; i++){
        pixel(i, 10, 1);
    }
    //Rita vertikal linje
    for(int i=0; i < 64; i++){
        pixel(10, i, 1);
    }
    
    delay500ns();
    
      //Sudda horisontell linje
    for(int i=0; i < 128; i++){
        pixel(i, 10, 0);
    }
    //sudda vertikal linje
    for(int i=0; i < 64; i++){
        pixel(10, i, 0);
    }
    
}    

