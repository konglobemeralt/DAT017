#define B_E         0x40
#define B_SELECT    4
#define B_RW        2
#define B_RS        1

#define GPIO_E 0x40021000

#define portModer((volatile)unsigned int* (GPIO_E))
#define portOutput ((volatile)unsigned short* (GPIO_E) + 0x04)
#define portldr ((volatile)unsigned short* (GPIO_E) + 0x10)
#define portldrLow ((volatile)unsigned short* (GPIO_E) + 0x10)
#define portldrHigh ((volatile)unsigned char* (GPIO_E) + 0x11)
#define portOdrLow ((volatile)unsigned char* (GPIO_E) + 0x14)
#define portOdrHigh ((volatile)unsigned char* (GPIO_E) + 0x15)

*portOdrLow &= ~B_RW;
delay(tsul);
*portOdrHigh = data;
delay(tw);
*portOdrLow &= ~B_E;
delay(tc-tw);


