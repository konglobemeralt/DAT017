/*
 * 	startup.c
 *
 */
#include "registers.h"

volatile unsigned int counter = 0;

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

void interruptHandler(){
        counter ++;
        *EXTI_PR |= 0x00000004; 
    }
    
void application_init(){
    // Setup hex display
	*GPIO_D_MODER &= 0xFFFF0000;
	*GPIO_D_MODER |= 0x00005555;
	
	// Setup E as input
	*GPIO_E_MODER = 0;
	
	// Setup PE3 to EXTICR1
	*SYSCFG_EXTICR1 &= 0xFFFF0FFF; 
	*SYSCFG_EXTICR1 |= 0x00004000; 
	
	// Setup EXTI for PE3
	*EXTI_IMR |= 0x08;
	*EXTI_FTSR |= 0x08;
	
	// Setup EXTI3 interrupt function
	*((void (**)(void)) 0x2001C064) = interruptHandler;
	
	// Enable EXTI3 in NVIC
	*((unsigned int *) 0xE000E100) |= (1<<9);
    }
    
void main(void){
    application_init();
	while(1) {
		*GPIO_D_ODR_LOW = counter++;
	}
}

