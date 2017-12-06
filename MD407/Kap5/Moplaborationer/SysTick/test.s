   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #ifdef SIMULATOR
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define DELAY_COUNT 100
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #else
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define DELAY_COUNT 1000000
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #endif
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****  
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****  // Port E setup
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_E 0x40021000
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** // Port D setup
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_D 0x40020C00
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_MODER ((volatile unsigned int *) (GPIOD_D))
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_OTYPER ((volatile unsigned short *) (GPIOD_D+0x4))
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_PUPDR ((volatile unsigned int *) (GPIOD_D+0xC))
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_IDR_LOW ((volatile unsigned char *) (GPIOD_D+0x10))
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_IDR_HIGH ((volatile unsigned char *) (GPIOD_D+0x11))
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_ODR_LOW ((volatile unsigned char *) (GPIOD_D+0x14))
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIOD_ODR_HIGH ((volatile unsigned char *) (GPIOD_D+0x15))
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #include "delay.h"
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** extern unsigned char systick_flag; 
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void startup ( void )
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** {
  26              		.loc 1 38 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** asm volatile(
  31              		.loc 1 39 0
  32              		.syntax divided
  33              	@ 39 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" MOV SP,R0\n"
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" BL main\n"				/* call main */
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	".L1: B .L1\n"				/* never return */
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	) ;
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
  40              		.loc 1 45 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	systick_irq_handler
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	systick_irq_handler:
  56              	.LFB1:
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void systick_irq_handler(){
  57              		.loc 1 47 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     //deaktivera flaggan
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     systick_flag = 0;
  67              		.loc 1 49 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 0022     		movs	r2, #0
  70 0008 1A70     		strb	r2, [r3]
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     }
  71              		.loc 1 50 0
  72 000a C046     		nop
  73 000c BD46     		mov	sp, r7
  74              		@ sp needed
  75 000e 80BD     		pop	{r7, pc}
  76              	.L4:
  77              		.align	2
  78              	.L3:
  79 0010 00000000 		.word	systick_flag
  80              		.cfi_endproc
  81              	.LFE1:
  83              		.align	1
  84              		.global	init_app
  85              		.syntax unified
  86              		.code	16
  87              		.thumb_func
  88              		.fpu softvfp
  90              	init_app:
  91              	.LFB2:
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void init_app(){
  92              		.loc 1 53 0
  93              		.cfi_startproc
  94              		@ args = 0, pretend = 0, frame = 0
  95              		@ frame_needed = 1, uses_anonymous_args = 0
  96 0014 80B5     		push	{r7, lr}
  97              		.cfi_def_cfa_offset 8
  98              		.cfi_offset 7, -8
  99              		.cfi_offset 14, -4
 100 0016 00AF     		add	r7, sp, #0
 101              		.cfi_def_cfa_register 7
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_MODER = 0x55555555;
 102              		.loc 1 54 0
 103 0018 044B     		ldr	r3, .L6
 104 001a 054A     		ldr	r2, .L6+4
 105 001c 1A60     		str	r2, [r3]
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *((void (**) (void)) 0x2001C03C) = systick_irq_handler;
 106              		.loc 1 55 0
 107 001e 054B     		ldr	r3, .L6+8
 108 0020 054A     		ldr	r2, .L6+12
 109 0022 1A60     		str	r2, [r3]
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     }
 110              		.loc 1 56 0
 111 0024 C046     		nop
 112 0026 BD46     		mov	sp, r7
 113              		@ sp needed
 114 0028 80BD     		pop	{r7, pc}
 115              	.L7:
 116 002a C046     		.align	2
 117              	.L6:
 118 002c 000C0240 		.word	1073875968
 119 0030 55555555 		.word	1431655765
 120 0034 3CC00120 		.word	536985660
 121 0038 00000000 		.word	systick_irq_handler
 122              		.cfi_endproc
 123              	.LFE2:
 125              		.align	1
 126              		.global	main
 127              		.syntax unified
 128              		.code	16
 129              		.thumb_func
 130              		.fpu softvfp
 132              	main:
 133              	.LFB3:
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void main(void)
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** {
 134              		.loc 1 59 0
 135              		.cfi_startproc
 136              		@ args = 0, pretend = 0, frame = 8
 137              		@ frame_needed = 1, uses_anonymous_args = 0
 138 003c 80B5     		push	{r7, lr}
 139              		.cfi_def_cfa_offset 8
 140              		.cfi_offset 7, -8
 141              		.cfi_offset 14, -4
 142 003e 82B0     		sub	sp, sp, #8
 143              		.cfi_def_cfa_offset 16
 144 0040 00AF     		add	r7, sp, #0
 145              		.cfi_def_cfa_register 7
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     unsigned int delaySync = 0;
 146              		.loc 1 60 0
 147 0042 0023     		movs	r3, #0
 148 0044 7B60     		str	r3, [r7, #4]
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     init_app();
 149              		.loc 1 62 0
 150 0046 FFF7FEFF 		bl	init_app
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_ODR_LOW = 0;
 151              		.loc 1 63 0
 152 004a 134B     		ldr	r3, .L15
 153 004c 0022     		movs	r2, #0
 154 004e 1A70     		strb	r2, [r3]
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     delay( DELAY_COUNT );
 155              		.loc 1 64 0
 156 0050 124B     		ldr	r3, .L15+4
 157 0052 1800     		movs	r0, r3
 158 0054 FFF7FEFF 		bl	delay
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_ODR_LOW = 0xFF;
 159              		.loc 1 65 0
 160 0058 0F4B     		ldr	r3, .L15
 161 005a FF22     		movs	r2, #255
 162 005c 1A70     		strb	r2, [r3]
 163              	.L12:
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     while(1){
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****         if ( systick_flag == 1 ) 
 164              		.loc 1 68 0
 165 005e 104B     		ldr	r3, .L15+8
 166 0060 1B78     		ldrb	r3, [r3]
 167 0062 012B     		cmp	r3, #1
 168 0064 0FD0     		beq	.L14
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****             break;
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****             //kod som utfors under vantetiden
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****         *GPIOD_ODR_LOW = 0xFF;
 169              		.loc 1 71 0
 170 0066 0C4B     		ldr	r3, .L15
 171 0068 FF22     		movs	r2, #255
 172 006a 1A70     		strb	r2, [r3]
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****         
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****         //Kod som vantar p[ timeout
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****         if(delaySync == 15000){
 173              		.loc 1 74 0
 174 006c 7B68     		ldr	r3, [r7, #4]
 175 006e 0D4A     		ldr	r2, .L15+12
 176 0070 9342     		cmp	r3, r2
 177 0072 04D1     		bne	.L11
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****                 *GPIOD_ODR_LOW = 0x00;
 178              		.loc 1 75 0
 179 0074 084B     		ldr	r3, .L15
 180 0076 0022     		movs	r2, #0
 181 0078 1A70     		strb	r2, [r3]
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****                 delaySync = 0;
 182              		.loc 1 76 0
 183 007a 0023     		movs	r3, #0
 184 007c 7B60     		str	r3, [r7, #4]
 185              	.L11:
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****                 
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****             }
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     delaySync++;
 186              		.loc 1 79 0
 187 007e 7B68     		ldr	r3, [r7, #4]
 188 0080 0133     		adds	r3, r3, #1
 189 0082 7B60     		str	r3, [r7, #4]
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****             break;
 190              		.loc 1 68 0
 191 0084 EBE7     		b	.L12
 192              	.L14:
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****             //kod som utfors under vantetiden
 193              		.loc 1 69 0
 194 0086 C046     		nop
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     }
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_ODR_LOW = 0;
 195              		.loc 1 81 0
 196 0088 034B     		ldr	r3, .L15
 197 008a 0022     		movs	r2, #0
 198 008c 1A70     		strb	r2, [r3]
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
 199              		.loc 1 82 0
 200 008e C046     		nop
 201 0090 BD46     		mov	sp, r7
 202 0092 02B0     		add	sp, sp, #8
 203              		@ sp needed
 204 0094 80BD     		pop	{r7, pc}
 205              	.L16:
 206 0096 C046     		.align	2
 207              	.L15:
 208 0098 140C0240 		.word	1073875988
 209 009c 40420F00 		.word	1000000
 210 00a0 00000000 		.word	systick_flag
 211 00a4 983A0000 		.word	15000
 212              		.cfi_endproc
 213              	.LFE3:
 215              	.Letext0:
