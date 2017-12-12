#include "delay.h"

void ascii_ctrl_bit_set(unsigned int x) {
	switch(x) {
		case 0: *GPIO_D_ODR_LOW |= 1; break;
		case 1: *GPIO_D_ODR_LOW |= 2; break;
		case 2: *GPIO_D_ODR_LOW |= 4; break;
		case 3: *GPIO_D_ODR_LOW |= 8; break;
		case 4: *GPIO_D_ODR_LOW |= 16; break;
		case 5: *GPIO_D_ODR_LOW |= 32; break;
		case 6: *GPIO_D_ODR_LOW |= 64; break;
		case 7: *GPIO_D_ODR_LOW |= 128; break;
    }
}

void ascii_ctrl_bit_clear(unsigned int x) {
	switch(x) {
		case(0): *GPIO_D_ODR_LOW &= 0xFE; break;
		case(1): *GPIO_D_ODR_LOW &= 0xFD; break;
		case(2): *GPIO_D_ODR_LOW &= 0xFB; break;
		case(3): *GPIO_D_ODR_LOW &= 0xF7; break;
		case(4): *GPIO_D_ODR_LOW &= 0xEF; break;
		case(5): *GPIO_D_ODR_LOW &= 0xDF; break;
		case(6): *GPIO_D_ODR_LOW &= 0xBF; break;
		case(7): *GPIO_D_ODR_LOW &= 0x7F; break;
	}
}
void ascii_write_controller( unsigned char c ) {
    ascii_ctrl_bit_set(B_E);
	*GPIO_D_ODR_HIGH = c;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);
}

unsigned char ascii_read_controller( void )
{
    ascii_ctrl_bit_set(B_E);
	delay_250ns();
	delay_250ns();
	unsigned char rv = *GPIO_D_IDR_HIGH;
	ascii_ctrl_bit_clear(B_E);
	return rv;
}

void ascii_write_cmd(unsigned char command){
    ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(command);
    }
    
void ascii_write_data(unsigned char data){
    ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}

unsigned char ascii_read_status(void){
    *GPIO_D_MODER &= 0x0000FFFF;	
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_set(B_RW);
	unsigned char rv = ascii_read_controller();
	*GPIO_D_MODER &= 0x0000FFFF;
	*GPIO_D_MODER |= 0x55550000;	
	return rv;
    }
    
unsigned char ascii_read_data(void){
    *GPIO_D_MODER &= 0x0000FFFF;	
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	unsigned char rv = ascii_read_controller();
	*GPIO_D_MODER &= 0x0000FFFF;
	*GPIO_D_MODER |= 0x55550000;	
	return rv;
    }
    
void ascii_command(char command, unsigned int delayMicroSec){
    while((ascii_read_status() & 0x80) == 0x80) {
            //TODO implement pip subroutine
        }
    delay_micro(8);
    ascii_write_cmd(command);
    delay_micro(delayMicroSec);
    }
	
void ascii_init(void){
        ascii_ctrl_bit_set(B_SELECT);
        ascii_command(0x38, 40); //Set disp size, delay 40 ms
        ascii_command(0xE, 40); //delay set to 40 bcs DR.eHugo
        ascii_command(0x01, 1530); // Cls
        ascii_command(0x6, 40); // Inc
}


void kbdActivate(unsigned int row){
    switch(row)
        {
            //activate row N or deactivate with 0 
            case 1: *GPIO_D_ODR_HIGH = 0x10; break;
            case 2: *GPIO_D_ODR_HIGH = 0x20; break;
            case 3: *GPIO_D_ODR_HIGH = 0x40; break;
            case 4: *GPIO_D_ODR_HIGH = 0x80; break;
            case 0: *GPIO_D_ODR_HIGH = 0x00; break;
        }
    
    }
    
int kdbGetCol(void){
        unsigned char idr;
        idr = *GPIO_D_IDR_HIGH;
        
        if(idr & 0x8) return 4;
        if(idr & 0x4) return 3;
        if(idr & 0x2) return 2;
        if(idr & 0x1) return 1;
        return 0;
    }
    
void outSeg7(unsigned char in)
    {
        
        if(in == 0x0) *GPIO_D_ODR_LOW = 0x3F;
        if(in == 0x1) *GPIO_D_ODR_LOW = 0x06;
        if(in == 0x2) *GPIO_D_ODR_LOW = 0x5B;
        if(in == 0x3) *GPIO_D_ODR_LOW = 0x4F;
        if(in == 0x4) *GPIO_D_ODR_LOW = 0x66;
        if(in == 0x5) *GPIO_D_ODR_LOW = 0x6D;
        if(in == 0x6) *GPIO_D_ODR_LOW = 0x7D;
        if(in == 0x7) *GPIO_D_ODR_LOW = 0x07;
        if(in == 0x8) *GPIO_D_ODR_LOW = 0x7F;
        if(in == 0x9) *GPIO_D_ODR_LOW = 0x67;
        if(in == 0xA) *GPIO_D_ODR_LOW = 0x77;
        if(in == 0xB) *GPIO_D_ODR_LOW = 0x7F;
        if(in == 0xC) *GPIO_D_ODR_LOW = 0xFF;
        if(in == 0xD) *GPIO_D_ODR_LOW = 0xBF;
        if(in == 0xE) *GPIO_D_ODR_LOW = 0x79;
        if(in == 0xF) *GPIO_D_ODR_LOW = 0x71;
	else *GPIO_D_ODR_LOW = 0x00;
        
    }
	
unsigned char keyb(void){
        unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
        int row, col;
        for(row = 1; row <= 4; row++)
            {
            kbdActivate(row);
			delay_250ns();
            if(col = kdbGetCol())
                {
                kbdActivate(0);
                return key[4*(row-1) + (col-1)];
                }
            }
        kbdActivate(0);
        return 0xFF;
}
    
	
//Array read keyboard
/*
unsigned char *keyb(void){
        unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
		static unsigned char returnKeys[4] = {0xFF,0xFF,0xFF,0xFF};
        int row, col;
        for(row = 1; row <= 4; row++)
            {
            kbdActivate(row);
			delay_250ns();
				if(col = kdbGetCol() )
					{
						kbdActivate(0);
						returnKeys[row-3] = key[4 * (row - 1) + (col - 1)];
					}
				}
        kbdActivate(0);
        return returnKeys;
}
*/