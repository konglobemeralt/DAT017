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
  15              		.align	1
  16              		.global	delay_250ns
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	delay_250ns:
  23              	.LFB0:
  24              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****  * 	delay.h
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** // Timer setup
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** #ifndef TIMER_H
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** #define TIMER_H
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** #define STK 0xE000E010
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** #define STK_CTRL ((volatile unsigned int *) (STK))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** void delay_250ns(void) {
  25              		.loc 1 14 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 00AF     		add	r7, sp, #0
  34              		.cfi_def_cfa_register 7
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	*STK_CTRL = 0;
  35              		.loc 1 15 0
  36 0004 0C4B     		ldr	r3, .L3
  37 0006 0022     		movs	r2, #0
  38 0008 1A60     		str	r2, [r3]
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  39              		.loc 1 16 0
  40 000a 0C4B     		ldr	r3, .L3+4
  41 000c 3122     		movs	r2, #49
  42 000e 1A60     		str	r2, [r3]
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	*STK_VAL = 0;
  43              		.loc 1 17 0
  44 0010 0B4B     		ldr	r3, .L3+8
  45 0012 0022     		movs	r2, #0
  46 0014 1A60     		str	r2, [r3]
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	*STK_CTRL = 5;
  47              		.loc 1 18 0
  48 0016 084B     		ldr	r3, .L3
  49 0018 0522     		movs	r2, #5
  50 001a 1A60     		str	r2, [r3]
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	while((*STK_CTRL & 0x10000) == 0) {
  51              		.loc 1 19 0
  52 001c C046     		nop
  53              	.L2:
  54              		.loc 1 19 0 is_stmt 0 discriminator 1
  55 001e 064B     		ldr	r3, .L3
  56 0020 1A68     		ldr	r2, [r3]
  57 0022 8023     		movs	r3, #128
  58 0024 5B02     		lsls	r3, r3, #9
  59 0026 1340     		ands	r3, r2
  60 0028 F9D0     		beq	.L2
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		// ??????
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	}
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	*STK_CTRL = 0;
  61              		.loc 1 22 0 is_stmt 1
  62 002a 034B     		ldr	r3, .L3
  63 002c 0022     		movs	r2, #0
  64 002e 1A60     		str	r2, [r3]
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** }
  65              		.loc 1 23 0
  66 0030 C046     		nop
  67 0032 BD46     		mov	sp, r7
  68              		@ sp needed
  69 0034 80BD     		pop	{r7, pc}
  70              	.L4:
  71 0036 C046     		.align	2
  72              	.L3:
  73 0038 10E000E0 		.word	-536813552
  74 003c 14E000E0 		.word	-536813548
  75 0040 18E000E0 		.word	-536813544
  76              		.cfi_endproc
  77              	.LFE0:
  79              		.align	1
  80              		.global	delay500ns
  81              		.syntax unified
  82              		.code	16
  83              		.thumb_func
  84              		.fpu softvfp
  86              	delay500ns:
  87              	.LFB1:
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** void delay500ns(){
  88              		.loc 1 25 0
  89              		.cfi_startproc
  90              		@ args = 0, pretend = 0, frame = 0
  91              		@ frame_needed = 1, uses_anonymous_args = 0
  92 0044 80B5     		push	{r7, lr}
  93              		.cfi_def_cfa_offset 8
  94              		.cfi_offset 7, -8
  95              		.cfi_offset 14, -4
  96 0046 00AF     		add	r7, sp, #0
  97              		.cfi_def_cfa_register 7
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****     //Delay 500ns in the most efficient way:
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****         delay_250ns();
  98              		.loc 1 27 0
  99 0048 FFF7FEFF 		bl	delay_250ns
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****         delay_250ns();
 100              		.loc 1 28 0
 101 004c FFF7FEFF 		bl	delay_250ns
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****         //Continue executing code efficently.
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****         }
 102              		.loc 1 30 0
 103 0050 C046     		nop
 104 0052 BD46     		mov	sp, r7
 105              		@ sp needed
 106 0054 80BD     		pop	{r7, pc}
 107              		.cfi_endproc
 108              	.LFE1:
 110              		.align	1
 111              		.global	delay_micro
 112              		.syntax unified
 113              		.code	16
 114              		.thumb_func
 115              		.fpu softvfp
 117              	delay_micro:
 118              	.LFB2:
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** void delay_micro(unsigned int us) {
 119              		.loc 1 32 0
 120              		.cfi_startproc
 121              		@ args = 0, pretend = 0, frame = 8
 122              		@ frame_needed = 1, uses_anonymous_args = 0
 123 0056 80B5     		push	{r7, lr}
 124              		.cfi_def_cfa_offset 8
 125              		.cfi_offset 7, -8
 126              		.cfi_offset 14, -4
 127 0058 82B0     		sub	sp, sp, #8
 128              		.cfi_def_cfa_offset 16
 129 005a 00AF     		add	r7, sp, #0
 130              		.cfi_def_cfa_register 7
 131 005c 7860     		str	r0, [r7, #4]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	while(us--) {
 132              		.loc 1 33 0
 133 005e 07E0     		b	.L7
 134              	.L8:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		delay_250ns();
 135              		.loc 1 34 0
 136 0060 FFF7FEFF 		bl	delay_250ns
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		delay_250ns();
 137              		.loc 1 35 0
 138 0064 FFF7FEFF 		bl	delay_250ns
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		delay_250ns();
 139              		.loc 1 36 0
 140 0068 FFF7FEFF 		bl	delay_250ns
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		delay_250ns();
 141              		.loc 1 37 0
 142 006c FFF7FEFF 		bl	delay_250ns
 143              	.L7:
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		delay_250ns();
 144              		.loc 1 33 0
 145 0070 7B68     		ldr	r3, [r7, #4]
 146 0072 5A1E     		subs	r2, r3, #1
 147 0074 7A60     		str	r2, [r7, #4]
 148 0076 002B     		cmp	r3, #0
 149 0078 F2D1     		bne	.L8
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	}
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** }
 150              		.loc 1 39 0
 151 007a C046     		nop
 152 007c BD46     		mov	sp, r7
 153 007e 02B0     		add	sp, sp, #8
 154              		@ sp needed
 155 0080 80BD     		pop	{r7, pc}
 156              		.cfi_endproc
 157              	.LFE2:
 159              		.align	1
 160              		.global	delay_milli
 161              		.syntax unified
 162              		.code	16
 163              		.thumb_func
 164              		.fpu softvfp
 166              	delay_milli:
 167              	.LFB3:
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** void delay_milli(unsigned int ms) {
 168              		.loc 1 41 0
 169              		.cfi_startproc
 170              		@ args = 0, pretend = 0, frame = 8
 171              		@ frame_needed = 1, uses_anonymous_args = 0
 172 0082 80B5     		push	{r7, lr}
 173              		.cfi_def_cfa_offset 8
 174              		.cfi_offset 7, -8
 175              		.cfi_offset 14, -4
 176 0084 82B0     		sub	sp, sp, #8
 177              		.cfi_def_cfa_offset 16
 178 0086 00AF     		add	r7, sp, #0
 179              		.cfi_def_cfa_register 7
 180 0088 7860     		str	r0, [r7, #4]
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	#ifdef SIMULATOR
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		delay_micro(ms);
 181              		.loc 1 43 0
 182 008a 7B68     		ldr	r3, [r7, #4]
 183 008c 1800     		movs	r0, r3
 184 008e FFF7FEFF 		bl	delay_micro
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	#else
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 		delay_micro(1000 * ms);
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** 	#endif
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h **** }
 185              		.loc 1 47 0
 186 0092 C046     		nop
 187 0094 BD46     		mov	sp, r7
 188 0096 02B0     		add	sp, sp, #8
 189              		@ sp needed
 190 0098 80BD     		pop	{r7, pc}
 191              		.cfi_endproc
 192              	.LFE3:
 194              		.align	1
 195              		.global	graphics_ctrl_bit_set
 196              		.syntax unified
 197              		.code	16
 198              		.thumb_func
 199              		.fpu softvfp
 201              	graphics_ctrl_bit_set:
 202              	.LFB4:
 203              		.file 2 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****  * 	graphics.h
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #ifndef GRAPHICS_H
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define GRAPHICS_H
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #include "delay.h"
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** // Control for display
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define B_E 0x40
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define B_SELECT 0x04
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define B_RW 0x02
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define B_RS 0x01
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define B_RST 0x20
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define B_CS2 0x10
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define B_CS1 0x08
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define LCD_ON 0x3F
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define LCD_OFF 0x3E
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define LCD_DISP_START 0xC0
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define LCD_SET_ADD 0x40
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define LCD_SET_PAGE 0xB8
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define LCD_BUSY 0x80
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define PAGE 8
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define ADD 63
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define SCREEN_WIDTH  127
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** #define SCREEN_HEIGHT 63
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** typedef unsigned char uint8_t;
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphics_ctrl_bit_set(uint8_t x){
 204              		.loc 2 35 0
 205              		.cfi_startproc
 206              		@ args = 0, pretend = 0, frame = 8
 207              		@ frame_needed = 1, uses_anonymous_args = 0
 208 009a 80B5     		push	{r7, lr}
 209              		.cfi_def_cfa_offset 8
 210              		.cfi_offset 7, -8
 211              		.cfi_offset 14, -4
 212 009c 82B0     		sub	sp, sp, #8
 213              		.cfi_def_cfa_offset 16
 214 009e 00AF     		add	r7, sp, #0
 215              		.cfi_def_cfa_register 7
 216 00a0 0200     		movs	r2, r0
 217 00a2 FB1D     		adds	r3, r7, #7
 218 00a4 1A70     		strb	r2, [r3]
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_ODR_LOW |= (x & ~B_SELECT);
 219              		.loc 2 36 0
 220 00a6 0949     		ldr	r1, .L11
 221 00a8 084B     		ldr	r3, .L11
 222 00aa 1B78     		ldrb	r3, [r3]
 223 00ac DBB2     		uxtb	r3, r3
 224 00ae 5AB2     		sxtb	r2, r3
 225 00b0 FB1D     		adds	r3, r7, #7
 226 00b2 1B78     		ldrb	r3, [r3]
 227 00b4 5BB2     		sxtb	r3, r3
 228 00b6 0420     		movs	r0, #4
 229 00b8 8343     		bics	r3, r0
 230 00ba 5BB2     		sxtb	r3, r3
 231 00bc 1343     		orrs	r3, r2
 232 00be 5BB2     		sxtb	r3, r3
 233 00c0 DBB2     		uxtb	r3, r3
 234 00c2 0B70     		strb	r3, [r1]
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 235              		.loc 2 37 0
 236 00c4 C046     		nop
 237 00c6 BD46     		mov	sp, r7
 238 00c8 02B0     		add	sp, sp, #8
 239              		@ sp needed
 240 00ca 80BD     		pop	{r7, pc}
 241              	.L12:
 242              		.align	2
 243              	.L11:
 244 00cc 14100240 		.word	1073877012
 245              		.cfi_endproc
 246              	.LFE4:
 248              		.align	1
 249              		.global	graphics_ctrl_bit_clear
 250              		.syntax unified
 251              		.code	16
 252              		.thumb_func
 253              		.fpu softvfp
 255              	graphics_ctrl_bit_clear:
 256              	.LFB5:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphics_ctrl_bit_clear(uint8_t x){
 257              		.loc 2 39 0
 258              		.cfi_startproc
 259              		@ args = 0, pretend = 0, frame = 8
 260              		@ frame_needed = 1, uses_anonymous_args = 0
 261 00d0 80B5     		push	{r7, lr}
 262              		.cfi_def_cfa_offset 8
 263              		.cfi_offset 7, -8
 264              		.cfi_offset 14, -4
 265 00d2 82B0     		sub	sp, sp, #8
 266              		.cfi_def_cfa_offset 16
 267 00d4 00AF     		add	r7, sp, #0
 268              		.cfi_def_cfa_register 7
 269 00d6 0200     		movs	r2, r0
 270 00d8 FB1D     		adds	r3, r7, #7
 271 00da 1A70     		strb	r2, [r3]
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_ODR_LOW &= ~x;
 272              		.loc 2 40 0
 273 00dc 0849     		ldr	r1, .L14
 274 00de 084B     		ldr	r3, .L14
 275 00e0 1B78     		ldrb	r3, [r3]
 276 00e2 DBB2     		uxtb	r3, r3
 277 00e4 5BB2     		sxtb	r3, r3
 278 00e6 FA1D     		adds	r2, r7, #7
 279 00e8 1278     		ldrb	r2, [r2]
 280 00ea 52B2     		sxtb	r2, r2
 281 00ec D243     		mvns	r2, r2
 282 00ee 52B2     		sxtb	r2, r2
 283 00f0 1340     		ands	r3, r2
 284 00f2 5BB2     		sxtb	r3, r3
 285 00f4 DBB2     		uxtb	r3, r3
 286 00f6 0B70     		strb	r3, [r1]
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 287              		.loc 2 41 0
 288 00f8 C046     		nop
 289 00fa BD46     		mov	sp, r7
 290 00fc 02B0     		add	sp, sp, #8
 291              		@ sp needed
 292 00fe 80BD     		pop	{r7, pc}
 293              	.L15:
 294              		.align	2
 295              	.L14:
 296 0100 14100240 		.word	1073877012
 297              		.cfi_endproc
 298              	.LFE5:
 300              		.align	1
 301              		.global	select_controller
 302              		.syntax unified
 303              		.code	16
 304              		.thumb_func
 305              		.fpu softvfp
 307              	select_controller:
 308              	.LFB6:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void select_controller(uint8_t controller){
 309              		.loc 2 43 0
 310              		.cfi_startproc
 311              		@ args = 0, pretend = 0, frame = 8
 312              		@ frame_needed = 1, uses_anonymous_args = 0
 313 0104 80B5     		push	{r7, lr}
 314              		.cfi_def_cfa_offset 8
 315              		.cfi_offset 7, -8
 316              		.cfi_offset 14, -4
 317 0106 82B0     		sub	sp, sp, #8
 318              		.cfi_def_cfa_offset 16
 319 0108 00AF     		add	r7, sp, #0
 320              		.cfi_def_cfa_register 7
 321 010a 0200     		movs	r2, r0
 322 010c FB1D     		adds	r3, r7, #7
 323 010e 1A70     		strb	r2, [r3]
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller == 0) {
 324              		.loc 2 44 0
 325 0110 FB1D     		adds	r3, r7, #7
 326 0112 1B78     		ldrb	r3, [r3]
 327 0114 002B     		cmp	r3, #0
 328 0116 06D1     		bne	.L17
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 329              		.loc 2 45 0
 330 0118 0820     		movs	r0, #8
 331 011a FFF7FEFF 		bl	graphics_ctrl_bit_clear
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 332              		.loc 2 46 0
 333 011e 1020     		movs	r0, #16
 334 0120 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     } else if(controller == B_CS1) {
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     } else if(controller == B_CS2) {
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 335              		.loc 2 57 0
 336 0124 1FE0     		b	.L21
 337              	.L17:
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
 338              		.loc 2 47 0
 339 0126 FB1D     		adds	r3, r7, #7
 340 0128 1B78     		ldrb	r3, [r3]
 341 012a 182B     		cmp	r3, #24
 342 012c 06D1     		bne	.L19
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 343              		.loc 2 48 0
 344 012e 0820     		movs	r0, #8
 345 0130 FFF7FEFF 		bl	graphics_ctrl_bit_set
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     } else if(controller == B_CS1) {
 346              		.loc 2 49 0
 347 0134 1020     		movs	r0, #16
 348 0136 FFF7FEFF 		bl	graphics_ctrl_bit_set
 349              		.loc 2 57 0
 350 013a 14E0     		b	.L21
 351              	.L19:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
 352              		.loc 2 50 0
 353 013c FB1D     		adds	r3, r7, #7
 354 013e 1B78     		ldrb	r3, [r3]
 355 0140 082B     		cmp	r3, #8
 356 0142 06D1     		bne	.L20
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 357              		.loc 2 51 0
 358 0144 0820     		movs	r0, #8
 359 0146 FFF7FEFF 		bl	graphics_ctrl_bit_set
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     } else if(controller == B_CS2) {
 360              		.loc 2 52 0
 361 014a 1020     		movs	r0, #16
 362 014c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 363              		.loc 2 57 0
 364 0150 09E0     		b	.L21
 365              	.L20:
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 366              		.loc 2 53 0
 367 0152 FB1D     		adds	r3, r7, #7
 368 0154 1B78     		ldrb	r3, [r3]
 369 0156 102B     		cmp	r3, #16
 370 0158 05D1     		bne	.L21
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 371              		.loc 2 54 0
 372 015a 0820     		movs	r0, #8
 373 015c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 374              		.loc 2 55 0
 375 0160 1020     		movs	r0, #16
 376 0162 FFF7FEFF 		bl	graphics_ctrl_bit_set
 377              	.L21:
 378              		.loc 2 57 0
 379 0166 C046     		nop
 380 0168 BD46     		mov	sp, r7
 381 016a 02B0     		add	sp, sp, #8
 382              		@ sp needed
 383 016c 80BD     		pop	{r7, pc}
 384              		.cfi_endproc
 385              	.LFE6:
 387              		.align	1
 388              		.global	graphic_wait_ready
 389              		.syntax unified
 390              		.code	16
 391              		.thumb_func
 392              		.fpu softvfp
 394              	graphic_wait_ready:
 395              	.LFB7:
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_wait_ready(){
 396              		.loc 2 59 0
 397              		.cfi_startproc
 398              		@ args = 0, pretend = 0, frame = 0
 399              		@ frame_needed = 1, uses_anonymous_args = 0
 400 016e 80B5     		push	{r7, lr}
 401              		.cfi_def_cfa_offset 8
 402              		.cfi_offset 7, -8
 403              		.cfi_offset 14, -4
 404 0170 00AF     		add	r7, sp, #0
 405              		.cfi_def_cfa_register 7
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 406              		.loc 2 60 0
 407 0172 4020     		movs	r0, #64
 408 0174 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x00005555;
 409              		.loc 2 61 0
 410 0178 124B     		ldr	r3, .L28
 411 017a 134A     		ldr	r2, .L28+4
 412 017c 1A60     		str	r2, [r3]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 413              		.loc 2 62 0
 414 017e 0120     		movs	r0, #1
 415 0180 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 416              		.loc 2 63 0
 417 0184 0220     		movs	r0, #2
 418 0186 FFF7FEFF 		bl	graphics_ctrl_bit_set
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 419              		.loc 2 64 0
 420 018a FFF7FEFF 		bl	delay500ns
 421              	.L25:
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     while(1) { // Wait for display not to be busy
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_E);
 422              		.loc 2 67 0
 423 018e 4020     		movs	r0, #64
 424 0190 FFF7FEFF 		bl	graphics_ctrl_bit_set
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         delay500ns();
 425              		.loc 2 68 0
 426 0194 FFF7FEFF 		bl	delay500ns
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_E);
 427              		.loc 2 69 0
 428 0198 4020     		movs	r0, #64
 429 019a FFF7FEFF 		bl	graphics_ctrl_bit_clear
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         delay500ns();
 430              		.loc 2 70 0
 431 019e FFF7FEFF 		bl	delay500ns
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         //unsigned char i = *GPIO_IDR_HIGH;
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         if((*GPIO_E_IDR_HIGH & LCD_BUSY) == 0) {
 432              		.loc 2 72 0
 433 01a2 0A4B     		ldr	r3, .L28+8
 434 01a4 1B78     		ldrb	r3, [r3]
 435 01a6 DBB2     		uxtb	r3, r3
 436 01a8 5BB2     		sxtb	r3, r3
 437 01aa 002B     		cmp	r3, #0
 438 01ac 00DA     		bge	.L27
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         delay500ns();
 439              		.loc 2 67 0
 440 01ae EEE7     		b	.L25
 441              	.L27:
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****             break;
 442              		.loc 2 73 0
 443 01b0 C046     		nop
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 444              		.loc 2 76 0
 445 01b2 4020     		movs	r0, #64
 446 01b4 FFF7FEFF 		bl	graphics_ctrl_bit_set
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x55555555;
 447              		.loc 2 77 0
 448 01b8 024B     		ldr	r3, .L28
 449 01ba 054A     		ldr	r2, .L28+12
 450 01bc 1A60     		str	r2, [r3]
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 451              		.loc 2 79 0
 452 01be C046     		nop
 453 01c0 BD46     		mov	sp, r7
 454              		@ sp needed
 455 01c2 80BD     		pop	{r7, pc}
 456              	.L29:
 457              		.align	2
 458              	.L28:
 459 01c4 00100240 		.word	1073876992
 460 01c8 55550000 		.word	21845
 461 01cc 11100240 		.word	1073877009
 462 01d0 55555555 		.word	1431655765
 463              		.cfi_endproc
 464              	.LFE7:
 466              		.align	1
 467              		.global	graphic_read
 468              		.syntax unified
 469              		.code	16
 470              		.thumb_func
 471              		.fpu softvfp
 473              	graphic_read:
 474              	.LFB8:
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** uint8_t graphic_read(uint8_t controller){
 475              		.loc 2 81 0
 476              		.cfi_startproc
 477              		@ args = 0, pretend = 0, frame = 16
 478              		@ frame_needed = 1, uses_anonymous_args = 0
 479 01d4 80B5     		push	{r7, lr}
 480              		.cfi_def_cfa_offset 8
 481              		.cfi_offset 7, -8
 482              		.cfi_offset 14, -4
 483 01d6 84B0     		sub	sp, sp, #16
 484              		.cfi_def_cfa_offset 24
 485 01d8 00AF     		add	r7, sp, #0
 486              		.cfi_def_cfa_register 7
 487 01da 0200     		movs	r2, r0
 488 01dc FB1D     		adds	r3, r7, #7
 489 01de 1A70     		strb	r2, [r3]
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 490              		.loc 2 82 0
 491 01e0 4020     		movs	r0, #64
 492 01e2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x00005555;
 493              		.loc 2 83 0
 494 01e6 1B4B     		ldr	r3, .L34
 495 01e8 1B4A     		ldr	r2, .L34+4
 496 01ea 1A60     		str	r2, [r3]
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RS | B_RW);
 497              		.loc 2 84 0
 498 01ec 0320     		movs	r0, #3
 499 01ee FFF7FEFF 		bl	graphics_ctrl_bit_set
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 500              		.loc 2 85 0
 501 01f2 FB1D     		adds	r3, r7, #7
 502 01f4 1B78     		ldrb	r3, [r3]
 503 01f6 1800     		movs	r0, r3
 504 01f8 FFF7FEFF 		bl	select_controller
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 505              		.loc 2 86 0
 506 01fc FFF7FEFF 		bl	delay500ns
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 507              		.loc 2 87 0
 508 0200 4020     		movs	r0, #64
 509 0202 FFF7FEFF 		bl	graphics_ctrl_bit_set
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 510              		.loc 2 88 0
 511 0206 FFF7FEFF 		bl	delay500ns
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     uint8_t RV = *GPIO_E_IDR_HIGH;
 512              		.loc 2 90 0
 513 020a 144A     		ldr	r2, .L34+8
 514 020c 0F23     		movs	r3, #15
 515 020e FB18     		adds	r3, r7, r3
 516 0210 1278     		ldrb	r2, [r2]
 517 0212 1A70     		strb	r2, [r3]
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 518              		.loc 2 91 0
 519 0214 4020     		movs	r0, #64
 520 0216 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x55555555;
 521              		.loc 2 92 0
 522 021a 0E4B     		ldr	r3, .L34
 523 021c 104A     		ldr	r2, .L34+12
 524 021e 1A60     		str	r2, [r3]
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller == B_CS1){
 525              		.loc 2 94 0
 526 0220 FB1D     		adds	r3, r7, #7
 527 0222 1B78     		ldrb	r3, [r3]
 528 0224 082B     		cmp	r3, #8
 529 0226 04D1     		bne	.L31
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS1);
 530              		.loc 2 95 0
 531 0228 0820     		movs	r0, #8
 532 022a FFF7FEFF 		bl	select_controller
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 533              		.loc 2 96 0
 534 022e FFF7FEFF 		bl	graphic_wait_ready
 535              	.L31:
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller == B_CS2){
 536              		.loc 2 99 0
 537 0232 FB1D     		adds	r3, r7, #7
 538 0234 1B78     		ldrb	r3, [r3]
 539 0236 102B     		cmp	r3, #16
 540 0238 04D1     		bne	.L32
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS2);
 541              		.loc 2 100 0
 542 023a 1020     		movs	r0, #16
 543 023c FFF7FEFF 		bl	select_controller
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 544              		.loc 2 101 0
 545 0240 FFF7FEFF 		bl	graphic_wait_ready
 546              	.L32:
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     return RV;
 547              		.loc 2 104 0
 548 0244 0F23     		movs	r3, #15
 549 0246 FB18     		adds	r3, r7, r3
 550 0248 1B78     		ldrb	r3, [r3]
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 551              		.loc 2 106 0
 552 024a 1800     		movs	r0, r3
 553 024c BD46     		mov	sp, r7
 554 024e 04B0     		add	sp, sp, #16
 555              		@ sp needed
 556 0250 80BD     		pop	{r7, pc}
 557              	.L35:
 558 0252 C046     		.align	2
 559              	.L34:
 560 0254 00100240 		.word	1073876992
 561 0258 55550000 		.word	21845
 562 025c 11100240 		.word	1073877009
 563 0260 55555555 		.word	1431655765
 564              		.cfi_endproc
 565              	.LFE8:
 567              		.align	1
 568              		.global	graphic_write
 569              		.syntax unified
 570              		.code	16
 571              		.thumb_func
 572              		.fpu softvfp
 574              	graphic_write:
 575              	.LFB9:
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_write(uint8_t value, uint8_t controller){
 576              		.loc 2 108 0
 577              		.cfi_startproc
 578              		@ args = 0, pretend = 0, frame = 8
 579              		@ frame_needed = 1, uses_anonymous_args = 0
 580 0264 80B5     		push	{r7, lr}
 581              		.cfi_def_cfa_offset 8
 582              		.cfi_offset 7, -8
 583              		.cfi_offset 14, -4
 584 0266 82B0     		sub	sp, sp, #8
 585              		.cfi_def_cfa_offset 16
 586 0268 00AF     		add	r7, sp, #0
 587              		.cfi_def_cfa_register 7
 588 026a 0200     		movs	r2, r0
 589 026c FB1D     		adds	r3, r7, #7
 590 026e 1A70     		strb	r2, [r3]
 591 0270 BB1D     		adds	r3, r7, #6
 592 0272 0A1C     		adds	r2, r1, #0
 593 0274 1A70     		strb	r2, [r3]
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_ODR_HIGH = value;
 594              		.loc 2 109 0
 595 0276 1A4A     		ldr	r2, .L39
 596 0278 FB1D     		adds	r3, r7, #7
 597 027a 1B78     		ldrb	r3, [r3]
 598 027c 1370     		strb	r3, [r2]
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 599              		.loc 2 110 0
 600 027e BB1D     		adds	r3, r7, #6
 601 0280 1B78     		ldrb	r3, [r3]
 602 0282 1800     		movs	r0, r3
 603 0284 FFF7FEFF 		bl	select_controller
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 604              		.loc 2 111 0
 605 0288 FFF7FEFF 		bl	delay500ns
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 606              		.loc 2 112 0
 607 028c 4020     		movs	r0, #64
 608 028e FFF7FEFF 		bl	graphics_ctrl_bit_set
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 609              		.loc 2 113 0
 610 0292 FFF7FEFF 		bl	delay500ns
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 611              		.loc 2 114 0
 612 0296 4020     		movs	r0, #64
 613 0298 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller & B_CS1){
 614              		.loc 2 116 0
 615 029c BB1D     		adds	r3, r7, #6
 616 029e 1B78     		ldrb	r3, [r3]
 617 02a0 0822     		movs	r2, #8
 618 02a2 1340     		ands	r3, r2
 619 02a4 04D0     		beq	.L37
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS1);
 620              		.loc 2 117 0
 621 02a6 0820     		movs	r0, #8
 622 02a8 FFF7FEFF 		bl	select_controller
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 623              		.loc 2 118 0
 624 02ac FFF7FEFF 		bl	graphic_wait_ready
 625              	.L37:
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller & B_CS2){
 626              		.loc 2 121 0
 627 02b0 BB1D     		adds	r3, r7, #6
 628 02b2 1B78     		ldrb	r3, [r3]
 629 02b4 1022     		movs	r2, #16
 630 02b6 1340     		ands	r3, r2
 631 02b8 04D0     		beq	.L38
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS2);
 632              		.loc 2 122 0
 633 02ba 1020     		movs	r0, #16
 634 02bc FFF7FEFF 		bl	select_controller
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 635              		.loc 2 123 0
 636 02c0 FFF7FEFF 		bl	graphic_wait_ready
 637              	.L38:
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_ODR_HIGH = 0;
 638              		.loc 2 126 0
 639 02c4 064B     		ldr	r3, .L39
 640 02c6 0022     		movs	r2, #0
 641 02c8 1A70     		strb	r2, [r3]
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 642              		.loc 2 127 0
 643 02ca 4020     		movs	r0, #64
 644 02cc FFF7FEFF 		bl	graphics_ctrl_bit_set
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(0);
 645              		.loc 2 128 0
 646 02d0 0020     		movs	r0, #0
 647 02d2 FFF7FEFF 		bl	select_controller
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 648              		.loc 2 129 0
 649 02d6 C046     		nop
 650 02d8 BD46     		mov	sp, r7
 651 02da 02B0     		add	sp, sp, #8
 652              		@ sp needed
 653 02dc 80BD     		pop	{r7, pc}
 654              	.L40:
 655 02de C046     		.align	2
 656              	.L39:
 657 02e0 15100240 		.word	1073877013
 658              		.cfi_endproc
 659              	.LFE9:
 661              		.align	1
 662              		.global	graphic_write_command
 663              		.syntax unified
 664              		.code	16
 665              		.thumb_func
 666              		.fpu softvfp
 668              	graphic_write_command:
 669              	.LFB10:
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_write_command(uint8_t command, uint8_t controller){
 670              		.loc 2 131 0
 671              		.cfi_startproc
 672              		@ args = 0, pretend = 0, frame = 8
 673              		@ frame_needed = 1, uses_anonymous_args = 0
 674 02e4 80B5     		push	{r7, lr}
 675              		.cfi_def_cfa_offset 8
 676              		.cfi_offset 7, -8
 677              		.cfi_offset 14, -4
 678 02e6 82B0     		sub	sp, sp, #8
 679              		.cfi_def_cfa_offset 16
 680 02e8 00AF     		add	r7, sp, #0
 681              		.cfi_def_cfa_register 7
 682 02ea 0200     		movs	r2, r0
 683 02ec FB1D     		adds	r3, r7, #7
 684 02ee 1A70     		strb	r2, [r3]
 685 02f0 BB1D     		adds	r3, r7, #6
 686 02f2 0A1C     		adds	r2, r1, #0
 687 02f4 1A70     		strb	r2, [r3]
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 688              		.loc 2 132 0
 689 02f6 4020     		movs	r0, #64
 690 02f8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 691              		.loc 2 133 0
 692 02fc BB1D     		adds	r3, r7, #6
 693 02fe 1B78     		ldrb	r3, [r3]
 694 0300 1800     		movs	r0, r3
 695 0302 FFF7FEFF 		bl	select_controller
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_RS | B_RW);
 696              		.loc 2 134 0
 697 0306 0320     		movs	r0, #3
 698 0308 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write(command, controller);
 699              		.loc 2 135 0
 700 030c BB1D     		adds	r3, r7, #6
 701 030e 1A78     		ldrb	r2, [r3]
 702 0310 FB1D     		adds	r3, r7, #7
 703 0312 1B78     		ldrb	r3, [r3]
 704 0314 1100     		movs	r1, r2
 705 0316 1800     		movs	r0, r3
 706 0318 FFF7FEFF 		bl	graphic_write
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 707              		.loc 2 136 0
 708 031c C046     		nop
 709 031e BD46     		mov	sp, r7
 710 0320 02B0     		add	sp, sp, #8
 711              		@ sp needed
 712 0322 80BD     		pop	{r7, pc}
 713              		.cfi_endproc
 714              	.LFE10:
 716              		.align	1
 717              		.global	graphic_write_data
 718              		.syntax unified
 719              		.code	16
 720              		.thumb_func
 721              		.fpu softvfp
 723              	graphic_write_data:
 724              	.LFB11:
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_write_data(uint8_t data, uint8_t controller){
 725              		.loc 2 138 0
 726              		.cfi_startproc
 727              		@ args = 0, pretend = 0, frame = 8
 728              		@ frame_needed = 1, uses_anonymous_args = 0
 729 0324 80B5     		push	{r7, lr}
 730              		.cfi_def_cfa_offset 8
 731              		.cfi_offset 7, -8
 732              		.cfi_offset 14, -4
 733 0326 82B0     		sub	sp, sp, #8
 734              		.cfi_def_cfa_offset 16
 735 0328 00AF     		add	r7, sp, #0
 736              		.cfi_def_cfa_register 7
 737 032a 0200     		movs	r2, r0
 738 032c FB1D     		adds	r3, r7, #7
 739 032e 1A70     		strb	r2, [r3]
 740 0330 BB1D     		adds	r3, r7, #6
 741 0332 0A1C     		adds	r2, r1, #0
 742 0334 1A70     		strb	r2, [r3]
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 743              		.loc 2 139 0
 744 0336 4020     		movs	r0, #64
 745 0338 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 746              		.loc 2 140 0
 747 033c BB1D     		adds	r3, r7, #6
 748 033e 1B78     		ldrb	r3, [r3]
 749 0340 1800     		movs	r0, r3
 750 0342 FFF7FEFF 		bl	select_controller
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 751              		.loc 2 141 0
 752 0346 0120     		movs	r0, #1
 753 0348 FFF7FEFF 		bl	graphics_ctrl_bit_set
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 754              		.loc 2 142 0
 755 034c 0220     		movs	r0, #2
 756 034e FFF7FEFF 		bl	graphics_ctrl_bit_clear
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write(data, controller);
 757              		.loc 2 143 0
 758 0352 BB1D     		adds	r3, r7, #6
 759 0354 1A78     		ldrb	r2, [r3]
 760 0356 FB1D     		adds	r3, r7, #7
 761 0358 1B78     		ldrb	r3, [r3]
 762 035a 1100     		movs	r1, r2
 763 035c 1800     		movs	r0, r3
 764 035e FFF7FEFF 		bl	graphic_write
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 765              		.loc 2 144 0
 766 0362 C046     		nop
 767 0364 BD46     		mov	sp, r7
 768 0366 02B0     		add	sp, sp, #8
 769              		@ sp needed
 770 0368 80BD     		pop	{r7, pc}
 771              		.cfi_endproc
 772              	.LFE11:
 774              		.align	1
 775              		.global	graphics_read_data
 776              		.syntax unified
 777              		.code	16
 778              		.thumb_func
 779              		.fpu softvfp
 781              	graphics_read_data:
 782              	.LFB12:
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** uint8_t graphics_read_data(uint8_t controller){
 783              		.loc 2 146 0
 784              		.cfi_startproc
 785              		@ args = 0, pretend = 0, frame = 8
 786              		@ frame_needed = 1, uses_anonymous_args = 0
 787 036a 80B5     		push	{r7, lr}
 788              		.cfi_def_cfa_offset 8
 789              		.cfi_offset 7, -8
 790              		.cfi_offset 14, -4
 791 036c 82B0     		sub	sp, sp, #8
 792              		.cfi_def_cfa_offset 16
 793 036e 00AF     		add	r7, sp, #0
 794              		.cfi_def_cfa_register 7
 795 0370 0200     		movs	r2, r0
 796 0372 FB1D     		adds	r3, r7, #7
 797 0374 1A70     		strb	r2, [r3]
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     (void) graphic_read(controller);
 798              		.loc 2 147 0
 799 0376 FB1D     		adds	r3, r7, #7
 800 0378 1B78     		ldrb	r3, [r3]
 801 037a 1800     		movs	r0, r3
 802 037c FFF7FEFF 		bl	graphic_read
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     return graphic_read(controller);
 803              		.loc 2 148 0
 804 0380 FB1D     		adds	r3, r7, #7
 805 0382 1B78     		ldrb	r3, [r3]
 806 0384 1800     		movs	r0, r3
 807 0386 FFF7FEFF 		bl	graphic_read
 808 038a 0300     		movs	r3, r0
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 809              		.loc 2 149 0
 810 038c 1800     		movs	r0, r3
 811 038e BD46     		mov	sp, r7
 812 0390 02B0     		add	sp, sp, #8
 813              		@ sp needed
 814 0392 80BD     		pop	{r7, pc}
 815              		.cfi_endproc
 816              	.LFE12:
 818              		.align	1
 819              		.global	graphic_initialize
 820              		.syntax unified
 821              		.code	16
 822              		.thumb_func
 823              		.fpu softvfp
 825              	graphic_initialize:
 826              	.LFB13:
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_initialize(void){
 827              		.loc 2 151 0
 828              		.cfi_startproc
 829              		@ args = 0, pretend = 0, frame = 0
 830              		@ frame_needed = 1, uses_anonymous_args = 0
 831 0394 80B5     		push	{r7, lr}
 832              		.cfi_def_cfa_offset 8
 833              		.cfi_offset 7, -8
 834              		.cfi_offset 14, -4
 835 0396 00AF     		add	r7, sp, #0
 836              		.cfi_def_cfa_register 7
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 837              		.loc 2 152 0
 838 0398 4020     		movs	r0, #64
 839 039a FFF7FEFF 		bl	graphics_ctrl_bit_set
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay_micro(10);
 840              		.loc 2 153 0
 841 039e 0A20     		movs	r0, #10
 842 03a0 FFF7FEFF 		bl	delay_micro
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 843              		.loc 2 154 0
 844 03a4 7820     		movs	r0, #120
 845 03a6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay_milli(30);
 846              		.loc 2 155 0
 847 03aa 1E20     		movs	r0, #30
 848 03ac FFF7FEFF 		bl	delay_milli
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RST);
 849              		.loc 2 156 0
 850 03b0 2020     		movs	r0, #32
 851 03b2 FFF7FEFF 		bl	graphics_ctrl_bit_set
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 852              		.loc 2 157 0
 853 03b6 1821     		movs	r1, #24
 854 03b8 3E20     		movs	r0, #62
 855 03ba FFF7FEFF 		bl	graphic_write_command
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_ON, B_CS1|B_CS2);
 856              		.loc 2 158 0
 857 03be 1821     		movs	r1, #24
 858 03c0 3F20     		movs	r0, #63
 859 03c2 FFF7FEFF 		bl	graphic_write_command
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 860              		.loc 2 159 0
 861 03c6 1821     		movs	r1, #24
 862 03c8 C020     		movs	r0, #192
 863 03ca FFF7FEFF 		bl	graphic_write_command
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 864              		.loc 2 160 0
 865 03ce 1821     		movs	r1, #24
 866 03d0 4020     		movs	r0, #64
 867 03d2 FFF7FEFF 		bl	graphic_write_command
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 868              		.loc 2 161 0
 869 03d6 1821     		movs	r1, #24
 870 03d8 B820     		movs	r0, #184
 871 03da FFF7FEFF 		bl	graphic_write_command
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(0);
 872              		.loc 2 162 0
 873 03de 0020     		movs	r0, #0
 874 03e0 FFF7FEFF 		bl	select_controller
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 875              		.loc 2 163 0
 876 03e4 C046     		nop
 877 03e6 BD46     		mov	sp, r7
 878              		@ sp needed
 879 03e8 80BD     		pop	{r7, pc}
 880              		.cfi_endproc
 881              	.LFE13:
 883              		.align	1
 884              		.global	graphics_clear_screen
 885              		.syntax unified
 886              		.code	16
 887              		.thumb_func
 888              		.fpu softvfp
 890              	graphics_clear_screen:
 891              	.LFB14:
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphics_clear_screen(void){
 892              		.loc 2 165 0
 893              		.cfi_startproc
 894              		@ args = 0, pretend = 0, frame = 8
 895              		@ frame_needed = 1, uses_anonymous_args = 0
 896 03ea 80B5     		push	{r7, lr}
 897              		.cfi_def_cfa_offset 8
 898              		.cfi_offset 7, -8
 899              		.cfi_offset 14, -4
 900 03ec 82B0     		sub	sp, sp, #8
 901              		.cfi_def_cfa_offset 16
 902 03ee 00AF     		add	r7, sp, #0
 903              		.cfi_def_cfa_register 7
 904              	.LBB2:
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     for(int page = 0; page < PAGE; page++){
 905              		.loc 2 166 0
 906 03f0 0023     		movs	r3, #0
 907 03f2 7B60     		str	r3, [r7, #4]
 908 03f4 1EE0     		b	.L47
 909              	.L50:
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 910              		.loc 2 167 0
 911 03f6 7B68     		ldr	r3, [r7, #4]
 912 03f8 5BB2     		sxtb	r3, r3
 913 03fa 4822     		movs	r2, #72
 914 03fc 5242     		rsbs	r2, r2, #0
 915 03fe 1343     		orrs	r3, r2
 916 0400 5BB2     		sxtb	r3, r3
 917 0402 DBB2     		uxtb	r3, r3
 918 0404 1821     		movs	r1, #24
 919 0406 1800     		movs	r0, r3
 920 0408 FFF7FEFF 		bl	graphic_write_command
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 921              		.loc 2 168 0
 922 040c 1821     		movs	r1, #24
 923 040e 4020     		movs	r0, #64
 924 0410 FFF7FEFF 		bl	graphic_write_command
 925              	.LBB3:
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         for(int add = 0; add < ADD; add++){
 926              		.loc 2 169 0
 927 0414 0023     		movs	r3, #0
 928 0416 3B60     		str	r3, [r7]
 929 0418 06E0     		b	.L48
 930              	.L49:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****             graphic_write_data(0, B_CS1|B_CS2);
 931              		.loc 2 170 0 discriminator 3
 932 041a 1821     		movs	r1, #24
 933 041c 0020     		movs	r0, #0
 934 041e FFF7FEFF 		bl	graphic_write_data
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         for(int add = 0; add < ADD; add++){
 935              		.loc 2 169 0 discriminator 3
 936 0422 3B68     		ldr	r3, [r7]
 937 0424 0133     		adds	r3, r3, #1
 938 0426 3B60     		str	r3, [r7]
 939              	.L48:
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         for(int add = 0; add < ADD; add++){
 940              		.loc 2 169 0 is_stmt 0 discriminator 1
 941 0428 3B68     		ldr	r3, [r7]
 942 042a 3E2B     		cmp	r3, #62
 943 042c F5DD     		ble	.L49
 944              	.LBE3:
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 945              		.loc 2 166 0 is_stmt 1 discriminator 2
 946 042e 7B68     		ldr	r3, [r7, #4]
 947 0430 0133     		adds	r3, r3, #1
 948 0432 7B60     		str	r3, [r7, #4]
 949              	.L47:
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 950              		.loc 2 166 0 is_stmt 0 discriminator 1
 951 0434 7B68     		ldr	r3, [r7, #4]
 952 0436 072B     		cmp	r3, #7
 953 0438 DDDD     		ble	.L50
 954              	.LBE2:
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 955              		.loc 2 174 0 is_stmt 1
 956 043a C046     		nop
 957 043c BD46     		mov	sp, r7
 958 043e 02B0     		add	sp, sp, #8
 959              		@ sp needed
 960 0440 80BD     		pop	{r7, pc}
 961              		.cfi_endproc
 962              	.LFE14:
 964              		.align	1
 965              		.global	pixel
 966              		.syntax unified
 967              		.code	16
 968              		.thumb_func
 969              		.fpu softvfp
 971              	pixel:
 972              	.LFB15:
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void pixel(unsigned x, unsigned y, unsigned set){
 973              		.loc 2 177 0
 974              		.cfi_startproc
 975              		@ args = 0, pretend = 0, frame = 24
 976              		@ frame_needed = 1, uses_anonymous_args = 0
 977 0442 90B5     		push	{r4, r7, lr}
 978              		.cfi_def_cfa_offset 12
 979              		.cfi_offset 4, -12
 980              		.cfi_offset 7, -8
 981              		.cfi_offset 14, -4
 982 0444 87B0     		sub	sp, sp, #28
 983              		.cfi_def_cfa_offset 40
 984 0446 00AF     		add	r7, sp, #0
 985              		.cfi_def_cfa_register 7
 986 0448 F860     		str	r0, [r7, #12]
 987 044a B960     		str	r1, [r7, #8]
 988 044c 7A60     		str	r2, [r7, #4]
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((x < 0 || y < 0) || (x > SCREEN_WIDTH || y > SCREEN_HEIGHT)) return;
 989              		.loc 2 178 0
 990 044e FB68     		ldr	r3, [r7, #12]
 991 0450 7F2B     		cmp	r3, #127
 992 0452 00D9     		bls	.LCB775
 993 0454 C7E0     		b	.L68	@long jump
 994              	.LCB775:
 995              		.loc 2 178 0 is_stmt 0 discriminator 1
 996 0456 BB68     		ldr	r3, [r7, #8]
 997 0458 3F2B     		cmp	r3, #63
 998 045a 00D9     		bls	.LCB778
 999 045c C3E0     		b	.L68	@long jump
 1000              	.LCB778:
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     unsigned char index = (y-1) / PAGE;
 1001              		.loc 2 180 0 is_stmt 1
 1002 045e BB68     		ldr	r3, [r7, #8]
 1003 0460 013B     		subs	r3, r3, #1
 1004 0462 DA08     		lsrs	r2, r3, #3
 1005 0464 1523     		movs	r3, #21
 1006 0466 FB18     		adds	r3, r7, r3
 1007 0468 1A70     		strb	r2, [r3]
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     unsigned char mask;
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 0){mask = 1;}
 1008              		.loc 2 183 0
 1009 046a BB68     		ldr	r3, [r7, #8]
 1010 046c 013B     		subs	r3, r3, #1
 1011 046e 0722     		movs	r2, #7
 1012 0470 1340     		ands	r3, r2
 1013 0472 03D1     		bne	.L55
 1014              		.loc 2 183 0 is_stmt 0 discriminator 1
 1015 0474 1723     		movs	r3, #23
 1016 0476 FB18     		adds	r3, r7, r3
 1017 0478 0122     		movs	r2, #1
 1018 047a 1A70     		strb	r2, [r3]
 1019              	.L55:
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 1){mask = 2;}
 1020              		.loc 2 184 0 is_stmt 1
 1021 047c BB68     		ldr	r3, [r7, #8]
 1022 047e 013B     		subs	r3, r3, #1
 1023 0480 0722     		movs	r2, #7
 1024 0482 1340     		ands	r3, r2
 1025 0484 012B     		cmp	r3, #1
 1026 0486 03D1     		bne	.L56
 1027              		.loc 2 184 0 is_stmt 0 discriminator 1
 1028 0488 1723     		movs	r3, #23
 1029 048a FB18     		adds	r3, r7, r3
 1030 048c 0222     		movs	r2, #2
 1031 048e 1A70     		strb	r2, [r3]
 1032              	.L56:
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 2){mask = 4;}
 1033              		.loc 2 185 0 is_stmt 1
 1034 0490 BB68     		ldr	r3, [r7, #8]
 1035 0492 013B     		subs	r3, r3, #1
 1036 0494 0722     		movs	r2, #7
 1037 0496 1340     		ands	r3, r2
 1038 0498 022B     		cmp	r3, #2
 1039 049a 03D1     		bne	.L57
 1040              		.loc 2 185 0 is_stmt 0 discriminator 1
 1041 049c 1723     		movs	r3, #23
 1042 049e FB18     		adds	r3, r7, r3
 1043 04a0 0422     		movs	r2, #4
 1044 04a2 1A70     		strb	r2, [r3]
 1045              	.L57:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 3){mask = 8;}
 1046              		.loc 2 186 0 is_stmt 1
 1047 04a4 BB68     		ldr	r3, [r7, #8]
 1048 04a6 013B     		subs	r3, r3, #1
 1049 04a8 0722     		movs	r2, #7
 1050 04aa 1340     		ands	r3, r2
 1051 04ac 032B     		cmp	r3, #3
 1052 04ae 03D1     		bne	.L58
 1053              		.loc 2 186 0 is_stmt 0 discriminator 1
 1054 04b0 1723     		movs	r3, #23
 1055 04b2 FB18     		adds	r3, r7, r3
 1056 04b4 0822     		movs	r2, #8
 1057 04b6 1A70     		strb	r2, [r3]
 1058              	.L58:
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 4){mask = 0x10;}
 1059              		.loc 2 187 0 is_stmt 1
 1060 04b8 BB68     		ldr	r3, [r7, #8]
 1061 04ba 013B     		subs	r3, r3, #1
 1062 04bc 0722     		movs	r2, #7
 1063 04be 1340     		ands	r3, r2
 1064 04c0 042B     		cmp	r3, #4
 1065 04c2 03D1     		bne	.L59
 1066              		.loc 2 187 0 is_stmt 0 discriminator 1
 1067 04c4 1723     		movs	r3, #23
 1068 04c6 FB18     		adds	r3, r7, r3
 1069 04c8 1022     		movs	r2, #16
 1070 04ca 1A70     		strb	r2, [r3]
 1071              	.L59:
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 5){mask = 0x20;}
 1072              		.loc 2 188 0 is_stmt 1
 1073 04cc BB68     		ldr	r3, [r7, #8]
 1074 04ce 013B     		subs	r3, r3, #1
 1075 04d0 0722     		movs	r2, #7
 1076 04d2 1340     		ands	r3, r2
 1077 04d4 052B     		cmp	r3, #5
 1078 04d6 03D1     		bne	.L60
 1079              		.loc 2 188 0 is_stmt 0 discriminator 1
 1080 04d8 1723     		movs	r3, #23
 1081 04da FB18     		adds	r3, r7, r3
 1082 04dc 2022     		movs	r2, #32
 1083 04de 1A70     		strb	r2, [r3]
 1084              	.L60:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 6){mask = 0x40;}
 1085              		.loc 2 189 0 is_stmt 1
 1086 04e0 BB68     		ldr	r3, [r7, #8]
 1087 04e2 013B     		subs	r3, r3, #1
 1088 04e4 0722     		movs	r2, #7
 1089 04e6 1340     		ands	r3, r2
 1090 04e8 062B     		cmp	r3, #6
 1091 04ea 03D1     		bne	.L61
 1092              		.loc 2 189 0 is_stmt 0 discriminator 1
 1093 04ec 1723     		movs	r3, #23
 1094 04ee FB18     		adds	r3, r7, r3
 1095 04f0 4022     		movs	r2, #64
 1096 04f2 1A70     		strb	r2, [r3]
 1097              	.L61:
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 7){mask = 0x80;}
 1098              		.loc 2 190 0 is_stmt 1
 1099 04f4 BB68     		ldr	r3, [r7, #8]
 1100 04f6 013B     		subs	r3, r3, #1
 1101 04f8 0722     		movs	r2, #7
 1102 04fa 1340     		ands	r3, r2
 1103 04fc 072B     		cmp	r3, #7
 1104 04fe 03D1     		bne	.L62
 1105              		.loc 2 190 0 is_stmt 0 discriminator 1
 1106 0500 1723     		movs	r3, #23
 1107 0502 FB18     		adds	r3, r7, r3
 1108 0504 8022     		movs	r2, #128
 1109 0506 1A70     		strb	r2, [r3]
 1110              	.L62:
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(set == 0){mask = ~mask;}
 1111              		.loc 2 192 0 is_stmt 1
 1112 0508 7B68     		ldr	r3, [r7, #4]
 1113 050a 002B     		cmp	r3, #0
 1114 050c 06D1     		bne	.L63
 1115              		.loc 2 192 0 is_stmt 0 discriminator 1
 1116 050e 1723     		movs	r3, #23
 1117 0510 FB18     		adds	r3, r7, r3
 1118 0512 1722     		movs	r2, #23
 1119 0514 BA18     		adds	r2, r7, r2
 1120 0516 1278     		ldrb	r2, [r2]
 1121 0518 D243     		mvns	r2, r2
 1122 051a 1A70     		strb	r2, [r3]
 1123              	.L63:
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     unsigned char controller;
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(x > 64){
 1124              		.loc 2 195 0 is_stmt 1
 1125 051c FB68     		ldr	r3, [r7, #12]
 1126 051e 402B     		cmp	r3, #64
 1127 0520 07D9     		bls	.L64
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         controller = B_CS2;
 1128              		.loc 2 196 0
 1129 0522 1623     		movs	r3, #22
 1130 0524 FB18     		adds	r3, r7, r3
 1131 0526 1022     		movs	r2, #16
 1132 0528 1A70     		strb	r2, [r3]
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         x = x - 65;
 1133              		.loc 2 197 0
 1134 052a FB68     		ldr	r3, [r7, #12]
 1135 052c 413B     		subs	r3, r3, #65
 1136 052e FB60     		str	r3, [r7, #12]
 1137 0530 06E0     		b	.L65
 1138              	.L64:
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     else{
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         controller = B_CS1;
 1139              		.loc 2 200 0
 1140 0532 1623     		movs	r3, #22
 1141 0534 FB18     		adds	r3, r7, r3
 1142 0536 0822     		movs	r2, #8
 1143 0538 1A70     		strb	r2, [r3]
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         x = x - 1;
 1144              		.loc 2 201 0
 1145 053a FB68     		ldr	r3, [r7, #12]
 1146 053c 013B     		subs	r3, r3, #1
 1147 053e FB60     		str	r3, [r7, #12]
 1148              	.L65:
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1149              		.loc 2 204 0
 1150 0540 FB68     		ldr	r3, [r7, #12]
 1151 0542 DBB2     		uxtb	r3, r3
 1152 0544 4022     		movs	r2, #64
 1153 0546 1343     		orrs	r3, r2
 1154 0548 DAB2     		uxtb	r2, r3
 1155 054a 1623     		movs	r3, #22
 1156 054c FB18     		adds	r3, r7, r3
 1157 054e 1B78     		ldrb	r3, [r3]
 1158 0550 1900     		movs	r1, r3
 1159 0552 1000     		movs	r0, r2
 1160 0554 FFF7FEFF 		bl	graphic_write_command
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 1161              		.loc 2 205 0
 1162 0558 1523     		movs	r3, #21
 1163 055a FB18     		adds	r3, r7, r3
 1164 055c 1B78     		ldrb	r3, [r3]
 1165 055e 4822     		movs	r2, #72
 1166 0560 5242     		rsbs	r2, r2, #0
 1167 0562 1343     		orrs	r3, r2
 1168 0564 DAB2     		uxtb	r2, r3
 1169 0566 1623     		movs	r3, #22
 1170 0568 FB18     		adds	r3, r7, r3
 1171 056a 1B78     		ldrb	r3, [r3]
 1172 056c 1900     		movs	r1, r3
 1173 056e 1000     		movs	r0, r2
 1174 0570 FFF7FEFF 		bl	graphic_write_command
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 	unsigned char temp = graphics_read_data(controller);
 1175              		.loc 2 206 0
 1176 0574 1423     		movs	r3, #20
 1177 0576 FC18     		adds	r4, r7, r3
 1178 0578 1623     		movs	r3, #22
 1179 057a FB18     		adds	r3, r7, r3
 1180 057c 1B78     		ldrb	r3, [r3]
 1181 057e 1800     		movs	r0, r3
 1182 0580 FFF7FEFF 		bl	graphics_read_data
 1183 0584 0300     		movs	r3, r0
 1184 0586 2370     		strb	r3, [r4]
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1185              		.loc 2 207 0
 1186 0588 FB68     		ldr	r3, [r7, #12]
 1187 058a DBB2     		uxtb	r3, r3
 1188 058c 4022     		movs	r2, #64
 1189 058e 1343     		orrs	r3, r2
 1190 0590 DAB2     		uxtb	r2, r3
 1191 0592 1623     		movs	r3, #22
 1192 0594 FB18     		adds	r3, r7, r3
 1193 0596 1B78     		ldrb	r3, [r3]
 1194 0598 1900     		movs	r1, r3
 1195 059a 1000     		movs	r0, r2
 1196 059c FFF7FEFF 		bl	graphic_write_command
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(set == 1)
 1197              		.loc 2 209 0
 1198 05a0 7B68     		ldr	r3, [r7, #4]
 1199 05a2 012B     		cmp	r3, #1
 1200 05a4 0AD1     		bne	.L66
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         {mask = mask | temp;}
 1201              		.loc 2 210 0
 1202 05a6 1723     		movs	r3, #23
 1203 05a8 FB18     		adds	r3, r7, r3
 1204 05aa 1722     		movs	r2, #23
 1205 05ac B918     		adds	r1, r7, r2
 1206 05ae 1422     		movs	r2, #20
 1207 05b0 BA18     		adds	r2, r7, r2
 1208 05b2 0978     		ldrb	r1, [r1]
 1209 05b4 1278     		ldrb	r2, [r2]
 1210 05b6 0A43     		orrs	r2, r1
 1211 05b8 1A70     		strb	r2, [r3]
 1212 05ba 09E0     		b	.L67
 1213              	.L66:
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     else
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         {mask = mask & temp;}
 1214              		.loc 2 212 0
 1215 05bc 1723     		movs	r3, #23
 1216 05be FB18     		adds	r3, r7, r3
 1217 05c0 1722     		movs	r2, #23
 1218 05c2 BA18     		adds	r2, r7, r2
 1219 05c4 1421     		movs	r1, #20
 1220 05c6 7918     		adds	r1, r7, r1
 1221 05c8 1278     		ldrb	r2, [r2]
 1222 05ca 0978     		ldrb	r1, [r1]
 1223 05cc 0A40     		ands	r2, r1
 1224 05ce 1A70     		strb	r2, [r3]
 1225              	.L67:
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_data(mask, controller);
 1226              		.loc 2 214 0
 1227 05d0 1623     		movs	r3, #22
 1228 05d2 FB18     		adds	r3, r7, r3
 1229 05d4 1A78     		ldrb	r2, [r3]
 1230 05d6 1723     		movs	r3, #23
 1231 05d8 FB18     		adds	r3, r7, r3
 1232 05da 1B78     		ldrb	r3, [r3]
 1233 05dc 1100     		movs	r1, r2
 1234 05de 1800     		movs	r0, r3
 1235 05e0 FFF7FEFF 		bl	graphic_write_data
 1236 05e4 00E0     		b	.L51
 1237              	.L68:
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 1238              		.loc 2 178 0
 1239 05e6 C046     		nop
 1240              	.L51:
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 1241              		.loc 2 217 0
 1242 05e8 BD46     		mov	sp, r7
 1243 05ea 07B0     		add	sp, sp, #28
 1244              		@ sp needed
 1245 05ec 90BD     		pop	{r4, r7, pc}
 1246              		.cfi_endproc
 1247              	.LFE15:
 1249              		.align	1
 1250              		.global	ascii_ctrl_bit_set
 1251              		.syntax unified
 1252              		.code	16
 1253              		.thumb_func
 1254              		.fpu softvfp
 1256              	ascii_ctrl_bit_set:
 1257              	.LFB16:
 1258              		.file 3 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** #include "delay.h"
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_ctrl_bit_set(unsigned int x) {
 1259              		.loc 3 3 0
 1260              		.cfi_startproc
 1261              		@ args = 0, pretend = 0, frame = 8
 1262              		@ frame_needed = 1, uses_anonymous_args = 0
 1263 05ee 80B5     		push	{r7, lr}
 1264              		.cfi_def_cfa_offset 8
 1265              		.cfi_offset 7, -8
 1266              		.cfi_offset 14, -4
 1267 05f0 82B0     		sub	sp, sp, #8
 1268              		.cfi_def_cfa_offset 16
 1269 05f2 00AF     		add	r7, sp, #0
 1270              		.cfi_def_cfa_register 7
 1271 05f4 7860     		str	r0, [r7, #4]
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	switch(x) {
 1272              		.loc 3 4 0
 1273 05f6 7B68     		ldr	r3, [r7, #4]
 1274 05f8 072B     		cmp	r3, #7
 1275 05fa 4ED8     		bhi	.L80
 1276 05fc 7B68     		ldr	r3, [r7, #4]
 1277 05fe 9A00     		lsls	r2, r3, #2
 1278 0600 284B     		ldr	r3, .L81
 1279 0602 D318     		adds	r3, r2, r3
 1280 0604 1B68     		ldr	r3, [r3]
 1281 0606 9F46     		mov	pc, r3
 1282              		.section	.rodata
 1283              		.align	2
 1284              	.L72:
 1285 0000 08060000 		.word	.L71
 1286 0004 1A060000 		.word	.L73
 1287 0008 2C060000 		.word	.L74
 1288 000c 3E060000 		.word	.L75
 1289 0010 50060000 		.word	.L76
 1290 0014 62060000 		.word	.L77
 1291 0018 74060000 		.word	.L78
 1292 001c 86060000 		.word	.L79
 1293              		.text
 1294              	.L71:
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 0: *GPIO_D_ODR_LOW |= 1; break;
 1295              		.loc 3 5 0
 1296 0608 274A     		ldr	r2, .L81+4
 1297 060a 274B     		ldr	r3, .L81+4
 1298 060c 1B78     		ldrb	r3, [r3]
 1299 060e DBB2     		uxtb	r3, r3
 1300 0610 0121     		movs	r1, #1
 1301 0612 0B43     		orrs	r3, r1
 1302 0614 DBB2     		uxtb	r3, r3
 1303 0616 1370     		strb	r3, [r2]
 1304 0618 3FE0     		b	.L70
 1305              	.L73:
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 1: *GPIO_D_ODR_LOW |= 2; break;
 1306              		.loc 3 6 0
 1307 061a 234A     		ldr	r2, .L81+4
 1308 061c 224B     		ldr	r3, .L81+4
 1309 061e 1B78     		ldrb	r3, [r3]
 1310 0620 DBB2     		uxtb	r3, r3
 1311 0622 0221     		movs	r1, #2
 1312 0624 0B43     		orrs	r3, r1
 1313 0626 DBB2     		uxtb	r3, r3
 1314 0628 1370     		strb	r3, [r2]
 1315 062a 36E0     		b	.L70
 1316              	.L74:
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 2: *GPIO_D_ODR_LOW |= 4; break;
 1317              		.loc 3 7 0
 1318 062c 1E4A     		ldr	r2, .L81+4
 1319 062e 1E4B     		ldr	r3, .L81+4
 1320 0630 1B78     		ldrb	r3, [r3]
 1321 0632 DBB2     		uxtb	r3, r3
 1322 0634 0421     		movs	r1, #4
 1323 0636 0B43     		orrs	r3, r1
 1324 0638 DBB2     		uxtb	r3, r3
 1325 063a 1370     		strb	r3, [r2]
 1326 063c 2DE0     		b	.L70
 1327              	.L75:
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 3: *GPIO_D_ODR_LOW |= 8; break;
 1328              		.loc 3 8 0
 1329 063e 1A4A     		ldr	r2, .L81+4
 1330 0640 194B     		ldr	r3, .L81+4
 1331 0642 1B78     		ldrb	r3, [r3]
 1332 0644 DBB2     		uxtb	r3, r3
 1333 0646 0821     		movs	r1, #8
 1334 0648 0B43     		orrs	r3, r1
 1335 064a DBB2     		uxtb	r3, r3
 1336 064c 1370     		strb	r3, [r2]
 1337 064e 24E0     		b	.L70
 1338              	.L76:
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 4: *GPIO_D_ODR_LOW |= 16; break;
 1339              		.loc 3 9 0
 1340 0650 154A     		ldr	r2, .L81+4
 1341 0652 154B     		ldr	r3, .L81+4
 1342 0654 1B78     		ldrb	r3, [r3]
 1343 0656 DBB2     		uxtb	r3, r3
 1344 0658 1021     		movs	r1, #16
 1345 065a 0B43     		orrs	r3, r1
 1346 065c DBB2     		uxtb	r3, r3
 1347 065e 1370     		strb	r3, [r2]
 1348 0660 1BE0     		b	.L70
 1349              	.L77:
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 5: *GPIO_D_ODR_LOW |= 32; break;
 1350              		.loc 3 10 0
 1351 0662 114A     		ldr	r2, .L81+4
 1352 0664 104B     		ldr	r3, .L81+4
 1353 0666 1B78     		ldrb	r3, [r3]
 1354 0668 DBB2     		uxtb	r3, r3
 1355 066a 2021     		movs	r1, #32
 1356 066c 0B43     		orrs	r3, r1
 1357 066e DBB2     		uxtb	r3, r3
 1358 0670 1370     		strb	r3, [r2]
 1359 0672 12E0     		b	.L70
 1360              	.L78:
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 6: *GPIO_D_ODR_LOW |= 64; break;
 1361              		.loc 3 11 0
 1362 0674 0C4A     		ldr	r2, .L81+4
 1363 0676 0C4B     		ldr	r3, .L81+4
 1364 0678 1B78     		ldrb	r3, [r3]
 1365 067a DBB2     		uxtb	r3, r3
 1366 067c 4021     		movs	r1, #64
 1367 067e 0B43     		orrs	r3, r1
 1368 0680 DBB2     		uxtb	r3, r3
 1369 0682 1370     		strb	r3, [r2]
 1370 0684 09E0     		b	.L70
 1371              	.L79:
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 7: *GPIO_D_ODR_LOW |= 128; break;
 1372              		.loc 3 12 0
 1373 0686 0849     		ldr	r1, .L81+4
 1374 0688 074B     		ldr	r3, .L81+4
 1375 068a 1B78     		ldrb	r3, [r3]
 1376 068c DBB2     		uxtb	r3, r3
 1377 068e 8022     		movs	r2, #128
 1378 0690 5242     		rsbs	r2, r2, #0
 1379 0692 1343     		orrs	r3, r2
 1380 0694 DBB2     		uxtb	r3, r3
 1381 0696 0B70     		strb	r3, [r1]
 1382 0698 C046     		nop
 1383              	.L70:
 1384              	.L80:
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1385              		.loc 3 14 0
 1386 069a C046     		nop
 1387 069c BD46     		mov	sp, r7
 1388 069e 02B0     		add	sp, sp, #8
 1389              		@ sp needed
 1390 06a0 80BD     		pop	{r7, pc}
 1391              	.L82:
 1392 06a2 C046     		.align	2
 1393              	.L81:
 1394 06a4 00000000 		.word	.L72
 1395 06a8 140C0240 		.word	1073875988
 1396              		.cfi_endproc
 1397              	.LFE16:
 1399              		.align	1
 1400              		.global	ascii_ctrl_bit_clear
 1401              		.syntax unified
 1402              		.code	16
 1403              		.thumb_func
 1404              		.fpu softvfp
 1406              	ascii_ctrl_bit_clear:
 1407              	.LFB17:
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_ctrl_bit_clear(unsigned int x) {
 1408              		.loc 3 16 0
 1409              		.cfi_startproc
 1410              		@ args = 0, pretend = 0, frame = 8
 1411              		@ frame_needed = 1, uses_anonymous_args = 0
 1412 06ac 80B5     		push	{r7, lr}
 1413              		.cfi_def_cfa_offset 8
 1414              		.cfi_offset 7, -8
 1415              		.cfi_offset 14, -4
 1416 06ae 82B0     		sub	sp, sp, #8
 1417              		.cfi_def_cfa_offset 16
 1418 06b0 00AF     		add	r7, sp, #0
 1419              		.cfi_def_cfa_register 7
 1420 06b2 7860     		str	r0, [r7, #4]
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	switch(x) {
 1421              		.loc 3 17 0
 1422 06b4 7B68     		ldr	r3, [r7, #4]
 1423 06b6 072B     		cmp	r3, #7
 1424 06b8 4DD8     		bhi	.L94
 1425 06ba 7B68     		ldr	r3, [r7, #4]
 1426 06bc 9A00     		lsls	r2, r3, #2
 1427 06be 284B     		ldr	r3, .L95
 1428 06c0 D318     		adds	r3, r2, r3
 1429 06c2 1B68     		ldr	r3, [r3]
 1430 06c4 9F46     		mov	pc, r3
 1431              		.section	.rodata
 1432              		.align	2
 1433              	.L86:
 1434 0020 C6060000 		.word	.L85
 1435 0024 D8060000 		.word	.L87
 1436 0028 EA060000 		.word	.L88
 1437 002c FC060000 		.word	.L89
 1438 0030 0E070000 		.word	.L90
 1439 0034 20070000 		.word	.L91
 1440 0038 32070000 		.word	.L92
 1441 003c 44070000 		.word	.L93
 1442              		.text
 1443              	.L85:
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(0): *GPIO_D_ODR_LOW &= 0xFE; break;
 1444              		.loc 3 18 0
 1445 06c6 274A     		ldr	r2, .L95+4
 1446 06c8 264B     		ldr	r3, .L95+4
 1447 06ca 1B78     		ldrb	r3, [r3]
 1448 06cc DBB2     		uxtb	r3, r3
 1449 06ce 0121     		movs	r1, #1
 1450 06d0 8B43     		bics	r3, r1
 1451 06d2 DBB2     		uxtb	r3, r3
 1452 06d4 1370     		strb	r3, [r2]
 1453 06d6 3EE0     		b	.L84
 1454              	.L87:
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(1): *GPIO_D_ODR_LOW &= 0xFD; break;
 1455              		.loc 3 19 0
 1456 06d8 224A     		ldr	r2, .L95+4
 1457 06da 224B     		ldr	r3, .L95+4
 1458 06dc 1B78     		ldrb	r3, [r3]
 1459 06de DBB2     		uxtb	r3, r3
 1460 06e0 0221     		movs	r1, #2
 1461 06e2 8B43     		bics	r3, r1
 1462 06e4 DBB2     		uxtb	r3, r3
 1463 06e6 1370     		strb	r3, [r2]
 1464 06e8 35E0     		b	.L84
 1465              	.L88:
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(2): *GPIO_D_ODR_LOW &= 0xFB; break;
 1466              		.loc 3 20 0
 1467 06ea 1E4A     		ldr	r2, .L95+4
 1468 06ec 1D4B     		ldr	r3, .L95+4
 1469 06ee 1B78     		ldrb	r3, [r3]
 1470 06f0 DBB2     		uxtb	r3, r3
 1471 06f2 0421     		movs	r1, #4
 1472 06f4 8B43     		bics	r3, r1
 1473 06f6 DBB2     		uxtb	r3, r3
 1474 06f8 1370     		strb	r3, [r2]
 1475 06fa 2CE0     		b	.L84
 1476              	.L89:
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(3): *GPIO_D_ODR_LOW &= 0xF7; break;
 1477              		.loc 3 21 0
 1478 06fc 194A     		ldr	r2, .L95+4
 1479 06fe 194B     		ldr	r3, .L95+4
 1480 0700 1B78     		ldrb	r3, [r3]
 1481 0702 DBB2     		uxtb	r3, r3
 1482 0704 0821     		movs	r1, #8
 1483 0706 8B43     		bics	r3, r1
 1484 0708 DBB2     		uxtb	r3, r3
 1485 070a 1370     		strb	r3, [r2]
 1486 070c 23E0     		b	.L84
 1487              	.L90:
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(4): *GPIO_D_ODR_LOW &= 0xEF; break;
 1488              		.loc 3 22 0
 1489 070e 154A     		ldr	r2, .L95+4
 1490 0710 144B     		ldr	r3, .L95+4
 1491 0712 1B78     		ldrb	r3, [r3]
 1492 0714 DBB2     		uxtb	r3, r3
 1493 0716 1021     		movs	r1, #16
 1494 0718 8B43     		bics	r3, r1
 1495 071a DBB2     		uxtb	r3, r3
 1496 071c 1370     		strb	r3, [r2]
 1497 071e 1AE0     		b	.L84
 1498              	.L91:
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(5): *GPIO_D_ODR_LOW &= 0xDF; break;
 1499              		.loc 3 23 0
 1500 0720 104A     		ldr	r2, .L95+4
 1501 0722 104B     		ldr	r3, .L95+4
 1502 0724 1B78     		ldrb	r3, [r3]
 1503 0726 DBB2     		uxtb	r3, r3
 1504 0728 2021     		movs	r1, #32
 1505 072a 8B43     		bics	r3, r1
 1506 072c DBB2     		uxtb	r3, r3
 1507 072e 1370     		strb	r3, [r2]
 1508 0730 11E0     		b	.L84
 1509              	.L92:
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(6): *GPIO_D_ODR_LOW &= 0xBF; break;
 1510              		.loc 3 24 0
 1511 0732 0C4A     		ldr	r2, .L95+4
 1512 0734 0B4B     		ldr	r3, .L95+4
 1513 0736 1B78     		ldrb	r3, [r3]
 1514 0738 DBB2     		uxtb	r3, r3
 1515 073a 4021     		movs	r1, #64
 1516 073c 8B43     		bics	r3, r1
 1517 073e DBB2     		uxtb	r3, r3
 1518 0740 1370     		strb	r3, [r2]
 1519 0742 08E0     		b	.L84
 1520              	.L93:
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(7): *GPIO_D_ODR_LOW &= 0x7F; break;
 1521              		.loc 3 25 0
 1522 0744 074A     		ldr	r2, .L95+4
 1523 0746 074B     		ldr	r3, .L95+4
 1524 0748 1B78     		ldrb	r3, [r3]
 1525 074a DBB2     		uxtb	r3, r3
 1526 074c 7F21     		movs	r1, #127
 1527 074e 0B40     		ands	r3, r1
 1528 0750 DBB2     		uxtb	r3, r3
 1529 0752 1370     		strb	r3, [r2]
 1530 0754 C046     		nop
 1531              	.L84:
 1532              	.L94:
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	}
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1533              		.loc 3 27 0
 1534 0756 C046     		nop
 1535 0758 BD46     		mov	sp, r7
 1536 075a 02B0     		add	sp, sp, #8
 1537              		@ sp needed
 1538 075c 80BD     		pop	{r7, pc}
 1539              	.L96:
 1540 075e C046     		.align	2
 1541              	.L95:
 1542 0760 20000000 		.word	.L86
 1543 0764 140C0240 		.word	1073875988
 1544              		.cfi_endproc
 1545              	.LFE17:
 1547              		.align	1
 1548              		.global	ascii_write_controller
 1549              		.syntax unified
 1550              		.code	16
 1551              		.thumb_func
 1552              		.fpu softvfp
 1554              	ascii_write_controller:
 1555              	.LFB18:
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_write_controller( unsigned char c ) {
 1556              		.loc 3 28 0
 1557              		.cfi_startproc
 1558              		@ args = 0, pretend = 0, frame = 8
 1559              		@ frame_needed = 1, uses_anonymous_args = 0
 1560 0768 80B5     		push	{r7, lr}
 1561              		.cfi_def_cfa_offset 8
 1562              		.cfi_offset 7, -8
 1563              		.cfi_offset 14, -4
 1564 076a 82B0     		sub	sp, sp, #8
 1565              		.cfi_def_cfa_offset 16
 1566 076c 00AF     		add	r7, sp, #0
 1567              		.cfi_def_cfa_register 7
 1568 076e 0200     		movs	r2, r0
 1569 0770 FB1D     		adds	r3, r7, #7
 1570 0772 1A70     		strb	r2, [r3]
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_set(B_E);
 1571              		.loc 3 29 0
 1572 0774 4020     		movs	r0, #64
 1573 0776 FFF7FEFF 		bl	ascii_ctrl_bit_set
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_D_ODR_HIGH = c;
 1574              		.loc 3 30 0
 1575 077a 064A     		ldr	r2, .L98
 1576 077c FB1D     		adds	r3, r7, #7
 1577 077e 1B78     		ldrb	r3, [r3]
 1578 0780 1370     		strb	r3, [r2]
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	delay_250ns();
 1579              		.loc 3 31 0
 1580 0782 FFF7FEFF 		bl	delay_250ns
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_E);
 1581              		.loc 3 32 0
 1582 0786 4020     		movs	r0, #64
 1583 0788 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1584              		.loc 3 33 0
 1585 078c C046     		nop
 1586 078e BD46     		mov	sp, r7
 1587 0790 02B0     		add	sp, sp, #8
 1588              		@ sp needed
 1589 0792 80BD     		pop	{r7, pc}
 1590              	.L99:
 1591              		.align	2
 1592              	.L98:
 1593 0794 150C0240 		.word	1073875989
 1594              		.cfi_endproc
 1595              	.LFE18:
 1597              		.align	1
 1598              		.global	ascii_read_controller
 1599              		.syntax unified
 1600              		.code	16
 1601              		.thumb_func
 1602              		.fpu softvfp
 1604              	ascii_read_controller:
 1605              	.LFB19:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char ascii_read_controller( void )
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** {
 1606              		.loc 3 36 0
 1607              		.cfi_startproc
 1608              		@ args = 0, pretend = 0, frame = 8
 1609              		@ frame_needed = 1, uses_anonymous_args = 0
 1610 0798 80B5     		push	{r7, lr}
 1611              		.cfi_def_cfa_offset 8
 1612              		.cfi_offset 7, -8
 1613              		.cfi_offset 14, -4
 1614 079a 82B0     		sub	sp, sp, #8
 1615              		.cfi_def_cfa_offset 16
 1616 079c 00AF     		add	r7, sp, #0
 1617              		.cfi_def_cfa_register 7
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_set(B_E);
 1618              		.loc 3 37 0
 1619 079e 4020     		movs	r0, #64
 1620 07a0 FFF7FEFF 		bl	ascii_ctrl_bit_set
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	delay_250ns();
 1621              		.loc 3 38 0
 1622 07a4 FFF7FEFF 		bl	delay_250ns
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	delay_250ns();
 1623              		.loc 3 39 0
 1624 07a8 FFF7FEFF 		bl	delay_250ns
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	unsigned char rv = *GPIO_D_IDR_HIGH;
 1625              		.loc 3 40 0
 1626 07ac 064A     		ldr	r2, .L102
 1627 07ae FB1D     		adds	r3, r7, #7
 1628 07b0 1278     		ldrb	r2, [r2]
 1629 07b2 1A70     		strb	r2, [r3]
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_E);
 1630              		.loc 3 41 0
 1631 07b4 4020     		movs	r0, #64
 1632 07b6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	return rv;
 1633              		.loc 3 42 0
 1634 07ba FB1D     		adds	r3, r7, #7
 1635 07bc 1B78     		ldrb	r3, [r3]
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1636              		.loc 3 43 0
 1637 07be 1800     		movs	r0, r3
 1638 07c0 BD46     		mov	sp, r7
 1639 07c2 02B0     		add	sp, sp, #8
 1640              		@ sp needed
 1641 07c4 80BD     		pop	{r7, pc}
 1642              	.L103:
 1643 07c6 C046     		.align	2
 1644              	.L102:
 1645 07c8 110C0240 		.word	1073875985
 1646              		.cfi_endproc
 1647              	.LFE19:
 1649              		.align	1
 1650              		.global	ascii_write_cmd
 1651              		.syntax unified
 1652              		.code	16
 1653              		.thumb_func
 1654              		.fpu softvfp
 1656              	ascii_write_cmd:
 1657              	.LFB20:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_write_cmd(unsigned char command){
 1658              		.loc 3 45 0
 1659              		.cfi_startproc
 1660              		@ args = 0, pretend = 0, frame = 8
 1661              		@ frame_needed = 1, uses_anonymous_args = 0
 1662 07cc 80B5     		push	{r7, lr}
 1663              		.cfi_def_cfa_offset 8
 1664              		.cfi_offset 7, -8
 1665              		.cfi_offset 14, -4
 1666 07ce 82B0     		sub	sp, sp, #8
 1667              		.cfi_def_cfa_offset 16
 1668 07d0 00AF     		add	r7, sp, #0
 1669              		.cfi_def_cfa_register 7
 1670 07d2 0200     		movs	r2, r0
 1671 07d4 FB1D     		adds	r3, r7, #7
 1672 07d6 1A70     		strb	r2, [r3]
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_clear(B_RS);
 1673              		.loc 3 46 0
 1674 07d8 0120     		movs	r0, #1
 1675 07da FFF7FEFF 		bl	ascii_ctrl_bit_clear
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_RW);
 1676              		.loc 3 47 0
 1677 07de 0220     		movs	r0, #2
 1678 07e0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_write_controller(command);
 1679              		.loc 3 48 0
 1680 07e4 FB1D     		adds	r3, r7, #7
 1681 07e6 1B78     		ldrb	r3, [r3]
 1682 07e8 1800     		movs	r0, r3
 1683 07ea FFF7FEFF 		bl	ascii_write_controller
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1684              		.loc 3 49 0
 1685 07ee C046     		nop
 1686 07f0 BD46     		mov	sp, r7
 1687 07f2 02B0     		add	sp, sp, #8
 1688              		@ sp needed
 1689 07f4 80BD     		pop	{r7, pc}
 1690              		.cfi_endproc
 1691              	.LFE20:
 1693              		.align	1
 1694              		.global	ascii_write_data
 1695              		.syntax unified
 1696              		.code	16
 1697              		.thumb_func
 1698              		.fpu softvfp
 1700              	ascii_write_data:
 1701              	.LFB21:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_write_data(unsigned char data){
 1702              		.loc 3 51 0
 1703              		.cfi_startproc
 1704              		@ args = 0, pretend = 0, frame = 8
 1705              		@ frame_needed = 1, uses_anonymous_args = 0
 1706 07f6 80B5     		push	{r7, lr}
 1707              		.cfi_def_cfa_offset 8
 1708              		.cfi_offset 7, -8
 1709              		.cfi_offset 14, -4
 1710 07f8 82B0     		sub	sp, sp, #8
 1711              		.cfi_def_cfa_offset 16
 1712 07fa 00AF     		add	r7, sp, #0
 1713              		.cfi_def_cfa_register 7
 1714 07fc 0200     		movs	r2, r0
 1715 07fe FB1D     		adds	r3, r7, #7
 1716 0800 1A70     		strb	r2, [r3]
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_set(B_RS);
 1717              		.loc 3 52 0
 1718 0802 0120     		movs	r0, #1
 1719 0804 FFF7FEFF 		bl	ascii_ctrl_bit_set
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_RW);
 1720              		.loc 3 53 0
 1721 0808 0220     		movs	r0, #2
 1722 080a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_write_controller(data);
 1723              		.loc 3 54 0
 1724 080e FB1D     		adds	r3, r7, #7
 1725 0810 1B78     		ldrb	r3, [r3]
 1726 0812 1800     		movs	r0, r3
 1727 0814 FFF7FEFF 		bl	ascii_write_controller
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1728              		.loc 3 55 0
 1729 0818 C046     		nop
 1730 081a BD46     		mov	sp, r7
 1731 081c 02B0     		add	sp, sp, #8
 1732              		@ sp needed
 1733 081e 80BD     		pop	{r7, pc}
 1734              		.cfi_endproc
 1735              	.LFE21:
 1737              		.align	1
 1738              		.global	ascii_read_status
 1739              		.syntax unified
 1740              		.code	16
 1741              		.thumb_func
 1742              		.fpu softvfp
 1744              	ascii_read_status:
 1745              	.LFB22:
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char ascii_read_status(void){
 1746              		.loc 3 57 0
 1747              		.cfi_startproc
 1748              		@ args = 0, pretend = 0, frame = 8
 1749              		@ frame_needed = 1, uses_anonymous_args = 0
 1750 0820 90B5     		push	{r4, r7, lr}
 1751              		.cfi_def_cfa_offset 12
 1752              		.cfi_offset 4, -12
 1753              		.cfi_offset 7, -8
 1754              		.cfi_offset 14, -4
 1755 0822 83B0     		sub	sp, sp, #12
 1756              		.cfi_def_cfa_offset 24
 1757 0824 00AF     		add	r7, sp, #0
 1758              		.cfi_def_cfa_register 7
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     *GPIO_D_MODER &= 0x0000FFFF;	
 1759              		.loc 3 58 0
 1760 0826 114B     		ldr	r3, .L108
 1761 0828 104A     		ldr	r2, .L108
 1762 082a 1268     		ldr	r2, [r2]
 1763 082c 1204     		lsls	r2, r2, #16
 1764 082e 120C     		lsrs	r2, r2, #16
 1765 0830 1A60     		str	r2, [r3]
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_RS);
 1766              		.loc 3 59 0
 1767 0832 0120     		movs	r0, #1
 1768 0834 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_set(B_RW);
 1769              		.loc 3 60 0
 1770 0838 0220     		movs	r0, #2
 1771 083a FFF7FEFF 		bl	ascii_ctrl_bit_set
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	unsigned char rv = ascii_read_controller();
 1772              		.loc 3 61 0
 1773 083e FC1D     		adds	r4, r7, #7
 1774 0840 FFF7FEFF 		bl	ascii_read_controller
 1775 0844 0300     		movs	r3, r0
 1776 0846 2370     		strb	r3, [r4]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_D_MODER &= 0x0000FFFF;
 1777              		.loc 3 62 0
 1778 0848 084B     		ldr	r3, .L108
 1779 084a 084A     		ldr	r2, .L108
 1780 084c 1268     		ldr	r2, [r2]
 1781 084e 1204     		lsls	r2, r2, #16
 1782 0850 120C     		lsrs	r2, r2, #16
 1783 0852 1A60     		str	r2, [r3]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_D_MODER |= 0x55550000;	
 1784              		.loc 3 63 0
 1785 0854 054B     		ldr	r3, .L108
 1786 0856 054A     		ldr	r2, .L108
 1787 0858 1268     		ldr	r2, [r2]
 1788 085a 0549     		ldr	r1, .L108+4
 1789 085c 0A43     		orrs	r2, r1
 1790 085e 1A60     		str	r2, [r3]
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	return rv;
 1791              		.loc 3 64 0
 1792 0860 FB1D     		adds	r3, r7, #7
 1793 0862 1B78     		ldrb	r3, [r3]
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1794              		.loc 3 65 0
 1795 0864 1800     		movs	r0, r3
 1796 0866 BD46     		mov	sp, r7
 1797 0868 03B0     		add	sp, sp, #12
 1798              		@ sp needed
 1799 086a 90BD     		pop	{r4, r7, pc}
 1800              	.L109:
 1801              		.align	2
 1802              	.L108:
 1803 086c 000C0240 		.word	1073875968
 1804 0870 00005555 		.word	1431633920
 1805              		.cfi_endproc
 1806              	.LFE22:
 1808              		.align	1
 1809              		.global	ascii_read_data
 1810              		.syntax unified
 1811              		.code	16
 1812              		.thumb_func
 1813              		.fpu softvfp
 1815              	ascii_read_data:
 1816              	.LFB23:
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char ascii_read_data(void){
 1817              		.loc 3 67 0
 1818              		.cfi_startproc
 1819              		@ args = 0, pretend = 0, frame = 8
 1820              		@ frame_needed = 1, uses_anonymous_args = 0
 1821 0874 90B5     		push	{r4, r7, lr}
 1822              		.cfi_def_cfa_offset 12
 1823              		.cfi_offset 4, -12
 1824              		.cfi_offset 7, -8
 1825              		.cfi_offset 14, -4
 1826 0876 83B0     		sub	sp, sp, #12
 1827              		.cfi_def_cfa_offset 24
 1828 0878 00AF     		add	r7, sp, #0
 1829              		.cfi_def_cfa_register 7
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     *GPIO_D_MODER &= 0x0000FFFF;	
 1830              		.loc 3 68 0
 1831 087a 114B     		ldr	r3, .L112
 1832 087c 104A     		ldr	r2, .L112
 1833 087e 1268     		ldr	r2, [r2]
 1834 0880 1204     		lsls	r2, r2, #16
 1835 0882 120C     		lsrs	r2, r2, #16
 1836 0884 1A60     		str	r2, [r3]
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_set(B_RS);
 1837              		.loc 3 69 0
 1838 0886 0120     		movs	r0, #1
 1839 0888 FFF7FEFF 		bl	ascii_ctrl_bit_set
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_set(B_RW);
 1840              		.loc 3 70 0
 1841 088c 0220     		movs	r0, #2
 1842 088e FFF7FEFF 		bl	ascii_ctrl_bit_set
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	unsigned char rv = ascii_read_controller();
 1843              		.loc 3 71 0
 1844 0892 FC1D     		adds	r4, r7, #7
 1845 0894 FFF7FEFF 		bl	ascii_read_controller
 1846 0898 0300     		movs	r3, r0
 1847 089a 2370     		strb	r3, [r4]
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_D_MODER &= 0x0000FFFF;
 1848              		.loc 3 72 0
 1849 089c 084B     		ldr	r3, .L112
 1850 089e 084A     		ldr	r2, .L112
 1851 08a0 1268     		ldr	r2, [r2]
 1852 08a2 1204     		lsls	r2, r2, #16
 1853 08a4 120C     		lsrs	r2, r2, #16
 1854 08a6 1A60     		str	r2, [r3]
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_D_MODER |= 0x55550000;	
 1855              		.loc 3 73 0
 1856 08a8 054B     		ldr	r3, .L112
 1857 08aa 054A     		ldr	r2, .L112
 1858 08ac 1268     		ldr	r2, [r2]
 1859 08ae 0549     		ldr	r1, .L112+4
 1860 08b0 0A43     		orrs	r2, r1
 1861 08b2 1A60     		str	r2, [r3]
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	return rv;
 1862              		.loc 3 74 0
 1863 08b4 FB1D     		adds	r3, r7, #7
 1864 08b6 1B78     		ldrb	r3, [r3]
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1865              		.loc 3 75 0
 1866 08b8 1800     		movs	r0, r3
 1867 08ba BD46     		mov	sp, r7
 1868 08bc 03B0     		add	sp, sp, #12
 1869              		@ sp needed
 1870 08be 90BD     		pop	{r4, r7, pc}
 1871              	.L113:
 1872              		.align	2
 1873              	.L112:
 1874 08c0 000C0240 		.word	1073875968
 1875 08c4 00005555 		.word	1431633920
 1876              		.cfi_endproc
 1877              	.LFE23:
 1879              		.align	1
 1880              		.global	ascii_command
 1881              		.syntax unified
 1882              		.code	16
 1883              		.thumb_func
 1884              		.fpu softvfp
 1886              	ascii_command:
 1887              	.LFB24:
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_command(char command, unsigned int delayMicroSec){
 1888              		.loc 3 77 0
 1889              		.cfi_startproc
 1890              		@ args = 0, pretend = 0, frame = 8
 1891              		@ frame_needed = 1, uses_anonymous_args = 0
 1892 08c8 80B5     		push	{r7, lr}
 1893              		.cfi_def_cfa_offset 8
 1894              		.cfi_offset 7, -8
 1895              		.cfi_offset 14, -4
 1896 08ca 82B0     		sub	sp, sp, #8
 1897              		.cfi_def_cfa_offset 16
 1898 08cc 00AF     		add	r7, sp, #0
 1899              		.cfi_def_cfa_register 7
 1900 08ce 0200     		movs	r2, r0
 1901 08d0 3960     		str	r1, [r7]
 1902 08d2 FB1D     		adds	r3, r7, #7
 1903 08d4 1A70     		strb	r2, [r3]
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     while((ascii_read_status() & 0x80) == 0x80) {
 1904              		.loc 3 78 0
 1905 08d6 C046     		nop
 1906              	.L115:
 1907              		.loc 3 78 0 is_stmt 0 discriminator 1
 1908 08d8 FFF7FEFF 		bl	ascii_read_status
 1909 08dc 0300     		movs	r3, r0
 1910 08de 1A00     		movs	r2, r3
 1911 08e0 8023     		movs	r3, #128
 1912 08e2 1340     		ands	r3, r2
 1913 08e4 802B     		cmp	r3, #128
 1914 08e6 F7D0     		beq	.L115
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             //TODO implement pip subroutine
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         }
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     delay_micro(8);
 1915              		.loc 3 81 0 is_stmt 1
 1916 08e8 0820     		movs	r0, #8
 1917 08ea FFF7FEFF 		bl	delay_micro
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_write_cmd(command);
 1918              		.loc 3 82 0
 1919 08ee FB1D     		adds	r3, r7, #7
 1920 08f0 1B78     		ldrb	r3, [r3]
 1921 08f2 1800     		movs	r0, r3
 1922 08f4 FFF7FEFF 		bl	ascii_write_cmd
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     delay_micro(delayMicroSec);
 1923              		.loc 3 83 0
 1924 08f8 3B68     		ldr	r3, [r7]
 1925 08fa 1800     		movs	r0, r3
 1926 08fc FFF7FEFF 		bl	delay_micro
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1927              		.loc 3 84 0
 1928 0900 C046     		nop
 1929 0902 BD46     		mov	sp, r7
 1930 0904 02B0     		add	sp, sp, #8
 1931              		@ sp needed
 1932 0906 80BD     		pop	{r7, pc}
 1933              		.cfi_endproc
 1934              	.LFE24:
 1936              		.align	1
 1937              		.global	ascii_init
 1938              		.syntax unified
 1939              		.code	16
 1940              		.thumb_func
 1941              		.fpu softvfp
 1943              	ascii_init:
 1944              	.LFB25:
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_init(void){
 1945              		.loc 3 86 0
 1946              		.cfi_startproc
 1947              		@ args = 0, pretend = 0, frame = 0
 1948              		@ frame_needed = 1, uses_anonymous_args = 0
 1949 0908 80B5     		push	{r7, lr}
 1950              		.cfi_def_cfa_offset 8
 1951              		.cfi_offset 7, -8
 1952              		.cfi_offset 14, -4
 1953 090a 00AF     		add	r7, sp, #0
 1954              		.cfi_def_cfa_register 7
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_ctrl_bit_set(B_SELECT);
 1955              		.loc 3 87 0
 1956 090c 0420     		movs	r0, #4
 1957 090e FFF7FEFF 		bl	ascii_ctrl_bit_set
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0x38, 40); //Set disp size, delay 40 ms
 1958              		.loc 3 88 0
 1959 0912 2821     		movs	r1, #40
 1960 0914 3820     		movs	r0, #56
 1961 0916 FFF7FEFF 		bl	ascii_command
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0xE, 40); //delay set to 40 bcs DR.eHugo
 1962              		.loc 3 89 0
 1963 091a 2821     		movs	r1, #40
 1964 091c 0E20     		movs	r0, #14
 1965 091e FFF7FEFF 		bl	ascii_command
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0x01, 1530); // Cls
 1966              		.loc 3 90 0
 1967 0922 064B     		ldr	r3, .L117
 1968 0924 1900     		movs	r1, r3
 1969 0926 0120     		movs	r0, #1
 1970 0928 FFF7FEFF 		bl	ascii_command
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0x6, 40); // Inc
 1971              		.loc 3 91 0
 1972 092c 2821     		movs	r1, #40
 1973 092e 0620     		movs	r0, #6
 1974 0930 FFF7FEFF 		bl	ascii_command
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1975              		.loc 3 92 0
 1976 0934 C046     		nop
 1977 0936 BD46     		mov	sp, r7
 1978              		@ sp needed
 1979 0938 80BD     		pop	{r7, pc}
 1980              	.L118:
 1981 093a C046     		.align	2
 1982              	.L117:
 1983 093c FA050000 		.word	1530
 1984              		.cfi_endproc
 1985              	.LFE25:
 1987              		.align	1
 1988              		.global	kbdActivate
 1989              		.syntax unified
 1990              		.code	16
 1991              		.thumb_func
 1992              		.fpu softvfp
 1994              	kbdActivate:
 1995              	.LFB26:
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void kbdActivate(unsigned int row){
 1996              		.loc 3 95 0
 1997              		.cfi_startproc
 1998              		@ args = 0, pretend = 0, frame = 8
 1999              		@ frame_needed = 1, uses_anonymous_args = 0
 2000 0940 80B5     		push	{r7, lr}
 2001              		.cfi_def_cfa_offset 8
 2002              		.cfi_offset 7, -8
 2003              		.cfi_offset 14, -4
 2004 0942 82B0     		sub	sp, sp, #8
 2005              		.cfi_def_cfa_offset 16
 2006 0944 00AF     		add	r7, sp, #0
 2007              		.cfi_def_cfa_register 7
 2008 0946 7860     		str	r0, [r7, #4]
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     switch(row)
 2009              		.loc 3 96 0
 2010 0948 7B68     		ldr	r3, [r7, #4]
 2011 094a 042B     		cmp	r3, #4
 2012 094c 19D8     		bhi	.L127
 2013 094e 7B68     		ldr	r3, [r7, #4]
 2014 0950 9A00     		lsls	r2, r3, #2
 2015 0952 0E4B     		ldr	r3, .L128
 2016 0954 D318     		adds	r3, r2, r3
 2017 0956 1B68     		ldr	r3, [r3]
 2018 0958 9F46     		mov	pc, r3
 2019              		.section	.rodata
 2020              		.align	2
 2021              	.L122:
 2022 0040 7A090000 		.word	.L121
 2023 0044 5A090000 		.word	.L123
 2024 0048 62090000 		.word	.L124
 2025 004c 6A090000 		.word	.L125
 2026 0050 72090000 		.word	.L126
 2027              		.text
 2028              	.L123:
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         {
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             //activate row N or deactivate with 0 
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 1: *GPIO_D_ODR_HIGH = 0x10; break;
 2029              		.loc 3 99 0
 2030 095a 0D4B     		ldr	r3, .L128+4
 2031 095c 1022     		movs	r2, #16
 2032 095e 1A70     		strb	r2, [r3]
 2033 0960 0FE0     		b	.L120
 2034              	.L124:
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 2: *GPIO_D_ODR_HIGH = 0x20; break;
 2035              		.loc 3 100 0
 2036 0962 0B4B     		ldr	r3, .L128+4
 2037 0964 2022     		movs	r2, #32
 2038 0966 1A70     		strb	r2, [r3]
 2039 0968 0BE0     		b	.L120
 2040              	.L125:
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 3: *GPIO_D_ODR_HIGH = 0x40; break;
 2041              		.loc 3 101 0
 2042 096a 094B     		ldr	r3, .L128+4
 2043 096c 4022     		movs	r2, #64
 2044 096e 1A70     		strb	r2, [r3]
 2045 0970 07E0     		b	.L120
 2046              	.L126:
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 4: *GPIO_D_ODR_HIGH = 0x80; break;
 2047              		.loc 3 102 0
 2048 0972 074B     		ldr	r3, .L128+4
 2049 0974 8022     		movs	r2, #128
 2050 0976 1A70     		strb	r2, [r3]
 2051 0978 03E0     		b	.L120
 2052              	.L121:
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 0: *GPIO_D_ODR_HIGH = 0x00; break;
 2053              		.loc 3 103 0
 2054 097a 054B     		ldr	r3, .L128+4
 2055 097c 0022     		movs	r2, #0
 2056 097e 1A70     		strb	r2, [r3]
 2057 0980 C046     		nop
 2058              	.L120:
 2059              	.L127:
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         }
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 2060              		.loc 3 106 0
 2061 0982 C046     		nop
 2062 0984 BD46     		mov	sp, r7
 2063 0986 02B0     		add	sp, sp, #8
 2064              		@ sp needed
 2065 0988 80BD     		pop	{r7, pc}
 2066              	.L129:
 2067 098a C046     		.align	2
 2068              	.L128:
 2069 098c 40000000 		.word	.L122
 2070 0990 150C0240 		.word	1073875989
 2071              		.cfi_endproc
 2072              	.LFE26:
 2074              		.align	1
 2075              		.global	kdbGetCol
 2076              		.syntax unified
 2077              		.code	16
 2078              		.thumb_func
 2079              		.fpu softvfp
 2081              	kdbGetCol:
 2082              	.LFB27:
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** int kdbGetCol(void){
 2083              		.loc 3 108 0
 2084              		.cfi_startproc
 2085              		@ args = 0, pretend = 0, frame = 8
 2086              		@ frame_needed = 1, uses_anonymous_args = 0
 2087 0994 80B5     		push	{r7, lr}
 2088              		.cfi_def_cfa_offset 8
 2089              		.cfi_offset 7, -8
 2090              		.cfi_offset 14, -4
 2091 0996 82B0     		sub	sp, sp, #8
 2092              		.cfi_def_cfa_offset 16
 2093 0998 00AF     		add	r7, sp, #0
 2094              		.cfi_def_cfa_register 7
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         unsigned char idr;
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         idr = *GPIO_D_IDR_HIGH;
 2095              		.loc 3 110 0
 2096 099a 124A     		ldr	r2, .L136
 2097 099c FB1D     		adds	r3, r7, #7
 2098 099e 1278     		ldrb	r2, [r2]
 2099 09a0 1A70     		strb	r2, [r3]
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x8) return 4;
 2100              		.loc 3 112 0
 2101 09a2 FB1D     		adds	r3, r7, #7
 2102 09a4 1B78     		ldrb	r3, [r3]
 2103 09a6 0822     		movs	r2, #8
 2104 09a8 1340     		ands	r3, r2
 2105 09aa 01D0     		beq	.L131
 2106              		.loc 3 112 0 is_stmt 0 discriminator 1
 2107 09ac 0423     		movs	r3, #4
 2108 09ae 15E0     		b	.L132
 2109              	.L131:
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x4) return 3;
 2110              		.loc 3 113 0 is_stmt 1
 2111 09b0 FB1D     		adds	r3, r7, #7
 2112 09b2 1B78     		ldrb	r3, [r3]
 2113 09b4 0422     		movs	r2, #4
 2114 09b6 1340     		ands	r3, r2
 2115 09b8 01D0     		beq	.L133
 2116              		.loc 3 113 0 is_stmt 0 discriminator 1
 2117 09ba 0323     		movs	r3, #3
 2118 09bc 0EE0     		b	.L132
 2119              	.L133:
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x2) return 2;
 2120              		.loc 3 114 0 is_stmt 1
 2121 09be FB1D     		adds	r3, r7, #7
 2122 09c0 1B78     		ldrb	r3, [r3]
 2123 09c2 0222     		movs	r2, #2
 2124 09c4 1340     		ands	r3, r2
 2125 09c6 01D0     		beq	.L134
 2126              		.loc 3 114 0 is_stmt 0 discriminator 1
 2127 09c8 0223     		movs	r3, #2
 2128 09ca 07E0     		b	.L132
 2129              	.L134:
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x1) return 1;
 2130              		.loc 3 115 0 is_stmt 1
 2131 09cc FB1D     		adds	r3, r7, #7
 2132 09ce 1B78     		ldrb	r3, [r3]
 2133 09d0 0122     		movs	r2, #1
 2134 09d2 1340     		ands	r3, r2
 2135 09d4 01D0     		beq	.L135
 2136              		.loc 3 115 0 is_stmt 0 discriminator 1
 2137 09d6 0123     		movs	r3, #1
 2138 09d8 00E0     		b	.L132
 2139              	.L135:
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         return 0;
 2140              		.loc 3 116 0 is_stmt 1
 2141 09da 0023     		movs	r3, #0
 2142              	.L132:
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 2143              		.loc 3 117 0
 2144 09dc 1800     		movs	r0, r3
 2145 09de BD46     		mov	sp, r7
 2146 09e0 02B0     		add	sp, sp, #8
 2147              		@ sp needed
 2148 09e2 80BD     		pop	{r7, pc}
 2149              	.L137:
 2150              		.align	2
 2151              	.L136:
 2152 09e4 110C0240 		.word	1073875985
 2153              		.cfi_endproc
 2154              	.LFE27:
 2156              		.align	1
 2157              		.global	outSeg7
 2158              		.syntax unified
 2159              		.code	16
 2160              		.thumb_func
 2161              		.fpu softvfp
 2163              	outSeg7:
 2164              	.LFB28:
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void outSeg7(unsigned char in)
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     {
 2165              		.loc 3 120 0
 2166              		.cfi_startproc
 2167              		@ args = 0, pretend = 0, frame = 8
 2168              		@ frame_needed = 1, uses_anonymous_args = 0
 2169 09e8 80B5     		push	{r7, lr}
 2170              		.cfi_def_cfa_offset 8
 2171              		.cfi_offset 7, -8
 2172              		.cfi_offset 14, -4
 2173 09ea 82B0     		sub	sp, sp, #8
 2174              		.cfi_def_cfa_offset 16
 2175 09ec 00AF     		add	r7, sp, #0
 2176              		.cfi_def_cfa_register 7
 2177 09ee 0200     		movs	r2, r0
 2178 09f0 FB1D     		adds	r3, r7, #7
 2179 09f2 1A70     		strb	r2, [r3]
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x0) *GPIO_D_ODR_LOW = 0x3F;
 2180              		.loc 3 122 0
 2181 09f4 FB1D     		adds	r3, r7, #7
 2182 09f6 1B78     		ldrb	r3, [r3]
 2183 09f8 002B     		cmp	r3, #0
 2184 09fa 02D1     		bne	.L139
 2185              		.loc 3 122 0 is_stmt 0 discriminator 1
 2186 09fc 394B     		ldr	r3, .L157
 2187 09fe 3F22     		movs	r2, #63
 2188 0a00 1A70     		strb	r2, [r3]
 2189              	.L139:
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x1) *GPIO_D_ODR_LOW = 0x06;
 2190              		.loc 3 123 0 is_stmt 1
 2191 0a02 FB1D     		adds	r3, r7, #7
 2192 0a04 1B78     		ldrb	r3, [r3]
 2193 0a06 012B     		cmp	r3, #1
 2194 0a08 02D1     		bne	.L140
 2195              		.loc 3 123 0 is_stmt 0 discriminator 1
 2196 0a0a 364B     		ldr	r3, .L157
 2197 0a0c 0622     		movs	r2, #6
 2198 0a0e 1A70     		strb	r2, [r3]
 2199              	.L140:
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x2) *GPIO_D_ODR_LOW = 0x5B;
 2200              		.loc 3 124 0 is_stmt 1
 2201 0a10 FB1D     		adds	r3, r7, #7
 2202 0a12 1B78     		ldrb	r3, [r3]
 2203 0a14 022B     		cmp	r3, #2
 2204 0a16 02D1     		bne	.L141
 2205              		.loc 3 124 0 is_stmt 0 discriminator 1
 2206 0a18 324B     		ldr	r3, .L157
 2207 0a1a 5B22     		movs	r2, #91
 2208 0a1c 1A70     		strb	r2, [r3]
 2209              	.L141:
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x3) *GPIO_D_ODR_LOW = 0x4F;
 2210              		.loc 3 125 0 is_stmt 1
 2211 0a1e FB1D     		adds	r3, r7, #7
 2212 0a20 1B78     		ldrb	r3, [r3]
 2213 0a22 032B     		cmp	r3, #3
 2214 0a24 02D1     		bne	.L142
 2215              		.loc 3 125 0 is_stmt 0 discriminator 1
 2216 0a26 2F4B     		ldr	r3, .L157
 2217 0a28 4F22     		movs	r2, #79
 2218 0a2a 1A70     		strb	r2, [r3]
 2219              	.L142:
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x4) *GPIO_D_ODR_LOW = 0x66;
 2220              		.loc 3 126 0 is_stmt 1
 2221 0a2c FB1D     		adds	r3, r7, #7
 2222 0a2e 1B78     		ldrb	r3, [r3]
 2223 0a30 042B     		cmp	r3, #4
 2224 0a32 02D1     		bne	.L143
 2225              		.loc 3 126 0 is_stmt 0 discriminator 1
 2226 0a34 2B4B     		ldr	r3, .L157
 2227 0a36 6622     		movs	r2, #102
 2228 0a38 1A70     		strb	r2, [r3]
 2229              	.L143:
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x5) *GPIO_D_ODR_LOW = 0x6D;
 2230              		.loc 3 127 0 is_stmt 1
 2231 0a3a FB1D     		adds	r3, r7, #7
 2232 0a3c 1B78     		ldrb	r3, [r3]
 2233 0a3e 052B     		cmp	r3, #5
 2234 0a40 02D1     		bne	.L144
 2235              		.loc 3 127 0 is_stmt 0 discriminator 1
 2236 0a42 284B     		ldr	r3, .L157
 2237 0a44 6D22     		movs	r2, #109
 2238 0a46 1A70     		strb	r2, [r3]
 2239              	.L144:
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x6) *GPIO_D_ODR_LOW = 0x7D;
 2240              		.loc 3 128 0 is_stmt 1
 2241 0a48 FB1D     		adds	r3, r7, #7
 2242 0a4a 1B78     		ldrb	r3, [r3]
 2243 0a4c 062B     		cmp	r3, #6
 2244 0a4e 02D1     		bne	.L145
 2245              		.loc 3 128 0 is_stmt 0 discriminator 1
 2246 0a50 244B     		ldr	r3, .L157
 2247 0a52 7D22     		movs	r2, #125
 2248 0a54 1A70     		strb	r2, [r3]
 2249              	.L145:
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x7) *GPIO_D_ODR_LOW = 0x07;
 2250              		.loc 3 129 0 is_stmt 1
 2251 0a56 FB1D     		adds	r3, r7, #7
 2252 0a58 1B78     		ldrb	r3, [r3]
 2253 0a5a 072B     		cmp	r3, #7
 2254 0a5c 02D1     		bne	.L146
 2255              		.loc 3 129 0 is_stmt 0 discriminator 1
 2256 0a5e 214B     		ldr	r3, .L157
 2257 0a60 0722     		movs	r2, #7
 2258 0a62 1A70     		strb	r2, [r3]
 2259              	.L146:
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x8) *GPIO_D_ODR_LOW = 0x7F;
 2260              		.loc 3 130 0 is_stmt 1
 2261 0a64 FB1D     		adds	r3, r7, #7
 2262 0a66 1B78     		ldrb	r3, [r3]
 2263 0a68 082B     		cmp	r3, #8
 2264 0a6a 02D1     		bne	.L147
 2265              		.loc 3 130 0 is_stmt 0 discriminator 1
 2266 0a6c 1D4B     		ldr	r3, .L157
 2267 0a6e 7F22     		movs	r2, #127
 2268 0a70 1A70     		strb	r2, [r3]
 2269              	.L147:
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x9) *GPIO_D_ODR_LOW = 0x67;
 2270              		.loc 3 131 0 is_stmt 1
 2271 0a72 FB1D     		adds	r3, r7, #7
 2272 0a74 1B78     		ldrb	r3, [r3]
 2273 0a76 092B     		cmp	r3, #9
 2274 0a78 02D1     		bne	.L148
 2275              		.loc 3 131 0 is_stmt 0 discriminator 1
 2276 0a7a 1A4B     		ldr	r3, .L157
 2277 0a7c 6722     		movs	r2, #103
 2278 0a7e 1A70     		strb	r2, [r3]
 2279              	.L148:
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xA) *GPIO_D_ODR_LOW = 0x77;
 2280              		.loc 3 132 0 is_stmt 1
 2281 0a80 FB1D     		adds	r3, r7, #7
 2282 0a82 1B78     		ldrb	r3, [r3]
 2283 0a84 0A2B     		cmp	r3, #10
 2284 0a86 02D1     		bne	.L149
 2285              		.loc 3 132 0 is_stmt 0 discriminator 1
 2286 0a88 164B     		ldr	r3, .L157
 2287 0a8a 7722     		movs	r2, #119
 2288 0a8c 1A70     		strb	r2, [r3]
 2289              	.L149:
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xB) *GPIO_D_ODR_LOW = 0x7F;
 2290              		.loc 3 133 0 is_stmt 1
 2291 0a8e FB1D     		adds	r3, r7, #7
 2292 0a90 1B78     		ldrb	r3, [r3]
 2293 0a92 0B2B     		cmp	r3, #11
 2294 0a94 02D1     		bne	.L150
 2295              		.loc 3 133 0 is_stmt 0 discriminator 1
 2296 0a96 134B     		ldr	r3, .L157
 2297 0a98 7F22     		movs	r2, #127
 2298 0a9a 1A70     		strb	r2, [r3]
 2299              	.L150:
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xC) *GPIO_D_ODR_LOW = 0xFF;
 2300              		.loc 3 134 0 is_stmt 1
 2301 0a9c FB1D     		adds	r3, r7, #7
 2302 0a9e 1B78     		ldrb	r3, [r3]
 2303 0aa0 0C2B     		cmp	r3, #12
 2304 0aa2 02D1     		bne	.L151
 2305              		.loc 3 134 0 is_stmt 0 discriminator 1
 2306 0aa4 0F4B     		ldr	r3, .L157
 2307 0aa6 FF22     		movs	r2, #255
 2308 0aa8 1A70     		strb	r2, [r3]
 2309              	.L151:
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xD) *GPIO_D_ODR_LOW = 0xBF;
 2310              		.loc 3 135 0 is_stmt 1
 2311 0aaa FB1D     		adds	r3, r7, #7
 2312 0aac 1B78     		ldrb	r3, [r3]
 2313 0aae 0D2B     		cmp	r3, #13
 2314 0ab0 02D1     		bne	.L152
 2315              		.loc 3 135 0 is_stmt 0 discriminator 1
 2316 0ab2 0C4B     		ldr	r3, .L157
 2317 0ab4 BF22     		movs	r2, #191
 2318 0ab6 1A70     		strb	r2, [r3]
 2319              	.L152:
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xE) *GPIO_D_ODR_LOW = 0x79;
 2320              		.loc 3 136 0 is_stmt 1
 2321 0ab8 FB1D     		adds	r3, r7, #7
 2322 0aba 1B78     		ldrb	r3, [r3]
 2323 0abc 0E2B     		cmp	r3, #14
 2324 0abe 02D1     		bne	.L153
 2325              		.loc 3 136 0 is_stmt 0 discriminator 1
 2326 0ac0 084B     		ldr	r3, .L157
 2327 0ac2 7922     		movs	r2, #121
 2328 0ac4 1A70     		strb	r2, [r3]
 2329              	.L153:
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xF) *GPIO_D_ODR_LOW = 0x71;
 2330              		.loc 3 137 0 is_stmt 1
 2331 0ac6 FB1D     		adds	r3, r7, #7
 2332 0ac8 1B78     		ldrb	r3, [r3]
 2333 0aca 0F2B     		cmp	r3, #15
 2334 0acc 03D1     		bne	.L154
 2335              		.loc 3 137 0 is_stmt 0 discriminator 1
 2336 0ace 054B     		ldr	r3, .L157
 2337 0ad0 7122     		movs	r2, #113
 2338 0ad2 1A70     		strb	r2, [r3]
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	else *GPIO_D_ODR_LOW = 0x00;
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 2339              		.loc 3 140 0 is_stmt 1 discriminator 1
 2340 0ad4 02E0     		b	.L156
 2341              	.L154:
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	else *GPIO_D_ODR_LOW = 0x00;
 2342              		.loc 3 138 0
 2343 0ad6 034B     		ldr	r3, .L157
 2344 0ad8 0022     		movs	r2, #0
 2345 0ada 1A70     		strb	r2, [r3]
 2346              	.L156:
 2347              		.loc 3 140 0
 2348 0adc C046     		nop
 2349 0ade BD46     		mov	sp, r7
 2350 0ae0 02B0     		add	sp, sp, #8
 2351              		@ sp needed
 2352 0ae2 80BD     		pop	{r7, pc}
 2353              	.L158:
 2354              		.align	2
 2355              	.L157:
 2356 0ae4 140C0240 		.word	1073875988
 2357              		.cfi_endproc
 2358              	.LFE28:
 2360              		.section	.rodata
 2361              		.align	2
 2362              	.LC0:
 2363 0054 01       		.byte	1
 2364 0055 02       		.byte	2
 2365 0056 03       		.byte	3
 2366 0057 0A       		.byte	10
 2367 0058 04       		.byte	4
 2368 0059 05       		.byte	5
 2369 005a 06       		.byte	6
 2370 005b 0B       		.byte	11
 2371 005c 07       		.byte	7
 2372 005d 08       		.byte	8
 2373 005e 09       		.byte	9
 2374 005f 0C       		.byte	12
 2375 0060 0E       		.byte	14
 2376 0061 00       		.byte	0
 2377 0062 0F       		.byte	15
 2378 0063 0D       		.byte	13
 2379              		.text
 2380              		.align	1
 2381              		.global	keyb
 2382              		.syntax unified
 2383              		.code	16
 2384              		.thumb_func
 2385              		.fpu softvfp
 2387              	keyb:
 2388              	.LFB29:
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char keyb(void){
 2389              		.loc 3 142 0
 2390              		.cfi_startproc
 2391              		@ args = 0, pretend = 0, frame = 24
 2392              		@ frame_needed = 1, uses_anonymous_args = 0
 2393 0ae8 90B5     		push	{r4, r7, lr}
 2394              		.cfi_def_cfa_offset 12
 2395              		.cfi_offset 4, -12
 2396              		.cfi_offset 7, -8
 2397              		.cfi_offset 14, -4
 2398 0aea 87B0     		sub	sp, sp, #28
 2399              		.cfi_def_cfa_offset 40
 2400 0aec 00AF     		add	r7, sp, #0
 2401              		.cfi_def_cfa_register 7
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
 2402              		.loc 3 143 0
 2403 0aee 3B00     		movs	r3, r7
 2404 0af0 174A     		ldr	r2, .L165
 2405 0af2 13CA     		ldmia	r2!, {r0, r1, r4}
 2406 0af4 13C3     		stmia	r3!, {r0, r1, r4}
 2407 0af6 1268     		ldr	r2, [r2]
 2408 0af8 1A60     		str	r2, [r3]
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         int row, col;
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         for(row = 1; row <= 4; row++)
 2409              		.loc 3 145 0
 2410 0afa 0123     		movs	r3, #1
 2411 0afc 7B61     		str	r3, [r7, #20]
 2412 0afe 1BE0     		b	.L160
 2413              	.L163:
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             {
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             kbdActivate(row);
 2414              		.loc 3 147 0
 2415 0b00 7B69     		ldr	r3, [r7, #20]
 2416 0b02 1800     		movs	r0, r3
 2417 0b04 FFF7FEFF 		bl	kbdActivate
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 			delay_250ns();
 2418              		.loc 3 148 0
 2419 0b08 FFF7FEFF 		bl	delay_250ns
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             if(col = kdbGetCol())
 2420              		.loc 3 149 0
 2421 0b0c FFF7FEFF 		bl	kdbGetCol
 2422 0b10 0300     		movs	r3, r0
 2423 0b12 3B61     		str	r3, [r7, #16]
 2424 0b14 3B69     		ldr	r3, [r7, #16]
 2425 0b16 002B     		cmp	r3, #0
 2426 0b18 0BD0     		beq	.L161
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 {
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 kbdActivate(0);
 2427              		.loc 3 151 0
 2428 0b1a 0020     		movs	r0, #0
 2429 0b1c FFF7FEFF 		bl	kbdActivate
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 return key[4*(row-1) + (col-1)];
 2430              		.loc 3 152 0
 2431 0b20 7B69     		ldr	r3, [r7, #20]
 2432 0b22 013B     		subs	r3, r3, #1
 2433 0b24 9A00     		lsls	r2, r3, #2
 2434 0b26 3B69     		ldr	r3, [r7, #16]
 2435 0b28 013B     		subs	r3, r3, #1
 2436 0b2a D318     		adds	r3, r2, r3
 2437 0b2c 3A00     		movs	r2, r7
 2438 0b2e D35C     		ldrb	r3, [r2, r3]
 2439 0b30 09E0     		b	.L164
 2440              	.L161:
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             {
 2441              		.loc 3 145 0 discriminator 2
 2442 0b32 7B69     		ldr	r3, [r7, #20]
 2443 0b34 0133     		adds	r3, r3, #1
 2444 0b36 7B61     		str	r3, [r7, #20]
 2445              	.L160:
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             {
 2446              		.loc 3 145 0 is_stmt 0 discriminator 1
 2447 0b38 7B69     		ldr	r3, [r7, #20]
 2448 0b3a 042B     		cmp	r3, #4
 2449 0b3c E0DD     		ble	.L163
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 }
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             }
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         kbdActivate(0);
 2450              		.loc 3 155 0 is_stmt 1
 2451 0b3e 0020     		movs	r0, #0
 2452 0b40 FFF7FEFF 		bl	kbdActivate
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         return 0xFF;
 2453              		.loc 3 156 0
 2454 0b44 FF23     		movs	r3, #255
 2455              	.L164:
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }...
 2456              		.loc 3 157 0 discriminator 1
 2457 0b46 1800     		movs	r0, r3
 2458 0b48 BD46     		mov	sp, r7
 2459 0b4a 07B0     		add	sp, sp, #28
 2460              		@ sp needed
 2461 0b4c 90BD     		pop	{r4, r7, pc}
 2462              	.L166:
 2463 0b4e C046     		.align	2
 2464              	.L165:
 2465 0b50 54000000 		.word	.LC0
 2466              		.cfi_endproc
 2467              	.LFE29:
 2469              		.align	1
 2470              		.global	set_object_speed
 2471              		.syntax unified
 2472              		.code	16
 2473              		.thumb_func
 2474              		.fpu softvfp
 2476              	set_object_speed:
 2477              	.LFB30:
 2478              		.file 4 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** #ifndef OBJECT_H
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** #define OBJECT_H
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** #define MAX_POINTS 75
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** 
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** typedef struct tPoint{
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     unsigned char x;
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     unsigned char y;
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }POINT;
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** typedef struct tGeometry{
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     int numpoints;
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     int sizeX;
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     int sizeY;
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     POINT px[MAX_POINTS];
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     } GEOMETRY, *PGEOMETRY;
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** typedef struct tObj{
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     PGEOMETRY geo;
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     int dirX, dirY;
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     int posX, posY;
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     void (* draw) (struct tObj*);
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     void (* clear) (struct tObj*);
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     void (* move) (struct tObj*);
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     void (* set_speed) (struct tObj*, int, int);
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     } OBJECT, *POBJECT;
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** void set_object_speed(POBJECT pObj, int speedX, int speedY){
 2479              		.loc 4 30 0
 2480              		.cfi_startproc
 2481              		@ args = 0, pretend = 0, frame = 16
 2482              		@ frame_needed = 1, uses_anonymous_args = 0
 2483 0b54 80B5     		push	{r7, lr}
 2484              		.cfi_def_cfa_offset 8
 2485              		.cfi_offset 7, -8
 2486              		.cfi_offset 14, -4
 2487 0b56 84B0     		sub	sp, sp, #16
 2488              		.cfi_def_cfa_offset 24
 2489 0b58 00AF     		add	r7, sp, #0
 2490              		.cfi_def_cfa_register 7
 2491 0b5a F860     		str	r0, [r7, #12]
 2492 0b5c B960     		str	r1, [r7, #8]
 2493 0b5e 7A60     		str	r2, [r7, #4]
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         pObj->dirX = speedX;
 2494              		.loc 4 31 0
 2495 0b60 FB68     		ldr	r3, [r7, #12]
 2496 0b62 BA68     		ldr	r2, [r7, #8]
 2497 0b64 5A60     		str	r2, [r3, #4]
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         pObj->dirY = speedY;
 2498              		.loc 4 32 0
 2499 0b66 FB68     		ldr	r3, [r7, #12]
 2500 0b68 7A68     		ldr	r2, [r7, #4]
 2501 0b6a 9A60     		str	r2, [r3, #8]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 2502              		.loc 4 33 0
 2503 0b6c C046     		nop
 2504 0b6e BD46     		mov	sp, r7
 2505 0b70 04B0     		add	sp, sp, #16
 2506              		@ sp needed
 2507 0b72 80BD     		pop	{r7, pc}
 2508              		.cfi_endproc
 2509              	.LFE30:
 2511              		.align	1
 2512              		.global	draw_object
 2513              		.syntax unified
 2514              		.code	16
 2515              		.thumb_func
 2516              		.fpu softvfp
 2518              	draw_object:
 2519              	.LFB31:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** void draw_object(POBJECT pObj){
 2520              		.loc 4 35 0
 2521              		.cfi_startproc
 2522              		@ args = 0, pretend = 0, frame = 16
 2523              		@ frame_needed = 1, uses_anonymous_args = 0
 2524 0b74 80B5     		push	{r7, lr}
 2525              		.cfi_def_cfa_offset 8
 2526              		.cfi_offset 7, -8
 2527              		.cfi_offset 14, -4
 2528 0b76 84B0     		sub	sp, sp, #16
 2529              		.cfi_def_cfa_offset 24
 2530 0b78 00AF     		add	r7, sp, #0
 2531              		.cfi_def_cfa_register 7
 2532 0b7a 7860     		str	r0, [r7, #4]
 2533              	.LBB4:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2534              		.loc 4 36 0
 2535 0b7c 0023     		movs	r3, #0
 2536 0b7e FB60     		str	r3, [r7, #12]
 2537 0b80 1FE0     		b	.L169
 2538              	.L170:
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 1);
 2539              		.loc 4 37 0 discriminator 3
 2540 0b82 7B68     		ldr	r3, [r7, #4]
 2541 0b84 1A68     		ldr	r2, [r3]
 2542 0b86 FB68     		ldr	r3, [r7, #12]
 2543 0b88 0433     		adds	r3, r3, #4
 2544 0b8a 5B00     		lsls	r3, r3, #1
 2545 0b8c D318     		adds	r3, r2, r3
 2546 0b8e 0433     		adds	r3, r3, #4
 2547 0b90 1B78     		ldrb	r3, [r3]
 2548 0b92 1A00     		movs	r2, r3
 2549 0b94 7B68     		ldr	r3, [r7, #4]
 2550 0b96 DB68     		ldr	r3, [r3, #12]
 2551 0b98 D318     		adds	r3, r2, r3
 2552 0b9a 1800     		movs	r0, r3
 2553 0b9c 7B68     		ldr	r3, [r7, #4]
 2554 0b9e 1A68     		ldr	r2, [r3]
 2555 0ba0 FB68     		ldr	r3, [r7, #12]
 2556 0ba2 0433     		adds	r3, r3, #4
 2557 0ba4 5B00     		lsls	r3, r3, #1
 2558 0ba6 D318     		adds	r3, r2, r3
 2559 0ba8 0533     		adds	r3, r3, #5
 2560 0baa 1B78     		ldrb	r3, [r3]
 2561 0bac 1A00     		movs	r2, r3
 2562 0bae 7B68     		ldr	r3, [r7, #4]
 2563 0bb0 1B69     		ldr	r3, [r3, #16]
 2564 0bb2 D318     		adds	r3, r2, r3
 2565 0bb4 0122     		movs	r2, #1
 2566 0bb6 1900     		movs	r1, r3
 2567 0bb8 FFF7FEFF 		bl	pixel
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2568              		.loc 4 36 0 discriminator 3
 2569 0bbc FB68     		ldr	r3, [r7, #12]
 2570 0bbe 0133     		adds	r3, r3, #1
 2571 0bc0 FB60     		str	r3, [r7, #12]
 2572              	.L169:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2573              		.loc 4 36 0 is_stmt 0 discriminator 1
 2574 0bc2 FB68     		ldr	r3, [r7, #12]
 2575 0bc4 4A2B     		cmp	r3, #74
 2576 0bc6 DCDD     		ble	.L170
 2577              	.LBE4:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         }
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 2578              		.loc 4 39 0 is_stmt 1
 2579 0bc8 C046     		nop
 2580 0bca BD46     		mov	sp, r7
 2581 0bcc 04B0     		add	sp, sp, #16
 2582              		@ sp needed
 2583 0bce 80BD     		pop	{r7, pc}
 2584              		.cfi_endproc
 2585              	.LFE31:
 2587              		.align	1
 2588              		.global	clear_object
 2589              		.syntax unified
 2590              		.code	16
 2591              		.thumb_func
 2592              		.fpu softvfp
 2594              	clear_object:
 2595              	.LFB32:
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** void clear_object(POBJECT pObj){
 2596              		.loc 4 41 0
 2597              		.cfi_startproc
 2598              		@ args = 0, pretend = 0, frame = 16
 2599              		@ frame_needed = 1, uses_anonymous_args = 0
 2600 0bd0 80B5     		push	{r7, lr}
 2601              		.cfi_def_cfa_offset 8
 2602              		.cfi_offset 7, -8
 2603              		.cfi_offset 14, -4
 2604 0bd2 84B0     		sub	sp, sp, #16
 2605              		.cfi_def_cfa_offset 24
 2606 0bd4 00AF     		add	r7, sp, #0
 2607              		.cfi_def_cfa_register 7
 2608 0bd6 7860     		str	r0, [r7, #4]
 2609              	.LBB5:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2610              		.loc 4 42 0
 2611 0bd8 0023     		movs	r3, #0
 2612 0bda FB60     		str	r3, [r7, #12]
 2613 0bdc 1FE0     		b	.L172
 2614              	.L173:
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 0);
 2615              		.loc 4 43 0 discriminator 3
 2616 0bde 7B68     		ldr	r3, [r7, #4]
 2617 0be0 1A68     		ldr	r2, [r3]
 2618 0be2 FB68     		ldr	r3, [r7, #12]
 2619 0be4 0433     		adds	r3, r3, #4
 2620 0be6 5B00     		lsls	r3, r3, #1
 2621 0be8 D318     		adds	r3, r2, r3
 2622 0bea 0433     		adds	r3, r3, #4
 2623 0bec 1B78     		ldrb	r3, [r3]
 2624 0bee 1A00     		movs	r2, r3
 2625 0bf0 7B68     		ldr	r3, [r7, #4]
 2626 0bf2 DB68     		ldr	r3, [r3, #12]
 2627 0bf4 D318     		adds	r3, r2, r3
 2628 0bf6 1800     		movs	r0, r3
 2629 0bf8 7B68     		ldr	r3, [r7, #4]
 2630 0bfa 1A68     		ldr	r2, [r3]
 2631 0bfc FB68     		ldr	r3, [r7, #12]
 2632 0bfe 0433     		adds	r3, r3, #4
 2633 0c00 5B00     		lsls	r3, r3, #1
 2634 0c02 D318     		adds	r3, r2, r3
 2635 0c04 0533     		adds	r3, r3, #5
 2636 0c06 1B78     		ldrb	r3, [r3]
 2637 0c08 1A00     		movs	r2, r3
 2638 0c0a 7B68     		ldr	r3, [r7, #4]
 2639 0c0c 1B69     		ldr	r3, [r3, #16]
 2640 0c0e D318     		adds	r3, r2, r3
 2641 0c10 0022     		movs	r2, #0
 2642 0c12 1900     		movs	r1, r3
 2643 0c14 FFF7FEFF 		bl	pixel
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2644              		.loc 4 42 0 discriminator 3
 2645 0c18 FB68     		ldr	r3, [r7, #12]
 2646 0c1a 0133     		adds	r3, r3, #1
 2647 0c1c FB60     		str	r3, [r7, #12]
 2648              	.L172:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2649              		.loc 4 42 0 is_stmt 0 discriminator 1
 2650 0c1e FB68     		ldr	r3, [r7, #12]
 2651 0c20 4A2B     		cmp	r3, #74
 2652 0c22 DCDD     		ble	.L173
 2653              	.LBE5:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         }
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 2654              		.loc 4 45 0 is_stmt 1
 2655 0c24 C046     		nop
 2656 0c26 BD46     		mov	sp, r7
 2657 0c28 04B0     		add	sp, sp, #16
 2658              		@ sp needed
 2659 0c2a 80BD     		pop	{r7, pc}
 2660              		.cfi_endproc
 2661              	.LFE32:
 2663              		.align	1
 2664              		.global	move_paddle
 2665              		.syntax unified
 2666              		.code	16
 2667              		.thumb_func
 2668              		.fpu softvfp
 2670              	move_paddle:
 2671              	.LFB33:
 2672              		.file 5 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** extern OBJECT Rpaddle;
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** extern OBJECT Lpaddle;
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** void move_paddle(POBJECT this) {
 2673              		.loc 5 4 0
 2674              		.cfi_startproc
 2675              		@ args = 0, pretend = 0, frame = 8
 2676              		@ frame_needed = 1, uses_anonymous_args = 0
 2677 0c2c 80B5     		push	{r7, lr}
 2678              		.cfi_def_cfa_offset 8
 2679              		.cfi_offset 7, -8
 2680              		.cfi_offset 14, -4
 2681 0c2e 82B0     		sub	sp, sp, #8
 2682              		.cfi_def_cfa_offset 16
 2683 0c30 00AF     		add	r7, sp, #0
 2684              		.cfi_def_cfa_register 7
 2685 0c32 7860     		str	r0, [r7, #4]
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	clear_object(this);
 2686              		.loc 5 5 0
 2687 0c34 7B68     		ldr	r3, [r7, #4]
 2688 0c36 1800     		movs	r0, r3
 2689 0c38 FFF7FEFF 		bl	clear_object
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	this->posY += this->dirY;
 2690              		.loc 5 7 0
 2691 0c3c 7B68     		ldr	r3, [r7, #4]
 2692 0c3e 1A69     		ldr	r2, [r3, #16]
 2693 0c40 7B68     		ldr	r3, [r7, #4]
 2694 0c42 9B68     		ldr	r3, [r3, #8]
 2695 0c44 D218     		adds	r2, r2, r3
 2696 0c46 7B68     		ldr	r3, [r7, #4]
 2697 0c48 1A61     		str	r2, [r3, #16]
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	if(this->posY < 0) {
 2698              		.loc 5 9 0
 2699 0c4a 7B68     		ldr	r3, [r7, #4]
 2700 0c4c 1B69     		ldr	r3, [r3, #16]
 2701 0c4e 002B     		cmp	r3, #0
 2702 0c50 03DA     		bge	.L175
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 		this->posY = 0;
 2703              		.loc 5 10 0
 2704 0c52 7B68     		ldr	r3, [r7, #4]
 2705 0c54 0022     		movs	r2, #0
 2706 0c56 1A61     		str	r2, [r3, #16]
 2707 0c58 0EE0     		b	.L176
 2708              	.L175:
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	} else if(this->posY + this->geo->sizeY > 127) {
 2709              		.loc 5 11 0
 2710 0c5a 7B68     		ldr	r3, [r7, #4]
 2711 0c5c 1A69     		ldr	r2, [r3, #16]
 2712 0c5e 7B68     		ldr	r3, [r7, #4]
 2713 0c60 1B68     		ldr	r3, [r3]
 2714 0c62 9B68     		ldr	r3, [r3, #8]
 2715 0c64 D318     		adds	r3, r2, r3
 2716 0c66 7F2B     		cmp	r3, #127
 2717 0c68 06DD     		ble	.L176
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 		this->posY = 127 - this->geo->sizeY;
 2718              		.loc 5 12 0
 2719 0c6a 7B68     		ldr	r3, [r7, #4]
 2720 0c6c 1B68     		ldr	r3, [r3]
 2721 0c6e 9B68     		ldr	r3, [r3, #8]
 2722 0c70 7F22     		movs	r2, #127
 2723 0c72 D21A     		subs	r2, r2, r3
 2724 0c74 7B68     		ldr	r3, [r7, #4]
 2725 0c76 1A61     		str	r2, [r3, #16]
 2726              	.L176:
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	}
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	this->draw(this);
 2727              		.loc 5 15 0
 2728 0c78 7B68     		ldr	r3, [r7, #4]
 2729 0c7a 5B69     		ldr	r3, [r3, #20]
 2730 0c7c 7A68     		ldr	r2, [r7, #4]
 2731 0c7e 1000     		movs	r0, r2
 2732 0c80 9847     		blx	r3
 2733              	.LVL0:
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** }
 2734              		.loc 5 16 0
 2735 0c82 C046     		nop
 2736 0c84 BD46     		mov	sp, r7
 2737 0c86 02B0     		add	sp, sp, #8
 2738              		@ sp needed
 2739 0c88 80BD     		pop	{r7, pc}
 2740              		.cfi_endproc
 2741              	.LFE33:
 2743              		.global	paddle_geometry
 2744              		.data
 2745              		.align	2
 2748              	paddle_geometry:
 2749 0000 4B000000 		.word	75
 2750 0004 02000000 		.word	2
 2751 0008 19000000 		.word	25
 2752 000c 00       		.byte	0
 2753 000d 01       		.byte	1
 2754 000e 00       		.byte	0
 2755 000f 02       		.byte	2
 2756 0010 00       		.byte	0
 2757 0011 03       		.byte	3
 2758 0012 00       		.byte	0
 2759 0013 04       		.byte	4
 2760 0014 00       		.byte	0
 2761 0015 05       		.byte	5
 2762 0016 00       		.byte	0
 2763 0017 06       		.byte	6
 2764 0018 00       		.byte	0
 2765 0019 07       		.byte	7
 2766 001a 00       		.byte	0
 2767 001b 08       		.byte	8
 2768 001c 00       		.byte	0
 2769 001d 09       		.byte	9
 2770 001e 00       		.byte	0
 2771 001f 0A       		.byte	10
 2772 0020 00       		.byte	0
 2773 0021 0B       		.byte	11
 2774 0022 00       		.byte	0
 2775 0023 0C       		.byte	12
 2776 0024 00       		.byte	0
 2777 0025 0D       		.byte	13
 2778 0026 00       		.byte	0
 2779 0027 0E       		.byte	14
 2780 0028 00       		.byte	0
 2781 0029 0F       		.byte	15
 2782 002a 00       		.byte	0
 2783 002b 10       		.byte	16
 2784 002c 00       		.byte	0
 2785 002d 11       		.byte	17
 2786 002e 00       		.byte	0
 2787 002f 12       		.byte	18
 2788 0030 00       		.byte	0
 2789 0031 13       		.byte	19
 2790 0032 00       		.byte	0
 2791 0033 14       		.byte	20
 2792 0034 00       		.byte	0
 2793 0035 15       		.byte	21
 2794 0036 00       		.byte	0
 2795 0037 16       		.byte	22
 2796 0038 00       		.byte	0
 2797 0039 17       		.byte	23
 2798 003a 00       		.byte	0
 2799 003b 18       		.byte	24
 2800 003c 00       		.byte	0
 2801 003d 19       		.byte	25
 2802 003e 01       		.byte	1
 2803 003f 01       		.byte	1
 2804 0040 01       		.byte	1
 2805 0041 02       		.byte	2
 2806 0042 01       		.byte	1
 2807 0043 03       		.byte	3
 2808 0044 01       		.byte	1
 2809 0045 04       		.byte	4
 2810 0046 01       		.byte	1
 2811 0047 05       		.byte	5
 2812 0048 01       		.byte	1
 2813 0049 06       		.byte	6
 2814 004a 01       		.byte	1
 2815 004b 07       		.byte	7
 2816 004c 01       		.byte	1
 2817 004d 08       		.byte	8
 2818 004e 01       		.byte	1
 2819 004f 09       		.byte	9
 2820 0050 01       		.byte	1
 2821 0051 0A       		.byte	10
 2822 0052 01       		.byte	1
 2823 0053 0B       		.byte	11
 2824 0054 01       		.byte	1
 2825 0055 0C       		.byte	12
 2826 0056 01       		.byte	1
 2827 0057 0D       		.byte	13
 2828 0058 01       		.byte	1
 2829 0059 0E       		.byte	14
 2830 005a 01       		.byte	1
 2831 005b 0F       		.byte	15
 2832 005c 01       		.byte	1
 2833 005d 10       		.byte	16
 2834 005e 01       		.byte	1
 2835 005f 11       		.byte	17
 2836 0060 01       		.byte	1
 2837 0061 12       		.byte	18
 2838 0062 01       		.byte	1
 2839 0063 13       		.byte	19
 2840 0064 01       		.byte	1
 2841 0065 14       		.byte	20
 2842 0066 01       		.byte	1
 2843 0067 15       		.byte	21
 2844 0068 01       		.byte	1
 2845 0069 16       		.byte	22
 2846 006a 01       		.byte	1
 2847 006b 17       		.byte	23
 2848 006c 01       		.byte	1
 2849 006d 18       		.byte	24
 2850 006e 01       		.byte	1
 2851 006f 19       		.byte	25
 2852 0070 02       		.byte	2
 2853 0071 01       		.byte	1
 2854 0072 02       		.byte	2
 2855 0073 02       		.byte	2
 2856 0074 02       		.byte	2
 2857 0075 03       		.byte	3
 2858 0076 02       		.byte	2
 2859 0077 04       		.byte	4
 2860 0078 02       		.byte	2
 2861 0079 05       		.byte	5
 2862 007a 02       		.byte	2
 2863 007b 06       		.byte	6
 2864 007c 02       		.byte	2
 2865 007d 07       		.byte	7
 2866 007e 02       		.byte	2
 2867 007f 08       		.byte	8
 2868 0080 02       		.byte	2
 2869 0081 09       		.byte	9
 2870 0082 02       		.byte	2
 2871 0083 0A       		.byte	10
 2872 0084 02       		.byte	2
 2873 0085 0B       		.byte	11
 2874 0086 02       		.byte	2
 2875 0087 0C       		.byte	12
 2876 0088 02       		.byte	2
 2877 0089 0D       		.byte	13
 2878 008a 02       		.byte	2
 2879 008b 0E       		.byte	14
 2880 008c 02       		.byte	2
 2881 008d 0F       		.byte	15
 2882 008e 02       		.byte	2
 2883 008f 10       		.byte	16
 2884 0090 02       		.byte	2
 2885 0091 11       		.byte	17
 2886 0092 02       		.byte	2
 2887 0093 12       		.byte	18
 2888 0094 02       		.byte	2
 2889 0095 13       		.byte	19
 2890 0096 02       		.byte	2
 2891 0097 14       		.byte	20
 2892 0098 02       		.byte	2
 2893 0099 15       		.byte	21
 2894 009a 02       		.byte	2
 2895 009b 16       		.byte	22
 2896 009c 02       		.byte	2
 2897 009d 17       		.byte	23
 2898 009e 02       		.byte	2
 2899 009f 18       		.byte	24
 2900 00a0 02       		.byte	2
 2901 00a1 19       		.byte	25
 2902 00a2 0000     		.space	2
 2903              		.global	Rpaddle
 2904              		.align	2
 2907              	Rpaddle:
 2908 00a4 00000000 		.word	paddle_geometry
 2909 00a8 00000000 		.word	0
 2910 00ac 00000000 		.word	0
 2911 00b0 78000000 		.word	120
 2912 00b4 01000000 		.word	1
 2913 00b8 00000000 		.word	draw_object
 2914 00bc 00000000 		.word	clear_object
 2915 00c0 00000000 		.word	move_paddle
 2916 00c4 00000000 		.word	set_object_speed
 2917              		.global	Lpaddle
 2918              		.align	2
 2921              	Lpaddle:
 2922 00c8 00000000 		.word	paddle_geometry
 2923 00cc 00000000 		.word	0
 2924 00d0 00000000 		.word	0
 2925 00d4 01000000 		.word	1
 2926 00d8 01000000 		.word	1
 2927 00dc 00000000 		.word	draw_object
 2928 00e0 00000000 		.word	clear_object
 2929 00e4 00000000 		.word	move_paddle
 2930 00e8 00000000 		.word	set_object_speed
 2931              		.text
 2932              		.align	1
 2933              		.global	move_ball
 2934              		.syntax unified
 2935              		.code	16
 2936              		.thumb_func
 2937              		.fpu softvfp
 2939              	move_ball:
 2940              	.LFB34:
 2941              		.file 6 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** #include "object.h"
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** #include "paddle.h"
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** void move_ball(POBJECT this) {
 2942              		.loc 6 4 0
 2943              		.cfi_startproc
 2944              		@ args = 0, pretend = 0, frame = 16
 2945              		@ frame_needed = 1, uses_anonymous_args = 0
 2946 0c8a 80B5     		push	{r7, lr}
 2947              		.cfi_def_cfa_offset 8
 2948              		.cfi_offset 7, -8
 2949              		.cfi_offset 14, -4
 2950 0c8c 84B0     		sub	sp, sp, #16
 2951              		.cfi_def_cfa_offset 24
 2952 0c8e 00AF     		add	r7, sp, #0
 2953              		.cfi_def_cfa_register 7
 2954 0c90 7860     		str	r0, [r7, #4]
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h ****     this->posX += this->dirX;
 2955              		.loc 6 6 0
 2956 0c92 7B68     		ldr	r3, [r7, #4]
 2957 0c94 DA68     		ldr	r2, [r3, #12]
 2958 0c96 7B68     		ldr	r3, [r7, #4]
 2959 0c98 5B68     		ldr	r3, [r3, #4]
 2960 0c9a D218     		adds	r2, r2, r3
 2961 0c9c 7B68     		ldr	r3, [r7, #4]
 2962 0c9e DA60     		str	r2, [r3, #12]
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	this->posY += this->dirY;
 2963              		.loc 6 7 0
 2964 0ca0 7B68     		ldr	r3, [r7, #4]
 2965 0ca2 1A69     		ldr	r2, [r3, #16]
 2966 0ca4 7B68     		ldr	r3, [r7, #4]
 2967 0ca6 9B68     		ldr	r3, [r3, #8]
 2968 0ca8 D218     		adds	r2, r2, r3
 2969 0caa 7B68     		ldr	r3, [r7, #4]
 2970 0cac 1A61     		str	r2, [r3, #16]
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	//if((this->posY < 0) ||  this->posY > 63 ) {
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	//	this->dirY = -this->dirY;
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	//}
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	// Define left and right paddle
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	POBJECT lp = &Lpaddle;
 2971              		.loc 6 14 0
 2972 0cae 234B     		ldr	r3, .L180
 2973 0cb0 FB60     		str	r3, [r7, #12]
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	POBJECT rp = &Rpaddle;
 2974              		.loc 6 15 0
 2975 0cb2 234B     		ldr	r3, .L180+4
 2976 0cb4 BB60     		str	r3, [r7, #8]
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	//Rpaddle collision
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	if(this->posX <= lp->posX + lp->geo->sizeX) {
 2977              		.loc 6 18 0
 2978 0cb6 7B68     		ldr	r3, [r7, #4]
 2979 0cb8 DA68     		ldr	r2, [r3, #12]
 2980 0cba FB68     		ldr	r3, [r7, #12]
 2981 0cbc D968     		ldr	r1, [r3, #12]
 2982 0cbe FB68     		ldr	r3, [r7, #12]
 2983 0cc0 1B68     		ldr	r3, [r3]
 2984 0cc2 5B68     		ldr	r3, [r3, #4]
 2985 0cc4 CB18     		adds	r3, r1, r3
 2986 0cc6 9A42     		cmp	r2, r3
 2987 0cc8 14DC     		bgt	.L178
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		if((this->posY >= lp->posY) && (this->posY <= lp->posY + lp->geo->sizeY)) {
 2988              		.loc 6 19 0
 2989 0cca 7B68     		ldr	r3, [r7, #4]
 2990 0ccc 1A69     		ldr	r2, [r3, #16]
 2991 0cce FB68     		ldr	r3, [r7, #12]
 2992 0cd0 1B69     		ldr	r3, [r3, #16]
 2993 0cd2 9A42     		cmp	r2, r3
 2994 0cd4 0EDB     		blt	.L178
 2995              		.loc 6 19 0 is_stmt 0 discriminator 1
 2996 0cd6 7B68     		ldr	r3, [r7, #4]
 2997 0cd8 1A69     		ldr	r2, [r3, #16]
 2998 0cda FB68     		ldr	r3, [r7, #12]
 2999 0cdc 1969     		ldr	r1, [r3, #16]
 3000 0cde FB68     		ldr	r3, [r7, #12]
 3001 0ce0 1B68     		ldr	r3, [r3]
 3002 0ce2 9B68     		ldr	r3, [r3, #8]
 3003 0ce4 CB18     		adds	r3, r1, r3
 3004 0ce6 9A42     		cmp	r2, r3
 3005 0ce8 04DC     		bgt	.L178
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			this->dirX = -this->dirX;
 3006              		.loc 6 20 0 is_stmt 1
 3007 0cea 7B68     		ldr	r3, [r7, #4]
 3008 0cec 5B68     		ldr	r3, [r3, #4]
 3009 0cee 5A42     		rsbs	r2, r3, #0
 3010 0cf0 7B68     		ldr	r3, [r7, #4]
 3011 0cf2 5A60     		str	r2, [r3, #4]
 3012              	.L178:
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		} else {
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			//Print ascii string to show score
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		}
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	}
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	//Lpaddle collision
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	if(this->posX >= rp->posX) {
 3013              		.loc 6 27 0
 3014 0cf4 7B68     		ldr	r3, [r7, #4]
 3015 0cf6 DA68     		ldr	r2, [r3, #12]
 3016 0cf8 BB68     		ldr	r3, [r7, #8]
 3017 0cfa DB68     		ldr	r3, [r3, #12]
 3018 0cfc 9A42     		cmp	r2, r3
 3019 0cfe 14DB     		blt	.L179
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		if((this->posY >= rp->posY) && (this->posY <= rp->posY + rp->geo->sizeY)) {
 3020              		.loc 6 28 0
 3021 0d00 7B68     		ldr	r3, [r7, #4]
 3022 0d02 1A69     		ldr	r2, [r3, #16]
 3023 0d04 BB68     		ldr	r3, [r7, #8]
 3024 0d06 1B69     		ldr	r3, [r3, #16]
 3025 0d08 9A42     		cmp	r2, r3
 3026 0d0a 0EDB     		blt	.L179
 3027              		.loc 6 28 0 is_stmt 0 discriminator 1
 3028 0d0c 7B68     		ldr	r3, [r7, #4]
 3029 0d0e 1A69     		ldr	r2, [r3, #16]
 3030 0d10 BB68     		ldr	r3, [r7, #8]
 3031 0d12 1969     		ldr	r1, [r3, #16]
 3032 0d14 BB68     		ldr	r3, [r7, #8]
 3033 0d16 1B68     		ldr	r3, [r3]
 3034 0d18 9B68     		ldr	r3, [r3, #8]
 3035 0d1a CB18     		adds	r3, r1, r3
 3036 0d1c 9A42     		cmp	r2, r3
 3037 0d1e 04DC     		bgt	.L179
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			this->dirX = -this->dirX;
 3038              		.loc 6 29 0 is_stmt 1
 3039 0d20 7B68     		ldr	r3, [r7, #4]
 3040 0d22 5B68     		ldr	r3, [r3, #4]
 3041 0d24 5A42     		rsbs	r2, r3, #0
 3042 0d26 7B68     		ldr	r3, [r7, #4]
 3043 0d28 5A60     		str	r2, [r3, #4]
 3044              	.L179:
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		} else {
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			//Print ascii string to show score
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		}
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	}
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	this->draw(this);
 3045              		.loc 6 35 0
 3046 0d2a 7B68     		ldr	r3, [r7, #4]
 3047 0d2c 5B69     		ldr	r3, [r3, #20]
 3048 0d2e 7A68     		ldr	r2, [r7, #4]
 3049 0d30 1000     		movs	r0, r2
 3050 0d32 9847     		blx	r3
 3051              	.LVL1:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** }
 3052              		.loc 6 36 0
 3053 0d34 C046     		nop
 3054 0d36 BD46     		mov	sp, r7
 3055 0d38 04B0     		add	sp, sp, #16
 3056              		@ sp needed
 3057 0d3a 80BD     		pop	{r7, pc}
 3058              	.L181:
 3059              		.align	2
 3060              	.L180:
 3061 0d3c 00000000 		.word	Lpaddle
 3062 0d40 00000000 		.word	Rpaddle
 3063              		.cfi_endproc
 3064              	.LFE34:
 3066              		.global	ball_geometry
 3067              		.data
 3068              		.align	2
 3071              	ball_geometry:
 3072 00ec 0C000000 		.word	12
 3073 00f0 04000000 		.word	4
 3074 00f4 04000000 		.word	4
 3075 00f8 00       		.byte	0
 3076 00f9 01       		.byte	1
 3077 00fa 00       		.byte	0
 3078 00fb 02       		.byte	2
 3079 00fc 01       		.byte	1
 3080 00fd 00       		.byte	0
 3081 00fe 01       		.byte	1
 3082 00ff 01       		.byte	1
 3083 0100 01       		.byte	1
 3084 0101 02       		.byte	2
 3085 0102 01       		.byte	1
 3086 0103 03       		.byte	3
 3087 0104 02       		.byte	2
 3088 0105 00       		.byte	0
 3089 0106 02       		.byte	2
 3090 0107 01       		.byte	1
 3091 0108 02       		.byte	2
 3092 0109 02       		.byte	2
 3093 010a 02       		.byte	2
 3094 010b 03       		.byte	3
 3095 010c 03       		.byte	3
 3096 010d 01       		.byte	1
 3097 010e 03       		.byte	3
 3098 010f 02       		.byte	2
 3099 0110 00000000 		.space	126
 3099      00000000 
 3099      00000000 
 3099      00000000 
 3099      00000000 
 3100 018e 0000     		.space	2
 3101              		.global	ball
 3102              		.align	2
 3105              	ball:
 3106 0190 00000000 		.word	ball_geometry
 3107 0194 00000000 		.word	0
 3108 0198 00000000 		.word	0
 3109 019c 01000000 		.word	1
 3110 01a0 01000000 		.word	1
 3111 01a4 00000000 		.word	draw_object
 3112 01a8 00000000 		.word	clear_object
 3113 01ac 00000000 		.word	move_ball
 3114 01b0 00000000 		.word	set_object_speed
 3115              		.section	.start_section,"ax",%progbits
 3116              		.align	1
 3117              		.global	startup
 3118              		.syntax unified
 3119              		.code	16
 3120              		.thumb_func
 3121              		.fpu softvfp
 3123              	startup:
 3124              	.LFB35:
 3125              		.file 7 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #define SIMULATOR
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "registers.h"
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "graphics.h"
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "keypad.h"
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "object.h"
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "ball.h"
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** extern OBJECT ball;
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void startup ( void )
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** {
 3126              		.loc 7 19 0
 3127              		.cfi_startproc
 3128              		@ Naked Function: prologue and epilogue provided by programmer.
 3129              		@ args = 0, pretend = 0, frame = 0
 3130              		@ frame_needed = 1, uses_anonymous_args = 0
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** asm volatile(
 3131              		.loc 7 20 0
 3132              		.syntax divided
 3133              	@ 20 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c" 1
 3134 0000 0248     		 LDR R0,=0x2001C000
 3135 0002 8546     	 MOV SP,R0
 3136 0004 FFF7FEFF 	 BL main
 3137 0008 FEE7     	.L1: B .L1
 3138              	
 3139              	@ 0 "" 2
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" MOV SP,R0\n"
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" BL main\n"				/* call main */
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	".L1: B .L1\n"				/* never return */
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	) ;
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** }
 3140              		.loc 7 26 0
 3141              		.thumb
 3142              		.syntax unified
 3143 000a C046     		nop
 3144              		.cfi_endproc
 3145              	.LFE35:
 3147              		.text
 3148              		.align	1
 3149              		.global	init_app
 3150              		.syntax unified
 3151              		.code	16
 3152              		.thumb_func
 3153              		.fpu softvfp
 3155              	init_app:
 3156              	.LFB36:
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void init_app(void){
 3157              		.loc 7 28 0
 3158              		.cfi_startproc
 3159              		@ args = 0, pretend = 0, frame = 0
 3160              		@ frame_needed = 1, uses_anonymous_args = 0
 3161 0d44 80B5     		push	{r7, lr}
 3162              		.cfi_def_cfa_offset 8
 3163              		.cfi_offset 7, -8
 3164              		.cfi_offset 14, -4
 3165 0d46 00AF     		add	r7, sp, #0
 3166              		.cfi_def_cfa_register 7
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_E_MODER = 0x55555555;
 3167              		.loc 7 29 0
 3168 0d48 0C4B     		ldr	r3, .L184
 3169 0d4a 0D4A     		ldr	r2, .L184+4
 3170 0d4c 1A60     		str	r2, [r3]
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_MODER = 0x55555555;
 3171              		.loc 7 31 0
 3172 0d4e 0D4B     		ldr	r3, .L184+8
 3173 0d50 0B4A     		ldr	r2, .L184+4
 3174 0d52 1A60     		str	r2, [r3]
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_MODER = 0x55005555;
 3175              		.loc 7 33 0
 3176 0d54 0B4B     		ldr	r3, .L184+8
 3177 0d56 0C4A     		ldr	r2, .L184+12
 3178 0d58 1A60     		str	r2, [r3]
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****      //set all bits as push pull
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_OTYPER &= 0x0000FFFF;   
 3179              		.loc 7 35 0
 3180 0d5a 0C4B     		ldr	r3, .L184+16
 3181 0d5c 0B4A     		ldr	r2, .L184+16
 3182 0d5e 1288     		ldrh	r2, [r2]
 3183 0d60 92B2     		uxth	r2, r2
 3184 0d62 1A80     		strh	r2, [r3]
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_OTYPER |= 0x00000000;   
 3185              		.loc 7 36 0
 3186 0d64 094B     		ldr	r3, .L184+16
 3187 0d66 094A     		ldr	r2, .L184+16
 3188 0d68 1288     		ldrh	r2, [r2]
 3189 0d6a 92B2     		uxth	r2, r2
 3190 0d6c 1A80     		strh	r2, [r3]
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****      //
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****      //PORT_PUPDR = 0xzz55zzzz;   
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_PUPDR = 0x00550000;   
 3191              		.loc 7 39 0
 3192 0d6e 084B     		ldr	r3, .L184+20
 3193 0d70 AA22     		movs	r2, #170
 3194 0d72 D203     		lsls	r2, r2, #15
 3195 0d74 1A60     		str	r2, [r3]
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     }
 3196              		.loc 7 40 0
 3197 0d76 C046     		nop
 3198 0d78 BD46     		mov	sp, r7
 3199              		@ sp needed
 3200 0d7a 80BD     		pop	{r7, pc}
 3201              	.L185:
 3202              		.align	2
 3203              	.L184:
 3204 0d7c 00100240 		.word	1073876992
 3205 0d80 55555555 		.word	1431655765
 3206 0d84 000C0240 		.word	1073875968
 3207 0d88 55550055 		.word	1426085205
 3208 0d8c 040C0240 		.word	1073875972
 3209 0d90 0C0C0240 		.word	1073875980
 3210              		.cfi_endproc
 3211              	.LFE36:
 3213              		.align	1
 3214              		.global	main
 3215              		.syntax unified
 3216              		.code	16
 3217              		.thumb_func
 3218              		.fpu softvfp
 3220              	main:
 3221              	.LFB37:
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void main(void)
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** {
 3222              		.loc 7 43 0
 3223              		.cfi_startproc
 3224              		@ args = 0, pretend = 0, frame = 16
 3225              		@ frame_needed = 1, uses_anonymous_args = 0
 3226 0d94 90B5     		push	{r4, r7, lr}
 3227              		.cfi_def_cfa_offset 12
 3228              		.cfi_offset 4, -12
 3229              		.cfi_offset 7, -8
 3230              		.cfi_offset 14, -4
 3231 0d96 85B0     		sub	sp, sp, #20
 3232              		.cfi_def_cfa_offset 32
 3233 0d98 00AF     		add	r7, sp, #0
 3234              		.cfi_def_cfa_register 7
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     init_app();
 3235              		.loc 7 44 0
 3236 0d9a FFF7FEFF 		bl	init_app
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     graphic_initialize();
 3237              		.loc 7 45 0
 3238 0d9e FFF7FEFF 		bl	graphic_initialize
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     #ifndef SIMULATOR
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         graphics_clear_screen();
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     #endif
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT p = &ball;
 3239              		.loc 7 51 0
 3240 0da2 124B     		ldr	r3, .L188
 3241 0da4 FB60     		str	r3, [r7, #12]
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT Lpad = &Lpaddle;
 3242              		.loc 7 52 0
 3243 0da6 124B     		ldr	r3, .L188+4
 3244 0da8 BB60     		str	r3, [r7, #8]
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT Rpad = &Rpaddle;
 3245              		.loc 7 53 0
 3246 0daa 124B     		ldr	r3, .L188+8
 3247 0dac 7B60     		str	r3, [r7, #4]
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     p->set_speed(p, 4, 4);
 3248              		.loc 7 55 0
 3249 0dae FB68     		ldr	r3, [r7, #12]
 3250 0db0 1B6A     		ldr	r3, [r3, #32]
 3251 0db2 F868     		ldr	r0, [r7, #12]
 3252 0db4 0422     		movs	r2, #4
 3253 0db6 0421     		movs	r1, #4
 3254 0db8 9847     		blx	r3
 3255              	.LVL2:
 3256              	.L187:
 3257              	.LBB6:
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     while(1){
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         unsigned char c = keyb();
 3258              		.loc 7 58 0 discriminator 1
 3259 0dba FC1C     		adds	r4, r7, #3
 3260 0dbc FFF7FEFF 		bl	keyb
 3261 0dc0 0300     		movs	r3, r0
 3262 0dc2 2370     		strb	r3, [r4]
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         p->move(p);
 3263              		.loc 7 59 0 discriminator 1
 3264 0dc4 FB68     		ldr	r3, [r7, #12]
 3265 0dc6 DB69     		ldr	r3, [r3, #28]
 3266 0dc8 FA68     		ldr	r2, [r7, #12]
 3267 0dca 1000     		movs	r0, r2
 3268 0dcc 9847     		blx	r3
 3269              	.LVL3:
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         Lpad->move(Lpad);
 3270              		.loc 7 60 0 discriminator 1
 3271 0dce BB68     		ldr	r3, [r7, #8]
 3272 0dd0 DB69     		ldr	r3, [r3, #28]
 3273 0dd2 BA68     		ldr	r2, [r7, #8]
 3274 0dd4 1000     		movs	r0, r2
 3275 0dd6 9847     		blx	r3
 3276              	.LVL4:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         Rpad->move(Rpad);
 3277              		.loc 7 61 0 discriminator 1
 3278 0dd8 7B68     		ldr	r3, [r7, #4]
 3279 0dda DB69     		ldr	r3, [r3, #28]
 3280 0ddc 7A68     		ldr	r2, [r7, #4]
 3281 0dde 1000     		movs	r0, r2
 3282 0de0 9847     		blx	r3
 3283              	.LVL5:
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         delay_milli(40);
 3284              		.loc 7 62 0 discriminator 1
 3285 0de2 2820     		movs	r0, #40
 3286 0de4 FFF7FEFF 		bl	delay_milli
 3287              	.LBE6:
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         unsigned char c = keyb();
 3288              		.loc 7 57 0 discriminator 1
 3289 0de8 E7E7     		b	.L187
 3290              	.L189:
 3291 0dea C046     		.align	2
 3292              	.L188:
 3293 0dec 00000000 		.word	ball
 3294 0df0 00000000 		.word	Lpaddle
 3295 0df4 00000000 		.word	Rpaddle
 3296              		.cfi_endproc
 3297              	.LFE37:
 3299              	.Letext0:
