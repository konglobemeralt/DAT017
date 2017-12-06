
#include "registers.h"

#define EXTI3_IRQVEC ((void (**) (void)) 0x2001C064)
#define EXTI2_IRQVEC ((void (**) (void)) 0x2001C060)
#define EXTI1_IRQVEC ((void (**) (void)) 0x2001C05C)
#define EXTI0_IRQVEC ((void (**) (void)) 0x2001C058)

#define NVIC_ISER0 ((volatile unsigned int *) 0xE000E100)
#define NVIC_EXTI3_IRQ_BPOS (1<<9)
#define NVIC_EXTI2_IRQ_BPOS (1<<8)
#define NVIC_EXTI1_IRQ_BPOS (1<<7)
#define NVIC_EXTI0_IRQ_BPOS (1<<6)

#define EXTI3_IRQ_BPOS (1<<3)
#define EXTI2_IRQ_BPOS (1<<2)
#define EXTI1_IRQ_BPOS (1<<1)
#define EXTI0_IRQ_BPOS (1<<0)

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

void IRQ_0(void) {
	counter++;
	*EXTI_PR |= EXTI0_IRQ_BPOS;
}
void IRQ_1(void) {
	counter = 0;
	*EXTI_PR |= EXTI1_IRQ_BPOS;
}
void IRQ_2(void) {
	counter = ~counter;
	*EXTI_PR |= EXTI2_IRQ_BPOS;
}

void init_app(void) {
	// Setup hex display
	*GPIO_D_MODER &= 0xFFFF0000;
	*GPIO_D_MODER |= 0x00005555;
	
	// Setup E as input
	*GPIO_E_MODER = 0;
	
	// Setup PE2,PE1,PE0 to EXTICR1
	*SYSCFG_EXTICR1 &= 0xFFFFF000; 
	*SYSCFG_EXTICR1 |= 0x00000444;
	
	// Setup EXTI for PE2,PE1,PE0
	*EXTI_IMR |= (EXTI2_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI0_IRQ_BPOS);
	*EXTI_FTSR |= (EXTI2_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI0_IRQ_BPOS);
	
	// Setup EXTI2,EXTI1,EXTI0 interrupt function
	*((void (**)(void)) EXTI2_IRQVEC) = IRQ_2;
	*((void (**)(void)) EXTI1_IRQVEC) = IRQ_1;
	*((void (**)(void)) EXTI0_IRQVEC) = IRQ_0;

	// Enable EXTI2,EXTI1,EXTI0 in NVIC
	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI2_IRQ_BPOS;
	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI1_IRQ_BPOS;
	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI0_IRQ_BPOS;
}
 
void main(void) {
	init_app();
	while(1) {
		*GPIO_D_ODR_LOW = counter;
	}
}
