/*
 * 	startup.c
 *
 */
// Timer setup
#define STK 0xE000E010
#define STK_CTRL ((volatile unsigned int *) (STK))
#define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
#define STK_VAL ((volatile unsigned int *) (STK + 0x8))

// Port E setup
#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))

// AciiiDisplay values
#define B_E 6
#define B_SELECT 4
#define B_RW 1
#define B_RS 0

#define B_RST   32
#define B_CS2   16
#define B_CS1   8

typedef unsigned char uint8_t;

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

void graphics_ctrl_bit_set(uint8_t x){
    *GPIO_ODR_LOW |= (x & ~B_SELECT);
    }

void graphics_ctrl_bit_clear(uint8_t x){
        *GPIO_ODR_LOW &= ~x;
    
void select_controller(uint8_t controller){
        if(controller == 0){
            graphics_ctrl_bit_clear(B_CS1);
            graphics_ctrl_bit_clear(B_CS2);
            }
        else if(B_CS1 | B_CS2){
            graphics_ctrl_bit_set(B_CS1);
            graphics_ctrl_bit_set(B_CS2);
            }
        if(controller == B_CS1){
            graphics_ctrl_bit_set(B_CS1);
            graphics_ctrl_bit_clear(B_CS2);
            }
        if(controller == B_CS2){
            graphics_ctrl_bit_clear(B_CS1);
            graphics_ctrl_bit_set(B_CS2);
            }
    }
    
void graphic_wait_ready(){
        graphics_ctrl_bit_clear(B_E);
        *GPIO_MODER = 0x00005555;
        graphics_ctrl_bit_clear(B_RS);
        graphics_ctrl_bit_set(B_RW);
        delay500ns();
        while(GPIO_IDR_HIGH & 0x80){ //Check if LCD busy
                graphics_ctrl_bit_set(B_E);
                delay500ns();
                graphics_ctrl_bit_clear(B_E);
                delay500ns();
            }
        graphics_crtl_bit_set(B_E);
        *GPIO_MODER = 0x55555555;
        
    }
char graphic_read(uint8_t controller){
        graphics_ctrl_bit_clear(B_E);
        *GPIO_MODER = 0x00005555;
        graphics_ctrl_bit_set(B_RS);
        graphics_ctrl_bit_set(B_RW);
        select_controller(controller);
        delay500ns();
        graphics_ctrl_bit_set(B_E);
        delay500ns();
        char RV = *GPIO_IDR_HIGH;
        graphics_ctrl_bit_clear(B_E);
        *GPIO_MODER = 0x55555555;
        if(controller == B_CS1){
            select_controller(B_CS1);
            graphic_wait_ready();
            }
            
        if(controller == B_CS2){
            select_controller(B_CS2);
            graphic_wait_ready();
            }
        
        return RV;
        
    }
    
void graphic_write(uint8_t value, uint8_t controller){
        *GPIO_IDR_HIGH = value;
        select_controller(controller);
        delay500ns();
        graphics_ctrl_bit_set(B_E);
        dalay500ns();
        graphics_ctrl_bit_clear(B_E);
        
        if(controller | B_CS1){
            select_controller(B_CS1);
            graphic_wait_ready();
        }
        
        if(controller | B_CS2){
            select_controller(B_CS2);
            graphic_wait_ready();     
        }
        
        *GPIO_IDR_HIGH = 0;
        graphics_ctrl_bit_set(B_E);
        select_controller(0);
    }
    
void graphic_write_command(uint8_t command, uint8_t controller){
        graphics_ctrl_bit_clear(B_E);
        select_controller(controller);
        graphics_ctrl_bit_clear(B_RS);
        graphics_ctrl_bit_clear(B_RW);
        graphic_write(command, controller);
    }
    
void graphic_write_data(uint8_t data, uint8_t controller){
        graphics_ctrl_bit_clear(B_E);
        select_controller(controller);
        graphics_ctrl_bit_set(B_RS);
        graphics_ctrl_bit_clear(B_RW);
        graphic_write(command, controller);
    }

void graphics_read_data(uint8_t controller){
        (void) graphic_read(controller);
        return graphic_read(controller);
    }

void delay_micro(unsigned int us) {
	while(us--) {
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void init_app(void){
    
    }
    
void graphic_initialize(void){
     graphics_ctrl_bit_set(B_E);
     delay_micro(10);
     graphic_initialize
    }

void main(void)
{
}    
    

//void ascii_ctrl_bit_set(unsigned char x){
//    unsigned char c;
//    c = *GPIO_ODR_LOW;
//    c |= (B_SELECT | x);
//    *portOdrLow = c;
//}
 
/*addressera ASCII-display och nollställ de bitar som är 1 i x */
//void ascii_ctrl_bit_clear(unsigned char x){
//    unsigned char c;
//    c = *portOdrLow;
//    c = B_SELECT | (c&~x);
//    *portOdrLow = c;
//}

