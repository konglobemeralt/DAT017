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
        //Continue executing code efficently.
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

#endif