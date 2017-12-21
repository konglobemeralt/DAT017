/*
 * 	startup.c
 *
 */
#define SIMULATOR

#include "registers.h"
#include "graphics.h"
#include "keypad.h"
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
        *GPIO_E_MODER = 0x55555555;
        
        *GPIO_D_MODER = 0x55555555;
        
        *GPIO_D_MODER = 0x55005555;
     //set all bits as push pull
        *GPIO_D_OTYPER &= 0x0000FFFF;   
        *GPIO_D_OTYPER |= 0x00000000;   
     //
     //PORT_PUPDR = 0xzz55zzzz;   
        *GPIO_D_PUPDR = 0x00AA0000;   
    }
	
void movePaddles(unsigned char c){
	if(c == 1){Lpaddle.posY--; }
	if(c == 4){Lpaddle.posY++; }
	
	if(c == 3){Rpaddle.posY--; }
	if(c == 6){Rpaddle.posY++; }
	
	}
    
void writeScore(){
    char *s;
	char test1[] = "Player1: ";
	char test2[] = "Player2: ";
    
    //init_app();
    ascii_init();
	goToXY(1,1);
	
	s = test1;
	while(*s) {
		ascii_write_char(*s++);
	}
	goToXY(1,2);
	s = test2;
	while(*s) {
		ascii_write_char(*s++);
	}
    
    }

	
//void movePaddles(unsigned char player1, unsigned char player2){
//	if(player1 == 1){Lpaddle.posY--; }
//	if(player1 == 4){Lpaddle.posY++; }
	
//	if(player2 == 3){Rpaddle.posY--; }
//	if(player2 == 6){Rpaddle.posY++; }
	
//	}

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
        
        //writeScore();
		
        //array move
		movePaddles(keyb());
		//unsigned char c = keyb()[1];
		//movePaddles(keyb()[0], keyb()[2] );

        p->move(p);
        Lpad->move(Lpad);
        Rpad->move(Rpad);

        delay_milli(40);
        graphics_clear_screen();
        }
    
}    


