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
 398              		@ args = 0, pretend = 0, frame = 8
 399              		@ frame_needed = 1, uses_anonymous_args = 0
 400 016e 80B5     		push	{r7, lr}
 401              		.cfi_def_cfa_offset 8
 402              		.cfi_offset 7, -8
 403              		.cfi_offset 14, -4
 404 0170 82B0     		sub	sp, sp, #8
 405              		.cfi_def_cfa_offset 16
 406 0172 00AF     		add	r7, sp, #0
 407              		.cfi_def_cfa_register 7
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 408              		.loc 2 60 0
 409 0174 4020     		movs	r0, #64
 410 0176 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x00005555;
 411              		.loc 2 61 0
 412 017a 164B     		ldr	r3, .L28
 413 017c 164A     		ldr	r2, .L28+4
 414 017e 1A60     		str	r2, [r3]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 415              		.loc 2 62 0
 416 0180 0120     		movs	r0, #1
 417 0182 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 418              		.loc 2 63 0
 419 0186 0220     		movs	r0, #2
 420 0188 FFF7FEFF 		bl	graphics_ctrl_bit_set
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 421              		.loc 2 64 0
 422 018c FFF7FEFF 		bl	delay500ns
 423              	.L25:
 424              	.LBB2:
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     while(1) { // Wait for display not to be busy
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_E);
 425              		.loc 2 67 0
 426 0190 4020     		movs	r0, #64
 427 0192 FFF7FEFF 		bl	graphics_ctrl_bit_set
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         delay500ns();
 428              		.loc 2 68 0
 429 0196 FFF7FEFF 		bl	delay500ns
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 		unsigned char busy = *GPIO_E_IDR_HIGH & LCD_BUSY;
 430              		.loc 2 69 0
 431 019a 104B     		ldr	r3, .L28+8
 432 019c 1B78     		ldrb	r3, [r3]
 433 019e DAB2     		uxtb	r2, r3
 434 01a0 FB1D     		adds	r3, r7, #7
 435 01a2 7F21     		movs	r1, #127
 436 01a4 8A43     		bics	r2, r1
 437 01a6 1A70     		strb	r2, [r3]
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_clear(B_E);
 438              		.loc 2 70 0
 439 01a8 4020     		movs	r0, #64
 440 01aa FFF7FEFF 		bl	graphics_ctrl_bit_clear
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         delay500ns();
 441              		.loc 2 71 0
 442 01ae FFF7FEFF 		bl	delay500ns
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         //unsigned char i = *GPIO_IDR_HIGH;
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         if(busy == 0) {
 443              		.loc 2 73 0
 444 01b2 FB1D     		adds	r3, r7, #7
 445 01b4 1B78     		ldrb	r3, [r3]
 446 01b6 002B     		cmp	r3, #0
 447 01b8 00D0     		beq	.L27
 448              	.LBE2:
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphics_ctrl_bit_set(B_E);
 449              		.loc 2 66 0
 450 01ba E9E7     		b	.L25
 451              	.L27:
 452              	.LBB3:
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****             break;
 453              		.loc 2 74 0
 454 01bc C046     		nop
 455              	.LBE3:
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 456              		.loc 2 77 0
 457 01be 4020     		movs	r0, #64
 458 01c0 FFF7FEFF 		bl	graphics_ctrl_bit_set
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x55555555;
 459              		.loc 2 78 0
 460 01c4 034B     		ldr	r3, .L28
 461 01c6 064A     		ldr	r2, .L28+12
 462 01c8 1A60     		str	r2, [r3]
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 463              		.loc 2 80 0
 464 01ca C046     		nop
 465 01cc BD46     		mov	sp, r7
 466 01ce 02B0     		add	sp, sp, #8
 467              		@ sp needed
 468 01d0 80BD     		pop	{r7, pc}
 469              	.L29:
 470 01d2 C046     		.align	2
 471              	.L28:
 472 01d4 00100240 		.word	1073876992
 473 01d8 55550000 		.word	21845
 474 01dc 11100240 		.word	1073877009
 475 01e0 55555555 		.word	1431655765
 476              		.cfi_endproc
 477              	.LFE7:
 479              		.align	1
 480              		.global	graphic_read
 481              		.syntax unified
 482              		.code	16
 483              		.thumb_func
 484              		.fpu softvfp
 486              	graphic_read:
 487              	.LFB8:
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** uint8_t graphic_read(uint8_t controller){
 488              		.loc 2 82 0
 489              		.cfi_startproc
 490              		@ args = 0, pretend = 0, frame = 16
 491              		@ frame_needed = 1, uses_anonymous_args = 0
 492 01e4 80B5     		push	{r7, lr}
 493              		.cfi_def_cfa_offset 8
 494              		.cfi_offset 7, -8
 495              		.cfi_offset 14, -4
 496 01e6 84B0     		sub	sp, sp, #16
 497              		.cfi_def_cfa_offset 24
 498 01e8 00AF     		add	r7, sp, #0
 499              		.cfi_def_cfa_register 7
 500 01ea 0200     		movs	r2, r0
 501 01ec FB1D     		adds	r3, r7, #7
 502 01ee 1A70     		strb	r2, [r3]
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 503              		.loc 2 83 0
 504 01f0 4020     		movs	r0, #64
 505 01f2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x00005555;
 506              		.loc 2 84 0
 507 01f6 1B4B     		ldr	r3, .L34
 508 01f8 1B4A     		ldr	r2, .L34+4
 509 01fa 1A60     		str	r2, [r3]
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RS | B_RW);
 510              		.loc 2 85 0
 511 01fc 0320     		movs	r0, #3
 512 01fe FFF7FEFF 		bl	graphics_ctrl_bit_set
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 513              		.loc 2 86 0
 514 0202 FB1D     		adds	r3, r7, #7
 515 0204 1B78     		ldrb	r3, [r3]
 516 0206 1800     		movs	r0, r3
 517 0208 FFF7FEFF 		bl	select_controller
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 518              		.loc 2 87 0
 519 020c FFF7FEFF 		bl	delay500ns
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 520              		.loc 2 88 0
 521 0210 4020     		movs	r0, #64
 522 0212 FFF7FEFF 		bl	graphics_ctrl_bit_set
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 523              		.loc 2 89 0
 524 0216 FFF7FEFF 		bl	delay500ns
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     uint8_t RV = *GPIO_E_IDR_HIGH;
 525              		.loc 2 91 0
 526 021a 144A     		ldr	r2, .L34+8
 527 021c 0F23     		movs	r3, #15
 528 021e FB18     		adds	r3, r7, r3
 529 0220 1278     		ldrb	r2, [r2]
 530 0222 1A70     		strb	r2, [r3]
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 531              		.loc 2 92 0
 532 0224 4020     		movs	r0, #64
 533 0226 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_MODER = 0x55555555;
 534              		.loc 2 93 0
 535 022a 0E4B     		ldr	r3, .L34
 536 022c 104A     		ldr	r2, .L34+12
 537 022e 1A60     		str	r2, [r3]
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller == B_CS1){
 538              		.loc 2 95 0
 539 0230 FB1D     		adds	r3, r7, #7
 540 0232 1B78     		ldrb	r3, [r3]
 541 0234 082B     		cmp	r3, #8
 542 0236 04D1     		bne	.L31
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS1);
 543              		.loc 2 96 0
 544 0238 0820     		movs	r0, #8
 545 023a FFF7FEFF 		bl	select_controller
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 546              		.loc 2 97 0
 547 023e FFF7FEFF 		bl	graphic_wait_ready
 548              	.L31:
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller == B_CS2){
 549              		.loc 2 100 0
 550 0242 FB1D     		adds	r3, r7, #7
 551 0244 1B78     		ldrb	r3, [r3]
 552 0246 102B     		cmp	r3, #16
 553 0248 04D1     		bne	.L32
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS2);
 554              		.loc 2 101 0
 555 024a 1020     		movs	r0, #16
 556 024c FFF7FEFF 		bl	select_controller
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 557              		.loc 2 102 0
 558 0250 FFF7FEFF 		bl	graphic_wait_ready
 559              	.L32:
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     return RV;
 560              		.loc 2 105 0
 561 0254 0F23     		movs	r3, #15
 562 0256 FB18     		adds	r3, r7, r3
 563 0258 1B78     		ldrb	r3, [r3]
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 564              		.loc 2 107 0
 565 025a 1800     		movs	r0, r3
 566 025c BD46     		mov	sp, r7
 567 025e 04B0     		add	sp, sp, #16
 568              		@ sp needed
 569 0260 80BD     		pop	{r7, pc}
 570              	.L35:
 571 0262 C046     		.align	2
 572              	.L34:
 573 0264 00100240 		.word	1073876992
 574 0268 55550000 		.word	21845
 575 026c 11100240 		.word	1073877009
 576 0270 55555555 		.word	1431655765
 577              		.cfi_endproc
 578              	.LFE8:
 580              		.align	1
 581              		.global	graphic_write
 582              		.syntax unified
 583              		.code	16
 584              		.thumb_func
 585              		.fpu softvfp
 587              	graphic_write:
 588              	.LFB9:
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_write(uint8_t value, uint8_t controller){
 589              		.loc 2 109 0
 590              		.cfi_startproc
 591              		@ args = 0, pretend = 0, frame = 8
 592              		@ frame_needed = 1, uses_anonymous_args = 0
 593 0274 80B5     		push	{r7, lr}
 594              		.cfi_def_cfa_offset 8
 595              		.cfi_offset 7, -8
 596              		.cfi_offset 14, -4
 597 0276 82B0     		sub	sp, sp, #8
 598              		.cfi_def_cfa_offset 16
 599 0278 00AF     		add	r7, sp, #0
 600              		.cfi_def_cfa_register 7
 601 027a 0200     		movs	r2, r0
 602 027c FB1D     		adds	r3, r7, #7
 603 027e 1A70     		strb	r2, [r3]
 604 0280 BB1D     		adds	r3, r7, #6
 605 0282 0A1C     		adds	r2, r1, #0
 606 0284 1A70     		strb	r2, [r3]
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_ODR_HIGH = value;
 607              		.loc 2 110 0
 608 0286 1A4A     		ldr	r2, .L39
 609 0288 FB1D     		adds	r3, r7, #7
 610 028a 1B78     		ldrb	r3, [r3]
 611 028c 1370     		strb	r3, [r2]
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 612              		.loc 2 111 0
 613 028e BB1D     		adds	r3, r7, #6
 614 0290 1B78     		ldrb	r3, [r3]
 615 0292 1800     		movs	r0, r3
 616 0294 FFF7FEFF 		bl	select_controller
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 617              		.loc 2 112 0
 618 0298 FFF7FEFF 		bl	delay500ns
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 619              		.loc 2 113 0
 620 029c 4020     		movs	r0, #64
 621 029e FFF7FEFF 		bl	graphics_ctrl_bit_set
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay500ns();
 622              		.loc 2 114 0
 623 02a2 FFF7FEFF 		bl	delay500ns
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 624              		.loc 2 115 0
 625 02a6 4020     		movs	r0, #64
 626 02a8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller & B_CS1){
 627              		.loc 2 117 0
 628 02ac BB1D     		adds	r3, r7, #6
 629 02ae 1B78     		ldrb	r3, [r3]
 630 02b0 0822     		movs	r2, #8
 631 02b2 1340     		ands	r3, r2
 632 02b4 04D0     		beq	.L37
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS1);
 633              		.loc 2 118 0
 634 02b6 0820     		movs	r0, #8
 635 02b8 FFF7FEFF 		bl	select_controller
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 636              		.loc 2 119 0
 637 02bc FFF7FEFF 		bl	graphic_wait_ready
 638              	.L37:
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(controller & B_CS2){
 639              		.loc 2 122 0
 640 02c0 BB1D     		adds	r3, r7, #6
 641 02c2 1B78     		ldrb	r3, [r3]
 642 02c4 1022     		movs	r2, #16
 643 02c6 1340     		ands	r3, r2
 644 02c8 04D0     		beq	.L38
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         select_controller(B_CS2);
 645              		.loc 2 123 0
 646 02ca 1020     		movs	r0, #16
 647 02cc FFF7FEFF 		bl	select_controller
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_wait_ready();
 648              		.loc 2 124 0
 649 02d0 FFF7FEFF 		bl	graphic_wait_ready
 650              	.L38:
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     *GPIO_E_ODR_HIGH = 0;
 651              		.loc 2 127 0
 652 02d4 064B     		ldr	r3, .L39
 653 02d6 0022     		movs	r2, #0
 654 02d8 1A70     		strb	r2, [r3]
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 655              		.loc 2 128 0
 656 02da 4020     		movs	r0, #64
 657 02dc FFF7FEFF 		bl	graphics_ctrl_bit_set
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(0);
 658              		.loc 2 129 0
 659 02e0 0020     		movs	r0, #0
 660 02e2 FFF7FEFF 		bl	select_controller
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 661              		.loc 2 130 0
 662 02e6 C046     		nop
 663 02e8 BD46     		mov	sp, r7
 664 02ea 02B0     		add	sp, sp, #8
 665              		@ sp needed
 666 02ec 80BD     		pop	{r7, pc}
 667              	.L40:
 668 02ee C046     		.align	2
 669              	.L39:
 670 02f0 15100240 		.word	1073877013
 671              		.cfi_endproc
 672              	.LFE9:
 674              		.align	1
 675              		.global	graphic_write_command
 676              		.syntax unified
 677              		.code	16
 678              		.thumb_func
 679              		.fpu softvfp
 681              	graphic_write_command:
 682              	.LFB10:
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_write_command(uint8_t command, uint8_t controller){
 683              		.loc 2 132 0
 684              		.cfi_startproc
 685              		@ args = 0, pretend = 0, frame = 8
 686              		@ frame_needed = 1, uses_anonymous_args = 0
 687 02f4 80B5     		push	{r7, lr}
 688              		.cfi_def_cfa_offset 8
 689              		.cfi_offset 7, -8
 690              		.cfi_offset 14, -4
 691 02f6 82B0     		sub	sp, sp, #8
 692              		.cfi_def_cfa_offset 16
 693 02f8 00AF     		add	r7, sp, #0
 694              		.cfi_def_cfa_register 7
 695 02fa 0200     		movs	r2, r0
 696 02fc FB1D     		adds	r3, r7, #7
 697 02fe 1A70     		strb	r2, [r3]
 698 0300 BB1D     		adds	r3, r7, #6
 699 0302 0A1C     		adds	r2, r1, #0
 700 0304 1A70     		strb	r2, [r3]
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 701              		.loc 2 133 0
 702 0306 4020     		movs	r0, #64
 703 0308 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 704              		.loc 2 134 0
 705 030c BB1D     		adds	r3, r7, #6
 706 030e 1B78     		ldrb	r3, [r3]
 707 0310 1800     		movs	r0, r3
 708 0312 FFF7FEFF 		bl	select_controller
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_RS | B_RW);
 709              		.loc 2 135 0
 710 0316 0320     		movs	r0, #3
 711 0318 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write(command, controller);
 712              		.loc 2 136 0
 713 031c BB1D     		adds	r3, r7, #6
 714 031e 1A78     		ldrb	r2, [r3]
 715 0320 FB1D     		adds	r3, r7, #7
 716 0322 1B78     		ldrb	r3, [r3]
 717 0324 1100     		movs	r1, r2
 718 0326 1800     		movs	r0, r3
 719 0328 FFF7FEFF 		bl	graphic_write
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 720              		.loc 2 137 0
 721 032c C046     		nop
 722 032e BD46     		mov	sp, r7
 723 0330 02B0     		add	sp, sp, #8
 724              		@ sp needed
 725 0332 80BD     		pop	{r7, pc}
 726              		.cfi_endproc
 727              	.LFE10:
 729              		.align	1
 730              		.global	graphic_write_data
 731              		.syntax unified
 732              		.code	16
 733              		.thumb_func
 734              		.fpu softvfp
 736              	graphic_write_data:
 737              	.LFB11:
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_write_data(uint8_t data, uint8_t controller){
 738              		.loc 2 139 0
 739              		.cfi_startproc
 740              		@ args = 0, pretend = 0, frame = 8
 741              		@ frame_needed = 1, uses_anonymous_args = 0
 742 0334 80B5     		push	{r7, lr}
 743              		.cfi_def_cfa_offset 8
 744              		.cfi_offset 7, -8
 745              		.cfi_offset 14, -4
 746 0336 82B0     		sub	sp, sp, #8
 747              		.cfi_def_cfa_offset 16
 748 0338 00AF     		add	r7, sp, #0
 749              		.cfi_def_cfa_register 7
 750 033a 0200     		movs	r2, r0
 751 033c FB1D     		adds	r3, r7, #7
 752 033e 1A70     		strb	r2, [r3]
 753 0340 BB1D     		adds	r3, r7, #6
 754 0342 0A1C     		adds	r2, r1, #0
 755 0344 1A70     		strb	r2, [r3]
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 756              		.loc 2 140 0
 757 0346 4020     		movs	r0, #64
 758 0348 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(controller);
 759              		.loc 2 141 0
 760 034c BB1D     		adds	r3, r7, #6
 761 034e 1B78     		ldrb	r3, [r3]
 762 0350 1800     		movs	r0, r3
 763 0352 FFF7FEFF 		bl	select_controller
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 764              		.loc 2 142 0
 765 0356 0120     		movs	r0, #1
 766 0358 FFF7FEFF 		bl	graphics_ctrl_bit_set
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 767              		.loc 2 143 0
 768 035c 0220     		movs	r0, #2
 769 035e FFF7FEFF 		bl	graphics_ctrl_bit_clear
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write(data, controller);
 770              		.loc 2 144 0
 771 0362 BB1D     		adds	r3, r7, #6
 772 0364 1A78     		ldrb	r2, [r3]
 773 0366 FB1D     		adds	r3, r7, #7
 774 0368 1B78     		ldrb	r3, [r3]
 775 036a 1100     		movs	r1, r2
 776 036c 1800     		movs	r0, r3
 777 036e FFF7FEFF 		bl	graphic_write
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 778              		.loc 2 145 0
 779 0372 C046     		nop
 780 0374 BD46     		mov	sp, r7
 781 0376 02B0     		add	sp, sp, #8
 782              		@ sp needed
 783 0378 80BD     		pop	{r7, pc}
 784              		.cfi_endproc
 785              	.LFE11:
 787              		.align	1
 788              		.global	graphics_read_data
 789              		.syntax unified
 790              		.code	16
 791              		.thumb_func
 792              		.fpu softvfp
 794              	graphics_read_data:
 795              	.LFB12:
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** uint8_t graphics_read_data(uint8_t controller){
 796              		.loc 2 147 0
 797              		.cfi_startproc
 798              		@ args = 0, pretend = 0, frame = 8
 799              		@ frame_needed = 1, uses_anonymous_args = 0
 800 037a 80B5     		push	{r7, lr}
 801              		.cfi_def_cfa_offset 8
 802              		.cfi_offset 7, -8
 803              		.cfi_offset 14, -4
 804 037c 82B0     		sub	sp, sp, #8
 805              		.cfi_def_cfa_offset 16
 806 037e 00AF     		add	r7, sp, #0
 807              		.cfi_def_cfa_register 7
 808 0380 0200     		movs	r2, r0
 809 0382 FB1D     		adds	r3, r7, #7
 810 0384 1A70     		strb	r2, [r3]
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     (void) graphic_read(controller);
 811              		.loc 2 148 0
 812 0386 FB1D     		adds	r3, r7, #7
 813 0388 1B78     		ldrb	r3, [r3]
 814 038a 1800     		movs	r0, r3
 815 038c FFF7FEFF 		bl	graphic_read
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     return graphic_read(controller);
 816              		.loc 2 149 0
 817 0390 FB1D     		adds	r3, r7, #7
 818 0392 1B78     		ldrb	r3, [r3]
 819 0394 1800     		movs	r0, r3
 820 0396 FFF7FEFF 		bl	graphic_read
 821 039a 0300     		movs	r3, r0
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 822              		.loc 2 150 0
 823 039c 1800     		movs	r0, r3
 824 039e BD46     		mov	sp, r7
 825 03a0 02B0     		add	sp, sp, #8
 826              		@ sp needed
 827 03a2 80BD     		pop	{r7, pc}
 828              		.cfi_endproc
 829              	.LFE12:
 831              		.align	1
 832              		.global	graphic_initialize
 833              		.syntax unified
 834              		.code	16
 835              		.thumb_func
 836              		.fpu softvfp
 838              	graphic_initialize:
 839              	.LFB13:
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphic_initialize(void){
 840              		.loc 2 152 0
 841              		.cfi_startproc
 842              		@ args = 0, pretend = 0, frame = 0
 843              		@ frame_needed = 1, uses_anonymous_args = 0
 844 03a4 80B5     		push	{r7, lr}
 845              		.cfi_def_cfa_offset 8
 846              		.cfi_offset 7, -8
 847              		.cfi_offset 14, -4
 848 03a6 00AF     		add	r7, sp, #0
 849              		.cfi_def_cfa_register 7
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_E);
 850              		.loc 2 153 0
 851 03a8 4020     		movs	r0, #64
 852 03aa FFF7FEFF 		bl	graphics_ctrl_bit_set
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay_micro(10);
 853              		.loc 2 154 0
 854 03ae 0A20     		movs	r0, #10
 855 03b0 FFF7FEFF 		bl	delay_micro
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 856              		.loc 2 155 0
 857 03b4 7820     		movs	r0, #120
 858 03b6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     delay_milli(30);
 859              		.loc 2 156 0
 860 03ba 1E20     		movs	r0, #30
 861 03bc FFF7FEFF 		bl	delay_milli
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphics_ctrl_bit_set(B_RST);
 862              		.loc 2 157 0
 863 03c0 2020     		movs	r0, #32
 864 03c2 FFF7FEFF 		bl	graphics_ctrl_bit_set
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 865              		.loc 2 158 0
 866 03c6 1821     		movs	r1, #24
 867 03c8 3E20     		movs	r0, #62
 868 03ca FFF7FEFF 		bl	graphic_write_command
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_ON, B_CS1|B_CS2);
 869              		.loc 2 159 0
 870 03ce 1821     		movs	r1, #24
 871 03d0 3F20     		movs	r0, #63
 872 03d2 FFF7FEFF 		bl	graphic_write_command
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 873              		.loc 2 160 0
 874 03d6 1821     		movs	r1, #24
 875 03d8 C020     		movs	r0, #192
 876 03da FFF7FEFF 		bl	graphic_write_command
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 877              		.loc 2 161 0
 878 03de 1821     		movs	r1, #24
 879 03e0 4020     		movs	r0, #64
 880 03e2 FFF7FEFF 		bl	graphic_write_command
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 881              		.loc 2 162 0
 882 03e6 1821     		movs	r1, #24
 883 03e8 B820     		movs	r0, #184
 884 03ea FFF7FEFF 		bl	graphic_write_command
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     select_controller(0);
 885              		.loc 2 163 0
 886 03ee 0020     		movs	r0, #0
 887 03f0 FFF7FEFF 		bl	select_controller
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 888              		.loc 2 164 0
 889 03f4 C046     		nop
 890 03f6 BD46     		mov	sp, r7
 891              		@ sp needed
 892 03f8 80BD     		pop	{r7, pc}
 893              		.cfi_endproc
 894              	.LFE13:
 896              		.align	1
 897              		.global	graphics_clear_screen
 898              		.syntax unified
 899              		.code	16
 900              		.thumb_func
 901              		.fpu softvfp
 903              	graphics_clear_screen:
 904              	.LFB14:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void graphics_clear_screen(void){
 905              		.loc 2 166 0
 906              		.cfi_startproc
 907              		@ args = 0, pretend = 0, frame = 8
 908              		@ frame_needed = 1, uses_anonymous_args = 0
 909 03fa 80B5     		push	{r7, lr}
 910              		.cfi_def_cfa_offset 8
 911              		.cfi_offset 7, -8
 912              		.cfi_offset 14, -4
 913 03fc 82B0     		sub	sp, sp, #8
 914              		.cfi_def_cfa_offset 16
 915 03fe 00AF     		add	r7, sp, #0
 916              		.cfi_def_cfa_register 7
 917              	.LBB4:
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     for(int page = 0; page < PAGE; page++){
 918              		.loc 2 167 0
 919 0400 0023     		movs	r3, #0
 920 0402 7B60     		str	r3, [r7, #4]
 921 0404 1EE0     		b	.L47
 922              	.L50:
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 923              		.loc 2 168 0
 924 0406 7B68     		ldr	r3, [r7, #4]
 925 0408 5BB2     		sxtb	r3, r3
 926 040a 4822     		movs	r2, #72
 927 040c 5242     		rsbs	r2, r2, #0
 928 040e 1343     		orrs	r3, r2
 929 0410 5BB2     		sxtb	r3, r3
 930 0412 DBB2     		uxtb	r3, r3
 931 0414 1821     		movs	r1, #24
 932 0416 1800     		movs	r0, r3
 933 0418 FFF7FEFF 		bl	graphic_write_command
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 934              		.loc 2 169 0
 935 041c 1821     		movs	r1, #24
 936 041e 4020     		movs	r0, #64
 937 0420 FFF7FEFF 		bl	graphic_write_command
 938              	.LBB5:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         for(int add = 0; add < ADD; add++){
 939              		.loc 2 170 0
 940 0424 0023     		movs	r3, #0
 941 0426 3B60     		str	r3, [r7]
 942 0428 06E0     		b	.L48
 943              	.L49:
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****             graphic_write_data(0, B_CS1|B_CS2);
 944              		.loc 2 171 0 discriminator 3
 945 042a 1821     		movs	r1, #24
 946 042c 0020     		movs	r0, #0
 947 042e FFF7FEFF 		bl	graphic_write_data
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         for(int add = 0; add < ADD; add++){
 948              		.loc 2 170 0 discriminator 3
 949 0432 3B68     		ldr	r3, [r7]
 950 0434 0133     		adds	r3, r3, #1
 951 0436 3B60     		str	r3, [r7]
 952              	.L48:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         for(int add = 0; add < ADD; add++){
 953              		.loc 2 170 0 is_stmt 0 discriminator 1
 954 0438 3B68     		ldr	r3, [r7]
 955 043a 3E2B     		cmp	r3, #62
 956 043c F5DD     		ble	.L49
 957              	.LBE5:
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 958              		.loc 2 167 0 is_stmt 1 discriminator 2
 959 043e 7B68     		ldr	r3, [r7, #4]
 960 0440 0133     		adds	r3, r3, #1
 961 0442 7B60     		str	r3, [r7, #4]
 962              	.L47:
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 963              		.loc 2 167 0 is_stmt 0 discriminator 1
 964 0444 7B68     		ldr	r3, [r7, #4]
 965 0446 072B     		cmp	r3, #7
 966 0448 DDDD     		ble	.L50
 967              	.LBE4:
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** }
 968              		.loc 2 175 0 is_stmt 1
 969 044a C046     		nop
 970 044c BD46     		mov	sp, r7
 971 044e 02B0     		add	sp, sp, #8
 972              		@ sp needed
 973 0450 80BD     		pop	{r7, pc}
 974              		.cfi_endproc
 975              	.LFE14:
 977              		.align	1
 978              		.global	pixel
 979              		.syntax unified
 980              		.code	16
 981              		.thumb_func
 982              		.fpu softvfp
 984              	pixel:
 985              	.LFB15:
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** void pixel(unsigned x, unsigned y, unsigned set){
 986              		.loc 2 178 0
 987              		.cfi_startproc
 988              		@ args = 0, pretend = 0, frame = 24
 989              		@ frame_needed = 1, uses_anonymous_args = 0
 990 0452 90B5     		push	{r4, r7, lr}
 991              		.cfi_def_cfa_offset 12
 992              		.cfi_offset 4, -12
 993              		.cfi_offset 7, -8
 994              		.cfi_offset 14, -4
 995 0454 87B0     		sub	sp, sp, #28
 996              		.cfi_def_cfa_offset 40
 997 0456 00AF     		add	r7, sp, #0
 998              		.cfi_def_cfa_register 7
 999 0458 F860     		str	r0, [r7, #12]
 1000 045a B960     		str	r1, [r7, #8]
 1001 045c 7A60     		str	r2, [r7, #4]
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((x < 0 || y < 0) || (x > SCREEN_WIDTH || y > SCREEN_HEIGHT)) return;
 1002              		.loc 2 179 0
 1003 045e FB68     		ldr	r3, [r7, #12]
 1004 0460 7F2B     		cmp	r3, #127
 1005 0462 00D9     		bls	.LCB788
 1006 0464 C7E0     		b	.L68	@long jump
 1007              	.LCB788:
 1008              		.loc 2 179 0 is_stmt 0 discriminator 1
 1009 0466 BB68     		ldr	r3, [r7, #8]
 1010 0468 3F2B     		cmp	r3, #63
 1011 046a 00D9     		bls	.LCB791
 1012 046c C3E0     		b	.L68	@long jump
 1013              	.LCB791:
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     unsigned char index = (y-1) / PAGE;
 1014              		.loc 2 181 0 is_stmt 1
 1015 046e BB68     		ldr	r3, [r7, #8]
 1016 0470 013B     		subs	r3, r3, #1
 1017 0472 DA08     		lsrs	r2, r3, #3
 1018 0474 1523     		movs	r3, #21
 1019 0476 FB18     		adds	r3, r7, r3
 1020 0478 1A70     		strb	r2, [r3]
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     unsigned char mask;
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 0){mask = 1;}
 1021              		.loc 2 184 0
 1022 047a BB68     		ldr	r3, [r7, #8]
 1023 047c 013B     		subs	r3, r3, #1
 1024 047e 0722     		movs	r2, #7
 1025 0480 1340     		ands	r3, r2
 1026 0482 03D1     		bne	.L55
 1027              		.loc 2 184 0 is_stmt 0 discriminator 1
 1028 0484 1723     		movs	r3, #23
 1029 0486 FB18     		adds	r3, r7, r3
 1030 0488 0122     		movs	r2, #1
 1031 048a 1A70     		strb	r2, [r3]
 1032              	.L55:
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 1){mask = 2;}
 1033              		.loc 2 185 0 is_stmt 1
 1034 048c BB68     		ldr	r3, [r7, #8]
 1035 048e 013B     		subs	r3, r3, #1
 1036 0490 0722     		movs	r2, #7
 1037 0492 1340     		ands	r3, r2
 1038 0494 012B     		cmp	r3, #1
 1039 0496 03D1     		bne	.L56
 1040              		.loc 2 185 0 is_stmt 0 discriminator 1
 1041 0498 1723     		movs	r3, #23
 1042 049a FB18     		adds	r3, r7, r3
 1043 049c 0222     		movs	r2, #2
 1044 049e 1A70     		strb	r2, [r3]
 1045              	.L56:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 2){mask = 4;}
 1046              		.loc 2 186 0 is_stmt 1
 1047 04a0 BB68     		ldr	r3, [r7, #8]
 1048 04a2 013B     		subs	r3, r3, #1
 1049 04a4 0722     		movs	r2, #7
 1050 04a6 1340     		ands	r3, r2
 1051 04a8 022B     		cmp	r3, #2
 1052 04aa 03D1     		bne	.L57
 1053              		.loc 2 186 0 is_stmt 0 discriminator 1
 1054 04ac 1723     		movs	r3, #23
 1055 04ae FB18     		adds	r3, r7, r3
 1056 04b0 0422     		movs	r2, #4
 1057 04b2 1A70     		strb	r2, [r3]
 1058              	.L57:
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 3){mask = 8;}
 1059              		.loc 2 187 0 is_stmt 1
 1060 04b4 BB68     		ldr	r3, [r7, #8]
 1061 04b6 013B     		subs	r3, r3, #1
 1062 04b8 0722     		movs	r2, #7
 1063 04ba 1340     		ands	r3, r2
 1064 04bc 032B     		cmp	r3, #3
 1065 04be 03D1     		bne	.L58
 1066              		.loc 2 187 0 is_stmt 0 discriminator 1
 1067 04c0 1723     		movs	r3, #23
 1068 04c2 FB18     		adds	r3, r7, r3
 1069 04c4 0822     		movs	r2, #8
 1070 04c6 1A70     		strb	r2, [r3]
 1071              	.L58:
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 4){mask = 0x10;}
 1072              		.loc 2 188 0 is_stmt 1
 1073 04c8 BB68     		ldr	r3, [r7, #8]
 1074 04ca 013B     		subs	r3, r3, #1
 1075 04cc 0722     		movs	r2, #7
 1076 04ce 1340     		ands	r3, r2
 1077 04d0 042B     		cmp	r3, #4
 1078 04d2 03D1     		bne	.L59
 1079              		.loc 2 188 0 is_stmt 0 discriminator 1
 1080 04d4 1723     		movs	r3, #23
 1081 04d6 FB18     		adds	r3, r7, r3
 1082 04d8 1022     		movs	r2, #16
 1083 04da 1A70     		strb	r2, [r3]
 1084              	.L59:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 5){mask = 0x20;}
 1085              		.loc 2 189 0 is_stmt 1
 1086 04dc BB68     		ldr	r3, [r7, #8]
 1087 04de 013B     		subs	r3, r3, #1
 1088 04e0 0722     		movs	r2, #7
 1089 04e2 1340     		ands	r3, r2
 1090 04e4 052B     		cmp	r3, #5
 1091 04e6 03D1     		bne	.L60
 1092              		.loc 2 189 0 is_stmt 0 discriminator 1
 1093 04e8 1723     		movs	r3, #23
 1094 04ea FB18     		adds	r3, r7, r3
 1095 04ec 2022     		movs	r2, #32
 1096 04ee 1A70     		strb	r2, [r3]
 1097              	.L60:
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 6){mask = 0x40;}
 1098              		.loc 2 190 0 is_stmt 1
 1099 04f0 BB68     		ldr	r3, [r7, #8]
 1100 04f2 013B     		subs	r3, r3, #1
 1101 04f4 0722     		movs	r2, #7
 1102 04f6 1340     		ands	r3, r2
 1103 04f8 062B     		cmp	r3, #6
 1104 04fa 03D1     		bne	.L61
 1105              		.loc 2 190 0 is_stmt 0 discriminator 1
 1106 04fc 1723     		movs	r3, #23
 1107 04fe FB18     		adds	r3, r7, r3
 1108 0500 4022     		movs	r2, #64
 1109 0502 1A70     		strb	r2, [r3]
 1110              	.L61:
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if((y-1) % 8 == 7){mask = 0x80;}
 1111              		.loc 2 191 0 is_stmt 1
 1112 0504 BB68     		ldr	r3, [r7, #8]
 1113 0506 013B     		subs	r3, r3, #1
 1114 0508 0722     		movs	r2, #7
 1115 050a 1340     		ands	r3, r2
 1116 050c 072B     		cmp	r3, #7
 1117 050e 03D1     		bne	.L62
 1118              		.loc 2 191 0 is_stmt 0 discriminator 1
 1119 0510 1723     		movs	r3, #23
 1120 0512 FB18     		adds	r3, r7, r3
 1121 0514 8022     		movs	r2, #128
 1122 0516 1A70     		strb	r2, [r3]
 1123              	.L62:
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(set == 0){mask = ~mask;}
 1124              		.loc 2 193 0 is_stmt 1
 1125 0518 7B68     		ldr	r3, [r7, #4]
 1126 051a 002B     		cmp	r3, #0
 1127 051c 06D1     		bne	.L63
 1128              		.loc 2 193 0 is_stmt 0 discriminator 1
 1129 051e 1723     		movs	r3, #23
 1130 0520 FB18     		adds	r3, r7, r3
 1131 0522 1722     		movs	r2, #23
 1132 0524 BA18     		adds	r2, r7, r2
 1133 0526 1278     		ldrb	r2, [r2]
 1134 0528 D243     		mvns	r2, r2
 1135 052a 1A70     		strb	r2, [r3]
 1136              	.L63:
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     unsigned char controller;
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(x > 64){
 1137              		.loc 2 196 0 is_stmt 1
 1138 052c FB68     		ldr	r3, [r7, #12]
 1139 052e 402B     		cmp	r3, #64
 1140 0530 07D9     		bls	.L64
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         controller = B_CS2;
 1141              		.loc 2 197 0
 1142 0532 1623     		movs	r3, #22
 1143 0534 FB18     		adds	r3, r7, r3
 1144 0536 1022     		movs	r2, #16
 1145 0538 1A70     		strb	r2, [r3]
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         x = x - 65;
 1146              		.loc 2 198 0
 1147 053a FB68     		ldr	r3, [r7, #12]
 1148 053c 413B     		subs	r3, r3, #65
 1149 053e FB60     		str	r3, [r7, #12]
 1150 0540 06E0     		b	.L65
 1151              	.L64:
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     else{
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         controller = B_CS1;
 1152              		.loc 2 201 0
 1153 0542 1623     		movs	r3, #22
 1154 0544 FB18     		adds	r3, r7, r3
 1155 0546 0822     		movs	r2, #8
 1156 0548 1A70     		strb	r2, [r3]
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         x = x - 1;
 1157              		.loc 2 202 0
 1158 054a FB68     		ldr	r3, [r7, #12]
 1159 054c 013B     		subs	r3, r3, #1
 1160 054e FB60     		str	r3, [r7, #12]
 1161              	.L65:
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         }
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1162              		.loc 2 205 0
 1163 0550 FB68     		ldr	r3, [r7, #12]
 1164 0552 DBB2     		uxtb	r3, r3
 1165 0554 4022     		movs	r2, #64
 1166 0556 1343     		orrs	r3, r2
 1167 0558 DAB2     		uxtb	r2, r3
 1168 055a 1623     		movs	r3, #22
 1169 055c FB18     		adds	r3, r7, r3
 1170 055e 1B78     		ldrb	r3, [r3]
 1171 0560 1900     		movs	r1, r3
 1172 0562 1000     		movs	r0, r2
 1173 0564 FFF7FEFF 		bl	graphic_write_command
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 1174              		.loc 2 206 0
 1175 0568 1523     		movs	r3, #21
 1176 056a FB18     		adds	r3, r7, r3
 1177 056c 1B78     		ldrb	r3, [r3]
 1178 056e 4822     		movs	r2, #72
 1179 0570 5242     		rsbs	r2, r2, #0
 1180 0572 1343     		orrs	r3, r2
 1181 0574 DAB2     		uxtb	r2, r3
 1182 0576 1623     		movs	r3, #22
 1183 0578 FB18     		adds	r3, r7, r3
 1184 057a 1B78     		ldrb	r3, [r3]
 1185 057c 1900     		movs	r1, r3
 1186 057e 1000     		movs	r0, r2
 1187 0580 FFF7FEFF 		bl	graphic_write_command
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 	unsigned char temp = graphics_read_data(controller);
 1188              		.loc 2 207 0
 1189 0584 1423     		movs	r3, #20
 1190 0586 FC18     		adds	r4, r7, r3
 1191 0588 1623     		movs	r3, #22
 1192 058a FB18     		adds	r3, r7, r3
 1193 058c 1B78     		ldrb	r3, [r3]
 1194 058e 1800     		movs	r0, r3
 1195 0590 FFF7FEFF 		bl	graphics_read_data
 1196 0594 0300     		movs	r3, r0
 1197 0596 2370     		strb	r3, [r4]
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h **** 	graphic_write_command(LCD_SET_ADD | x, controller);
 1198              		.loc 2 208 0
 1199 0598 FB68     		ldr	r3, [r7, #12]
 1200 059a DBB2     		uxtb	r3, r3
 1201 059c 4022     		movs	r2, #64
 1202 059e 1343     		orrs	r3, r2
 1203 05a0 DAB2     		uxtb	r2, r3
 1204 05a2 1623     		movs	r3, #22
 1205 05a4 FB18     		adds	r3, r7, r3
 1206 05a6 1B78     		ldrb	r3, [r3]
 1207 05a8 1900     		movs	r1, r3
 1208 05aa 1000     		movs	r0, r2
 1209 05ac FFF7FEFF 		bl	graphic_write_command
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     if(set == 1)
 1210              		.loc 2 210 0
 1211 05b0 7B68     		ldr	r3, [r7, #4]
 1212 05b2 012B     		cmp	r3, #1
 1213 05b4 0AD1     		bne	.L66
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         {mask = mask | temp;}
 1214              		.loc 2 211 0
 1215 05b6 1723     		movs	r3, #23
 1216 05b8 FB18     		adds	r3, r7, r3
 1217 05ba 1722     		movs	r2, #23
 1218 05bc B918     		adds	r1, r7, r2
 1219 05be 1422     		movs	r2, #20
 1220 05c0 BA18     		adds	r2, r7, r2
 1221 05c2 0978     		ldrb	r1, [r1]
 1222 05c4 1278     		ldrb	r2, [r2]
 1223 05c6 0A43     		orrs	r2, r1
 1224 05c8 1A70     		strb	r2, [r3]
 1225 05ca 09E0     		b	.L67
 1226              	.L66:
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     else
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****         {mask = mask & temp;}
 1227              		.loc 2 213 0
 1228 05cc 1723     		movs	r3, #23
 1229 05ce FB18     		adds	r3, r7, r3
 1230 05d0 1722     		movs	r2, #23
 1231 05d2 BA18     		adds	r2, r7, r2
 1232 05d4 1421     		movs	r1, #20
 1233 05d6 7918     		adds	r1, r7, r1
 1234 05d8 1278     		ldrb	r2, [r2]
 1235 05da 0978     		ldrb	r1, [r1]
 1236 05dc 0A40     		ands	r2, r1
 1237 05de 1A70     		strb	r2, [r3]
 1238              	.L67:
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     graphic_write_data(mask, controller);
 1239              		.loc 2 215 0
 1240 05e0 1623     		movs	r3, #22
 1241 05e2 FB18     		adds	r3, r7, r3
 1242 05e4 1A78     		ldrb	r2, [r3]
 1243 05e6 1723     		movs	r3, #23
 1244 05e8 FB18     		adds	r3, r7, r3
 1245 05ea 1B78     		ldrb	r3, [r3]
 1246 05ec 1100     		movs	r1, r2
 1247 05ee 1800     		movs	r0, r3
 1248 05f0 FFF7FEFF 		bl	graphic_write_data
 1249 05f4 00E0     		b	.L51
 1250              	.L68:
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 1251              		.loc 2 179 0
 1252 05f6 C046     		nop
 1253              	.L51:
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/graphics.h ****     }
 1254              		.loc 2 218 0
 1255 05f8 BD46     		mov	sp, r7
 1256 05fa 07B0     		add	sp, sp, #28
 1257              		@ sp needed
 1258 05fc 90BD     		pop	{r4, r7, pc}
 1259              		.cfi_endproc
 1260              	.LFE15:
 1262              		.align	1
 1263              		.global	ascii_ctrl_bit_set
 1264              		.syntax unified
 1265              		.code	16
 1266              		.thumb_func
 1267              		.fpu softvfp
 1269              	ascii_ctrl_bit_set:
 1270              	.LFB16:
 1271              		.file 3 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** #include "delay.h"
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_ctrl_bit_set(unsigned int x) {
 1272              		.loc 3 3 0
 1273              		.cfi_startproc
 1274              		@ args = 0, pretend = 0, frame = 8
 1275              		@ frame_needed = 1, uses_anonymous_args = 0
 1276 05fe 80B5     		push	{r7, lr}
 1277              		.cfi_def_cfa_offset 8
 1278              		.cfi_offset 7, -8
 1279              		.cfi_offset 14, -4
 1280 0600 82B0     		sub	sp, sp, #8
 1281              		.cfi_def_cfa_offset 16
 1282 0602 00AF     		add	r7, sp, #0
 1283              		.cfi_def_cfa_register 7
 1284 0604 7860     		str	r0, [r7, #4]
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	switch(x) {
 1285              		.loc 3 4 0
 1286 0606 7B68     		ldr	r3, [r7, #4]
 1287 0608 072B     		cmp	r3, #7
 1288 060a 4ED8     		bhi	.L80
 1289 060c 7B68     		ldr	r3, [r7, #4]
 1290 060e 9A00     		lsls	r2, r3, #2
 1291 0610 284B     		ldr	r3, .L81
 1292 0612 D318     		adds	r3, r2, r3
 1293 0614 1B68     		ldr	r3, [r3]
 1294 0616 9F46     		mov	pc, r3
 1295              		.section	.rodata
 1296              		.align	2
 1297              	.L72:
 1298 0000 18060000 		.word	.L71
 1299 0004 2A060000 		.word	.L73
 1300 0008 3C060000 		.word	.L74
 1301 000c 4E060000 		.word	.L75
 1302 0010 60060000 		.word	.L76
 1303 0014 72060000 		.word	.L77
 1304 0018 84060000 		.word	.L78
 1305 001c 96060000 		.word	.L79
 1306              		.text
 1307              	.L71:
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 0: *GPIO_E_ODR_LOW |= 1; break;
 1308              		.loc 3 5 0
 1309 0618 274A     		ldr	r2, .L81+4
 1310 061a 274B     		ldr	r3, .L81+4
 1311 061c 1B78     		ldrb	r3, [r3]
 1312 061e DBB2     		uxtb	r3, r3
 1313 0620 0121     		movs	r1, #1
 1314 0622 0B43     		orrs	r3, r1
 1315 0624 DBB2     		uxtb	r3, r3
 1316 0626 1370     		strb	r3, [r2]
 1317 0628 3FE0     		b	.L70
 1318              	.L73:
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 1: *GPIO_E_ODR_LOW |= 2; break;
 1319              		.loc 3 6 0
 1320 062a 234A     		ldr	r2, .L81+4
 1321 062c 224B     		ldr	r3, .L81+4
 1322 062e 1B78     		ldrb	r3, [r3]
 1323 0630 DBB2     		uxtb	r3, r3
 1324 0632 0221     		movs	r1, #2
 1325 0634 0B43     		orrs	r3, r1
 1326 0636 DBB2     		uxtb	r3, r3
 1327 0638 1370     		strb	r3, [r2]
 1328 063a 36E0     		b	.L70
 1329              	.L74:
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 2: *GPIO_E_ODR_LOW |= 4; break;
 1330              		.loc 3 7 0
 1331 063c 1E4A     		ldr	r2, .L81+4
 1332 063e 1E4B     		ldr	r3, .L81+4
 1333 0640 1B78     		ldrb	r3, [r3]
 1334 0642 DBB2     		uxtb	r3, r3
 1335 0644 0421     		movs	r1, #4
 1336 0646 0B43     		orrs	r3, r1
 1337 0648 DBB2     		uxtb	r3, r3
 1338 064a 1370     		strb	r3, [r2]
 1339 064c 2DE0     		b	.L70
 1340              	.L75:
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 3: *GPIO_E_ODR_LOW |= 8; break;
 1341              		.loc 3 8 0
 1342 064e 1A4A     		ldr	r2, .L81+4
 1343 0650 194B     		ldr	r3, .L81+4
 1344 0652 1B78     		ldrb	r3, [r3]
 1345 0654 DBB2     		uxtb	r3, r3
 1346 0656 0821     		movs	r1, #8
 1347 0658 0B43     		orrs	r3, r1
 1348 065a DBB2     		uxtb	r3, r3
 1349 065c 1370     		strb	r3, [r2]
 1350 065e 24E0     		b	.L70
 1351              	.L76:
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 4: *GPIO_E_ODR_LOW |= 16; break;
 1352              		.loc 3 9 0
 1353 0660 154A     		ldr	r2, .L81+4
 1354 0662 154B     		ldr	r3, .L81+4
 1355 0664 1B78     		ldrb	r3, [r3]
 1356 0666 DBB2     		uxtb	r3, r3
 1357 0668 1021     		movs	r1, #16
 1358 066a 0B43     		orrs	r3, r1
 1359 066c DBB2     		uxtb	r3, r3
 1360 066e 1370     		strb	r3, [r2]
 1361 0670 1BE0     		b	.L70
 1362              	.L77:
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 5: *GPIO_E_ODR_LOW |= 32; break;
 1363              		.loc 3 10 0
 1364 0672 114A     		ldr	r2, .L81+4
 1365 0674 104B     		ldr	r3, .L81+4
 1366 0676 1B78     		ldrb	r3, [r3]
 1367 0678 DBB2     		uxtb	r3, r3
 1368 067a 2021     		movs	r1, #32
 1369 067c 0B43     		orrs	r3, r1
 1370 067e DBB2     		uxtb	r3, r3
 1371 0680 1370     		strb	r3, [r2]
 1372 0682 12E0     		b	.L70
 1373              	.L78:
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 6: *GPIO_E_ODR_LOW |= 64; break;
 1374              		.loc 3 11 0
 1375 0684 0C4A     		ldr	r2, .L81+4
 1376 0686 0C4B     		ldr	r3, .L81+4
 1377 0688 1B78     		ldrb	r3, [r3]
 1378 068a DBB2     		uxtb	r3, r3
 1379 068c 4021     		movs	r1, #64
 1380 068e 0B43     		orrs	r3, r1
 1381 0690 DBB2     		uxtb	r3, r3
 1382 0692 1370     		strb	r3, [r2]
 1383 0694 09E0     		b	.L70
 1384              	.L79:
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case 7: *GPIO_E_ODR_LOW |= 128; break;
 1385              		.loc 3 12 0
 1386 0696 0849     		ldr	r1, .L81+4
 1387 0698 074B     		ldr	r3, .L81+4
 1388 069a 1B78     		ldrb	r3, [r3]
 1389 069c DBB2     		uxtb	r3, r3
 1390 069e 8022     		movs	r2, #128
 1391 06a0 5242     		rsbs	r2, r2, #0
 1392 06a2 1343     		orrs	r3, r2
 1393 06a4 DBB2     		uxtb	r3, r3
 1394 06a6 0B70     		strb	r3, [r1]
 1395 06a8 C046     		nop
 1396              	.L70:
 1397              	.L80:
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1398              		.loc 3 14 0
 1399 06aa C046     		nop
 1400 06ac BD46     		mov	sp, r7
 1401 06ae 02B0     		add	sp, sp, #8
 1402              		@ sp needed
 1403 06b0 80BD     		pop	{r7, pc}
 1404              	.L82:
 1405 06b2 C046     		.align	2
 1406              	.L81:
 1407 06b4 00000000 		.word	.L72
 1408 06b8 14100240 		.word	1073877012
 1409              		.cfi_endproc
 1410              	.LFE16:
 1412              		.align	1
 1413              		.global	ascii_ctrl_bit_clear
 1414              		.syntax unified
 1415              		.code	16
 1416              		.thumb_func
 1417              		.fpu softvfp
 1419              	ascii_ctrl_bit_clear:
 1420              	.LFB17:
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_ctrl_bit_clear(unsigned int x) {
 1421              		.loc 3 16 0
 1422              		.cfi_startproc
 1423              		@ args = 0, pretend = 0, frame = 8
 1424              		@ frame_needed = 1, uses_anonymous_args = 0
 1425 06bc 80B5     		push	{r7, lr}
 1426              		.cfi_def_cfa_offset 8
 1427              		.cfi_offset 7, -8
 1428              		.cfi_offset 14, -4
 1429 06be 82B0     		sub	sp, sp, #8
 1430              		.cfi_def_cfa_offset 16
 1431 06c0 00AF     		add	r7, sp, #0
 1432              		.cfi_def_cfa_register 7
 1433 06c2 7860     		str	r0, [r7, #4]
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	switch(x) {
 1434              		.loc 3 17 0
 1435 06c4 7B68     		ldr	r3, [r7, #4]
 1436 06c6 072B     		cmp	r3, #7
 1437 06c8 4DD8     		bhi	.L94
 1438 06ca 7B68     		ldr	r3, [r7, #4]
 1439 06cc 9A00     		lsls	r2, r3, #2
 1440 06ce 284B     		ldr	r3, .L95
 1441 06d0 D318     		adds	r3, r2, r3
 1442 06d2 1B68     		ldr	r3, [r3]
 1443 06d4 9F46     		mov	pc, r3
 1444              		.section	.rodata
 1445              		.align	2
 1446              	.L86:
 1447 0020 D6060000 		.word	.L85
 1448 0024 E8060000 		.word	.L87
 1449 0028 FA060000 		.word	.L88
 1450 002c 0C070000 		.word	.L89
 1451 0030 1E070000 		.word	.L90
 1452 0034 30070000 		.word	.L91
 1453 0038 42070000 		.word	.L92
 1454 003c 54070000 		.word	.L93
 1455              		.text
 1456              	.L85:
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(0): *GPIO_E_ODR_LOW &= 0xFE; break;
 1457              		.loc 3 18 0
 1458 06d6 274A     		ldr	r2, .L95+4
 1459 06d8 264B     		ldr	r3, .L95+4
 1460 06da 1B78     		ldrb	r3, [r3]
 1461 06dc DBB2     		uxtb	r3, r3
 1462 06de 0121     		movs	r1, #1
 1463 06e0 8B43     		bics	r3, r1
 1464 06e2 DBB2     		uxtb	r3, r3
 1465 06e4 1370     		strb	r3, [r2]
 1466 06e6 3EE0     		b	.L84
 1467              	.L87:
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(1): *GPIO_E_ODR_LOW &= 0xFD; break;
 1468              		.loc 3 19 0
 1469 06e8 224A     		ldr	r2, .L95+4
 1470 06ea 224B     		ldr	r3, .L95+4
 1471 06ec 1B78     		ldrb	r3, [r3]
 1472 06ee DBB2     		uxtb	r3, r3
 1473 06f0 0221     		movs	r1, #2
 1474 06f2 8B43     		bics	r3, r1
 1475 06f4 DBB2     		uxtb	r3, r3
 1476 06f6 1370     		strb	r3, [r2]
 1477 06f8 35E0     		b	.L84
 1478              	.L88:
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(2): *GPIO_E_ODR_LOW &= 0xFB; break;
 1479              		.loc 3 20 0
 1480 06fa 1E4A     		ldr	r2, .L95+4
 1481 06fc 1D4B     		ldr	r3, .L95+4
 1482 06fe 1B78     		ldrb	r3, [r3]
 1483 0700 DBB2     		uxtb	r3, r3
 1484 0702 0421     		movs	r1, #4
 1485 0704 8B43     		bics	r3, r1
 1486 0706 DBB2     		uxtb	r3, r3
 1487 0708 1370     		strb	r3, [r2]
 1488 070a 2CE0     		b	.L84
 1489              	.L89:
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(3): *GPIO_E_ODR_LOW &= 0xF7; break;
 1490              		.loc 3 21 0
 1491 070c 194A     		ldr	r2, .L95+4
 1492 070e 194B     		ldr	r3, .L95+4
 1493 0710 1B78     		ldrb	r3, [r3]
 1494 0712 DBB2     		uxtb	r3, r3
 1495 0714 0821     		movs	r1, #8
 1496 0716 8B43     		bics	r3, r1
 1497 0718 DBB2     		uxtb	r3, r3
 1498 071a 1370     		strb	r3, [r2]
 1499 071c 23E0     		b	.L84
 1500              	.L90:
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(4): *GPIO_E_ODR_LOW &= 0xEF; break;
 1501              		.loc 3 22 0
 1502 071e 154A     		ldr	r2, .L95+4
 1503 0720 144B     		ldr	r3, .L95+4
 1504 0722 1B78     		ldrb	r3, [r3]
 1505 0724 DBB2     		uxtb	r3, r3
 1506 0726 1021     		movs	r1, #16
 1507 0728 8B43     		bics	r3, r1
 1508 072a DBB2     		uxtb	r3, r3
 1509 072c 1370     		strb	r3, [r2]
 1510 072e 1AE0     		b	.L84
 1511              	.L91:
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(5): *GPIO_E_ODR_LOW &= 0xDF; break;
 1512              		.loc 3 23 0
 1513 0730 104A     		ldr	r2, .L95+4
 1514 0732 104B     		ldr	r3, .L95+4
 1515 0734 1B78     		ldrb	r3, [r3]
 1516 0736 DBB2     		uxtb	r3, r3
 1517 0738 2021     		movs	r1, #32
 1518 073a 8B43     		bics	r3, r1
 1519 073c DBB2     		uxtb	r3, r3
 1520 073e 1370     		strb	r3, [r2]
 1521 0740 11E0     		b	.L84
 1522              	.L92:
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(6): *GPIO_E_ODR_LOW &= 0xBF; break;
 1523              		.loc 3 24 0
 1524 0742 0C4A     		ldr	r2, .L95+4
 1525 0744 0B4B     		ldr	r3, .L95+4
 1526 0746 1B78     		ldrb	r3, [r3]
 1527 0748 DBB2     		uxtb	r3, r3
 1528 074a 4021     		movs	r1, #64
 1529 074c 8B43     		bics	r3, r1
 1530 074e DBB2     		uxtb	r3, r3
 1531 0750 1370     		strb	r3, [r2]
 1532 0752 08E0     		b	.L84
 1533              	.L93:
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		case(7): *GPIO_E_ODR_LOW &= 0x7F; break;
 1534              		.loc 3 25 0
 1535 0754 074A     		ldr	r2, .L95+4
 1536 0756 074B     		ldr	r3, .L95+4
 1537 0758 1B78     		ldrb	r3, [r3]
 1538 075a DBB2     		uxtb	r3, r3
 1539 075c 7F21     		movs	r1, #127
 1540 075e 0B40     		ands	r3, r1
 1541 0760 DBB2     		uxtb	r3, r3
 1542 0762 1370     		strb	r3, [r2]
 1543 0764 C046     		nop
 1544              	.L84:
 1545              	.L94:
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	}
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1546              		.loc 3 27 0
 1547 0766 C046     		nop
 1548 0768 BD46     		mov	sp, r7
 1549 076a 02B0     		add	sp, sp, #8
 1550              		@ sp needed
 1551 076c 80BD     		pop	{r7, pc}
 1552              	.L96:
 1553 076e C046     		.align	2
 1554              	.L95:
 1555 0770 20000000 		.word	.L86
 1556 0774 14100240 		.word	1073877012
 1557              		.cfi_endproc
 1558              	.LFE17:
 1560              		.align	1
 1561              		.global	ascii_write_controller
 1562              		.syntax unified
 1563              		.code	16
 1564              		.thumb_func
 1565              		.fpu softvfp
 1567              	ascii_write_controller:
 1568              	.LFB18:
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_write_controller( unsigned char c ) {
 1569              		.loc 3 28 0
 1570              		.cfi_startproc
 1571              		@ args = 0, pretend = 0, frame = 8
 1572              		@ frame_needed = 1, uses_anonymous_args = 0
 1573 0778 80B5     		push	{r7, lr}
 1574              		.cfi_def_cfa_offset 8
 1575              		.cfi_offset 7, -8
 1576              		.cfi_offset 14, -4
 1577 077a 82B0     		sub	sp, sp, #8
 1578              		.cfi_def_cfa_offset 16
 1579 077c 00AF     		add	r7, sp, #0
 1580              		.cfi_def_cfa_register 7
 1581 077e 0200     		movs	r2, r0
 1582 0780 FB1D     		adds	r3, r7, #7
 1583 0782 1A70     		strb	r2, [r3]
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_set(B_E);
 1584              		.loc 3 29 0
 1585 0784 4020     		movs	r0, #64
 1586 0786 FFF7FEFF 		bl	ascii_ctrl_bit_set
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_E_ODR_HIGH = c;
 1587              		.loc 3 30 0
 1588 078a 064A     		ldr	r2, .L98
 1589 078c FB1D     		adds	r3, r7, #7
 1590 078e 1B78     		ldrb	r3, [r3]
 1591 0790 1370     		strb	r3, [r2]
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	delay_250ns();
 1592              		.loc 3 31 0
 1593 0792 FFF7FEFF 		bl	delay_250ns
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_E);
 1594              		.loc 3 32 0
 1595 0796 4020     		movs	r0, #64
 1596 0798 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1597              		.loc 3 33 0
 1598 079c C046     		nop
 1599 079e BD46     		mov	sp, r7
 1600 07a0 02B0     		add	sp, sp, #8
 1601              		@ sp needed
 1602 07a2 80BD     		pop	{r7, pc}
 1603              	.L99:
 1604              		.align	2
 1605              	.L98:
 1606 07a4 15100240 		.word	1073877013
 1607              		.cfi_endproc
 1608              	.LFE18:
 1610              		.align	1
 1611              		.global	ascii_read_controller
 1612              		.syntax unified
 1613              		.code	16
 1614              		.thumb_func
 1615              		.fpu softvfp
 1617              	ascii_read_controller:
 1618              	.LFB19:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char ascii_read_controller( void )
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** {
 1619              		.loc 3 36 0
 1620              		.cfi_startproc
 1621              		@ args = 0, pretend = 0, frame = 8
 1622              		@ frame_needed = 1, uses_anonymous_args = 0
 1623 07a8 80B5     		push	{r7, lr}
 1624              		.cfi_def_cfa_offset 8
 1625              		.cfi_offset 7, -8
 1626              		.cfi_offset 14, -4
 1627 07aa 82B0     		sub	sp, sp, #8
 1628              		.cfi_def_cfa_offset 16
 1629 07ac 00AF     		add	r7, sp, #0
 1630              		.cfi_def_cfa_register 7
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_set(B_E);
 1631              		.loc 3 37 0
 1632 07ae 4020     		movs	r0, #64
 1633 07b0 FFF7FEFF 		bl	ascii_ctrl_bit_set
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	delay_250ns();
 1634              		.loc 3 38 0
 1635 07b4 FFF7FEFF 		bl	delay_250ns
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	delay_250ns();
 1636              		.loc 3 39 0
 1637 07b8 FFF7FEFF 		bl	delay_250ns
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	unsigned char rv = *GPIO_E_IDR_HIGH;
 1638              		.loc 3 40 0
 1639 07bc 064A     		ldr	r2, .L102
 1640 07be FB1D     		adds	r3, r7, #7
 1641 07c0 1278     		ldrb	r2, [r2]
 1642 07c2 1A70     		strb	r2, [r3]
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_E);
 1643              		.loc 3 41 0
 1644 07c4 4020     		movs	r0, #64
 1645 07c6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	return rv;
 1646              		.loc 3 42 0
 1647 07ca FB1D     		adds	r3, r7, #7
 1648 07cc 1B78     		ldrb	r3, [r3]
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1649              		.loc 3 43 0
 1650 07ce 1800     		movs	r0, r3
 1651 07d0 BD46     		mov	sp, r7
 1652 07d2 02B0     		add	sp, sp, #8
 1653              		@ sp needed
 1654 07d4 80BD     		pop	{r7, pc}
 1655              	.L103:
 1656 07d6 C046     		.align	2
 1657              	.L102:
 1658 07d8 11100240 		.word	1073877009
 1659              		.cfi_endproc
 1660              	.LFE19:
 1662              		.align	1
 1663              		.global	ascii_write_cmd
 1664              		.syntax unified
 1665              		.code	16
 1666              		.thumb_func
 1667              		.fpu softvfp
 1669              	ascii_write_cmd:
 1670              	.LFB20:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_write_cmd(unsigned char command){
 1671              		.loc 3 45 0
 1672              		.cfi_startproc
 1673              		@ args = 0, pretend = 0, frame = 8
 1674              		@ frame_needed = 1, uses_anonymous_args = 0
 1675 07dc 80B5     		push	{r7, lr}
 1676              		.cfi_def_cfa_offset 8
 1677              		.cfi_offset 7, -8
 1678              		.cfi_offset 14, -4
 1679 07de 82B0     		sub	sp, sp, #8
 1680              		.cfi_def_cfa_offset 16
 1681 07e0 00AF     		add	r7, sp, #0
 1682              		.cfi_def_cfa_register 7
 1683 07e2 0200     		movs	r2, r0
 1684 07e4 FB1D     		adds	r3, r7, #7
 1685 07e6 1A70     		strb	r2, [r3]
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_clear(B_RS);
 1686              		.loc 3 46 0
 1687 07e8 0120     		movs	r0, #1
 1688 07ea FFF7FEFF 		bl	ascii_ctrl_bit_clear
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_RW);
 1689              		.loc 3 47 0
 1690 07ee 0220     		movs	r0, #2
 1691 07f0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_write_controller(command);
 1692              		.loc 3 48 0
 1693 07f4 FB1D     		adds	r3, r7, #7
 1694 07f6 1B78     		ldrb	r3, [r3]
 1695 07f8 1800     		movs	r0, r3
 1696 07fa FFF7FEFF 		bl	ascii_write_controller
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1697              		.loc 3 49 0
 1698 07fe C046     		nop
 1699 0800 BD46     		mov	sp, r7
 1700 0802 02B0     		add	sp, sp, #8
 1701              		@ sp needed
 1702 0804 80BD     		pop	{r7, pc}
 1703              		.cfi_endproc
 1704              	.LFE20:
 1706              		.align	1
 1707              		.global	ascii_write_data
 1708              		.syntax unified
 1709              		.code	16
 1710              		.thumb_func
 1711              		.fpu softvfp
 1713              	ascii_write_data:
 1714              	.LFB21:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_write_data(unsigned char data){
 1715              		.loc 3 51 0
 1716              		.cfi_startproc
 1717              		@ args = 0, pretend = 0, frame = 8
 1718              		@ frame_needed = 1, uses_anonymous_args = 0
 1719 0806 80B5     		push	{r7, lr}
 1720              		.cfi_def_cfa_offset 8
 1721              		.cfi_offset 7, -8
 1722              		.cfi_offset 14, -4
 1723 0808 82B0     		sub	sp, sp, #8
 1724              		.cfi_def_cfa_offset 16
 1725 080a 00AF     		add	r7, sp, #0
 1726              		.cfi_def_cfa_register 7
 1727 080c 0200     		movs	r2, r0
 1728 080e FB1D     		adds	r3, r7, #7
 1729 0810 1A70     		strb	r2, [r3]
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_ctrl_bit_set(B_RS);
 1730              		.loc 3 52 0
 1731 0812 0120     		movs	r0, #1
 1732 0814 FFF7FEFF 		bl	ascii_ctrl_bit_set
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_RW);
 1733              		.loc 3 53 0
 1734 0818 0220     		movs	r0, #2
 1735 081a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_write_controller(data);
 1736              		.loc 3 54 0
 1737 081e FB1D     		adds	r3, r7, #7
 1738 0820 1B78     		ldrb	r3, [r3]
 1739 0822 1800     		movs	r0, r3
 1740 0824 FFF7FEFF 		bl	ascii_write_controller
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1741              		.loc 3 55 0
 1742 0828 C046     		nop
 1743 082a BD46     		mov	sp, r7
 1744 082c 02B0     		add	sp, sp, #8
 1745              		@ sp needed
 1746 082e 80BD     		pop	{r7, pc}
 1747              		.cfi_endproc
 1748              	.LFE21:
 1750              		.align	1
 1751              		.global	ascii_read_status
 1752              		.syntax unified
 1753              		.code	16
 1754              		.thumb_func
 1755              		.fpu softvfp
 1757              	ascii_read_status:
 1758              	.LFB22:
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char ascii_read_status(void){
 1759              		.loc 3 57 0
 1760              		.cfi_startproc
 1761              		@ args = 0, pretend = 0, frame = 8
 1762              		@ frame_needed = 1, uses_anonymous_args = 0
 1763 0830 90B5     		push	{r4, r7, lr}
 1764              		.cfi_def_cfa_offset 12
 1765              		.cfi_offset 4, -12
 1766              		.cfi_offset 7, -8
 1767              		.cfi_offset 14, -4
 1768 0832 83B0     		sub	sp, sp, #12
 1769              		.cfi_def_cfa_offset 24
 1770 0834 00AF     		add	r7, sp, #0
 1771              		.cfi_def_cfa_register 7
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     *GPIO_E_MODER &= 0x0000FFFF;	
 1772              		.loc 3 58 0
 1773 0836 114B     		ldr	r3, .L108
 1774 0838 104A     		ldr	r2, .L108
 1775 083a 1268     		ldr	r2, [r2]
 1776 083c 1204     		lsls	r2, r2, #16
 1777 083e 120C     		lsrs	r2, r2, #16
 1778 0840 1A60     		str	r2, [r3]
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_clear(B_RS);
 1779              		.loc 3 59 0
 1780 0842 0120     		movs	r0, #1
 1781 0844 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_set(B_RW);
 1782              		.loc 3 60 0
 1783 0848 0220     		movs	r0, #2
 1784 084a FFF7FEFF 		bl	ascii_ctrl_bit_set
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	unsigned char rv = ascii_read_controller();
 1785              		.loc 3 61 0
 1786 084e FC1D     		adds	r4, r7, #7
 1787 0850 FFF7FEFF 		bl	ascii_read_controller
 1788 0854 0300     		movs	r3, r0
 1789 0856 2370     		strb	r3, [r4]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_E_MODER &= 0x0000FFFF;
 1790              		.loc 3 62 0
 1791 0858 084B     		ldr	r3, .L108
 1792 085a 084A     		ldr	r2, .L108
 1793 085c 1268     		ldr	r2, [r2]
 1794 085e 1204     		lsls	r2, r2, #16
 1795 0860 120C     		lsrs	r2, r2, #16
 1796 0862 1A60     		str	r2, [r3]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_E_MODER |= 0x55550000;	
 1797              		.loc 3 63 0
 1798 0864 054B     		ldr	r3, .L108
 1799 0866 054A     		ldr	r2, .L108
 1800 0868 1268     		ldr	r2, [r2]
 1801 086a 0549     		ldr	r1, .L108+4
 1802 086c 0A43     		orrs	r2, r1
 1803 086e 1A60     		str	r2, [r3]
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	return rv;
 1804              		.loc 3 64 0
 1805 0870 FB1D     		adds	r3, r7, #7
 1806 0872 1B78     		ldrb	r3, [r3]
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1807              		.loc 3 65 0
 1808 0874 1800     		movs	r0, r3
 1809 0876 BD46     		mov	sp, r7
 1810 0878 03B0     		add	sp, sp, #12
 1811              		@ sp needed
 1812 087a 90BD     		pop	{r4, r7, pc}
 1813              	.L109:
 1814              		.align	2
 1815              	.L108:
 1816 087c 00100240 		.word	1073876992
 1817 0880 00005555 		.word	1431633920
 1818              		.cfi_endproc
 1819              	.LFE22:
 1821              		.align	1
 1822              		.global	ascii_read_data
 1823              		.syntax unified
 1824              		.code	16
 1825              		.thumb_func
 1826              		.fpu softvfp
 1828              	ascii_read_data:
 1829              	.LFB23:
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char ascii_read_data(void){
 1830              		.loc 3 67 0
 1831              		.cfi_startproc
 1832              		@ args = 0, pretend = 0, frame = 8
 1833              		@ frame_needed = 1, uses_anonymous_args = 0
 1834 0884 90B5     		push	{r4, r7, lr}
 1835              		.cfi_def_cfa_offset 12
 1836              		.cfi_offset 4, -12
 1837              		.cfi_offset 7, -8
 1838              		.cfi_offset 14, -4
 1839 0886 83B0     		sub	sp, sp, #12
 1840              		.cfi_def_cfa_offset 24
 1841 0888 00AF     		add	r7, sp, #0
 1842              		.cfi_def_cfa_register 7
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     *GPIO_E_MODER &= 0x0000FFFF;	
 1843              		.loc 3 68 0
 1844 088a 114B     		ldr	r3, .L112
 1845 088c 104A     		ldr	r2, .L112
 1846 088e 1268     		ldr	r2, [r2]
 1847 0890 1204     		lsls	r2, r2, #16
 1848 0892 120C     		lsrs	r2, r2, #16
 1849 0894 1A60     		str	r2, [r3]
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_set(B_RS);
 1850              		.loc 3 69 0
 1851 0896 0120     		movs	r0, #1
 1852 0898 FFF7FEFF 		bl	ascii_ctrl_bit_set
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_ctrl_bit_set(B_RW);
 1853              		.loc 3 70 0
 1854 089c 0220     		movs	r0, #2
 1855 089e FFF7FEFF 		bl	ascii_ctrl_bit_set
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	unsigned char rv = ascii_read_controller();
 1856              		.loc 3 71 0
 1857 08a2 FC1D     		adds	r4, r7, #7
 1858 08a4 FFF7FEFF 		bl	ascii_read_controller
 1859 08a8 0300     		movs	r3, r0
 1860 08aa 2370     		strb	r3, [r4]
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_E_MODER &= 0x0000FFFF;
 1861              		.loc 3 72 0
 1862 08ac 084B     		ldr	r3, .L112
 1863 08ae 084A     		ldr	r2, .L112
 1864 08b0 1268     		ldr	r2, [r2]
 1865 08b2 1204     		lsls	r2, r2, #16
 1866 08b4 120C     		lsrs	r2, r2, #16
 1867 08b6 1A60     		str	r2, [r3]
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	*GPIO_E_MODER |= 0x55550000;	
 1868              		.loc 3 73 0
 1869 08b8 054B     		ldr	r3, .L112
 1870 08ba 054A     		ldr	r2, .L112
 1871 08bc 1268     		ldr	r2, [r2]
 1872 08be 0549     		ldr	r1, .L112+4
 1873 08c0 0A43     		orrs	r2, r1
 1874 08c2 1A60     		str	r2, [r3]
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	return rv;
 1875              		.loc 3 74 0
 1876 08c4 FB1D     		adds	r3, r7, #7
 1877 08c6 1B78     		ldrb	r3, [r3]
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1878              		.loc 3 75 0
 1879 08c8 1800     		movs	r0, r3
 1880 08ca BD46     		mov	sp, r7
 1881 08cc 03B0     		add	sp, sp, #12
 1882              		@ sp needed
 1883 08ce 90BD     		pop	{r4, r7, pc}
 1884              	.L113:
 1885              		.align	2
 1886              	.L112:
 1887 08d0 00100240 		.word	1073876992
 1888 08d4 00005555 		.word	1431633920
 1889              		.cfi_endproc
 1890              	.LFE23:
 1892              		.align	1
 1893              		.global	ascii_command
 1894              		.syntax unified
 1895              		.code	16
 1896              		.thumb_func
 1897              		.fpu softvfp
 1899              	ascii_command:
 1900              	.LFB24:
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_command(char command, unsigned int delayMicroSec){
 1901              		.loc 3 77 0
 1902              		.cfi_startproc
 1903              		@ args = 0, pretend = 0, frame = 8
 1904              		@ frame_needed = 1, uses_anonymous_args = 0
 1905 08d8 80B5     		push	{r7, lr}
 1906              		.cfi_def_cfa_offset 8
 1907              		.cfi_offset 7, -8
 1908              		.cfi_offset 14, -4
 1909 08da 82B0     		sub	sp, sp, #8
 1910              		.cfi_def_cfa_offset 16
 1911 08dc 00AF     		add	r7, sp, #0
 1912              		.cfi_def_cfa_register 7
 1913 08de 0200     		movs	r2, r0
 1914 08e0 3960     		str	r1, [r7]
 1915 08e2 FB1D     		adds	r3, r7, #7
 1916 08e4 1A70     		strb	r2, [r3]
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     while((ascii_read_status() & 0x80) == 0x80) {
 1917              		.loc 3 78 0
 1918 08e6 C046     		nop
 1919              	.L115:
 1920              		.loc 3 78 0 is_stmt 0 discriminator 1
 1921 08e8 FFF7FEFF 		bl	ascii_read_status
 1922 08ec 0300     		movs	r3, r0
 1923 08ee 1A00     		movs	r2, r3
 1924 08f0 8023     		movs	r3, #128
 1925 08f2 1340     		ands	r3, r2
 1926 08f4 802B     		cmp	r3, #128
 1927 08f6 F7D0     		beq	.L115
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             //TODO implement pip subroutine
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         }
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     delay_micro(8);
 1928              		.loc 3 81 0 is_stmt 1
 1929 08f8 0820     		movs	r0, #8
 1930 08fa FFF7FEFF 		bl	delay_micro
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_write_cmd(command);
 1931              		.loc 3 82 0
 1932 08fe FB1D     		adds	r3, r7, #7
 1933 0900 1B78     		ldrb	r3, [r3]
 1934 0902 1800     		movs	r0, r3
 1935 0904 FFF7FEFF 		bl	ascii_write_cmd
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     delay_micro(delayMicroSec);
 1936              		.loc 3 83 0
 1937 0908 3B68     		ldr	r3, [r7]
 1938 090a 1800     		movs	r0, r3
 1939 090c FFF7FEFF 		bl	delay_micro
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 1940              		.loc 3 84 0
 1941 0910 C046     		nop
 1942 0912 BD46     		mov	sp, r7
 1943 0914 02B0     		add	sp, sp, #8
 1944              		@ sp needed
 1945 0916 80BD     		pop	{r7, pc}
 1946              		.cfi_endproc
 1947              	.LFE24:
 1949              		.align	1
 1950              		.global	ascii_init
 1951              		.syntax unified
 1952              		.code	16
 1953              		.thumb_func
 1954              		.fpu softvfp
 1956              	ascii_init:
 1957              	.LFB25:
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_init(void){
 1958              		.loc 3 86 0
 1959              		.cfi_startproc
 1960              		@ args = 0, pretend = 0, frame = 0
 1961              		@ frame_needed = 1, uses_anonymous_args = 0
 1962 0918 80B5     		push	{r7, lr}
 1963              		.cfi_def_cfa_offset 8
 1964              		.cfi_offset 7, -8
 1965              		.cfi_offset 14, -4
 1966 091a 00AF     		add	r7, sp, #0
 1967              		.cfi_def_cfa_register 7
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_ctrl_bit_set(B_SELECT);
 1968              		.loc 3 87 0
 1969 091c 0420     		movs	r0, #4
 1970 091e FFF7FEFF 		bl	ascii_ctrl_bit_set
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0x38, 40); //Set disp size, delay 40 ms
 1971              		.loc 3 88 0
 1972 0922 2821     		movs	r1, #40
 1973 0924 3820     		movs	r0, #56
 1974 0926 FFF7FEFF 		bl	ascii_command
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0xE, 40); //delay set to 40 bcs DR.eHugo
 1975              		.loc 3 89 0
 1976 092a 2821     		movs	r1, #40
 1977 092c 0E20     		movs	r0, #14
 1978 092e FFF7FEFF 		bl	ascii_command
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0x01, 1530); // Cls
 1979              		.loc 3 90 0
 1980 0932 064B     		ldr	r3, .L117
 1981 0934 1900     		movs	r1, r3
 1982 0936 0120     		movs	r0, #1
 1983 0938 FFF7FEFF 		bl	ascii_command
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         ascii_command(0x6, 40); // Inc
 1984              		.loc 3 91 0
 1985 093c 2821     		movs	r1, #40
 1986 093e 0620     		movs	r0, #6
 1987 0940 FFF7FEFF 		bl	ascii_command
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 1988              		.loc 3 92 0
 1989 0944 C046     		nop
 1990 0946 BD46     		mov	sp, r7
 1991              		@ sp needed
 1992 0948 80BD     		pop	{r7, pc}
 1993              	.L118:
 1994 094a C046     		.align	2
 1995              	.L117:
 1996 094c FA050000 		.word	1530
 1997              		.cfi_endproc
 1998              	.LFE25:
 2000              		.align	1
 2001              		.global	kbdActivate
 2002              		.syntax unified
 2003              		.code	16
 2004              		.thumb_func
 2005              		.fpu softvfp
 2007              	kbdActivate:
 2008              	.LFB26:
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void kbdActivate(unsigned int row){
 2009              		.loc 3 95 0
 2010              		.cfi_startproc
 2011              		@ args = 0, pretend = 0, frame = 8
 2012              		@ frame_needed = 1, uses_anonymous_args = 0
 2013 0950 80B5     		push	{r7, lr}
 2014              		.cfi_def_cfa_offset 8
 2015              		.cfi_offset 7, -8
 2016              		.cfi_offset 14, -4
 2017 0952 82B0     		sub	sp, sp, #8
 2018              		.cfi_def_cfa_offset 16
 2019 0954 00AF     		add	r7, sp, #0
 2020              		.cfi_def_cfa_register 7
 2021 0956 7860     		str	r0, [r7, #4]
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     switch(row)
 2022              		.loc 3 96 0
 2023 0958 7B68     		ldr	r3, [r7, #4]
 2024 095a 042B     		cmp	r3, #4
 2025 095c 19D8     		bhi	.L127
 2026 095e 7B68     		ldr	r3, [r7, #4]
 2027 0960 9A00     		lsls	r2, r3, #2
 2028 0962 0E4B     		ldr	r3, .L128
 2029 0964 D318     		adds	r3, r2, r3
 2030 0966 1B68     		ldr	r3, [r3]
 2031 0968 9F46     		mov	pc, r3
 2032              		.section	.rodata
 2033              		.align	2
 2034              	.L122:
 2035 0040 8A090000 		.word	.L121
 2036 0044 6A090000 		.word	.L123
 2037 0048 72090000 		.word	.L124
 2038 004c 7A090000 		.word	.L125
 2039 0050 82090000 		.word	.L126
 2040              		.text
 2041              	.L123:
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         {
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             //activate row N or deactivate with 0 
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 1: *GPIO_E_ODR_HIGH = 0x10; break;
 2042              		.loc 3 99 0
 2043 096a 0D4B     		ldr	r3, .L128+4
 2044 096c 1022     		movs	r2, #16
 2045 096e 1A70     		strb	r2, [r3]
 2046 0970 0FE0     		b	.L120
 2047              	.L124:
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 2: *GPIO_E_ODR_HIGH = 0x20; break;
 2048              		.loc 3 100 0
 2049 0972 0B4B     		ldr	r3, .L128+4
 2050 0974 2022     		movs	r2, #32
 2051 0976 1A70     		strb	r2, [r3]
 2052 0978 0BE0     		b	.L120
 2053              	.L125:
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 3: *GPIO_E_ODR_HIGH = 0x40; break;
 2054              		.loc 3 101 0
 2055 097a 094B     		ldr	r3, .L128+4
 2056 097c 4022     		movs	r2, #64
 2057 097e 1A70     		strb	r2, [r3]
 2058 0980 07E0     		b	.L120
 2059              	.L126:
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 4: *GPIO_E_ODR_HIGH = 0x80; break;
 2060              		.loc 3 102 0
 2061 0982 074B     		ldr	r3, .L128+4
 2062 0984 8022     		movs	r2, #128
 2063 0986 1A70     		strb	r2, [r3]
 2064 0988 03E0     		b	.L120
 2065              	.L121:
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             case 0: *GPIO_E_ODR_HIGH = 0x00; break;
 2066              		.loc 3 103 0
 2067 098a 054B     		ldr	r3, .L128+4
 2068 098c 0022     		movs	r2, #0
 2069 098e 1A70     		strb	r2, [r3]
 2070 0990 C046     		nop
 2071              	.L120:
 2072              	.L127:
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         }
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 2073              		.loc 3 106 0
 2074 0992 C046     		nop
 2075 0994 BD46     		mov	sp, r7
 2076 0996 02B0     		add	sp, sp, #8
 2077              		@ sp needed
 2078 0998 80BD     		pop	{r7, pc}
 2079              	.L129:
 2080 099a C046     		.align	2
 2081              	.L128:
 2082 099c 40000000 		.word	.L122
 2083 09a0 15100240 		.word	1073877013
 2084              		.cfi_endproc
 2085              	.LFE26:
 2087              		.align	1
 2088              		.global	kdbGetCol
 2089              		.syntax unified
 2090              		.code	16
 2091              		.thumb_func
 2092              		.fpu softvfp
 2094              	kdbGetCol:
 2095              	.LFB27:
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** int kdbGetCol(void){
 2096              		.loc 3 108 0
 2097              		.cfi_startproc
 2098              		@ args = 0, pretend = 0, frame = 8
 2099              		@ frame_needed = 1, uses_anonymous_args = 0
 2100 09a4 80B5     		push	{r7, lr}
 2101              		.cfi_def_cfa_offset 8
 2102              		.cfi_offset 7, -8
 2103              		.cfi_offset 14, -4
 2104 09a6 82B0     		sub	sp, sp, #8
 2105              		.cfi_def_cfa_offset 16
 2106 09a8 00AF     		add	r7, sp, #0
 2107              		.cfi_def_cfa_register 7
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         unsigned char idr;
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         idr = *GPIO_E_IDR_HIGH;
 2108              		.loc 3 110 0
 2109 09aa 124A     		ldr	r2, .L136
 2110 09ac FB1D     		adds	r3, r7, #7
 2111 09ae 1278     		ldrb	r2, [r2]
 2112 09b0 1A70     		strb	r2, [r3]
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x8) return 4;
 2113              		.loc 3 112 0
 2114 09b2 FB1D     		adds	r3, r7, #7
 2115 09b4 1B78     		ldrb	r3, [r3]
 2116 09b6 0822     		movs	r2, #8
 2117 09b8 1340     		ands	r3, r2
 2118 09ba 01D0     		beq	.L131
 2119              		.loc 3 112 0 is_stmt 0 discriminator 1
 2120 09bc 0423     		movs	r3, #4
 2121 09be 15E0     		b	.L132
 2122              	.L131:
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x4) return 3;
 2123              		.loc 3 113 0 is_stmt 1
 2124 09c0 FB1D     		adds	r3, r7, #7
 2125 09c2 1B78     		ldrb	r3, [r3]
 2126 09c4 0422     		movs	r2, #4
 2127 09c6 1340     		ands	r3, r2
 2128 09c8 01D0     		beq	.L133
 2129              		.loc 3 113 0 is_stmt 0 discriminator 1
 2130 09ca 0323     		movs	r3, #3
 2131 09cc 0EE0     		b	.L132
 2132              	.L133:
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x2) return 2;
 2133              		.loc 3 114 0 is_stmt 1
 2134 09ce FB1D     		adds	r3, r7, #7
 2135 09d0 1B78     		ldrb	r3, [r3]
 2136 09d2 0222     		movs	r2, #2
 2137 09d4 1340     		ands	r3, r2
 2138 09d6 01D0     		beq	.L134
 2139              		.loc 3 114 0 is_stmt 0 discriminator 1
 2140 09d8 0223     		movs	r3, #2
 2141 09da 07E0     		b	.L132
 2142              	.L134:
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(idr & 0x1) return 1;
 2143              		.loc 3 115 0 is_stmt 1
 2144 09dc FB1D     		adds	r3, r7, #7
 2145 09de 1B78     		ldrb	r3, [r3]
 2146 09e0 0122     		movs	r2, #1
 2147 09e2 1340     		ands	r3, r2
 2148 09e4 01D0     		beq	.L135
 2149              		.loc 3 115 0 is_stmt 0 discriminator 1
 2150 09e6 0123     		movs	r3, #1
 2151 09e8 00E0     		b	.L132
 2152              	.L135:
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         return 0;
 2153              		.loc 3 116 0 is_stmt 1
 2154 09ea 0023     		movs	r3, #0
 2155              	.L132:
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 2156              		.loc 3 117 0
 2157 09ec 1800     		movs	r0, r3
 2158 09ee BD46     		mov	sp, r7
 2159 09f0 02B0     		add	sp, sp, #8
 2160              		@ sp needed
 2161 09f2 80BD     		pop	{r7, pc}
 2162              	.L137:
 2163              		.align	2
 2164              	.L136:
 2165 09f4 11100240 		.word	1073877009
 2166              		.cfi_endproc
 2167              	.LFE27:
 2169              		.align	1
 2170              		.global	outSeg7
 2171              		.syntax unified
 2172              		.code	16
 2173              		.thumb_func
 2174              		.fpu softvfp
 2176              	outSeg7:
 2177              	.LFB28:
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void outSeg7(unsigned char in)
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     {
 2178              		.loc 3 120 0
 2179              		.cfi_startproc
 2180              		@ args = 0, pretend = 0, frame = 8
 2181              		@ frame_needed = 1, uses_anonymous_args = 0
 2182 09f8 80B5     		push	{r7, lr}
 2183              		.cfi_def_cfa_offset 8
 2184              		.cfi_offset 7, -8
 2185              		.cfi_offset 14, -4
 2186 09fa 82B0     		sub	sp, sp, #8
 2187              		.cfi_def_cfa_offset 16
 2188 09fc 00AF     		add	r7, sp, #0
 2189              		.cfi_def_cfa_register 7
 2190 09fe 0200     		movs	r2, r0
 2191 0a00 FB1D     		adds	r3, r7, #7
 2192 0a02 1A70     		strb	r2, [r3]
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x0) *GPIO_E_ODR_LOW = 0x3F;
 2193              		.loc 3 122 0
 2194 0a04 FB1D     		adds	r3, r7, #7
 2195 0a06 1B78     		ldrb	r3, [r3]
 2196 0a08 002B     		cmp	r3, #0
 2197 0a0a 02D1     		bne	.L139
 2198              		.loc 3 122 0 is_stmt 0 discriminator 1
 2199 0a0c 394B     		ldr	r3, .L157
 2200 0a0e 3F22     		movs	r2, #63
 2201 0a10 1A70     		strb	r2, [r3]
 2202              	.L139:
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x1) *GPIO_E_ODR_LOW = 0x06;
 2203              		.loc 3 123 0 is_stmt 1
 2204 0a12 FB1D     		adds	r3, r7, #7
 2205 0a14 1B78     		ldrb	r3, [r3]
 2206 0a16 012B     		cmp	r3, #1
 2207 0a18 02D1     		bne	.L140
 2208              		.loc 3 123 0 is_stmt 0 discriminator 1
 2209 0a1a 364B     		ldr	r3, .L157
 2210 0a1c 0622     		movs	r2, #6
 2211 0a1e 1A70     		strb	r2, [r3]
 2212              	.L140:
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x2) *GPIO_E_ODR_LOW = 0x5B;
 2213              		.loc 3 124 0 is_stmt 1
 2214 0a20 FB1D     		adds	r3, r7, #7
 2215 0a22 1B78     		ldrb	r3, [r3]
 2216 0a24 022B     		cmp	r3, #2
 2217 0a26 02D1     		bne	.L141
 2218              		.loc 3 124 0 is_stmt 0 discriminator 1
 2219 0a28 324B     		ldr	r3, .L157
 2220 0a2a 5B22     		movs	r2, #91
 2221 0a2c 1A70     		strb	r2, [r3]
 2222              	.L141:
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x3) *GPIO_E_ODR_LOW = 0x4F;
 2223              		.loc 3 125 0 is_stmt 1
 2224 0a2e FB1D     		adds	r3, r7, #7
 2225 0a30 1B78     		ldrb	r3, [r3]
 2226 0a32 032B     		cmp	r3, #3
 2227 0a34 02D1     		bne	.L142
 2228              		.loc 3 125 0 is_stmt 0 discriminator 1
 2229 0a36 2F4B     		ldr	r3, .L157
 2230 0a38 4F22     		movs	r2, #79
 2231 0a3a 1A70     		strb	r2, [r3]
 2232              	.L142:
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x4) *GPIO_E_ODR_LOW = 0x66;
 2233              		.loc 3 126 0 is_stmt 1
 2234 0a3c FB1D     		adds	r3, r7, #7
 2235 0a3e 1B78     		ldrb	r3, [r3]
 2236 0a40 042B     		cmp	r3, #4
 2237 0a42 02D1     		bne	.L143
 2238              		.loc 3 126 0 is_stmt 0 discriminator 1
 2239 0a44 2B4B     		ldr	r3, .L157
 2240 0a46 6622     		movs	r2, #102
 2241 0a48 1A70     		strb	r2, [r3]
 2242              	.L143:
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x5) *GPIO_E_ODR_LOW = 0x6D;
 2243              		.loc 3 127 0 is_stmt 1
 2244 0a4a FB1D     		adds	r3, r7, #7
 2245 0a4c 1B78     		ldrb	r3, [r3]
 2246 0a4e 052B     		cmp	r3, #5
 2247 0a50 02D1     		bne	.L144
 2248              		.loc 3 127 0 is_stmt 0 discriminator 1
 2249 0a52 284B     		ldr	r3, .L157
 2250 0a54 6D22     		movs	r2, #109
 2251 0a56 1A70     		strb	r2, [r3]
 2252              	.L144:
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x6) *GPIO_E_ODR_LOW = 0x7D;
 2253              		.loc 3 128 0 is_stmt 1
 2254 0a58 FB1D     		adds	r3, r7, #7
 2255 0a5a 1B78     		ldrb	r3, [r3]
 2256 0a5c 062B     		cmp	r3, #6
 2257 0a5e 02D1     		bne	.L145
 2258              		.loc 3 128 0 is_stmt 0 discriminator 1
 2259 0a60 244B     		ldr	r3, .L157
 2260 0a62 7D22     		movs	r2, #125
 2261 0a64 1A70     		strb	r2, [r3]
 2262              	.L145:
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x7) *GPIO_E_ODR_LOW = 0x07;
 2263              		.loc 3 129 0 is_stmt 1
 2264 0a66 FB1D     		adds	r3, r7, #7
 2265 0a68 1B78     		ldrb	r3, [r3]
 2266 0a6a 072B     		cmp	r3, #7
 2267 0a6c 02D1     		bne	.L146
 2268              		.loc 3 129 0 is_stmt 0 discriminator 1
 2269 0a6e 214B     		ldr	r3, .L157
 2270 0a70 0722     		movs	r2, #7
 2271 0a72 1A70     		strb	r2, [r3]
 2272              	.L146:
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x8) *GPIO_E_ODR_LOW = 0x7F;
 2273              		.loc 3 130 0 is_stmt 1
 2274 0a74 FB1D     		adds	r3, r7, #7
 2275 0a76 1B78     		ldrb	r3, [r3]
 2276 0a78 082B     		cmp	r3, #8
 2277 0a7a 02D1     		bne	.L147
 2278              		.loc 3 130 0 is_stmt 0 discriminator 1
 2279 0a7c 1D4B     		ldr	r3, .L157
 2280 0a7e 7F22     		movs	r2, #127
 2281 0a80 1A70     		strb	r2, [r3]
 2282              	.L147:
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0x9) *GPIO_E_ODR_LOW = 0x67;
 2283              		.loc 3 131 0 is_stmt 1
 2284 0a82 FB1D     		adds	r3, r7, #7
 2285 0a84 1B78     		ldrb	r3, [r3]
 2286 0a86 092B     		cmp	r3, #9
 2287 0a88 02D1     		bne	.L148
 2288              		.loc 3 131 0 is_stmt 0 discriminator 1
 2289 0a8a 1A4B     		ldr	r3, .L157
 2290 0a8c 6722     		movs	r2, #103
 2291 0a8e 1A70     		strb	r2, [r3]
 2292              	.L148:
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xA) *GPIO_E_ODR_LOW = 0x77;
 2293              		.loc 3 132 0 is_stmt 1
 2294 0a90 FB1D     		adds	r3, r7, #7
 2295 0a92 1B78     		ldrb	r3, [r3]
 2296 0a94 0A2B     		cmp	r3, #10
 2297 0a96 02D1     		bne	.L149
 2298              		.loc 3 132 0 is_stmt 0 discriminator 1
 2299 0a98 164B     		ldr	r3, .L157
 2300 0a9a 7722     		movs	r2, #119
 2301 0a9c 1A70     		strb	r2, [r3]
 2302              	.L149:
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xB) *GPIO_E_ODR_LOW = 0x7F;
 2303              		.loc 3 133 0 is_stmt 1
 2304 0a9e FB1D     		adds	r3, r7, #7
 2305 0aa0 1B78     		ldrb	r3, [r3]
 2306 0aa2 0B2B     		cmp	r3, #11
 2307 0aa4 02D1     		bne	.L150
 2308              		.loc 3 133 0 is_stmt 0 discriminator 1
 2309 0aa6 134B     		ldr	r3, .L157
 2310 0aa8 7F22     		movs	r2, #127
 2311 0aaa 1A70     		strb	r2, [r3]
 2312              	.L150:
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xC) *GPIO_E_ODR_LOW = 0xFF;
 2313              		.loc 3 134 0 is_stmt 1
 2314 0aac FB1D     		adds	r3, r7, #7
 2315 0aae 1B78     		ldrb	r3, [r3]
 2316 0ab0 0C2B     		cmp	r3, #12
 2317 0ab2 02D1     		bne	.L151
 2318              		.loc 3 134 0 is_stmt 0 discriminator 1
 2319 0ab4 0F4B     		ldr	r3, .L157
 2320 0ab6 FF22     		movs	r2, #255
 2321 0ab8 1A70     		strb	r2, [r3]
 2322              	.L151:
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xD) *GPIO_E_ODR_LOW = 0xBF;
 2323              		.loc 3 135 0 is_stmt 1
 2324 0aba FB1D     		adds	r3, r7, #7
 2325 0abc 1B78     		ldrb	r3, [r3]
 2326 0abe 0D2B     		cmp	r3, #13
 2327 0ac0 02D1     		bne	.L152
 2328              		.loc 3 135 0 is_stmt 0 discriminator 1
 2329 0ac2 0C4B     		ldr	r3, .L157
 2330 0ac4 BF22     		movs	r2, #191
 2331 0ac6 1A70     		strb	r2, [r3]
 2332              	.L152:
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xE) *GPIO_E_ODR_LOW = 0x79;
 2333              		.loc 3 136 0 is_stmt 1
 2334 0ac8 FB1D     		adds	r3, r7, #7
 2335 0aca 1B78     		ldrb	r3, [r3]
 2336 0acc 0E2B     		cmp	r3, #14
 2337 0ace 02D1     		bne	.L153
 2338              		.loc 3 136 0 is_stmt 0 discriminator 1
 2339 0ad0 084B     		ldr	r3, .L157
 2340 0ad2 7922     		movs	r2, #121
 2341 0ad4 1A70     		strb	r2, [r3]
 2342              	.L153:
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         if(in == 0xF) *GPIO_E_ODR_LOW = 0x71;
 2343              		.loc 3 137 0 is_stmt 1
 2344 0ad6 FB1D     		adds	r3, r7, #7
 2345 0ad8 1B78     		ldrb	r3, [r3]
 2346 0ada 0F2B     		cmp	r3, #15
 2347 0adc 03D1     		bne	.L154
 2348              		.loc 3 137 0 is_stmt 0 discriminator 1
 2349 0ade 054B     		ldr	r3, .L157
 2350 0ae0 7122     		movs	r2, #113
 2351 0ae2 1A70     		strb	r2, [r3]
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	else *GPIO_E_ODR_LOW = 0x00;
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 2352              		.loc 3 140 0 is_stmt 1 discriminator 1
 2353 0ae4 02E0     		b	.L156
 2354              	.L154:
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	else *GPIO_E_ODR_LOW = 0x00;
 2355              		.loc 3 138 0
 2356 0ae6 034B     		ldr	r3, .L157
 2357 0ae8 0022     		movs	r2, #0
 2358 0aea 1A70     		strb	r2, [r3]
 2359              	.L156:
 2360              		.loc 3 140 0
 2361 0aec C046     		nop
 2362 0aee BD46     		mov	sp, r7
 2363 0af0 02B0     		add	sp, sp, #8
 2364              		@ sp needed
 2365 0af2 80BD     		pop	{r7, pc}
 2366              	.L158:
 2367              		.align	2
 2368              	.L157:
 2369 0af4 14100240 		.word	1073877012
 2370              		.cfi_endproc
 2371              	.LFE28:
 2373              		.align	1
 2374              		.global	ascii_write_char
 2375              		.syntax unified
 2376              		.code	16
 2377              		.thumb_func
 2378              		.fpu softvfp
 2380              	ascii_write_char:
 2381              	.LFB29:
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void ascii_write_char(char c){
 2382              		.loc 3 142 0
 2383              		.cfi_startproc
 2384              		@ args = 0, pretend = 0, frame = 8
 2385              		@ frame_needed = 1, uses_anonymous_args = 0
 2386 0af8 80B5     		push	{r7, lr}
 2387              		.cfi_def_cfa_offset 8
 2388              		.cfi_offset 7, -8
 2389              		.cfi_offset 14, -4
 2390 0afa 82B0     		sub	sp, sp, #8
 2391              		.cfi_def_cfa_offset 16
 2392 0afc 00AF     		add	r7, sp, #0
 2393              		.cfi_def_cfa_register 7
 2394 0afe 0200     		movs	r2, r0
 2395 0b00 FB1D     		adds	r3, r7, #7
 2396 0b02 1A70     		strb	r2, [r3]
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     while((ascii_read_status() & 0x80) == 0x80) {
 2397              		.loc 3 143 0
 2398 0b04 C046     		nop
 2399              	.L160:
 2400              		.loc 3 143 0 is_stmt 0 discriminator 1
 2401 0b06 FFF7FEFF 		bl	ascii_read_status
 2402 0b0a 0300     		movs	r3, r0
 2403 0b0c 1A00     		movs	r2, r3
 2404 0b0e 8023     		movs	r3, #128
 2405 0b10 1340     		ands	r3, r2
 2406 0b12 802B     		cmp	r3, #128
 2407 0b14 F7D0     		beq	.L160
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	// TODO: implement pip subroutines
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     delay_micro(8);
 2408              		.loc 3 146 0 is_stmt 1
 2409 0b16 0820     		movs	r0, #8
 2410 0b18 FFF7FEFF 		bl	delay_micro
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     ascii_write_data(c);
 2411              		.loc 3 147 0
 2412 0b1c FB1D     		adds	r3, r7, #7
 2413 0b1e 1B78     		ldrb	r3, [r3]
 2414 0b20 1800     		movs	r0, r3
 2415 0b22 FFF7FEFF 		bl	ascii_write_data
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     delay_micro(45);
 2416              		.loc 3 148 0
 2417 0b26 2D20     		movs	r0, #45
 2418 0b28 FFF7FEFF 		bl	delay_micro
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     }
 2419              		.loc 3 149 0
 2420 0b2c C046     		nop
 2421 0b2e BD46     		mov	sp, r7
 2422 0b30 02B0     		add	sp, sp, #8
 2423              		@ sp needed
 2424 0b32 80BD     		pop	{r7, pc}
 2425              		.cfi_endproc
 2426              	.LFE29:
 2428              		.align	1
 2429              		.global	goToXY
 2430              		.syntax unified
 2431              		.code	16
 2432              		.thumb_func
 2433              		.fpu softvfp
 2435              	goToXY:
 2436              	.LFB30:
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****     
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** void goToXY(unsigned char row, unsigned char column) {
 2437              		.loc 3 152 0
 2438              		.cfi_startproc
 2439              		@ args = 0, pretend = 0, frame = 16
 2440              		@ frame_needed = 1, uses_anonymous_args = 0
 2441 0b34 80B5     		push	{r7, lr}
 2442              		.cfi_def_cfa_offset 8
 2443              		.cfi_offset 7, -8
 2444              		.cfi_offset 14, -4
 2445 0b36 84B0     		sub	sp, sp, #16
 2446              		.cfi_def_cfa_offset 24
 2447 0b38 00AF     		add	r7, sp, #0
 2448              		.cfi_def_cfa_register 7
 2449 0b3a 0200     		movs	r2, r0
 2450 0b3c FB1D     		adds	r3, r7, #7
 2451 0b3e 1A70     		strb	r2, [r3]
 2452 0b40 BB1D     		adds	r3, r7, #6
 2453 0b42 0A1C     		adds	r2, r1, #0
 2454 0b44 1A70     		strb	r2, [r3]
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	unsigned char address = row - 1;
 2455              		.loc 3 153 0
 2456 0b46 0F23     		movs	r3, #15
 2457 0b48 FB18     		adds	r3, r7, r3
 2458 0b4a FA1D     		adds	r2, r7, #7
 2459 0b4c 1278     		ldrb	r2, [r2]
 2460 0b4e 013A     		subs	r2, r2, #1
 2461 0b50 1A70     		strb	r2, [r3]
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	if(column == 2) {
 2462              		.loc 3 154 0
 2463 0b52 BB1D     		adds	r3, r7, #6
 2464 0b54 1B78     		ldrb	r3, [r3]
 2465 0b56 022B     		cmp	r3, #2
 2466 0b58 06D1     		bne	.L162
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 		address = address + 0x40;
 2467              		.loc 3 155 0
 2468 0b5a 0F23     		movs	r3, #15
 2469 0b5c FB18     		adds	r3, r7, r3
 2470 0b5e 0F22     		movs	r2, #15
 2471 0b60 BA18     		adds	r2, r7, r2
 2472 0b62 1278     		ldrb	r2, [r2]
 2473 0b64 4032     		adds	r2, r2, #64
 2474 0b66 1A70     		strb	r2, [r3]
 2475              	.L162:
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	}
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	ascii_write_cmd(0x80 | address);
 2476              		.loc 3 157 0
 2477 0b68 0F23     		movs	r3, #15
 2478 0b6a FB18     		adds	r3, r7, r3
 2479 0b6c 1B78     		ldrb	r3, [r3]
 2480 0b6e 8022     		movs	r2, #128
 2481 0b70 5242     		rsbs	r2, r2, #0
 2482 0b72 1343     		orrs	r3, r2
 2483 0b74 DBB2     		uxtb	r3, r3
 2484 0b76 1800     		movs	r0, r3
 2485 0b78 FFF7FEFF 		bl	ascii_write_cmd
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 2486              		.loc 3 158 0
 2487 0b7c C046     		nop
 2488 0b7e BD46     		mov	sp, r7
 2489 0b80 04B0     		add	sp, sp, #16
 2490              		@ sp needed
 2491 0b82 80BD     		pop	{r7, pc}
 2492              		.cfi_endproc
 2493              	.LFE30:
 2495              		.section	.rodata
 2496              		.align	2
 2497              	.LC0:
 2498 0054 01       		.byte	1
 2499 0055 02       		.byte	2
 2500 0056 03       		.byte	3
 2501 0057 0A       		.byte	10
 2502 0058 04       		.byte	4
 2503 0059 05       		.byte	5
 2504 005a 06       		.byte	6
 2505 005b 0B       		.byte	11
 2506 005c 07       		.byte	7
 2507 005d 08       		.byte	8
 2508 005e 09       		.byte	9
 2509 005f 0C       		.byte	12
 2510 0060 0E       		.byte	14
 2511 0061 00       		.byte	0
 2512 0062 0F       		.byte	15
 2513 0063 0D       		.byte	13
 2514              		.text
 2515              		.align	1
 2516              		.global	keyb
 2517              		.syntax unified
 2518              		.code	16
 2519              		.thumb_func
 2520              		.fpu softvfp
 2522              	keyb:
 2523              	.LFB31:
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 	
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** unsigned char keyb(void){
 2524              		.loc 3 161 0
 2525              		.cfi_startproc
 2526              		@ args = 0, pretend = 0, frame = 24
 2527              		@ frame_needed = 1, uses_anonymous_args = 0
 2528 0b84 90B5     		push	{r4, r7, lr}
 2529              		.cfi_def_cfa_offset 12
 2530              		.cfi_offset 4, -12
 2531              		.cfi_offset 7, -8
 2532              		.cfi_offset 14, -4
 2533 0b86 87B0     		sub	sp, sp, #28
 2534              		.cfi_def_cfa_offset 40
 2535 0b88 00AF     		add	r7, sp, #0
 2536              		.cfi_def_cfa_register 7
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
 2537              		.loc 3 162 0
 2538 0b8a 3B00     		movs	r3, r7
 2539 0b8c 174A     		ldr	r2, .L169
 2540 0b8e 13CA     		ldmia	r2!, {r0, r1, r4}
 2541 0b90 13C3     		stmia	r3!, {r0, r1, r4}
 2542 0b92 1268     		ldr	r2, [r2]
 2543 0b94 1A60     		str	r2, [r3]
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         int row, col;
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         for(row = 1; row <= 4; row++)
 2544              		.loc 3 164 0
 2545 0b96 0123     		movs	r3, #1
 2546 0b98 7B61     		str	r3, [r7, #20]
 2547 0b9a 1BE0     		b	.L164
 2548              	.L167:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             {
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             kbdActivate(row);
 2549              		.loc 3 166 0
 2550 0b9c 7B69     		ldr	r3, [r7, #20]
 2551 0b9e 1800     		movs	r0, r3
 2552 0ba0 FFF7FEFF 		bl	kbdActivate
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** 			delay_250ns();
 2553              		.loc 3 167 0
 2554 0ba4 FFF7FEFF 		bl	delay_250ns
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             if(col = kdbGetCol())
 2555              		.loc 3 168 0
 2556 0ba8 FFF7FEFF 		bl	kdbGetCol
 2557 0bac 0300     		movs	r3, r0
 2558 0bae 3B61     		str	r3, [r7, #16]
 2559 0bb0 3B69     		ldr	r3, [r7, #16]
 2560 0bb2 002B     		cmp	r3, #0
 2561 0bb4 0BD0     		beq	.L165
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 {
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 kbdActivate(0);
 2562              		.loc 3 170 0
 2563 0bb6 0020     		movs	r0, #0
 2564 0bb8 FFF7FEFF 		bl	kbdActivate
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 return key[4*(row-1) + (col-1)];
 2565              		.loc 3 171 0
 2566 0bbc 7B69     		ldr	r3, [r7, #20]
 2567 0bbe 013B     		subs	r3, r3, #1
 2568 0bc0 9A00     		lsls	r2, r3, #2
 2569 0bc2 3B69     		ldr	r3, [r7, #16]
 2570 0bc4 013B     		subs	r3, r3, #1
 2571 0bc6 D318     		adds	r3, r2, r3
 2572 0bc8 3A00     		movs	r2, r7
 2573 0bca D35C     		ldrb	r3, [r2, r3]
 2574 0bcc 09E0     		b	.L168
 2575              	.L165:
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             {
 2576              		.loc 3 164 0 discriminator 2
 2577 0bce 7B69     		ldr	r3, [r7, #20]
 2578 0bd0 0133     		adds	r3, r3, #1
 2579 0bd2 7B61     		str	r3, [r7, #20]
 2580              	.L164:
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             {
 2581              		.loc 3 164 0 is_stmt 0 discriminator 1
 2582 0bd4 7B69     		ldr	r3, [r7, #20]
 2583 0bd6 042B     		cmp	r3, #4
 2584 0bd8 E0DD     		ble	.L167
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****                 }
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****             }
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         kbdActivate(0);
 2585              		.loc 3 174 0 is_stmt 1
 2586 0bda 0020     		movs	r0, #0
 2587 0bdc FFF7FEFF 		bl	kbdActivate
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h ****         return 0xFF;
 2588              		.loc 3 175 0
 2589 0be0 FF23     		movs	r3, #255
 2590              	.L168:
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/keypad.h **** }
 2591              		.loc 3 176 0 discriminator 1
 2592 0be2 1800     		movs	r0, r3
 2593 0be4 BD46     		mov	sp, r7
 2594 0be6 07B0     		add	sp, sp, #28
 2595              		@ sp needed
 2596 0be8 90BD     		pop	{r4, r7, pc}
 2597              	.L170:
 2598 0bea C046     		.align	2
 2599              	.L169:
 2600 0bec 54000000 		.word	.LC0
 2601              		.cfi_endproc
 2602              	.LFE31:
 2604              		.align	1
 2605              		.global	set_object_speed
 2606              		.syntax unified
 2607              		.code	16
 2608              		.thumb_func
 2609              		.fpu softvfp
 2611              	set_object_speed:
 2612              	.LFB32:
 2613              		.file 4 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h"
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
 2614              		.loc 4 30 0
 2615              		.cfi_startproc
 2616              		@ args = 0, pretend = 0, frame = 16
 2617              		@ frame_needed = 1, uses_anonymous_args = 0
 2618 0bf0 80B5     		push	{r7, lr}
 2619              		.cfi_def_cfa_offset 8
 2620              		.cfi_offset 7, -8
 2621              		.cfi_offset 14, -4
 2622 0bf2 84B0     		sub	sp, sp, #16
 2623              		.cfi_def_cfa_offset 24
 2624 0bf4 00AF     		add	r7, sp, #0
 2625              		.cfi_def_cfa_register 7
 2626 0bf6 F860     		str	r0, [r7, #12]
 2627 0bf8 B960     		str	r1, [r7, #8]
 2628 0bfa 7A60     		str	r2, [r7, #4]
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         pObj->dirX = speedX;
 2629              		.loc 4 31 0
 2630 0bfc FB68     		ldr	r3, [r7, #12]
 2631 0bfe BA68     		ldr	r2, [r7, #8]
 2632 0c00 5A60     		str	r2, [r3, #4]
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         pObj->dirY = speedY;
 2633              		.loc 4 32 0
 2634 0c02 FB68     		ldr	r3, [r7, #12]
 2635 0c04 7A68     		ldr	r2, [r7, #4]
 2636 0c06 9A60     		str	r2, [r3, #8]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 2637              		.loc 4 33 0
 2638 0c08 C046     		nop
 2639 0c0a BD46     		mov	sp, r7
 2640 0c0c 04B0     		add	sp, sp, #16
 2641              		@ sp needed
 2642 0c0e 80BD     		pop	{r7, pc}
 2643              		.cfi_endproc
 2644              	.LFE32:
 2646              		.align	1
 2647              		.global	draw_object
 2648              		.syntax unified
 2649              		.code	16
 2650              		.thumb_func
 2651              		.fpu softvfp
 2653              	draw_object:
 2654              	.LFB33:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** void draw_object(POBJECT pObj){
 2655              		.loc 4 35 0
 2656              		.cfi_startproc
 2657              		@ args = 0, pretend = 0, frame = 16
 2658              		@ frame_needed = 1, uses_anonymous_args = 0
 2659 0c10 80B5     		push	{r7, lr}
 2660              		.cfi_def_cfa_offset 8
 2661              		.cfi_offset 7, -8
 2662              		.cfi_offset 14, -4
 2663 0c12 84B0     		sub	sp, sp, #16
 2664              		.cfi_def_cfa_offset 24
 2665 0c14 00AF     		add	r7, sp, #0
 2666              		.cfi_def_cfa_register 7
 2667 0c16 7860     		str	r0, [r7, #4]
 2668              	.LBB6:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2669              		.loc 4 36 0
 2670 0c18 0023     		movs	r3, #0
 2671 0c1a FB60     		str	r3, [r7, #12]
 2672 0c1c 1FE0     		b	.L173
 2673              	.L174:
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 1);
 2674              		.loc 4 37 0 discriminator 3
 2675 0c1e 7B68     		ldr	r3, [r7, #4]
 2676 0c20 1A68     		ldr	r2, [r3]
 2677 0c22 FB68     		ldr	r3, [r7, #12]
 2678 0c24 0433     		adds	r3, r3, #4
 2679 0c26 5B00     		lsls	r3, r3, #1
 2680 0c28 D318     		adds	r3, r2, r3
 2681 0c2a 0433     		adds	r3, r3, #4
 2682 0c2c 1B78     		ldrb	r3, [r3]
 2683 0c2e 1A00     		movs	r2, r3
 2684 0c30 7B68     		ldr	r3, [r7, #4]
 2685 0c32 DB68     		ldr	r3, [r3, #12]
 2686 0c34 D318     		adds	r3, r2, r3
 2687 0c36 1800     		movs	r0, r3
 2688 0c38 7B68     		ldr	r3, [r7, #4]
 2689 0c3a 1A68     		ldr	r2, [r3]
 2690 0c3c FB68     		ldr	r3, [r7, #12]
 2691 0c3e 0433     		adds	r3, r3, #4
 2692 0c40 5B00     		lsls	r3, r3, #1
 2693 0c42 D318     		adds	r3, r2, r3
 2694 0c44 0533     		adds	r3, r3, #5
 2695 0c46 1B78     		ldrb	r3, [r3]
 2696 0c48 1A00     		movs	r2, r3
 2697 0c4a 7B68     		ldr	r3, [r7, #4]
 2698 0c4c 1B69     		ldr	r3, [r3, #16]
 2699 0c4e D318     		adds	r3, r2, r3
 2700 0c50 0122     		movs	r2, #1
 2701 0c52 1900     		movs	r1, r3
 2702 0c54 FFF7FEFF 		bl	pixel
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2703              		.loc 4 36 0 discriminator 3
 2704 0c58 FB68     		ldr	r3, [r7, #12]
 2705 0c5a 0133     		adds	r3, r3, #1
 2706 0c5c FB60     		str	r3, [r7, #12]
 2707              	.L173:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2708              		.loc 4 36 0 is_stmt 0 discriminator 1
 2709 0c5e FB68     		ldr	r3, [r7, #12]
 2710 0c60 4A2B     		cmp	r3, #74
 2711 0c62 DCDD     		ble	.L174
 2712              	.LBE6:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         }
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 2713              		.loc 4 39 0 is_stmt 1
 2714 0c64 C046     		nop
 2715 0c66 BD46     		mov	sp, r7
 2716 0c68 04B0     		add	sp, sp, #16
 2717              		@ sp needed
 2718 0c6a 80BD     		pop	{r7, pc}
 2719              		.cfi_endproc
 2720              	.LFE33:
 2722              		.align	1
 2723              		.global	clear_object
 2724              		.syntax unified
 2725              		.code	16
 2726              		.thumb_func
 2727              		.fpu softvfp
 2729              	clear_object:
 2730              	.LFB34:
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** void clear_object(POBJECT pObj){
 2731              		.loc 4 41 0
 2732              		.cfi_startproc
 2733              		@ args = 0, pretend = 0, frame = 16
 2734              		@ frame_needed = 1, uses_anonymous_args = 0
 2735 0c6c 80B5     		push	{r7, lr}
 2736              		.cfi_def_cfa_offset 8
 2737              		.cfi_offset 7, -8
 2738              		.cfi_offset 14, -4
 2739 0c6e 84B0     		sub	sp, sp, #16
 2740              		.cfi_def_cfa_offset 24
 2741 0c70 00AF     		add	r7, sp, #0
 2742              		.cfi_def_cfa_register 7
 2743 0c72 7860     		str	r0, [r7, #4]
 2744              	.LBB7:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2745              		.loc 4 42 0
 2746 0c74 0023     		movs	r3, #0
 2747 0c76 FB60     		str	r3, [r7, #12]
 2748 0c78 1FE0     		b	.L176
 2749              	.L177:
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 0);
 2750              		.loc 4 43 0 discriminator 3
 2751 0c7a 7B68     		ldr	r3, [r7, #4]
 2752 0c7c 1A68     		ldr	r2, [r3]
 2753 0c7e FB68     		ldr	r3, [r7, #12]
 2754 0c80 0433     		adds	r3, r3, #4
 2755 0c82 5B00     		lsls	r3, r3, #1
 2756 0c84 D318     		adds	r3, r2, r3
 2757 0c86 0433     		adds	r3, r3, #4
 2758 0c88 1B78     		ldrb	r3, [r3]
 2759 0c8a 1A00     		movs	r2, r3
 2760 0c8c 7B68     		ldr	r3, [r7, #4]
 2761 0c8e DB68     		ldr	r3, [r3, #12]
 2762 0c90 D318     		adds	r3, r2, r3
 2763 0c92 1800     		movs	r0, r3
 2764 0c94 7B68     		ldr	r3, [r7, #4]
 2765 0c96 1A68     		ldr	r2, [r3]
 2766 0c98 FB68     		ldr	r3, [r7, #12]
 2767 0c9a 0433     		adds	r3, r3, #4
 2768 0c9c 5B00     		lsls	r3, r3, #1
 2769 0c9e D318     		adds	r3, r2, r3
 2770 0ca0 0533     		adds	r3, r3, #5
 2771 0ca2 1B78     		ldrb	r3, [r3]
 2772 0ca4 1A00     		movs	r2, r3
 2773 0ca6 7B68     		ldr	r3, [r7, #4]
 2774 0ca8 1B69     		ldr	r3, [r3, #16]
 2775 0caa D318     		adds	r3, r2, r3
 2776 0cac 0022     		movs	r2, #0
 2777 0cae 1900     		movs	r1, r3
 2778 0cb0 FFF7FEFF 		bl	pixel
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2779              		.loc 4 42 0 discriminator 3
 2780 0cb4 FB68     		ldr	r3, [r7, #12]
 2781 0cb6 0133     		adds	r3, r3, #1
 2782 0cb8 FB60     		str	r3, [r7, #12]
 2783              	.L176:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2784              		.loc 4 42 0 is_stmt 0 discriminator 1
 2785 0cba FB68     		ldr	r3, [r7, #12]
 2786 0cbc 4A2B     		cmp	r3, #74
 2787 0cbe DCDD     		ble	.L177
 2788              	.LBE7:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         }
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 2789              		.loc 4 45 0 is_stmt 1
 2790 0cc0 C046     		nop
 2791 0cc2 BD46     		mov	sp, r7
 2792 0cc4 04B0     		add	sp, sp, #16
 2793              		@ sp needed
 2794 0cc6 80BD     		pop	{r7, pc}
 2795              		.cfi_endproc
 2796              	.LFE34:
 2798              		.align	1
 2799              		.global	move_paddle
 2800              		.syntax unified
 2801              		.code	16
 2802              		.thumb_func
 2803              		.fpu softvfp
 2805              	move_paddle:
 2806              	.LFB35:
 2807              		.file 5 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** extern OBJECT Rpaddle;
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** extern OBJECT Lpaddle;
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** void move_paddle(POBJECT this) {
 2808              		.loc 5 4 0
 2809              		.cfi_startproc
 2810              		@ args = 0, pretend = 0, frame = 8
 2811              		@ frame_needed = 1, uses_anonymous_args = 0
 2812 0cc8 80B5     		push	{r7, lr}
 2813              		.cfi_def_cfa_offset 8
 2814              		.cfi_offset 7, -8
 2815              		.cfi_offset 14, -4
 2816 0cca 82B0     		sub	sp, sp, #8
 2817              		.cfi_def_cfa_offset 16
 2818 0ccc 00AF     		add	r7, sp, #0
 2819              		.cfi_def_cfa_register 7
 2820 0cce 7860     		str	r0, [r7, #4]
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	clear_object(this);
 2821              		.loc 5 5 0
 2822 0cd0 7B68     		ldr	r3, [r7, #4]
 2823 0cd2 1800     		movs	r0, r3
 2824 0cd4 FFF7FEFF 		bl	clear_object
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	this->posY += this->dirY;
 2825              		.loc 5 7 0
 2826 0cd8 7B68     		ldr	r3, [r7, #4]
 2827 0cda 1A69     		ldr	r2, [r3, #16]
 2828 0cdc 7B68     		ldr	r3, [r7, #4]
 2829 0cde 9B68     		ldr	r3, [r3, #8]
 2830 0ce0 D218     		adds	r2, r2, r3
 2831 0ce2 7B68     		ldr	r3, [r7, #4]
 2832 0ce4 1A61     		str	r2, [r3, #16]
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	if(this->posY < 0) {
 2833              		.loc 5 9 0
 2834 0ce6 7B68     		ldr	r3, [r7, #4]
 2835 0ce8 1B69     		ldr	r3, [r3, #16]
 2836 0cea 002B     		cmp	r3, #0
 2837 0cec 03DA     		bge	.L179
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 		this->posY = 0;
 2838              		.loc 5 10 0
 2839 0cee 7B68     		ldr	r3, [r7, #4]
 2840 0cf0 0022     		movs	r2, #0
 2841 0cf2 1A61     		str	r2, [r3, #16]
 2842 0cf4 0EE0     		b	.L180
 2843              	.L179:
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	} else if(this->posY + this->geo->sizeY > 63) {
 2844              		.loc 5 11 0
 2845 0cf6 7B68     		ldr	r3, [r7, #4]
 2846 0cf8 1A69     		ldr	r2, [r3, #16]
 2847 0cfa 7B68     		ldr	r3, [r7, #4]
 2848 0cfc 1B68     		ldr	r3, [r3]
 2849 0cfe 9B68     		ldr	r3, [r3, #8]
 2850 0d00 D318     		adds	r3, r2, r3
 2851 0d02 3F2B     		cmp	r3, #63
 2852 0d04 06DD     		ble	.L180
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 		this->posY = 63 - this->geo->sizeY;
 2853              		.loc 5 12 0
 2854 0d06 7B68     		ldr	r3, [r7, #4]
 2855 0d08 1B68     		ldr	r3, [r3]
 2856 0d0a 9B68     		ldr	r3, [r3, #8]
 2857 0d0c 3F22     		movs	r2, #63
 2858 0d0e D21A     		subs	r2, r2, r3
 2859 0d10 7B68     		ldr	r3, [r7, #4]
 2860 0d12 1A61     		str	r2, [r3, #16]
 2861              	.L180:
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	}
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	this->draw(this);
 2862              		.loc 5 15 0
 2863 0d14 7B68     		ldr	r3, [r7, #4]
 2864 0d16 5B69     		ldr	r3, [r3, #20]
 2865 0d18 7A68     		ldr	r2, [r7, #4]
 2866 0d1a 1000     		movs	r0, r2
 2867 0d1c 9847     		blx	r3
 2868              	.LVL0:
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** }
 2869              		.loc 5 16 0
 2870 0d1e C046     		nop
 2871 0d20 BD46     		mov	sp, r7
 2872 0d22 02B0     		add	sp, sp, #8
 2873              		@ sp needed
 2874 0d24 80BD     		pop	{r7, pc}
 2875              		.cfi_endproc
 2876              	.LFE35:
 2878              		.global	paddle_geometry
 2879              		.data
 2880              		.align	2
 2883              	paddle_geometry:
 2884 0000 4B000000 		.word	75
 2885 0004 02000000 		.word	2
 2886 0008 19000000 		.word	25
 2887 000c 00       		.byte	0
 2888 000d 01       		.byte	1
 2889 000e 00       		.byte	0
 2890 000f 02       		.byte	2
 2891 0010 00       		.byte	0
 2892 0011 03       		.byte	3
 2893 0012 00       		.byte	0
 2894 0013 04       		.byte	4
 2895 0014 00       		.byte	0
 2896 0015 05       		.byte	5
 2897 0016 00       		.byte	0
 2898 0017 06       		.byte	6
 2899 0018 00       		.byte	0
 2900 0019 07       		.byte	7
 2901 001a 00       		.byte	0
 2902 001b 08       		.byte	8
 2903 001c 00       		.byte	0
 2904 001d 09       		.byte	9
 2905 001e 00       		.byte	0
 2906 001f 0A       		.byte	10
 2907 0020 00       		.byte	0
 2908 0021 0B       		.byte	11
 2909 0022 00       		.byte	0
 2910 0023 0C       		.byte	12
 2911 0024 00       		.byte	0
 2912 0025 0D       		.byte	13
 2913 0026 00       		.byte	0
 2914 0027 0E       		.byte	14
 2915 0028 00       		.byte	0
 2916 0029 0F       		.byte	15
 2917 002a 00       		.byte	0
 2918 002b 10       		.byte	16
 2919 002c 00       		.byte	0
 2920 002d 11       		.byte	17
 2921 002e 00       		.byte	0
 2922 002f 12       		.byte	18
 2923 0030 00       		.byte	0
 2924 0031 13       		.byte	19
 2925 0032 00       		.byte	0
 2926 0033 14       		.byte	20
 2927 0034 00       		.byte	0
 2928 0035 15       		.byte	21
 2929 0036 00       		.byte	0
 2930 0037 16       		.byte	22
 2931 0038 00       		.byte	0
 2932 0039 17       		.byte	23
 2933 003a 00       		.byte	0
 2934 003b 18       		.byte	24
 2935 003c 00       		.byte	0
 2936 003d 19       		.byte	25
 2937 003e 01       		.byte	1
 2938 003f 01       		.byte	1
 2939 0040 01       		.byte	1
 2940 0041 02       		.byte	2
 2941 0042 01       		.byte	1
 2942 0043 03       		.byte	3
 2943 0044 01       		.byte	1
 2944 0045 04       		.byte	4
 2945 0046 01       		.byte	1
 2946 0047 05       		.byte	5
 2947 0048 01       		.byte	1
 2948 0049 06       		.byte	6
 2949 004a 01       		.byte	1
 2950 004b 07       		.byte	7
 2951 004c 01       		.byte	1
 2952 004d 08       		.byte	8
 2953 004e 01       		.byte	1
 2954 004f 09       		.byte	9
 2955 0050 01       		.byte	1
 2956 0051 0A       		.byte	10
 2957 0052 01       		.byte	1
 2958 0053 0B       		.byte	11
 2959 0054 01       		.byte	1
 2960 0055 0C       		.byte	12
 2961 0056 01       		.byte	1
 2962 0057 0D       		.byte	13
 2963 0058 01       		.byte	1
 2964 0059 0E       		.byte	14
 2965 005a 01       		.byte	1
 2966 005b 0F       		.byte	15
 2967 005c 01       		.byte	1
 2968 005d 10       		.byte	16
 2969 005e 01       		.byte	1
 2970 005f 11       		.byte	17
 2971 0060 01       		.byte	1
 2972 0061 12       		.byte	18
 2973 0062 01       		.byte	1
 2974 0063 13       		.byte	19
 2975 0064 01       		.byte	1
 2976 0065 14       		.byte	20
 2977 0066 01       		.byte	1
 2978 0067 15       		.byte	21
 2979 0068 01       		.byte	1
 2980 0069 16       		.byte	22
 2981 006a 01       		.byte	1
 2982 006b 17       		.byte	23
 2983 006c 01       		.byte	1
 2984 006d 18       		.byte	24
 2985 006e 01       		.byte	1
 2986 006f 19       		.byte	25
 2987 0070 02       		.byte	2
 2988 0071 01       		.byte	1
 2989 0072 02       		.byte	2
 2990 0073 02       		.byte	2
 2991 0074 02       		.byte	2
 2992 0075 03       		.byte	3
 2993 0076 02       		.byte	2
 2994 0077 04       		.byte	4
 2995 0078 02       		.byte	2
 2996 0079 05       		.byte	5
 2997 007a 02       		.byte	2
 2998 007b 06       		.byte	6
 2999 007c 02       		.byte	2
 3000 007d 07       		.byte	7
 3001 007e 02       		.byte	2
 3002 007f 08       		.byte	8
 3003 0080 02       		.byte	2
 3004 0081 09       		.byte	9
 3005 0082 02       		.byte	2
 3006 0083 0A       		.byte	10
 3007 0084 02       		.byte	2
 3008 0085 0B       		.byte	11
 3009 0086 02       		.byte	2
 3010 0087 0C       		.byte	12
 3011 0088 02       		.byte	2
 3012 0089 0D       		.byte	13
 3013 008a 02       		.byte	2
 3014 008b 0E       		.byte	14
 3015 008c 02       		.byte	2
 3016 008d 0F       		.byte	15
 3017 008e 02       		.byte	2
 3018 008f 10       		.byte	16
 3019 0090 02       		.byte	2
 3020 0091 11       		.byte	17
 3021 0092 02       		.byte	2
 3022 0093 12       		.byte	18
 3023 0094 02       		.byte	2
 3024 0095 13       		.byte	19
 3025 0096 02       		.byte	2
 3026 0097 14       		.byte	20
 3027 0098 02       		.byte	2
 3028 0099 15       		.byte	21
 3029 009a 02       		.byte	2
 3030 009b 16       		.byte	22
 3031 009c 02       		.byte	2
 3032 009d 17       		.byte	23
 3033 009e 02       		.byte	2
 3034 009f 18       		.byte	24
 3035 00a0 02       		.byte	2
 3036 00a1 19       		.byte	25
 3037 00a2 0000     		.space	2
 3038              		.global	Rpaddle
 3039              		.align	2
 3042              	Rpaddle:
 3043 00a4 00000000 		.word	paddle_geometry
 3044 00a8 00000000 		.word	0
 3045 00ac 00000000 		.word	0
 3046 00b0 7D000000 		.word	125
 3047 00b4 01000000 		.word	1
 3048 00b8 00000000 		.word	draw_object
 3049 00bc 00000000 		.word	clear_object
 3050 00c0 00000000 		.word	move_paddle
 3051 00c4 00000000 		.word	set_object_speed
 3052              		.global	Lpaddle
 3053              		.align	2
 3056              	Lpaddle:
 3057 00c8 00000000 		.word	paddle_geometry
 3058 00cc 00000000 		.word	0
 3059 00d0 00000000 		.word	0
 3060 00d4 01000000 		.word	1
 3061 00d8 01000000 		.word	1
 3062 00dc 00000000 		.word	draw_object
 3063 00e0 00000000 		.word	clear_object
 3064 00e4 00000000 		.word	move_paddle
 3065 00e8 00000000 		.word	set_object_speed
 3066              		.text
 3067              		.align	1
 3068              		.global	move_ball
 3069              		.syntax unified
 3070              		.code	16
 3071              		.thumb_func
 3072              		.fpu softvfp
 3074              	move_ball:
 3075              	.LFB36:
 3076              		.file 6 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** #include "object.h"
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** #include "paddle.h"
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** void move_ball(POBJECT this) {
 3077              		.loc 6 4 0
 3078              		.cfi_startproc
 3079              		@ args = 0, pretend = 0, frame = 16
 3080              		@ frame_needed = 1, uses_anonymous_args = 0
 3081 0d26 80B5     		push	{r7, lr}
 3082              		.cfi_def_cfa_offset 8
 3083              		.cfi_offset 7, -8
 3084              		.cfi_offset 14, -4
 3085 0d28 84B0     		sub	sp, sp, #16
 3086              		.cfi_def_cfa_offset 24
 3087 0d2a 00AF     		add	r7, sp, #0
 3088              		.cfi_def_cfa_register 7
 3089 0d2c 7860     		str	r0, [r7, #4]
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h ****     this->posX += this->dirX;
 3090              		.loc 6 6 0
 3091 0d2e 7B68     		ldr	r3, [r7, #4]
 3092 0d30 DA68     		ldr	r2, [r3, #12]
 3093 0d32 7B68     		ldr	r3, [r7, #4]
 3094 0d34 5B68     		ldr	r3, [r3, #4]
 3095 0d36 D218     		adds	r2, r2, r3
 3096 0d38 7B68     		ldr	r3, [r7, #4]
 3097 0d3a DA60     		str	r2, [r3, #12]
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	this->posY += this->dirY;
 3098              		.loc 6 7 0
 3099 0d3c 7B68     		ldr	r3, [r7, #4]
 3100 0d3e 1A69     		ldr	r2, [r3, #16]
 3101 0d40 7B68     		ldr	r3, [r7, #4]
 3102 0d42 9B68     		ldr	r3, [r3, #8]
 3103 0d44 D218     		adds	r2, r2, r3
 3104 0d46 7B68     		ldr	r3, [r7, #4]
 3105 0d48 1A61     		str	r2, [r3, #16]
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	if((this->posY < 0) ||  this->posY > 63 ) {
 3106              		.loc 6 11 0
 3107 0d4a 7B68     		ldr	r3, [r7, #4]
 3108 0d4c 1B69     		ldr	r3, [r3, #16]
 3109 0d4e 002B     		cmp	r3, #0
 3110 0d50 03DB     		blt	.L182
 3111              		.loc 6 11 0 is_stmt 0 discriminator 1
 3112 0d52 7B68     		ldr	r3, [r7, #4]
 3113 0d54 1B69     		ldr	r3, [r3, #16]
 3114 0d56 3F2B     		cmp	r3, #63
 3115 0d58 04DD     		ble	.L183
 3116              	.L182:
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		this->dirY = -this->dirY;
 3117              		.loc 6 12 0 is_stmt 1
 3118 0d5a 7B68     		ldr	r3, [r7, #4]
 3119 0d5c 9B68     		ldr	r3, [r3, #8]
 3120 0d5e 5A42     		rsbs	r2, r3, #0
 3121 0d60 7B68     		ldr	r3, [r7, #4]
 3122 0d62 9A60     		str	r2, [r3, #8]
 3123              	.L183:
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	}
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	// Define left and right paddle
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	POBJECT lp = &Lpaddle;
 3124              		.loc 6 16 0
 3125 0d64 234B     		ldr	r3, .L186
 3126 0d66 FB60     		str	r3, [r7, #12]
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	POBJECT rp = &Rpaddle;
 3127              		.loc 6 17 0
 3128 0d68 234B     		ldr	r3, .L186+4
 3129 0d6a BB60     		str	r3, [r7, #8]
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	//Rpaddle collision
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	if(this->posX <= lp->posX + lp->geo->sizeX) {
 3130              		.loc 6 20 0
 3131 0d6c 7B68     		ldr	r3, [r7, #4]
 3132 0d6e DA68     		ldr	r2, [r3, #12]
 3133 0d70 FB68     		ldr	r3, [r7, #12]
 3134 0d72 D968     		ldr	r1, [r3, #12]
 3135 0d74 FB68     		ldr	r3, [r7, #12]
 3136 0d76 1B68     		ldr	r3, [r3]
 3137 0d78 5B68     		ldr	r3, [r3, #4]
 3138 0d7a CB18     		adds	r3, r1, r3
 3139 0d7c 9A42     		cmp	r2, r3
 3140 0d7e 14DC     		bgt	.L184
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		if((this->posY >= lp->posY) && (this->posY <= lp->posY + lp->geo->sizeY)) {
 3141              		.loc 6 21 0
 3142 0d80 7B68     		ldr	r3, [r7, #4]
 3143 0d82 1A69     		ldr	r2, [r3, #16]
 3144 0d84 FB68     		ldr	r3, [r7, #12]
 3145 0d86 1B69     		ldr	r3, [r3, #16]
 3146 0d88 9A42     		cmp	r2, r3
 3147 0d8a 0EDB     		blt	.L184
 3148              		.loc 6 21 0 is_stmt 0 discriminator 1
 3149 0d8c 7B68     		ldr	r3, [r7, #4]
 3150 0d8e 1A69     		ldr	r2, [r3, #16]
 3151 0d90 FB68     		ldr	r3, [r7, #12]
 3152 0d92 1969     		ldr	r1, [r3, #16]
 3153 0d94 FB68     		ldr	r3, [r7, #12]
 3154 0d96 1B68     		ldr	r3, [r3]
 3155 0d98 9B68     		ldr	r3, [r3, #8]
 3156 0d9a CB18     		adds	r3, r1, r3
 3157 0d9c 9A42     		cmp	r2, r3
 3158 0d9e 04DC     		bgt	.L184
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			this->dirX = -this->dirX;
 3159              		.loc 6 22 0 is_stmt 1
 3160 0da0 7B68     		ldr	r3, [r7, #4]
 3161 0da2 5B68     		ldr	r3, [r3, #4]
 3162 0da4 5A42     		rsbs	r2, r3, #0
 3163 0da6 7B68     		ldr	r3, [r7, #4]
 3164 0da8 5A60     		str	r2, [r3, #4]
 3165              	.L184:
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		} else {
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			//Print ascii string to show score
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		}
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	}
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	//Lpaddle collision
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	if(this->posX >= rp->posX) {
 3166              		.loc 6 29 0
 3167 0daa 7B68     		ldr	r3, [r7, #4]
 3168 0dac DA68     		ldr	r2, [r3, #12]
 3169 0dae BB68     		ldr	r3, [r7, #8]
 3170 0db0 DB68     		ldr	r3, [r3, #12]
 3171 0db2 9A42     		cmp	r2, r3
 3172 0db4 14DB     		blt	.L185
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		if((this->posY >= rp->posY) && (this->posY <= rp->posY + rp->geo->sizeY)) {
 3173              		.loc 6 30 0
 3174 0db6 7B68     		ldr	r3, [r7, #4]
 3175 0db8 1A69     		ldr	r2, [r3, #16]
 3176 0dba BB68     		ldr	r3, [r7, #8]
 3177 0dbc 1B69     		ldr	r3, [r3, #16]
 3178 0dbe 9A42     		cmp	r2, r3
 3179 0dc0 0EDB     		blt	.L185
 3180              		.loc 6 30 0 is_stmt 0 discriminator 1
 3181 0dc2 7B68     		ldr	r3, [r7, #4]
 3182 0dc4 1A69     		ldr	r2, [r3, #16]
 3183 0dc6 BB68     		ldr	r3, [r7, #8]
 3184 0dc8 1969     		ldr	r1, [r3, #16]
 3185 0dca BB68     		ldr	r3, [r7, #8]
 3186 0dcc 1B68     		ldr	r3, [r3]
 3187 0dce 9B68     		ldr	r3, [r3, #8]
 3188 0dd0 CB18     		adds	r3, r1, r3
 3189 0dd2 9A42     		cmp	r2, r3
 3190 0dd4 04DC     		bgt	.L185
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			this->dirX = -this->dirX;
 3191              		.loc 6 31 0 is_stmt 1
 3192 0dd6 7B68     		ldr	r3, [r7, #4]
 3193 0dd8 5B68     		ldr	r3, [r3, #4]
 3194 0dda 5A42     		rsbs	r2, r3, #0
 3195 0ddc 7B68     		ldr	r3, [r7, #4]
 3196 0dde 5A60     		str	r2, [r3, #4]
 3197              	.L185:
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		} else {
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 			//Print ascii string to show score
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 		}
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	}
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	this->draw(this);
 3198              		.loc 6 37 0
 3199 0de0 7B68     		ldr	r3, [r7, #4]
 3200 0de2 5B69     		ldr	r3, [r3, #20]
 3201 0de4 7A68     		ldr	r2, [r7, #4]
 3202 0de6 1000     		movs	r0, r2
 3203 0de8 9847     		blx	r3
 3204              	.LVL1:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** }
 3205              		.loc 6 38 0
 3206 0dea C046     		nop
 3207 0dec BD46     		mov	sp, r7
 3208 0dee 04B0     		add	sp, sp, #16
 3209              		@ sp needed
 3210 0df0 80BD     		pop	{r7, pc}
 3211              	.L187:
 3212 0df2 C046     		.align	2
 3213              	.L186:
 3214 0df4 00000000 		.word	Lpaddle
 3215 0df8 00000000 		.word	Rpaddle
 3216              		.cfi_endproc
 3217              	.LFE36:
 3219              		.global	ball_geometry
 3220              		.data
 3221              		.align	2
 3224              	ball_geometry:
 3225 00ec 0C000000 		.word	12
 3226 00f0 04000000 		.word	4
 3227 00f4 04000000 		.word	4
 3228 00f8 00       		.byte	0
 3229 00f9 01       		.byte	1
 3230 00fa 00       		.byte	0
 3231 00fb 02       		.byte	2
 3232 00fc 01       		.byte	1
 3233 00fd 00       		.byte	0
 3234 00fe 01       		.byte	1
 3235 00ff 01       		.byte	1
 3236 0100 01       		.byte	1
 3237 0101 02       		.byte	2
 3238 0102 01       		.byte	1
 3239 0103 03       		.byte	3
 3240 0104 02       		.byte	2
 3241 0105 00       		.byte	0
 3242 0106 02       		.byte	2
 3243 0107 01       		.byte	1
 3244 0108 02       		.byte	2
 3245 0109 02       		.byte	2
 3246 010a 02       		.byte	2
 3247 010b 03       		.byte	3
 3248 010c 03       		.byte	3
 3249 010d 01       		.byte	1
 3250 010e 03       		.byte	3
 3251 010f 02       		.byte	2
 3252 0110 00000000 		.space	126
 3252      00000000 
 3252      00000000 
 3252      00000000 
 3252      00000000 
 3253 018e 0000     		.space	2
 3254              		.global	ball
 3255              		.align	2
 3258              	ball:
 3259 0190 00000000 		.word	ball_geometry
 3260 0194 00000000 		.word	0
 3261 0198 00000000 		.word	0
 3262 019c 01000000 		.word	1
 3263 01a0 01000000 		.word	1
 3264 01a4 00000000 		.word	draw_object
 3265 01a8 00000000 		.word	clear_object
 3266 01ac 00000000 		.word	move_ball
 3267 01b0 00000000 		.word	set_object_speed
 3268              		.section	.start_section,"ax",%progbits
 3269              		.align	1
 3270              		.global	startup
 3271              		.syntax unified
 3272              		.code	16
 3273              		.thumb_func
 3274              		.fpu softvfp
 3276              	startup:
 3277              	.LFB37:
 3278              		.file 7 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c
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
 3279              		.loc 7 19 0
 3280              		.cfi_startproc
 3281              		@ Naked Function: prologue and epilogue provided by programmer.
 3282              		@ args = 0, pretend = 0, frame = 0
 3283              		@ frame_needed = 1, uses_anonymous_args = 0
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** asm volatile(
 3284              		.loc 7 20 0
 3285              		.syntax divided
 3286              	@ 20 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c" 1
 3287 0000 0248     		 LDR R0,=0x2001C000
 3288 0002 8546     	 MOV SP,R0
 3289 0004 FFF7FEFF 	 BL main
 3290 0008 FEE7     	.L1: B .L1
 3291              	
 3292              	@ 0 "" 2
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" MOV SP,R0\n"
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" BL main\n"				/* call main */
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	".L1: B .L1\n"				/* never return */
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	) ;
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** }
 3293              		.loc 7 26 0
 3294              		.thumb
 3295              		.syntax unified
 3296 000a C046     		nop
 3297              		.cfi_endproc
 3298              	.LFE37:
 3300              		.text
 3301              		.align	1
 3302              		.global	init_app
 3303              		.syntax unified
 3304              		.code	16
 3305              		.thumb_func
 3306              		.fpu softvfp
 3308              	init_app:
 3309              	.LFB38:
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void init_app(void){
 3310              		.loc 7 28 0
 3311              		.cfi_startproc
 3312              		@ args = 0, pretend = 0, frame = 0
 3313              		@ frame_needed = 1, uses_anonymous_args = 0
 3314 0dfc 80B5     		push	{r7, lr}
 3315              		.cfi_def_cfa_offset 8
 3316              		.cfi_offset 7, -8
 3317              		.cfi_offset 14, -4
 3318 0dfe 00AF     		add	r7, sp, #0
 3319              		.cfi_def_cfa_register 7
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_E_MODER = 0x55555555;
 3320              		.loc 7 29 0
 3321 0e00 0C4B     		ldr	r3, .L190
 3322 0e02 0D4A     		ldr	r2, .L190+4
 3323 0e04 1A60     		str	r2, [r3]
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_MODER = 0x55555555;
 3324              		.loc 7 31 0
 3325 0e06 0D4B     		ldr	r3, .L190+8
 3326 0e08 0B4A     		ldr	r2, .L190+4
 3327 0e0a 1A60     		str	r2, [r3]
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_MODER = 0x55005555;
 3328              		.loc 7 33 0
 3329 0e0c 0B4B     		ldr	r3, .L190+8
 3330 0e0e 0C4A     		ldr	r2, .L190+12
 3331 0e10 1A60     		str	r2, [r3]
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****      //set all bits as push pull
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_OTYPER &= 0x0000FFFF;   
 3332              		.loc 7 35 0
 3333 0e12 0C4B     		ldr	r3, .L190+16
 3334 0e14 0B4A     		ldr	r2, .L190+16
 3335 0e16 1288     		ldrh	r2, [r2]
 3336 0e18 92B2     		uxth	r2, r2
 3337 0e1a 1A80     		strh	r2, [r3]
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_OTYPER |= 0x00000000;   
 3338              		.loc 7 36 0
 3339 0e1c 094B     		ldr	r3, .L190+16
 3340 0e1e 094A     		ldr	r2, .L190+16
 3341 0e20 1288     		ldrh	r2, [r2]
 3342 0e22 92B2     		uxth	r2, r2
 3343 0e24 1A80     		strh	r2, [r3]
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****      //
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****      //PORT_PUPDR = 0xzz55zzzz;   
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_D_PUPDR = 0x00AA0000;   
 3344              		.loc 7 39 0
 3345 0e26 084B     		ldr	r3, .L190+20
 3346 0e28 AA22     		movs	r2, #170
 3347 0e2a 1204     		lsls	r2, r2, #16
 3348 0e2c 1A60     		str	r2, [r3]
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     }
 3349              		.loc 7 40 0
 3350 0e2e C046     		nop
 3351 0e30 BD46     		mov	sp, r7
 3352              		@ sp needed
 3353 0e32 80BD     		pop	{r7, pc}
 3354              	.L191:
 3355              		.align	2
 3356              	.L190:
 3357 0e34 00100240 		.word	1073876992
 3358 0e38 55555555 		.word	1431655765
 3359 0e3c 000C0240 		.word	1073875968
 3360 0e40 55550055 		.word	1426085205
 3361 0e44 040C0240 		.word	1073875972
 3362 0e48 0C0C0240 		.word	1073875980
 3363              		.cfi_endproc
 3364              	.LFE38:
 3366              		.align	1
 3367              		.global	movePaddles
 3368              		.syntax unified
 3369              		.code	16
 3370              		.thumb_func
 3371              		.fpu softvfp
 3373              	movePaddles:
 3374              	.LFB39:
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void movePaddles(unsigned char c){
 3375              		.loc 7 42 0
 3376              		.cfi_startproc
 3377              		@ args = 0, pretend = 0, frame = 8
 3378              		@ frame_needed = 1, uses_anonymous_args = 0
 3379 0e4c 80B5     		push	{r7, lr}
 3380              		.cfi_def_cfa_offset 8
 3381              		.cfi_offset 7, -8
 3382              		.cfi_offset 14, -4
 3383 0e4e 82B0     		sub	sp, sp, #8
 3384              		.cfi_def_cfa_offset 16
 3385 0e50 00AF     		add	r7, sp, #0
 3386              		.cfi_def_cfa_register 7
 3387 0e52 0200     		movs	r2, r0
 3388 0e54 FB1D     		adds	r3, r7, #7
 3389 0e56 1A70     		strb	r2, [r3]
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	if(c == 1){Lpaddle.posY--; }
 3390              		.loc 7 43 0
 3391 0e58 FB1D     		adds	r3, r7, #7
 3392 0e5a 1B78     		ldrb	r3, [r3]
 3393 0e5c 012B     		cmp	r3, #1
 3394 0e5e 04D1     		bne	.L193
 3395              		.loc 7 43 0 is_stmt 0 discriminator 1
 3396 0e60 114B     		ldr	r3, .L198
 3397 0e62 1B69     		ldr	r3, [r3, #16]
 3398 0e64 5A1E     		subs	r2, r3, #1
 3399 0e66 104B     		ldr	r3, .L198
 3400 0e68 1A61     		str	r2, [r3, #16]
 3401              	.L193:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	if(c == 4){Lpaddle.posY++; }
 3402              		.loc 7 44 0 is_stmt 1
 3403 0e6a FB1D     		adds	r3, r7, #7
 3404 0e6c 1B78     		ldrb	r3, [r3]
 3405 0e6e 042B     		cmp	r3, #4
 3406 0e70 04D1     		bne	.L194
 3407              		.loc 7 44 0 is_stmt 0 discriminator 1
 3408 0e72 0D4B     		ldr	r3, .L198
 3409 0e74 1B69     		ldr	r3, [r3, #16]
 3410 0e76 5A1C     		adds	r2, r3, #1
 3411 0e78 0B4B     		ldr	r3, .L198
 3412 0e7a 1A61     		str	r2, [r3, #16]
 3413              	.L194:
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	if(c == 3){Rpaddle.posY--; }
 3414              		.loc 7 46 0 is_stmt 1
 3415 0e7c FB1D     		adds	r3, r7, #7
 3416 0e7e 1B78     		ldrb	r3, [r3]
 3417 0e80 032B     		cmp	r3, #3
 3418 0e82 04D1     		bne	.L195
 3419              		.loc 7 46 0 is_stmt 0 discriminator 1
 3420 0e84 094B     		ldr	r3, .L198+4
 3421 0e86 1B69     		ldr	r3, [r3, #16]
 3422 0e88 5A1E     		subs	r2, r3, #1
 3423 0e8a 084B     		ldr	r3, .L198+4
 3424 0e8c 1A61     		str	r2, [r3, #16]
 3425              	.L195:
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	if(c == 6){Rpaddle.posY++; }
 3426              		.loc 7 47 0 is_stmt 1
 3427 0e8e FB1D     		adds	r3, r7, #7
 3428 0e90 1B78     		ldrb	r3, [r3]
 3429 0e92 062B     		cmp	r3, #6
 3430 0e94 04D1     		bne	.L197
 3431              		.loc 7 47 0 is_stmt 0 discriminator 1
 3432 0e96 054B     		ldr	r3, .L198+4
 3433 0e98 1B69     		ldr	r3, [r3, #16]
 3434 0e9a 5A1C     		adds	r2, r3, #1
 3435 0e9c 034B     		ldr	r3, .L198+4
 3436 0e9e 1A61     		str	r2, [r3, #16]
 3437              	.L197:
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	}
 3438              		.loc 7 49 0 is_stmt 1
 3439 0ea0 C046     		nop
 3440 0ea2 BD46     		mov	sp, r7
 3441 0ea4 02B0     		add	sp, sp, #8
 3442              		@ sp needed
 3443 0ea6 80BD     		pop	{r7, pc}
 3444              	.L199:
 3445              		.align	2
 3446              	.L198:
 3447 0ea8 00000000 		.word	Lpaddle
 3448 0eac 00000000 		.word	Rpaddle
 3449              		.cfi_endproc
 3450              	.LFE39:
 3452              		.section	.rodata
 3453              		.align	2
 3454              	.LC9:
 3455 0064 506C6179 		.ascii	"Player1: \000"
 3455      6572313A 
 3455      2000
 3456 006e 0000     		.align	2
 3457              	.LC11:
 3458 0070 506C6179 		.ascii	"Player2: \000"
 3458      6572323A 
 3458      2000
 3459              		.text
 3460              		.align	1
 3461              		.global	writeScore
 3462              		.syntax unified
 3463              		.code	16
 3464              		.thumb_func
 3465              		.fpu softvfp
 3467              	writeScore:
 3468              	.LFB40:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void writeScore(){
 3469              		.loc 7 51 0
 3470              		.cfi_startproc
 3471              		@ args = 0, pretend = 0, frame = 32
 3472              		@ frame_needed = 1, uses_anonymous_args = 0
 3473 0eb0 80B5     		push	{r7, lr}
 3474              		.cfi_def_cfa_offset 8
 3475              		.cfi_offset 7, -8
 3476              		.cfi_offset 14, -4
 3477 0eb2 88B0     		sub	sp, sp, #32
 3478              		.cfi_def_cfa_offset 40
 3479 0eb4 00AF     		add	r7, sp, #0
 3480              		.cfi_def_cfa_register 7
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     char *s;
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	char test1[] = "Player1: ";
 3481              		.loc 7 53 0
 3482 0eb6 1023     		movs	r3, #16
 3483 0eb8 FB18     		adds	r3, r7, r3
 3484 0eba 1B4A     		ldr	r2, .L205
 3485 0ebc 03CA     		ldmia	r2!, {r0, r1}
 3486 0ebe 03C3     		stmia	r3!, {r0, r1}
 3487 0ec0 1288     		ldrh	r2, [r2]
 3488 0ec2 1A80     		strh	r2, [r3]
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	char test2[] = "Player2: ";
 3489              		.loc 7 54 0
 3490 0ec4 3B1D     		adds	r3, r7, #4
 3491 0ec6 194A     		ldr	r2, .L205+4
 3492 0ec8 03CA     		ldmia	r2!, {r0, r1}
 3493 0eca 03C3     		stmia	r3!, {r0, r1}
 3494 0ecc 1288     		ldrh	r2, [r2]
 3495 0ece 1A80     		strh	r2, [r3]
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     //init_app();
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     ascii_init();
 3496              		.loc 7 57 0
 3497 0ed0 FFF7FEFF 		bl	ascii_init
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	goToXY(1,1);
 3498              		.loc 7 58 0
 3499 0ed4 0121     		movs	r1, #1
 3500 0ed6 0120     		movs	r0, #1
 3501 0ed8 FFF7FEFF 		bl	goToXY
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	s = test1;
 3502              		.loc 7 60 0
 3503 0edc 1023     		movs	r3, #16
 3504 0ede FB18     		adds	r3, r7, r3
 3505 0ee0 FB61     		str	r3, [r7, #28]
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	while(*s) {
 3506              		.loc 7 61 0
 3507 0ee2 06E0     		b	.L201
 3508              	.L202:
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 		ascii_write_char(*s++);
 3509              		.loc 7 62 0
 3510 0ee4 FB69     		ldr	r3, [r7, #28]
 3511 0ee6 5A1C     		adds	r2, r3, #1
 3512 0ee8 FA61     		str	r2, [r7, #28]
 3513 0eea 1B78     		ldrb	r3, [r3]
 3514 0eec 1800     		movs	r0, r3
 3515 0eee FFF7FEFF 		bl	ascii_write_char
 3516              	.L201:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	while(*s) {
 3517              		.loc 7 61 0
 3518 0ef2 FB69     		ldr	r3, [r7, #28]
 3519 0ef4 1B78     		ldrb	r3, [r3]
 3520 0ef6 002B     		cmp	r3, #0
 3521 0ef8 F4D1     		bne	.L202
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	}
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	goToXY(1,2);
 3522              		.loc 7 64 0
 3523 0efa 0221     		movs	r1, #2
 3524 0efc 0120     		movs	r0, #1
 3525 0efe FFF7FEFF 		bl	goToXY
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	s = test2;
 3526              		.loc 7 65 0
 3527 0f02 3B1D     		adds	r3, r7, #4
 3528 0f04 FB61     		str	r3, [r7, #28]
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	while(*s) {
 3529              		.loc 7 66 0
 3530 0f06 06E0     		b	.L203
 3531              	.L204:
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 		ascii_write_char(*s++);
 3532              		.loc 7 67 0
 3533 0f08 FB69     		ldr	r3, [r7, #28]
 3534 0f0a 5A1C     		adds	r2, r3, #1
 3535 0f0c FA61     		str	r2, [r7, #28]
 3536 0f0e 1B78     		ldrb	r3, [r3]
 3537 0f10 1800     		movs	r0, r3
 3538 0f12 FFF7FEFF 		bl	ascii_write_char
 3539              	.L203:
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	while(*s) {
 3540              		.loc 7 66 0
 3541 0f16 FB69     		ldr	r3, [r7, #28]
 3542 0f18 1B78     		ldrb	r3, [r3]
 3543 0f1a 002B     		cmp	r3, #0
 3544 0f1c F4D1     		bne	.L204
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	}
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     }
 3545              		.loc 7 70 0
 3546 0f1e C046     		nop
 3547 0f20 BD46     		mov	sp, r7
 3548 0f22 08B0     		add	sp, sp, #32
 3549              		@ sp needed
 3550 0f24 80BD     		pop	{r7, pc}
 3551              	.L206:
 3552 0f26 C046     		.align	2
 3553              	.L205:
 3554 0f28 64000000 		.word	.LC9
 3555 0f2c 70000000 		.word	.LC11
 3556              		.cfi_endproc
 3557              	.LFE40:
 3559              		.align	1
 3560              		.global	main
 3561              		.syntax unified
 3562              		.code	16
 3563              		.thumb_func
 3564              		.fpu softvfp
 3566              	main:
 3567              	.LFB41:
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** //void movePaddles(unsigned char player1, unsigned char player2){
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** //	if(player1 == 1){Lpaddle.posY--; }
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** //	if(player1 == 4){Lpaddle.posY++; }
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** //	if(player2 == 3){Rpaddle.posY--; }
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** //	if(player2 == 6){Rpaddle.posY++; }
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** //	}
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void main(void)
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** {
 3568              		.loc 7 83 0
 3569              		.cfi_startproc
 3570              		@ args = 0, pretend = 0, frame = 16
 3571              		@ frame_needed = 1, uses_anonymous_args = 0
 3572 0f30 80B5     		push	{r7, lr}
 3573              		.cfi_def_cfa_offset 8
 3574              		.cfi_offset 7, -8
 3575              		.cfi_offset 14, -4
 3576 0f32 84B0     		sub	sp, sp, #16
 3577              		.cfi_def_cfa_offset 24
 3578 0f34 00AF     		add	r7, sp, #0
 3579              		.cfi_def_cfa_register 7
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     init_app();
 3580              		.loc 7 84 0
 3581 0f36 FFF7FEFF 		bl	init_app
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     graphic_initialize();
 3582              		.loc 7 85 0
 3583 0f3a FFF7FEFF 		bl	graphic_initialize
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     #ifndef SIMULATOR
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         graphics_clear_screen();
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     #endif
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT p = &ball;
 3584              		.loc 7 90 0
 3585 0f3e 134B     		ldr	r3, .L209
 3586 0f40 FB60     		str	r3, [r7, #12]
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT Lpad = &Lpaddle;
 3587              		.loc 7 91 0
 3588 0f42 134B     		ldr	r3, .L209+4
 3589 0f44 BB60     		str	r3, [r7, #8]
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT Rpad = &Rpaddle;
 3590              		.loc 7 92 0
 3591 0f46 134B     		ldr	r3, .L209+8
 3592 0f48 7B60     		str	r3, [r7, #4]
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     p->set_speed(p, 4, 4);
 3593              		.loc 7 94 0
 3594 0f4a FB68     		ldr	r3, [r7, #12]
 3595 0f4c 1B6A     		ldr	r3, [r3, #32]
 3596 0f4e F868     		ldr	r0, [r7, #12]
 3597 0f50 0422     		movs	r2, #4
 3598 0f52 0421     		movs	r1, #4
 3599 0f54 9847     		blx	r3
 3600              	.LVL2:
 3601              	.L208:
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     while(1){
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         //writeScore();
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 		
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         //array move
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 		movePaddles(keyb());
 3602              		.loc 7 101 0 discriminator 1
 3603 0f56 FFF7FEFF 		bl	keyb
 3604 0f5a 0300     		movs	r3, r0
 3605 0f5c 1800     		movs	r0, r3
 3606 0f5e FFF7FEFF 		bl	movePaddles
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 		//unsigned char c = keyb()[1];
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 		//movePaddles(keyb()[0], keyb()[2] );
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         p->move(p);
 3607              		.loc 7 105 0 discriminator 1
 3608 0f62 FB68     		ldr	r3, [r7, #12]
 3609 0f64 DB69     		ldr	r3, [r3, #28]
 3610 0f66 FA68     		ldr	r2, [r7, #12]
 3611 0f68 1000     		movs	r0, r2
 3612 0f6a 9847     		blx	r3
 3613              	.LVL3:
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         Lpad->move(Lpad);
 3614              		.loc 7 106 0 discriminator 1
 3615 0f6c BB68     		ldr	r3, [r7, #8]
 3616 0f6e DB69     		ldr	r3, [r3, #28]
 3617 0f70 BA68     		ldr	r2, [r7, #8]
 3618 0f72 1000     		movs	r0, r2
 3619 0f74 9847     		blx	r3
 3620              	.LVL4:
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         Rpad->move(Rpad);
 3621              		.loc 7 107 0 discriminator 1
 3622 0f76 7B68     		ldr	r3, [r7, #4]
 3623 0f78 DB69     		ldr	r3, [r3, #28]
 3624 0f7a 7A68     		ldr	r2, [r7, #4]
 3625 0f7c 1000     		movs	r0, r2
 3626 0f7e 9847     		blx	r3
 3627              	.LVL5:
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         delay_milli(40);
 3628              		.loc 7 109 0 discriminator 1
 3629 0f80 2820     		movs	r0, #40
 3630 0f82 FFF7FEFF 		bl	delay_milli
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         graphics_clear_screen();
 3631              		.loc 7 110 0 discriminator 1
 3632 0f86 FFF7FEFF 		bl	graphics_clear_screen
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 		//unsigned char c = keyb()[1];
 3633              		.loc 7 101 0 discriminator 1
 3634 0f8a E4E7     		b	.L208
 3635              	.L210:
 3636              		.align	2
 3637              	.L209:
 3638 0f8c 00000000 		.word	ball
 3639 0f90 00000000 		.word	Lpaddle
 3640 0f94 00000000 		.word	Rpaddle
 3641              		.cfi_endproc
 3642              	.LFE41:
 3644              	.Letext0:
