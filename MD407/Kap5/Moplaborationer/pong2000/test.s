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
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/delay.h ****         //Continue executing code efficently/.
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
 1250              		.global	set_object_speed
 1251              		.syntax unified
 1252              		.code	16
 1253              		.thumb_func
 1254              		.fpu softvfp
 1256              	set_object_speed:
 1257              	.LFB16:
 1258              		.file 3 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h"
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
 1259              		.loc 3 30 0
 1260              		.cfi_startproc
 1261              		@ args = 0, pretend = 0, frame = 16
 1262              		@ frame_needed = 1, uses_anonymous_args = 0
 1263 05ee 80B5     		push	{r7, lr}
 1264              		.cfi_def_cfa_offset 8
 1265              		.cfi_offset 7, -8
 1266              		.cfi_offset 14, -4
 1267 05f0 84B0     		sub	sp, sp, #16
 1268              		.cfi_def_cfa_offset 24
 1269 05f2 00AF     		add	r7, sp, #0
 1270              		.cfi_def_cfa_register 7
 1271 05f4 F860     		str	r0, [r7, #12]
 1272 05f6 B960     		str	r1, [r7, #8]
 1273 05f8 7A60     		str	r2, [r7, #4]
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         pObj->dirX = speedX;
 1274              		.loc 3 31 0
 1275 05fa FB68     		ldr	r3, [r7, #12]
 1276 05fc BA68     		ldr	r2, [r7, #8]
 1277 05fe 5A60     		str	r2, [r3, #4]
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         pObj->dirY = speedY;
 1278              		.loc 3 32 0
 1279 0600 FB68     		ldr	r3, [r7, #12]
 1280 0602 7A68     		ldr	r2, [r7, #4]
 1281 0604 9A60     		str	r2, [r3, #8]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 1282              		.loc 3 33 0
 1283 0606 C046     		nop
 1284 0608 BD46     		mov	sp, r7
 1285 060a 04B0     		add	sp, sp, #16
 1286              		@ sp needed
 1287 060c 80BD     		pop	{r7, pc}
 1288              		.cfi_endproc
 1289              	.LFE16:
 1291              		.align	1
 1292              		.global	draw_object
 1293              		.syntax unified
 1294              		.code	16
 1295              		.thumb_func
 1296              		.fpu softvfp
 1298              	draw_object:
 1299              	.LFB17:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** void draw_object(POBJECT pObj){
 1300              		.loc 3 35 0
 1301              		.cfi_startproc
 1302              		@ args = 0, pretend = 0, frame = 16
 1303              		@ frame_needed = 1, uses_anonymous_args = 0
 1304 060e 80B5     		push	{r7, lr}
 1305              		.cfi_def_cfa_offset 8
 1306              		.cfi_offset 7, -8
 1307              		.cfi_offset 14, -4
 1308 0610 84B0     		sub	sp, sp, #16
 1309              		.cfi_def_cfa_offset 24
 1310 0612 00AF     		add	r7, sp, #0
 1311              		.cfi_def_cfa_register 7
 1312 0614 7860     		str	r0, [r7, #4]
 1313              	.LBB4:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1314              		.loc 3 36 0
 1315 0616 0023     		movs	r3, #0
 1316 0618 FB60     		str	r3, [r7, #12]
 1317 061a 1FE0     		b	.L71
 1318              	.L72:
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 1);
 1319              		.loc 3 37 0 discriminator 3
 1320 061c 7B68     		ldr	r3, [r7, #4]
 1321 061e 1A68     		ldr	r2, [r3]
 1322 0620 FB68     		ldr	r3, [r7, #12]
 1323 0622 0433     		adds	r3, r3, #4
 1324 0624 5B00     		lsls	r3, r3, #1
 1325 0626 D318     		adds	r3, r2, r3
 1326 0628 0433     		adds	r3, r3, #4
 1327 062a 1B78     		ldrb	r3, [r3]
 1328 062c 1A00     		movs	r2, r3
 1329 062e 7B68     		ldr	r3, [r7, #4]
 1330 0630 DB68     		ldr	r3, [r3, #12]
 1331 0632 D318     		adds	r3, r2, r3
 1332 0634 1800     		movs	r0, r3
 1333 0636 7B68     		ldr	r3, [r7, #4]
 1334 0638 1A68     		ldr	r2, [r3]
 1335 063a FB68     		ldr	r3, [r7, #12]
 1336 063c 0433     		adds	r3, r3, #4
 1337 063e 5B00     		lsls	r3, r3, #1
 1338 0640 D318     		adds	r3, r2, r3
 1339 0642 0533     		adds	r3, r3, #5
 1340 0644 1B78     		ldrb	r3, [r3]
 1341 0646 1A00     		movs	r2, r3
 1342 0648 7B68     		ldr	r3, [r7, #4]
 1343 064a 1B69     		ldr	r3, [r3, #16]
 1344 064c D318     		adds	r3, r2, r3
 1345 064e 0122     		movs	r2, #1
 1346 0650 1900     		movs	r1, r3
 1347 0652 FFF7FEFF 		bl	pixel
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1348              		.loc 3 36 0 discriminator 3
 1349 0656 FB68     		ldr	r3, [r7, #12]
 1350 0658 0133     		adds	r3, r3, #1
 1351 065a FB60     		str	r3, [r7, #12]
 1352              	.L71:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1353              		.loc 3 36 0 is_stmt 0 discriminator 1
 1354 065c FB68     		ldr	r3, [r7, #12]
 1355 065e 4A2B     		cmp	r3, #74
 1356 0660 DCDD     		ble	.L72
 1357              	.LBE4:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         }
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 1358              		.loc 3 39 0 is_stmt 1
 1359 0662 C046     		nop
 1360 0664 BD46     		mov	sp, r7
 1361 0666 04B0     		add	sp, sp, #16
 1362              		@ sp needed
 1363 0668 80BD     		pop	{r7, pc}
 1364              		.cfi_endproc
 1365              	.LFE17:
 1367              		.align	1
 1368              		.global	clear_object
 1369              		.syntax unified
 1370              		.code	16
 1371              		.thumb_func
 1372              		.fpu softvfp
 1374              	clear_object:
 1375              	.LFB18:
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h **** void clear_object(POBJECT pObj){
 1376              		.loc 3 41 0
 1377              		.cfi_startproc
 1378              		@ args = 0, pretend = 0, frame = 16
 1379              		@ frame_needed = 1, uses_anonymous_args = 0
 1380 066a 80B5     		push	{r7, lr}
 1381              		.cfi_def_cfa_offset 8
 1382              		.cfi_offset 7, -8
 1383              		.cfi_offset 14, -4
 1384 066c 84B0     		sub	sp, sp, #16
 1385              		.cfi_def_cfa_offset 24
 1386 066e 00AF     		add	r7, sp, #0
 1387              		.cfi_def_cfa_register 7
 1388 0670 7860     		str	r0, [r7, #4]
 1389              	.LBB5:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1390              		.loc 3 42 0
 1391 0672 0023     		movs	r3, #0
 1392 0674 FB60     		str	r3, [r7, #12]
 1393 0676 1FE0     		b	.L74
 1394              	.L75:
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 0);
 1395              		.loc 3 43 0 discriminator 3
 1396 0678 7B68     		ldr	r3, [r7, #4]
 1397 067a 1A68     		ldr	r2, [r3]
 1398 067c FB68     		ldr	r3, [r7, #12]
 1399 067e 0433     		adds	r3, r3, #4
 1400 0680 5B00     		lsls	r3, r3, #1
 1401 0682 D318     		adds	r3, r2, r3
 1402 0684 0433     		adds	r3, r3, #4
 1403 0686 1B78     		ldrb	r3, [r3]
 1404 0688 1A00     		movs	r2, r3
 1405 068a 7B68     		ldr	r3, [r7, #4]
 1406 068c DB68     		ldr	r3, [r3, #12]
 1407 068e D318     		adds	r3, r2, r3
 1408 0690 1800     		movs	r0, r3
 1409 0692 7B68     		ldr	r3, [r7, #4]
 1410 0694 1A68     		ldr	r2, [r3]
 1411 0696 FB68     		ldr	r3, [r7, #12]
 1412 0698 0433     		adds	r3, r3, #4
 1413 069a 5B00     		lsls	r3, r3, #1
 1414 069c D318     		adds	r3, r2, r3
 1415 069e 0533     		adds	r3, r3, #5
 1416 06a0 1B78     		ldrb	r3, [r3]
 1417 06a2 1A00     		movs	r2, r3
 1418 06a4 7B68     		ldr	r3, [r7, #4]
 1419 06a6 1B69     		ldr	r3, [r3, #16]
 1420 06a8 D318     		adds	r3, r2, r3
 1421 06aa 0022     		movs	r2, #0
 1422 06ac 1900     		movs	r1, r3
 1423 06ae FFF7FEFF 		bl	pixel
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1424              		.loc 3 42 0 discriminator 3
 1425 06b2 FB68     		ldr	r3, [r7, #12]
 1426 06b4 0133     		adds	r3, r3, #1
 1427 06b6 FB60     		str	r3, [r7, #12]
 1428              	.L74:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1429              		.loc 3 42 0 is_stmt 0 discriminator 1
 1430 06b8 FB68     		ldr	r3, [r7, #12]
 1431 06ba 4A2B     		cmp	r3, #74
 1432 06bc DCDD     		ble	.L75
 1433              	.LBE5:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****         }
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/object.h ****     }
 1434              		.loc 3 45 0 is_stmt 1
 1435 06be C046     		nop
 1436 06c0 BD46     		mov	sp, r7
 1437 06c2 04B0     		add	sp, sp, #16
 1438              		@ sp needed
 1439 06c4 80BD     		pop	{r7, pc}
 1440              		.cfi_endproc
 1441              	.LFE18:
 1443              		.align	1
 1444              		.global	move_paddle
 1445              		.syntax unified
 1446              		.code	16
 1447              		.thumb_func
 1448              		.fpu softvfp
 1450              	move_paddle:
 1451              	.LFB19:
 1452              		.file 4 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** extern OBJECT Rpaddle;
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** extern OBJECT Lpaddle;
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** void move_paddle(POBJECT this) {
 1453              		.loc 4 4 0
 1454              		.cfi_startproc
 1455              		@ args = 0, pretend = 0, frame = 8
 1456              		@ frame_needed = 1, uses_anonymous_args = 0
 1457 06c6 80B5     		push	{r7, lr}
 1458              		.cfi_def_cfa_offset 8
 1459              		.cfi_offset 7, -8
 1460              		.cfi_offset 14, -4
 1461 06c8 82B0     		sub	sp, sp, #8
 1462              		.cfi_def_cfa_offset 16
 1463 06ca 00AF     		add	r7, sp, #0
 1464              		.cfi_def_cfa_register 7
 1465 06cc 7860     		str	r0, [r7, #4]
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	clear_object(this);
 1466              		.loc 4 5 0
 1467 06ce 7B68     		ldr	r3, [r7, #4]
 1468 06d0 1800     		movs	r0, r3
 1469 06d2 FFF7FEFF 		bl	clear_object
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** 	this->draw(this);
 1470              		.loc 4 6 0
 1471 06d6 7B68     		ldr	r3, [r7, #4]
 1472 06d8 5B69     		ldr	r3, [r3, #20]
 1473 06da 7A68     		ldr	r2, [r7, #4]
 1474 06dc 1000     		movs	r0, r2
 1475 06de 9847     		blx	r3
 1476              	.LVL0:
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/paddle.h **** }
 1477              		.loc 4 7 0
 1478 06e0 C046     		nop
 1479 06e2 BD46     		mov	sp, r7
 1480 06e4 02B0     		add	sp, sp, #8
 1481              		@ sp needed
 1482 06e6 80BD     		pop	{r7, pc}
 1483              		.cfi_endproc
 1484              	.LFE19:
 1486              		.global	paddle_geometry
 1487              		.data
 1488              		.align	2
 1491              	paddle_geometry:
 1492 0000 4B000000 		.word	75
 1493 0004 02000000 		.word	2
 1494 0008 19000000 		.word	25
 1495 000c 00       		.byte	0
 1496 000d 01       		.byte	1
 1497 000e 00       		.byte	0
 1498 000f 02       		.byte	2
 1499 0010 00       		.byte	0
 1500 0011 03       		.byte	3
 1501 0012 00       		.byte	0
 1502 0013 04       		.byte	4
 1503 0014 00       		.byte	0
 1504 0015 05       		.byte	5
 1505 0016 00       		.byte	0
 1506 0017 06       		.byte	6
 1507 0018 00       		.byte	0
 1508 0019 07       		.byte	7
 1509 001a 00       		.byte	0
 1510 001b 08       		.byte	8
 1511 001c 00       		.byte	0
 1512 001d 09       		.byte	9
 1513 001e 00       		.byte	0
 1514 001f 0A       		.byte	10
 1515 0020 00       		.byte	0
 1516 0021 0B       		.byte	11
 1517 0022 00       		.byte	0
 1518 0023 0C       		.byte	12
 1519 0024 00       		.byte	0
 1520 0025 0D       		.byte	13
 1521 0026 00       		.byte	0
 1522 0027 0E       		.byte	14
 1523 0028 00       		.byte	0
 1524 0029 0F       		.byte	15
 1525 002a 00       		.byte	0
 1526 002b 10       		.byte	16
 1527 002c 00       		.byte	0
 1528 002d 11       		.byte	17
 1529 002e 00       		.byte	0
 1530 002f 12       		.byte	18
 1531 0030 00       		.byte	0
 1532 0031 13       		.byte	19
 1533 0032 00       		.byte	0
 1534 0033 14       		.byte	20
 1535 0034 00       		.byte	0
 1536 0035 15       		.byte	21
 1537 0036 00       		.byte	0
 1538 0037 16       		.byte	22
 1539 0038 00       		.byte	0
 1540 0039 17       		.byte	23
 1541 003a 00       		.byte	0
 1542 003b 18       		.byte	24
 1543 003c 00       		.byte	0
 1544 003d 19       		.byte	25
 1545 003e 01       		.byte	1
 1546 003f 01       		.byte	1
 1547 0040 01       		.byte	1
 1548 0041 02       		.byte	2
 1549 0042 01       		.byte	1
 1550 0043 03       		.byte	3
 1551 0044 01       		.byte	1
 1552 0045 04       		.byte	4
 1553 0046 01       		.byte	1
 1554 0047 05       		.byte	5
 1555 0048 01       		.byte	1
 1556 0049 06       		.byte	6
 1557 004a 01       		.byte	1
 1558 004b 07       		.byte	7
 1559 004c 01       		.byte	1
 1560 004d 08       		.byte	8
 1561 004e 01       		.byte	1
 1562 004f 09       		.byte	9
 1563 0050 01       		.byte	1
 1564 0051 0A       		.byte	10
 1565 0052 01       		.byte	1
 1566 0053 0B       		.byte	11
 1567 0054 01       		.byte	1
 1568 0055 0C       		.byte	12
 1569 0056 01       		.byte	1
 1570 0057 0D       		.byte	13
 1571 0058 01       		.byte	1
 1572 0059 0E       		.byte	14
 1573 005a 01       		.byte	1
 1574 005b 0F       		.byte	15
 1575 005c 01       		.byte	1
 1576 005d 10       		.byte	16
 1577 005e 01       		.byte	1
 1578 005f 11       		.byte	17
 1579 0060 01       		.byte	1
 1580 0061 12       		.byte	18
 1581 0062 01       		.byte	1
 1582 0063 13       		.byte	19
 1583 0064 01       		.byte	1
 1584 0065 14       		.byte	20
 1585 0066 01       		.byte	1
 1586 0067 15       		.byte	21
 1587 0068 01       		.byte	1
 1588 0069 16       		.byte	22
 1589 006a 01       		.byte	1
 1590 006b 17       		.byte	23
 1591 006c 01       		.byte	1
 1592 006d 18       		.byte	24
 1593 006e 01       		.byte	1
 1594 006f 19       		.byte	25
 1595 0070 02       		.byte	2
 1596 0071 01       		.byte	1
 1597 0072 02       		.byte	2
 1598 0073 02       		.byte	2
 1599 0074 02       		.byte	2
 1600 0075 03       		.byte	3
 1601 0076 02       		.byte	2
 1602 0077 04       		.byte	4
 1603 0078 02       		.byte	2
 1604 0079 05       		.byte	5
 1605 007a 02       		.byte	2
 1606 007b 06       		.byte	6
 1607 007c 02       		.byte	2
 1608 007d 07       		.byte	7
 1609 007e 02       		.byte	2
 1610 007f 08       		.byte	8
 1611 0080 02       		.byte	2
 1612 0081 09       		.byte	9
 1613 0082 02       		.byte	2
 1614 0083 0A       		.byte	10
 1615 0084 02       		.byte	2
 1616 0085 0B       		.byte	11
 1617 0086 02       		.byte	2
 1618 0087 0C       		.byte	12
 1619 0088 02       		.byte	2
 1620 0089 0D       		.byte	13
 1621 008a 02       		.byte	2
 1622 008b 0E       		.byte	14
 1623 008c 02       		.byte	2
 1624 008d 0F       		.byte	15
 1625 008e 02       		.byte	2
 1626 008f 10       		.byte	16
 1627 0090 02       		.byte	2
 1628 0091 11       		.byte	17
 1629 0092 02       		.byte	2
 1630 0093 12       		.byte	18
 1631 0094 02       		.byte	2
 1632 0095 13       		.byte	19
 1633 0096 02       		.byte	2
 1634 0097 14       		.byte	20
 1635 0098 02       		.byte	2
 1636 0099 15       		.byte	21
 1637 009a 02       		.byte	2
 1638 009b 16       		.byte	22
 1639 009c 02       		.byte	2
 1640 009d 17       		.byte	23
 1641 009e 02       		.byte	2
 1642 009f 18       		.byte	24
 1643 00a0 02       		.byte	2
 1644 00a1 19       		.byte	25
 1645 00a2 0000     		.space	2
 1646              		.global	Rpaddle
 1647              		.align	2
 1650              	Rpaddle:
 1651 00a4 00000000 		.word	paddle_geometry
 1652 00a8 00000000 		.word	0
 1653 00ac 00000000 		.word	0
 1654 00b0 78000000 		.word	120
 1655 00b4 01000000 		.word	1
 1656 00b8 00000000 		.word	draw_object
 1657 00bc 00000000 		.word	clear_object
 1658 00c0 00000000 		.word	move_paddle
 1659 00c4 00000000 		.word	set_object_speed
 1660              		.global	Lpaddle
 1661              		.align	2
 1664              	Lpaddle:
 1665 00c8 00000000 		.word	paddle_geometry
 1666 00cc 00000000 		.word	0
 1667 00d0 00000000 		.word	0
 1668 00d4 01000000 		.word	1
 1669 00d8 01000000 		.word	1
 1670 00dc 00000000 		.word	draw_object
 1671 00e0 00000000 		.word	clear_object
 1672 00e4 00000000 		.word	move_paddle
 1673 00e8 00000000 		.word	set_object_speed
 1674              		.text
 1675              		.align	1
 1676              		.global	move_ball
 1677              		.syntax unified
 1678              		.code	16
 1679              		.thumb_func
 1680              		.fpu softvfp
 1682              	move_ball:
 1683              	.LFB20:
 1684              		.file 5 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** #include "object.h"
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** #include "paddle.h"
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** void move_ball(POBJECT this) {
 1685              		.loc 5 4 0
 1686              		.cfi_startproc
 1687              		@ args = 0, pretend = 0, frame = 8
 1688              		@ frame_needed = 1, uses_anonymous_args = 0
 1689 06e8 80B5     		push	{r7, lr}
 1690              		.cfi_def_cfa_offset 8
 1691              		.cfi_offset 7, -8
 1692              		.cfi_offset 14, -4
 1693 06ea 82B0     		sub	sp, sp, #8
 1694              		.cfi_def_cfa_offset 16
 1695 06ec 00AF     		add	r7, sp, #0
 1696              		.cfi_def_cfa_register 7
 1697 06ee 7860     		str	r0, [r7, #4]
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	clear_object(this);
 1698              		.loc 5 5 0
 1699 06f0 7B68     		ldr	r3, [r7, #4]
 1700 06f2 1800     		movs	r0, r3
 1701 06f4 FFF7FEFF 		bl	clear_object
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** 	this->draw(this);
 1702              		.loc 5 6 0
 1703 06f8 7B68     		ldr	r3, [r7, #4]
 1704 06fa 5B69     		ldr	r3, [r3, #20]
 1705 06fc 7A68     		ldr	r2, [r7, #4]
 1706 06fe 1000     		movs	r0, r2
 1707 0700 9847     		blx	r3
 1708              	.LVL1:
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/ball.h **** }
 1709              		.loc 5 7 0
 1710 0702 C046     		nop
 1711 0704 BD46     		mov	sp, r7
 1712 0706 02B0     		add	sp, sp, #8
 1713              		@ sp needed
 1714 0708 80BD     		pop	{r7, pc}
 1715              		.cfi_endproc
 1716              	.LFE20:
 1718              		.global	ball_geometry
 1719              		.data
 1720              		.align	2
 1723              	ball_geometry:
 1724 00ec 0C000000 		.word	12
 1725 00f0 04000000 		.word	4
 1726 00f4 04000000 		.word	4
 1727 00f8 00       		.byte	0
 1728 00f9 01       		.byte	1
 1729 00fa 00       		.byte	0
 1730 00fb 02       		.byte	2
 1731 00fc 01       		.byte	1
 1732 00fd 00       		.byte	0
 1733 00fe 01       		.byte	1
 1734 00ff 01       		.byte	1
 1735 0100 01       		.byte	1
 1736 0101 02       		.byte	2
 1737 0102 01       		.byte	1
 1738 0103 03       		.byte	3
 1739 0104 02       		.byte	2
 1740 0105 00       		.byte	0
 1741 0106 02       		.byte	2
 1742 0107 01       		.byte	1
 1743 0108 02       		.byte	2
 1744 0109 02       		.byte	2
 1745 010a 02       		.byte	2
 1746 010b 03       		.byte	3
 1747 010c 03       		.byte	3
 1748 010d 01       		.byte	1
 1749 010e 03       		.byte	3
 1750 010f 02       		.byte	2
 1751 0110 00000000 		.space	126
 1751      00000000 
 1751      00000000 
 1751      00000000 
 1751      00000000 
 1752 018e 0000     		.space	2
 1753              		.global	ball
 1754              		.align	2
 1757              	ball:
 1758 0190 00000000 		.word	ball_geometry
 1759 0194 00000000 		.word	0
 1760 0198 00000000 		.word	0
 1761 019c 01000000 		.word	1
 1762 01a0 01000000 		.word	1
 1763 01a4 00000000 		.word	draw_object
 1764 01a8 00000000 		.word	clear_object
 1765 01ac 00000000 		.word	move_ball
 1766 01b0 00000000 		.word	set_object_speed
 1767              		.section	.start_section,"ax",%progbits
 1768              		.align	1
 1769              		.global	startup
 1770              		.syntax unified
 1771              		.code	16
 1772              		.thumb_func
 1773              		.fpu softvfp
 1775              	startup:
 1776              	.LFB21:
 1777              		.file 6 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #define SIMULATOR
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "registers.h"
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "delay.h"
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "graphics.h"
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "object.h"
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** #include "ball.h"
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** extern OBJECT ball;
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****  
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void startup ( void )
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** {
 1778              		.loc 6 18 0
 1779              		.cfi_startproc
 1780              		@ Naked Function: prologue and epilogue provided by programmer.
 1781              		@ args = 0, pretend = 0, frame = 0
 1782              		@ frame_needed = 1, uses_anonymous_args = 0
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** asm volatile(
 1783              		.loc 6 19 0
 1784              		.syntax divided
 1785              	@ 19 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c" 1
 1786 0000 0248     		 LDR R0,=0x2001C000
 1787 0002 8546     	 MOV SP,R0
 1788 0004 FFF7FEFF 	 BL main
 1789 0008 FEE7     	.L1: B .L1
 1790              	
 1791              	@ 0 "" 2
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" MOV SP,R0\n"
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	" BL main\n"				/* call main */
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	".L1: B .L1\n"				/* never return */
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 	) ;
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** }
 1792              		.loc 6 25 0
 1793              		.thumb
 1794              		.syntax unified
 1795 000a C046     		nop
 1796              		.cfi_endproc
 1797              	.LFE21:
 1799              		.text
 1800              		.align	1
 1801              		.global	init_app
 1802              		.syntax unified
 1803              		.code	16
 1804              		.thumb_func
 1805              		.fpu softvfp
 1807              	init_app:
 1808              	.LFB22:
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void init_app(void){
 1809              		.loc 6 27 0
 1810              		.cfi_startproc
 1811              		@ args = 0, pretend = 0, frame = 0
 1812              		@ frame_needed = 1, uses_anonymous_args = 0
 1813 070a 80B5     		push	{r7, lr}
 1814              		.cfi_def_cfa_offset 8
 1815              		.cfi_offset 7, -8
 1816              		.cfi_offset 14, -4
 1817 070c 00AF     		add	r7, sp, #0
 1818              		.cfi_def_cfa_register 7
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         *GPIO_E_MODER = 0x55555555;
 1819              		.loc 6 28 0
 1820 070e 034B     		ldr	r3, .L80
 1821 0710 034A     		ldr	r2, .L80+4
 1822 0712 1A60     		str	r2, [r3]
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     }
 1823              		.loc 6 29 0
 1824 0714 C046     		nop
 1825 0716 BD46     		mov	sp, r7
 1826              		@ sp needed
 1827 0718 80BD     		pop	{r7, pc}
 1828              	.L81:
 1829 071a C046     		.align	2
 1830              	.L80:
 1831 071c 00100240 		.word	1073876992
 1832 0720 55555555 		.word	1431655765
 1833              		.cfi_endproc
 1834              	.LFE22:
 1836              		.align	1
 1837              		.global	main
 1838              		.syntax unified
 1839              		.code	16
 1840              		.thumb_func
 1841              		.fpu softvfp
 1843              	main:
 1844              	.LFB23:
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** void main(void)
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** {
 1845              		.loc 6 32 0
 1846              		.cfi_startproc
 1847              		@ args = 0, pretend = 0, frame = 16
 1848              		@ frame_needed = 1, uses_anonymous_args = 0
 1849 0724 80B5     		push	{r7, lr}
 1850              		.cfi_def_cfa_offset 8
 1851              		.cfi_offset 7, -8
 1852              		.cfi_offset 14, -4
 1853 0726 84B0     		sub	sp, sp, #16
 1854              		.cfi_def_cfa_offset 24
 1855 0728 00AF     		add	r7, sp, #0
 1856              		.cfi_def_cfa_register 7
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     init_app();
 1857              		.loc 6 33 0
 1858 072a FFF7FEFF 		bl	init_app
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     graphic_initialize();
 1859              		.loc 6 34 0
 1860 072e FFF7FEFF 		bl	graphic_initialize
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     #ifndef SIMULATOR
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         graphics_clear_screen();
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     #endif
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c **** 
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT p = &ball;
 1861              		.loc 6 40 0
 1862 0732 0F4B     		ldr	r3, .L84
 1863 0734 FB60     		str	r3, [r7, #12]
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT Lpad = &Lpaddle;
 1864              		.loc 6 41 0
 1865 0736 0F4B     		ldr	r3, .L84+4
 1866 0738 BB60     		str	r3, [r7, #8]
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     POBJECT Rpad = &Rpaddle;
 1867              		.loc 6 42 0
 1868 073a 0F4B     		ldr	r3, .L84+8
 1869 073c 7B60     		str	r3, [r7, #4]
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     p->set_speed(p, 4, 4);
 1870              		.loc 6 44 0
 1871 073e FB68     		ldr	r3, [r7, #12]
 1872 0740 1B6A     		ldr	r3, [r3, #32]
 1873 0742 F868     		ldr	r0, [r7, #12]
 1874 0744 0422     		movs	r2, #4
 1875 0746 0421     		movs	r1, #4
 1876 0748 9847     		blx	r3
 1877              	.LVL2:
 1878              	.L83:
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****     while(1){
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         p->move(p);
 1879              		.loc 6 47 0 discriminator 1
 1880 074a FB68     		ldr	r3, [r7, #12]
 1881 074c DB69     		ldr	r3, [r3, #28]
 1882 074e FA68     		ldr	r2, [r7, #12]
 1883 0750 1000     		movs	r0, r2
 1884 0752 9847     		blx	r3
 1885              	.LVL3:
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         delay_milli(40);
 1886              		.loc 6 48 0 discriminator 1
 1887 0754 2820     		movs	r0, #40
 1888 0756 FFF7FEFF 		bl	delay_milli
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         Lpad->move(Lpad);
 1889              		.loc 6 49 0 discriminator 1
 1890 075a BB68     		ldr	r3, [r7, #8]
 1891 075c DB69     		ldr	r3, [r3, #28]
 1892 075e BA68     		ldr	r2, [r7, #8]
 1893 0760 1000     		movs	r0, r2
 1894 0762 9847     		blx	r3
 1895              	.LVL4:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         Rpad->move(Rpad);
 1896              		.loc 6 50 0 discriminator 1
 1897 0764 7B68     		ldr	r3, [r7, #4]
 1898 0766 DB69     		ldr	r3, [r3, #28]
 1899 0768 7A68     		ldr	r2, [r7, #4]
 1900 076a 1000     		movs	r0, r2
 1901 076c 9847     		blx	r3
 1902              	.LVL5:
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/pong2000/startup.c ****         delay_milli(40);
 1903              		.loc 6 47 0 discriminator 1
 1904 076e ECE7     		b	.L83
 1905              	.L85:
 1906              		.align	2
 1907              	.L84:
 1908 0770 00000000 		.word	ball
 1909 0774 00000000 		.word	Lpaddle
 1910 0778 00000000 		.word	Rpaddle
 1911              		.cfi_endproc
 1912              	.LFE23:
 1914              	.Letext0:
