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

#define LCD_ON  0x3F
#define LCD_OFF 0x3E
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_DISP_START 0xC0
#define LCD_BUSY 0x80

#define PAGE 8
#define ADD 63

#define SIMULATOR

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
    }
    
void select_controller(uint8_t controller){
    if(controller == 0) {
            graphics_ctrl_bit_clear(B_CS1);
            graphics_ctrl_bit_clear(B_CS2);
        } else if(controller == (B_CS1 | B_CS2)) {
            graphics_ctrl_bit_set(B_CS1);
            graphics_ctrl_bit_set(B_CS2);
        } else if(controller == B_CS1) {
            graphics_ctrl_bit_set(B_CS1);
            graphics_ctrl_bit_clear(B_CS2);
        } else if(controller == B_CS2) {
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
        
        while(1) { // Wait for display not to be busy
            graphics_ctrl_bit_set(B_E);
            delay500ns();
            graphics_ctrl_bit_clear(B_E);
            delay500ns();		
            unsigned char i = *GPIO_IDR_HIGH;
                if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
                    break;
                }
        }
        graphics_ctrl_bit_set(B_E);
        *GPIO_MODER = 0x55555555;
        
    }
    
uint8_t graphic_read(uint8_t controller){
        graphics_ctrl_bit_clear(B_E);
        *GPIO_MODER = 0x00005555;
        graphics_ctrl_bit_set(B_RS);
        graphics_ctrl_bit_set(B_RW);
        select_controller(controller);
        delay500ns();
        graphics_ctrl_bit_set(B_E);
        delay500ns();
        uint8_t RV = *GPIO_IDR_HIGH;
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
        *GPIO_ODR_HIGH = value;
        select_controller(controller);
        delay500ns();
        graphics_ctrl_bit_set(B_E);
        delay500ns();
        graphics_ctrl_bit_clear(B_E);
        
        if(controller & B_CS1){
            select_controller(B_CS1);
            graphic_wait_ready();
        }
        
        if(controller & B_CS2){
            select_controller(B_CS2);
            graphic_wait_ready();     
        }
        
        *GPIO_ODR_HIGH = 0;
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
        graphic_write(data, controller);
    }

uint8_t graphics_read_data(uint8_t controller){
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

void delay_milli(unsigned int ms) {
	#ifdef SIMULATOR
		delay_micro(ms);
	#else
		delay_micro(1000 * ms);
	#endif
}

void init_app(void){
        *GPIO_MODER = 0x55555555;
        
    }
    
void graphic_initialize(void){
     graphics_ctrl_bit_set(B_E);
     delay_micro(10);
     graphics_ctrl_bit_clear(B_CS1);
     graphics_ctrl_bit_clear(B_CS2);
     graphics_ctrl_bit_clear(B_RST);
     graphics_ctrl_bit_clear(B_E);
     delay_milli(30);
     graphics_ctrl_bit_set(B_RST);
     graphic_write_command(LCD_OFF, B_CS1|B_CS2);
     graphic_write_command(LCD_ON, B_CS1|B_CS2);
     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
     select_controller(0);
    }
    
void graphics_clear_screen(void){
    for(int page = 0; page < PAGE; page++){
        graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
        graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
        for(int add = 0; add < ADD; add++){
            graphic_write_data(0, B_CS1|B_CS2);
            }
        }
    
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

