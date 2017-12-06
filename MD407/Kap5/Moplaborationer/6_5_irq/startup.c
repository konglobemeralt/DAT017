
#include "registers.h"

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

volatile unsigned char counter  = 0;

void interrupt_handler(void) {
	if(*EXTI_PR & 0x08) {
		// IRQ0
		if(*EXTI_PR & 0x01) {
			counter++;
			*EXTI_PR |= 0x01;
		}
		// IRQ1
		else if(*EXTI_PR & 0x02) {
			counter = 0;
			*EXTI_PR |= 0x02;
		}
		// IRQ2
		else if(*EXTI_PR & 0x04) {
			counter = ~counter;
			*EXTI_PR |= 0x04;
		}
		*EXTI_PR |= 0x08;
	}
	
}

void init_app(void) {
	// Setup hex display
	*GPIO_D_MODER &= 0xFFFF0000;
	*GPIO_D_MODER |= 0x00005555;
	
	// Setup E as input
	*GPIO_E_MODER = 0;
	
	// Setup PE3,PE2,PE1,PE0 to EXTICR1
	*SYSCFG_EXTICR1 &= 0xFFFF0000; 
	*SYSCFG_EXTICR1 |= 0x00004444;
	
	// Setup EXTI for P3,PE2,PE1,PE0
	*EXTI_IMR |= 0x0F;
	*EXTI_FTSR |= 0x0F;
	
	// Setup EXTI2,EXTI1,EXTI0 interrupt function
	*((void (**)(void)) 0x2001C064) = interrupt_handler;

	// Enable EXT13,EXTI2,EXTI1,EXTI0 in NVIC
	*((unsigned int *) 0xE000E100) |= (1<<9);
	*((unsigned int *) 0xE000E100) |= (1<<8);
	*((unsigned int *) 0xE000E100) |= (1<<7);
	*((unsigned int *) 0xE000E100) |= (1<<6);
}
 
void main(void) {
	init_app();
	while(1) {
		*GPIO_D_ODR_LOW = counter;
	}
}
