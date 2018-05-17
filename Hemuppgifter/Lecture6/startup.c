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

void irq_handler ( void )
{
	// Om avbrott från EXTI2:
		 // kvittera avbrott från EXTI2 */
}

void app_init ( void )
{
	// Koppla PE2 till avbrottslina EXTI2;

	// Konfigurera EXTI2 för att generera avbrott;
	// Konfigurera för avbrott på negativ flank
	
	// Sätt upp avbrottsvektor
     
   	// Konfigurera de bitar i NVIC som kontrollerar den avbrottslina som EXTI2 kopplats till
}

void main(void)
{
}

