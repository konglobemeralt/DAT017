/*
 * 	startup.c
 *
 */
#define SIMULATOR

#include "registers.h"
#include "delay.h"
#include "graphics.h"
#include "object.h"
#include "ball.h"
#include "paddle.h"
 
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
        *GPIO_E_MODER = 0x55555555;
    }

void main(void)
{
    init_app();
    graphic_initialize();
    #ifndef SIMULATOR
        graphics_clear_screen();
    #endif

    
    POBJECT p = &ball;
    POBJECT Lpad = &Lpaddle;
    POBJECT Rpad = &Rpaddle;
    
    p->set_speed(p, 4, 4);
    
    while(1){
        p->move(p);
        delay_milli(40);
        Lpad->move(Lpad);
        Rpad->move(Rpad);
        }
    
}    


