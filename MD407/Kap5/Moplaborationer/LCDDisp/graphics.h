/*
 * 	graphics.h
 *
 */

// Control for display
#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01

#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08

#define LCD_ON 0x3F
#define LCD_OFF 0x3E
#define LCD_DISP_START 0xC0
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_BUSY 0x80

#define PAGE 8
#define ADD 63

typedef unsigned char uint8_t;

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


