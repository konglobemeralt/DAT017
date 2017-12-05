/*
 * 	delay.h
 *
 */
// Timer setup
#ifndef TIMER_H
#define TIMER_H

#define STK 0xE000E010
#define STK_CTRL ((volatile unsigned int *) (STK))
#define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
#define STK_VAL ((volatile unsigned int *) (STK + 0x8))

//Start adress
#define SYS_TICK_ADDRESS 0xE000E010

//nextlevl struct 
typedef struct {
	unsigned char 		    CTRL;
	const unsigned char 	RES_CTRL1;
	unsigned char 		    CTRL_COUNT;
	const unsigned char 	RES_CTRL2;	
	unsigned int  		    LOAD;
	unsigned int  		    VAL;
} systick;

typedef volatile systick* SysTickPtr;
#define SYS_TICK (*((SysTickPtr) SYS_TICK_ADDRESS))

static unsigned char systick_flag;

static volatile unsigned int delay_counter;

void delay_250ns(void) {
	*STK_CTRL = 0;
	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
	*STK_VAL = 0;
	*STK_CTRL = 5;
	while((*STK_CTRL & 0x10000) == 0) {
		// ??????
	}
	*STK_CTRL = 0;
}

void delay500ns(){
    //Delay 500ns in the most efficient way:
        delay_250ns();
        delay_250ns();
        //Continue executing code efficently/.
        }

void delay_micro(unsigned int us) {
	while(us--) {
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void delay_milli(unsigned int ms) {
	#ifdef SIMULATOR
		delay_micro(ms);
	#else
		delay_micro(1000 * ms);
	#endif
}

void delay_1micro(void)
{
	SYS_TICK.CTRL = 0;
	SYS_TICK.CTRL_COUNT = 0;
	SYS_TICK.VAL = 0;
	SYS_TICK.LOAD = 167;
	SYS_TICK.CTRL = 0x07;
}

void delay(unsigned int counter)
{
	delay_counter = counter;
	systick_flag = 0;
	delay_1micro();
}

#endif