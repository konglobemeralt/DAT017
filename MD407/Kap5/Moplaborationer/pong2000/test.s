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
  24              		.file 1 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/delay.h"
   1:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** /*
   2:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****  * 	delay.h
   3:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****  *
   4:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****  */
   5:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** // Timer setup
   6:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** #ifndef TIMER_H
   7:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** #define TIMER_H
   8:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 
   9:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** #define STK 0xE000E010
  10:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** #define STK_CTRL ((volatile unsigned int *) (STK))
  11:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
  12:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
  13:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 
  14:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** void delay_250ns(void) {
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
  15:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	*STK_CTRL = 0;
  35              		.loc 1 15 0
  36 0004 0C4B     		ldr	r3, .L3
  37 0006 0022     		movs	r2, #0
  38 0008 1A60     		str	r2, [r3]
  16:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  39              		.loc 1 16 0
  40 000a 0C4B     		ldr	r3, .L3+4
  41 000c 3122     		movs	r2, #49
  42 000e 1A60     		str	r2, [r3]
  17:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	*STK_VAL = 0;
  43              		.loc 1 17 0
  44 0010 0B4B     		ldr	r3, .L3+8
  45 0012 0022     		movs	r2, #0
  46 0014 1A60     		str	r2, [r3]
  18:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	*STK_CTRL = 5;
  47              		.loc 1 18 0
  48 0016 084B     		ldr	r3, .L3
  49 0018 0522     		movs	r2, #5
  50 001a 1A60     		str	r2, [r3]
  19:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	while((*STK_CTRL & 0x10000) == 0) {
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
  20:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		// ??????
  21:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	}
  22:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	*STK_CTRL = 0;
  61              		.loc 1 22 0 is_stmt 1
  62 002a 034B     		ldr	r3, .L3
  63 002c 0022     		movs	r2, #0
  64 002e 1A60     		str	r2, [r3]
  23:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** }
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
  24:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 
  25:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** void delay500ns(){
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
  26:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****     //Delay 500ns in the most efficient way:
  27:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****         delay_250ns();
  98              		.loc 1 27 0
  99 0048 FFF7FEFF 		bl	delay_250ns
  28:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****         delay_250ns();
 100              		.loc 1 28 0
 101 004c FFF7FEFF 		bl	delay_250ns
  29:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****         //Continue executing code efficently.
  30:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h ****         }
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
  31:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 
  32:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** void delay_micro(unsigned int us) {
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
  33:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	while(us--) {
 132              		.loc 1 33 0
 133 005e 07E0     		b	.L7
 134              	.L8:
  34:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		delay_250ns();
 135              		.loc 1 34 0
 136 0060 FFF7FEFF 		bl	delay_250ns
  35:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		delay_250ns();
 137              		.loc 1 35 0
 138 0064 FFF7FEFF 		bl	delay_250ns
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		delay_250ns();
 139              		.loc 1 36 0
 140 0068 FFF7FEFF 		bl	delay_250ns
  37:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		delay_250ns();
 141              		.loc 1 37 0
 142 006c FFF7FEFF 		bl	delay_250ns
 143              	.L7:
  33:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		delay_250ns();
 144              		.loc 1 33 0
 145 0070 7B68     		ldr	r3, [r7, #4]
 146 0072 5A1E     		subs	r2, r3, #1
 147 0074 7A60     		str	r2, [r7, #4]
 148 0076 002B     		cmp	r3, #0
 149 0078 F2D1     		bne	.L8
  38:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	}
  39:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** }
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
  40:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 
  41:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** void delay_milli(unsigned int ms) {
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
  42:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	#ifdef SIMULATOR
  43:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		delay_micro(ms);
 181              		.loc 1 43 0
 182 008a 7B68     		ldr	r3, [r7, #4]
 183 008c 1800     		movs	r0, r3
 184 008e FFF7FEFF 		bl	delay_micro
  44:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	#else
  45:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 		delay_micro(1000 * ms);
  46:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** 	#endif
  47:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\delay.h **** }
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
 203              		.file 2 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/graphics.h"
   1:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** /*
   2:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****  * 	graphics.h
   3:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****  *
   4:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****  */
   5:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
   6:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #ifndef GRAPHICS_H
   7:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define GRAPHICS_H
   8:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
   9:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #include "delay.h"
  10:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** // Control for display
  11:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define B_E 0x40
  12:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define B_SELECT 0x04
  13:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define B_RW 0x02
  14:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define B_RS 0x01
  15:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  16:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define B_RST 0x20
  17:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define B_CS2 0x10
  18:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define B_CS1 0x08
  19:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  20:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define LCD_ON 0x3F
  21:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define LCD_OFF 0x3E
  22:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define LCD_DISP_START 0xC0
  23:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define LCD_SET_ADD 0x40
  24:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define LCD_SET_PAGE 0xB8
  25:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define LCD_BUSY 0x80
  26:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  27:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define PAGE 8
  28:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define ADD 63
  29:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  30:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define SCREEN_WIDTH  127
  31:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** #define SCREEN_HEIGHT 63
  32:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  33:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** typedef unsigned char uint8_t;
  34:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  35:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphics_ctrl_bit_set(uint8_t x){
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
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_ODR_LOW |= (x & ~B_SELECT);
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
  37:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
  38:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  39:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphics_ctrl_bit_clear(uint8_t x){
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
  40:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_ODR_LOW &= ~x;
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
  41:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
  42:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  43:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void select_controller(uint8_t controller){
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
  44:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(controller == 0) {
 324              		.loc 2 44 0
 325 0110 FB1D     		adds	r3, r7, #7
 326 0112 1B78     		ldrb	r3, [r3]
 327 0114 002B     		cmp	r3, #0
 328 0116 06D1     		bne	.L17
  45:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 329              		.loc 2 45 0
 330 0118 0820     		movs	r0, #8
 331 011a FFF7FEFF 		bl	graphics_ctrl_bit_clear
  46:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 332              		.loc 2 46 0
 333 011e 1020     		movs	r0, #16
 334 0120 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  47:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
  48:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  49:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  50:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     } else if(controller == B_CS1) {
  51:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  52:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
  53:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     } else if(controller == B_CS2) {
  54:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
  55:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  56:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
  57:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
 335              		.loc 2 57 0
 336 0124 1FE0     		b	.L21
 337              	.L17:
  47:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
 338              		.loc 2 47 0
 339 0126 FB1D     		adds	r3, r7, #7
 340 0128 1B78     		ldrb	r3, [r3]
 341 012a 182B     		cmp	r3, #24
 342 012c 06D1     		bne	.L19
  48:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 343              		.loc 2 48 0
 344 012e 0820     		movs	r0, #8
 345 0130 FFF7FEFF 		bl	graphics_ctrl_bit_set
  49:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     } else if(controller == B_CS1) {
 346              		.loc 2 49 0
 347 0134 1020     		movs	r0, #16
 348 0136 FFF7FEFF 		bl	graphics_ctrl_bit_set
 349              		.loc 2 57 0
 350 013a 14E0     		b	.L21
 351              	.L19:
  50:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_CS1);
 352              		.loc 2 50 0
 353 013c FB1D     		adds	r3, r7, #7
 354 013e 1B78     		ldrb	r3, [r3]
 355 0140 082B     		cmp	r3, #8
 356 0142 06D1     		bne	.L20
  51:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 357              		.loc 2 51 0
 358 0144 0820     		movs	r0, #8
 359 0146 FFF7FEFF 		bl	graphics_ctrl_bit_set
  52:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     } else if(controller == B_CS2) {
 360              		.loc 2 52 0
 361 014a 1020     		movs	r0, #16
 362 014c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 363              		.loc 2 57 0
 364 0150 09E0     		b	.L21
 365              	.L20:
  53:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 366              		.loc 2 53 0
 367 0152 FB1D     		adds	r3, r7, #7
 368 0154 1B78     		ldrb	r3, [r3]
 369 0156 102B     		cmp	r3, #16
 370 0158 05D1     		bne	.L21
  54:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 371              		.loc 2 54 0
 372 015a 0820     		movs	r0, #8
 373 015c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  55:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
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
  58:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  59:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphic_wait_ready(){
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
  60:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_E);
 408              		.loc 2 60 0
 409 0174 4020     		movs	r0, #64
 410 0176 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  61:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_MODER = 0x00005555;
 411              		.loc 2 61 0
 412 017a 164B     		ldr	r3, .L28
 413 017c 164A     		ldr	r2, .L28+4
 414 017e 1A60     		str	r2, [r3]
  62:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 415              		.loc 2 62 0
 416 0180 0120     		movs	r0, #1
 417 0182 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  63:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_RW);
 418              		.loc 2 63 0
 419 0186 0220     		movs	r0, #2
 420 0188 FFF7FEFF 		bl	graphics_ctrl_bit_set
  64:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     delay500ns();
 421              		.loc 2 64 0
 422 018c FFF7FEFF 		bl	delay500ns
 423              	.L25:
 424              	.LBB2:
  65:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
  66:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     while(1) { // Wait for display not to be busy
  67:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_E);
 425              		.loc 2 67 0
 426 0190 4020     		movs	r0, #64
 427 0192 FFF7FEFF 		bl	graphics_ctrl_bit_set
  68:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         delay500ns();
 428              		.loc 2 68 0
 429 0196 FFF7FEFF 		bl	delay500ns
  69:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 		unsigned char busy = *GPIO_E_IDR_HIGH & LCD_BUSY;
 430              		.loc 2 69 0
 431 019a 104B     		ldr	r3, .L28+8
 432 019c 1B78     		ldrb	r3, [r3]
 433 019e DAB2     		uxtb	r2, r3
 434 01a0 FB1D     		adds	r3, r7, #7
 435 01a2 7F21     		movs	r1, #127
 436 01a4 8A43     		bics	r2, r1
 437 01a6 1A70     		strb	r2, [r3]
  70:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_clear(B_E);
 438              		.loc 2 70 0
 439 01a8 4020     		movs	r0, #64
 440 01aa FFF7FEFF 		bl	graphics_ctrl_bit_clear
  71:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         delay500ns();
 441              		.loc 2 71 0
 442 01ae FFF7FEFF 		bl	delay500ns
  72:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         //unsigned char i = *GPIO_IDR_HIGH;
  73:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         if(busy == 0) {
 443              		.loc 2 73 0
 444 01b2 FB1D     		adds	r3, r7, #7
 445 01b4 1B78     		ldrb	r3, [r3]
 446 01b6 002B     		cmp	r3, #0
 447 01b8 00D0     		beq	.L27
 448              	.LBE2:
  66:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphics_ctrl_bit_set(B_E);
 449              		.loc 2 66 0
 450 01ba E9E7     		b	.L25
 451              	.L27:
 452              	.LBB3:
  74:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****             break;
 453              		.loc 2 74 0
 454 01bc C046     		nop
 455              	.LBE3:
  75:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         }
  76:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
  77:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_E);
 456              		.loc 2 77 0
 457 01be 4020     		movs	r0, #64
 458 01c0 FFF7FEFF 		bl	graphics_ctrl_bit_set
  78:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_MODER = 0x55555555;
 459              		.loc 2 78 0
 460 01c4 034B     		ldr	r3, .L28
 461 01c6 064A     		ldr	r2, .L28+12
 462 01c8 1A60     		str	r2, [r3]
  79:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
  80:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
  81:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
  82:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** uint8_t graphic_read(uint8_t controller){
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
  83:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_E);
 503              		.loc 2 83 0
 504 01f0 4020     		movs	r0, #64
 505 01f2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  84:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_MODER = 0x00005555;
 506              		.loc 2 84 0
 507 01f6 1B4B     		ldr	r3, .L34
 508 01f8 1B4A     		ldr	r2, .L34+4
 509 01fa 1A60     		str	r2, [r3]
  85:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_RS | B_RW);
 510              		.loc 2 85 0
 511 01fc 0320     		movs	r0, #3
 512 01fe FFF7FEFF 		bl	graphics_ctrl_bit_set
  86:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     select_controller(controller);
 513              		.loc 2 86 0
 514 0202 FB1D     		adds	r3, r7, #7
 515 0204 1B78     		ldrb	r3, [r3]
 516 0206 1800     		movs	r0, r3
 517 0208 FFF7FEFF 		bl	select_controller
  87:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     delay500ns();
 518              		.loc 2 87 0
 519 020c FFF7FEFF 		bl	delay500ns
  88:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_E);
 520              		.loc 2 88 0
 521 0210 4020     		movs	r0, #64
 522 0212 FFF7FEFF 		bl	graphics_ctrl_bit_set
  89:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     delay500ns();
 523              		.loc 2 89 0
 524 0216 FFF7FEFF 		bl	delay500ns
  90:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
  91:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     uint8_t RV = *GPIO_E_IDR_HIGH;
 525              		.loc 2 91 0
 526 021a 144A     		ldr	r2, .L34+8
 527 021c 0F23     		movs	r3, #15
 528 021e FB18     		adds	r3, r7, r3
 529 0220 1278     		ldrb	r2, [r2]
 530 0222 1A70     		strb	r2, [r3]
  92:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_E);
 531              		.loc 2 92 0
 532 0224 4020     		movs	r0, #64
 533 0226 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  93:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_MODER = 0x55555555;
 534              		.loc 2 93 0
 535 022a 0E4B     		ldr	r3, .L34
 536 022c 104A     		ldr	r2, .L34+12
 537 022e 1A60     		str	r2, [r3]
  94:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
  95:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(controller == B_CS1){
 538              		.loc 2 95 0
 539 0230 FB1D     		adds	r3, r7, #7
 540 0232 1B78     		ldrb	r3, [r3]
 541 0234 082B     		cmp	r3, #8
 542 0236 04D1     		bne	.L31
  96:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         select_controller(B_CS1);
 543              		.loc 2 96 0
 544 0238 0820     		movs	r0, #8
 545 023a FFF7FEFF 		bl	select_controller
  97:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_wait_ready();
 546              		.loc 2 97 0
 547 023e FFF7FEFF 		bl	graphic_wait_ready
 548              	.L31:
  98:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
  99:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 100:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(controller == B_CS2){
 549              		.loc 2 100 0
 550 0242 FB1D     		adds	r3, r7, #7
 551 0244 1B78     		ldrb	r3, [r3]
 552 0246 102B     		cmp	r3, #16
 553 0248 04D1     		bne	.L32
 101:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         select_controller(B_CS2);
 554              		.loc 2 101 0
 555 024a 1020     		movs	r0, #16
 556 024c FFF7FEFF 		bl	select_controller
 102:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_wait_ready();
 557              		.loc 2 102 0
 558 0250 FFF7FEFF 		bl	graphic_wait_ready
 559              	.L32:
 103:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
 104:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 105:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     return RV;
 560              		.loc 2 105 0
 561 0254 0F23     		movs	r3, #15
 562 0256 FB18     		adds	r3, r7, r3
 563 0258 1B78     		ldrb	r3, [r3]
 106:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 107:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
 108:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 109:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphic_write(uint8_t value, uint8_t controller){
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
 110:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_ODR_HIGH = value;
 607              		.loc 2 110 0
 608 0286 1A4A     		ldr	r2, .L39
 609 0288 FB1D     		adds	r3, r7, #7
 610 028a 1B78     		ldrb	r3, [r3]
 611 028c 1370     		strb	r3, [r2]
 111:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     select_controller(controller);
 612              		.loc 2 111 0
 613 028e BB1D     		adds	r3, r7, #6
 614 0290 1B78     		ldrb	r3, [r3]
 615 0292 1800     		movs	r0, r3
 616 0294 FFF7FEFF 		bl	select_controller
 112:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     delay500ns();
 617              		.loc 2 112 0
 618 0298 FFF7FEFF 		bl	delay500ns
 113:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_E);
 619              		.loc 2 113 0
 620 029c 4020     		movs	r0, #64
 621 029e FFF7FEFF 		bl	graphics_ctrl_bit_set
 114:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     delay500ns();
 622              		.loc 2 114 0
 623 02a2 FFF7FEFF 		bl	delay500ns
 115:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_E);
 624              		.loc 2 115 0
 625 02a6 4020     		movs	r0, #64
 626 02a8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 116:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 117:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(controller & B_CS1){
 627              		.loc 2 117 0
 628 02ac BB1D     		adds	r3, r7, #6
 629 02ae 1B78     		ldrb	r3, [r3]
 630 02b0 0822     		movs	r2, #8
 631 02b2 1340     		ands	r3, r2
 632 02b4 04D0     		beq	.L37
 118:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         select_controller(B_CS1);
 633              		.loc 2 118 0
 634 02b6 0820     		movs	r0, #8
 635 02b8 FFF7FEFF 		bl	select_controller
 119:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_wait_ready();
 636              		.loc 2 119 0
 637 02bc FFF7FEFF 		bl	graphic_wait_ready
 638              	.L37:
 120:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
 121:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 122:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(controller & B_CS2){
 639              		.loc 2 122 0
 640 02c0 BB1D     		adds	r3, r7, #6
 641 02c2 1B78     		ldrb	r3, [r3]
 642 02c4 1022     		movs	r2, #16
 643 02c6 1340     		ands	r3, r2
 644 02c8 04D0     		beq	.L38
 123:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         select_controller(B_CS2);
 645              		.loc 2 123 0
 646 02ca 1020     		movs	r0, #16
 647 02cc FFF7FEFF 		bl	select_controller
 124:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_wait_ready();
 648              		.loc 2 124 0
 649 02d0 FFF7FEFF 		bl	graphic_wait_ready
 650              	.L38:
 125:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
 126:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 127:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     *GPIO_E_ODR_HIGH = 0;
 651              		.loc 2 127 0
 652 02d4 064B     		ldr	r3, .L39
 653 02d6 0022     		movs	r2, #0
 654 02d8 1A70     		strb	r2, [r3]
 128:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_E);
 655              		.loc 2 128 0
 656 02da 4020     		movs	r0, #64
 657 02dc FFF7FEFF 		bl	graphics_ctrl_bit_set
 129:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     select_controller(0);
 658              		.loc 2 129 0
 659 02e0 0020     		movs	r0, #0
 660 02e2 FFF7FEFF 		bl	select_controller
 130:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
 131:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 132:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphic_write_command(uint8_t command, uint8_t controller){
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
 133:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_E);
 701              		.loc 2 133 0
 702 0306 4020     		movs	r0, #64
 703 0308 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 134:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     select_controller(controller);
 704              		.loc 2 134 0
 705 030c BB1D     		adds	r3, r7, #6
 706 030e 1B78     		ldrb	r3, [r3]
 707 0310 1800     		movs	r0, r3
 708 0312 FFF7FEFF 		bl	select_controller
 135:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_RS | B_RW);
 709              		.loc 2 135 0
 710 0316 0320     		movs	r0, #3
 711 0318 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 136:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write(command, controller);
 712              		.loc 2 136 0
 713 031c BB1D     		adds	r3, r7, #6
 714 031e 1A78     		ldrb	r2, [r3]
 715 0320 FB1D     		adds	r3, r7, #7
 716 0322 1B78     		ldrb	r3, [r3]
 717 0324 1100     		movs	r1, r2
 718 0326 1800     		movs	r0, r3
 719 0328 FFF7FEFF 		bl	graphic_write
 137:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
 138:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 139:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphic_write_data(uint8_t data, uint8_t controller){
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
 140:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_E);
 756              		.loc 2 140 0
 757 0346 4020     		movs	r0, #64
 758 0348 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 141:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     select_controller(controller);
 759              		.loc 2 141 0
 760 034c BB1D     		adds	r3, r7, #6
 761 034e 1B78     		ldrb	r3, [r3]
 762 0350 1800     		movs	r0, r3
 763 0352 FFF7FEFF 		bl	select_controller
 142:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_RS);
 764              		.loc 2 142 0
 765 0356 0120     		movs	r0, #1
 766 0358 FFF7FEFF 		bl	graphics_ctrl_bit_set
 143:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 767              		.loc 2 143 0
 768 035c 0220     		movs	r0, #2
 769 035e FFF7FEFF 		bl	graphics_ctrl_bit_clear
 144:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write(data, controller);
 770              		.loc 2 144 0
 771 0362 BB1D     		adds	r3, r7, #6
 772 0364 1A78     		ldrb	r2, [r3]
 773 0366 FB1D     		adds	r3, r7, #7
 774 0368 1B78     		ldrb	r3, [r3]
 775 036a 1100     		movs	r1, r2
 776 036c 1800     		movs	r0, r3
 777 036e FFF7FEFF 		bl	graphic_write
 145:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
 146:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 147:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** uint8_t graphics_read_data(uint8_t controller){
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
 148:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     (void) graphic_read(controller);
 811              		.loc 2 148 0
 812 0386 FB1D     		adds	r3, r7, #7
 813 0388 1B78     		ldrb	r3, [r3]
 814 038a 1800     		movs	r0, r3
 815 038c FFF7FEFF 		bl	graphic_read
 149:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     return graphic_read(controller);
 816              		.loc 2 149 0
 817 0390 FB1D     		adds	r3, r7, #7
 818 0392 1B78     		ldrb	r3, [r3]
 819 0394 1800     		movs	r0, r3
 820 0396 FFF7FEFF 		bl	graphic_read
 821 039a 0300     		movs	r3, r0
 150:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
 151:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 152:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphic_initialize(void){
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
 153:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_E);
 850              		.loc 2 153 0
 851 03a8 4020     		movs	r0, #64
 852 03aa FFF7FEFF 		bl	graphics_ctrl_bit_set
 154:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     delay_micro(10);
 853              		.loc 2 154 0
 854 03ae 0A20     		movs	r0, #10
 855 03b0 FFF7FEFF 		bl	delay_micro
 155:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 856              		.loc 2 155 0
 857 03b4 7820     		movs	r0, #120
 858 03b6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 156:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     delay_milli(30);
 859              		.loc 2 156 0
 860 03ba 1E20     		movs	r0, #30
 861 03bc FFF7FEFF 		bl	delay_milli
 157:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphics_ctrl_bit_set(B_RST);
 862              		.loc 2 157 0
 863 03c0 2020     		movs	r0, #32
 864 03c2 FFF7FEFF 		bl	graphics_ctrl_bit_set
 158:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 865              		.loc 2 158 0
 866 03c6 1821     		movs	r1, #24
 867 03c8 3E20     		movs	r0, #62
 868 03ca FFF7FEFF 		bl	graphic_write_command
 159:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write_command(LCD_ON, B_CS1|B_CS2);
 869              		.loc 2 159 0
 870 03ce 1821     		movs	r1, #24
 871 03d0 3F20     		movs	r0, #63
 872 03d2 FFF7FEFF 		bl	graphic_write_command
 160:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 873              		.loc 2 160 0
 874 03d6 1821     		movs	r1, #24
 875 03d8 C020     		movs	r0, #192
 876 03da FFF7FEFF 		bl	graphic_write_command
 161:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 877              		.loc 2 161 0
 878 03de 1821     		movs	r1, #24
 879 03e0 4020     		movs	r0, #64
 880 03e2 FFF7FEFF 		bl	graphic_write_command
 162:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 881              		.loc 2 162 0
 882 03e6 1821     		movs	r1, #24
 883 03e8 B820     		movs	r0, #184
 884 03ea FFF7FEFF 		bl	graphic_write_command
 163:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     select_controller(0);
 885              		.loc 2 163 0
 886 03ee 0020     		movs	r0, #0
 887 03f0 FFF7FEFF 		bl	select_controller
 164:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
 165:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 166:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void graphics_clear_screen(void){
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
 167:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     for(int page = 0; page < PAGE; page++){
 918              		.loc 2 167 0
 919 0400 0023     		movs	r3, #0
 920 0402 7B60     		str	r3, [r7, #4]
 921 0404 1EE0     		b	.L47
 922              	.L50:
 168:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
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
 169:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 934              		.loc 2 169 0
 935 041c 1821     		movs	r1, #24
 936 041e 4020     		movs	r0, #64
 937 0420 FFF7FEFF 		bl	graphic_write_command
 938              	.LBB5:
 170:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         for(int add = 0; add < ADD; add++){
 939              		.loc 2 170 0
 940 0424 0023     		movs	r3, #0
 941 0426 3B60     		str	r3, [r7]
 942 0428 06E0     		b	.L48
 943              	.L49:
 171:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****             graphic_write_data(0, B_CS1|B_CS2);
 944              		.loc 2 171 0 discriminator 3
 945 042a 1821     		movs	r1, #24
 946 042c 0020     		movs	r0, #0
 947 042e FFF7FEFF 		bl	graphic_write_data
 170:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         for(int add = 0; add < ADD; add++){
 948              		.loc 2 170 0 discriminator 3
 949 0432 3B68     		ldr	r3, [r7]
 950 0434 0133     		adds	r3, r3, #1
 951 0436 3B60     		str	r3, [r7]
 952              	.L48:
 170:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         for(int add = 0; add < ADD; add++){
 953              		.loc 2 170 0 is_stmt 0 discriminator 1
 954 0438 3B68     		ldr	r3, [r7]
 955 043a 3E2B     		cmp	r3, #62
 956 043c F5DD     		ble	.L49
 957              	.LBE5:
 167:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 958              		.loc 2 167 0 is_stmt 1 discriminator 2
 959 043e 7B68     		ldr	r3, [r7, #4]
 960 0440 0133     		adds	r3, r3, #1
 961 0442 7B60     		str	r3, [r7, #4]
 962              	.L47:
 167:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 963              		.loc 2 167 0 is_stmt 0 discriminator 1
 964 0444 7B68     		ldr	r3, [r7, #4]
 965 0446 072B     		cmp	r3, #7
 966 0448 DDDD     		ble	.L50
 967              	.LBE4:
 172:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         }
 173:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
 174:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 175:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** }
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
 176:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 177:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 
 178:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** void pixel(unsigned x, unsigned y, unsigned set){
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
 179:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((x < 0 || y < 0) || (x > SCREEN_WIDTH || y > SCREEN_HEIGHT)) return;
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
 180:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 181:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     unsigned char index = (y-1) / PAGE;
 1014              		.loc 2 181 0 is_stmt 1
 1015 046e BB68     		ldr	r3, [r7, #8]
 1016 0470 013B     		subs	r3, r3, #1
 1017 0472 DA08     		lsrs	r2, r3, #3
 1018 0474 1523     		movs	r3, #21
 1019 0476 FB18     		adds	r3, r7, r3
 1020 0478 1A70     		strb	r2, [r3]
 182:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     unsigned char mask;
 183:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 184:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 0){mask = 1;}
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
 185:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 1){mask = 2;}
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
 186:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 2){mask = 4;}
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
 187:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 3){mask = 8;}
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
 188:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 4){mask = 0x10;}
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
 189:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 5){mask = 0x20;}
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
 190:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 6){mask = 0x40;}
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
 191:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if((y-1) % 8 == 7){mask = 0x80;}
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
 192:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 193:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(set == 0){mask = ~mask;}
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
 194:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 195:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     unsigned char controller;
 196:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(x > 64){
 1137              		.loc 2 196 0 is_stmt 1
 1138 052c FB68     		ldr	r3, [r7, #12]
 1139 052e 402B     		cmp	r3, #64
 1140 0530 07D9     		bls	.L64
 197:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         controller = B_CS2;
 1141              		.loc 2 197 0
 1142 0532 1623     		movs	r3, #22
 1143 0534 FB18     		adds	r3, r7, r3
 1144 0536 1022     		movs	r2, #16
 1145 0538 1A70     		strb	r2, [r3]
 198:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         x = x - 65;
 1146              		.loc 2 198 0
 1147 053a FB68     		ldr	r3, [r7, #12]
 1148 053c 413B     		subs	r3, r3, #65
 1149 053e FB60     		str	r3, [r7, #12]
 1150 0540 06E0     		b	.L65
 1151              	.L64:
 199:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         }
 200:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     else{
 201:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         controller = B_CS1;
 1152              		.loc 2 201 0
 1153 0542 1623     		movs	r3, #22
 1154 0544 FB18     		adds	r3, r7, r3
 1155 0546 0822     		movs	r2, #8
 1156 0548 1A70     		strb	r2, [r3]
 202:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         x = x - 1;
 1157              		.loc 2 202 0
 1158 054a FB68     		ldr	r3, [r7, #12]
 1159 054c 013B     		subs	r3, r3, #1
 1160 054e FB60     		str	r3, [r7, #12]
 1161              	.L65:
 203:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         }
 204:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 205:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
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
 206:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
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
 207:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 	unsigned char temp = graphics_read_data(controller);
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
 208:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h **** 	graphic_write_command(LCD_SET_ADD | x, controller);
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
 209:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 210:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     if(set == 1)
 1210              		.loc 2 210 0
 1211 05b0 7B68     		ldr	r3, [r7, #4]
 1212 05b2 012B     		cmp	r3, #1
 1213 05b4 0AD1     		bne	.L66
 211:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         {mask = mask | temp;}
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
 212:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     else
 213:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****         {mask = mask & temp;}
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
 214:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 215:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     graphic_write_data(mask, controller);
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
 179:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 1251              		.loc 2 179 0
 1252 05f6 C046     		nop
 1253              	.L51:
 216:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 217:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     
 218:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\graphics.h ****     }
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
 1271              		.file 3 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/keypad.h"
   1:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** #include "delay.h"
   2:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 
   3:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void ascii_ctrl_bit_set(unsigned int x) {
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
   4:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	switch(x) {
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
   5:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 0: *GPIO_D_ODR_LOW |= 1; break;
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
   6:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 1: *GPIO_D_ODR_LOW |= 2; break;
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
   7:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 2: *GPIO_D_ODR_LOW |= 4; break;
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
   8:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 3: *GPIO_D_ODR_LOW |= 8; break;
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
   9:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 4: *GPIO_D_ODR_LOW |= 16; break;
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
  10:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 5: *GPIO_D_ODR_LOW |= 32; break;
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
  11:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 6: *GPIO_D_ODR_LOW |= 64; break;
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
  12:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case 7: *GPIO_D_ODR_LOW |= 128; break;
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
  13:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
  14:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** }
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
 1408 06b8 140C0240 		.word	1073875988
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
  15:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 
  16:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void ascii_ctrl_bit_clear(unsigned int x) {
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
  17:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	switch(x) {
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
  18:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(0): *GPIO_D_ODR_LOW &= 0xFE; break;
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
  19:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(1): *GPIO_D_ODR_LOW &= 0xFD; break;
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
  20:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(2): *GPIO_D_ODR_LOW &= 0xFB; break;
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
  21:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(3): *GPIO_D_ODR_LOW &= 0xF7; break;
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
  22:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(4): *GPIO_D_ODR_LOW &= 0xEF; break;
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
  23:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(5): *GPIO_D_ODR_LOW &= 0xDF; break;
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
  24:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(6): *GPIO_D_ODR_LOW &= 0xBF; break;
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
  25:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 		case(7): *GPIO_D_ODR_LOW &= 0x7F; break;
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
  26:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	}
  27:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** }
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
 1556 0774 140C0240 		.word	1073875988
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
  28:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void ascii_write_controller( unsigned char c ) {
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
  29:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     ascii_ctrl_bit_set(B_E);
 1584              		.loc 3 29 0
 1585 0784 4020     		movs	r0, #64
 1586 0786 FFF7FEFF 		bl	ascii_ctrl_bit_set
  30:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	*GPIO_D_ODR_HIGH = c;
 1587              		.loc 3 30 0
 1588 078a 064A     		ldr	r2, .L98
 1589 078c FB1D     		adds	r3, r7, #7
 1590 078e 1B78     		ldrb	r3, [r3]
 1591 0790 1370     		strb	r3, [r2]
  31:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	delay_250ns();
 1592              		.loc 3 31 0
 1593 0792 FFF7FEFF 		bl	delay_250ns
  32:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_clear(B_E);
 1594              		.loc 3 32 0
 1595 0796 4020     		movs	r0, #64
 1596 0798 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  33:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** }
 1597              		.loc 3 33 0
 1598 079c C046     		nop
 1599 079e BD46     		mov	sp, r7
 1600 07a0 02B0     		add	sp, sp, #8
 1601              		@ sp needed
 1602 07a2 80BD     		pop	{r7, pc}
 1603              	.L99:
 1604              		.align	2
 1605              	.L98:
 1606 07a4 150C0240 		.word	1073875989
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
  34:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 
  35:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** unsigned char ascii_read_controller( void )
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** {
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
  37:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     ascii_ctrl_bit_set(B_E);
 1631              		.loc 3 37 0
 1632 07ae 4020     		movs	r0, #64
 1633 07b0 FFF7FEFF 		bl	ascii_ctrl_bit_set
  38:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	delay_250ns();
 1634              		.loc 3 38 0
 1635 07b4 FFF7FEFF 		bl	delay_250ns
  39:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	delay_250ns();
 1636              		.loc 3 39 0
 1637 07b8 FFF7FEFF 		bl	delay_250ns
  40:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	unsigned char rv = *GPIO_D_IDR_HIGH;
 1638              		.loc 3 40 0
 1639 07bc 064A     		ldr	r2, .L102
 1640 07be FB1D     		adds	r3, r7, #7
 1641 07c0 1278     		ldrb	r2, [r2]
 1642 07c2 1A70     		strb	r2, [r3]
  41:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_clear(B_E);
 1643              		.loc 3 41 0
 1644 07c4 4020     		movs	r0, #64
 1645 07c6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  42:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	return rv;
 1646              		.loc 3 42 0
 1647 07ca FB1D     		adds	r3, r7, #7
 1648 07cc 1B78     		ldrb	r3, [r3]
  43:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** }
 1649              		.loc 3 43 0
 1650 07ce 1800     		movs	r0, r3
 1651 07d0 BD46     		mov	sp, r7
 1652 07d2 02B0     		add	sp, sp, #8
 1653              		@ sp needed
 1654 07d4 80BD     		pop	{r7, pc}
 1655              	.L103:
 1656 07d6 C046     		.align	2
 1657              	.L102:
 1658 07d8 110C0240 		.word	1073875985
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
  44:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 
  45:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void ascii_write_cmd(unsigned char command){
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
  46:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     ascii_ctrl_bit_clear(B_RS);
 1686              		.loc 3 46 0
 1687 07e8 0120     		movs	r0, #1
 1688 07ea FFF7FEFF 		bl	ascii_ctrl_bit_clear
  47:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_clear(B_RW);
 1689              		.loc 3 47 0
 1690 07ee 0220     		movs	r0, #2
 1691 07f0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  48:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_write_controller(command);
 1692              		.loc 3 48 0
 1693 07f4 FB1D     		adds	r3, r7, #7
 1694 07f6 1B78     		ldrb	r3, [r3]
 1695 07f8 1800     		movs	r0, r3
 1696 07fa FFF7FEFF 		bl	ascii_write_controller
  49:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
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
  50:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     
  51:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void ascii_write_data(unsigned char data){
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
  52:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     ascii_ctrl_bit_set(B_RS);
 1730              		.loc 3 52 0
 1731 0812 0120     		movs	r0, #1
 1732 0814 FFF7FEFF 		bl	ascii_ctrl_bit_set
  53:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_clear(B_RW);
 1733              		.loc 3 53 0
 1734 0818 0220     		movs	r0, #2
 1735 081a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  54:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_write_controller(data);
 1736              		.loc 3 54 0
 1737 081e FB1D     		adds	r3, r7, #7
 1738 0820 1B78     		ldrb	r3, [r3]
 1739 0822 1800     		movs	r0, r3
 1740 0824 FFF7FEFF 		bl	ascii_write_controller
  55:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** }
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
  56:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 
  57:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** unsigned char ascii_read_status(void){
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
  58:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     *GPIO_D_MODER &= 0x0000FFFF;	
 1772              		.loc 3 58 0
 1773 0836 114B     		ldr	r3, .L108
 1774 0838 104A     		ldr	r2, .L108
 1775 083a 1268     		ldr	r2, [r2]
 1776 083c 1204     		lsls	r2, r2, #16
 1777 083e 120C     		lsrs	r2, r2, #16
 1778 0840 1A60     		str	r2, [r3]
  59:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_clear(B_RS);
 1779              		.loc 3 59 0
 1780 0842 0120     		movs	r0, #1
 1781 0844 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  60:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_set(B_RW);
 1782              		.loc 3 60 0
 1783 0848 0220     		movs	r0, #2
 1784 084a FFF7FEFF 		bl	ascii_ctrl_bit_set
  61:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	unsigned char rv = ascii_read_controller();
 1785              		.loc 3 61 0
 1786 084e FC1D     		adds	r4, r7, #7
 1787 0850 FFF7FEFF 		bl	ascii_read_controller
 1788 0854 0300     		movs	r3, r0
 1789 0856 2370     		strb	r3, [r4]
  62:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	*GPIO_D_MODER &= 0x0000FFFF;
 1790              		.loc 3 62 0
 1791 0858 084B     		ldr	r3, .L108
 1792 085a 084A     		ldr	r2, .L108
 1793 085c 1268     		ldr	r2, [r2]
 1794 085e 1204     		lsls	r2, r2, #16
 1795 0860 120C     		lsrs	r2, r2, #16
 1796 0862 1A60     		str	r2, [r3]
  63:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	*GPIO_D_MODER |= 0x55550000;	
 1797              		.loc 3 63 0
 1798 0864 054B     		ldr	r3, .L108
 1799 0866 054A     		ldr	r2, .L108
 1800 0868 1268     		ldr	r2, [r2]
 1801 086a 0549     		ldr	r1, .L108+4
 1802 086c 0A43     		orrs	r2, r1
 1803 086e 1A60     		str	r2, [r3]
  64:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	return rv;
 1804              		.loc 3 64 0
 1805 0870 FB1D     		adds	r3, r7, #7
 1806 0872 1B78     		ldrb	r3, [r3]
  65:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
 1807              		.loc 3 65 0
 1808 0874 1800     		movs	r0, r3
 1809 0876 BD46     		mov	sp, r7
 1810 0878 03B0     		add	sp, sp, #12
 1811              		@ sp needed
 1812 087a 90BD     		pop	{r4, r7, pc}
 1813              	.L109:
 1814              		.align	2
 1815              	.L108:
 1816 087c 000C0240 		.word	1073875968
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
  66:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     
  67:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** unsigned char ascii_read_data(void){
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
  68:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     *GPIO_D_MODER &= 0x0000FFFF;	
 1843              		.loc 3 68 0
 1844 088a 114B     		ldr	r3, .L112
 1845 088c 104A     		ldr	r2, .L112
 1846 088e 1268     		ldr	r2, [r2]
 1847 0890 1204     		lsls	r2, r2, #16
 1848 0892 120C     		lsrs	r2, r2, #16
 1849 0894 1A60     		str	r2, [r3]
  69:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_set(B_RS);
 1850              		.loc 3 69 0
 1851 0896 0120     		movs	r0, #1
 1852 0898 FFF7FEFF 		bl	ascii_ctrl_bit_set
  70:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	ascii_ctrl_bit_set(B_RW);
 1853              		.loc 3 70 0
 1854 089c 0220     		movs	r0, #2
 1855 089e FFF7FEFF 		bl	ascii_ctrl_bit_set
  71:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	unsigned char rv = ascii_read_controller();
 1856              		.loc 3 71 0
 1857 08a2 FC1D     		adds	r4, r7, #7
 1858 08a4 FFF7FEFF 		bl	ascii_read_controller
 1859 08a8 0300     		movs	r3, r0
 1860 08aa 2370     		strb	r3, [r4]
  72:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	*GPIO_D_MODER &= 0x0000FFFF;
 1861              		.loc 3 72 0
 1862 08ac 084B     		ldr	r3, .L112
 1863 08ae 084A     		ldr	r2, .L112
 1864 08b0 1268     		ldr	r2, [r2]
 1865 08b2 1204     		lsls	r2, r2, #16
 1866 08b4 120C     		lsrs	r2, r2, #16
 1867 08b6 1A60     		str	r2, [r3]
  73:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	*GPIO_D_MODER |= 0x55550000;	
 1868              		.loc 3 73 0
 1869 08b8 054B     		ldr	r3, .L112
 1870 08ba 054A     		ldr	r2, .L112
 1871 08bc 1268     		ldr	r2, [r2]
 1872 08be 0549     		ldr	r1, .L112+4
 1873 08c0 0A43     		orrs	r2, r1
 1874 08c2 1A60     		str	r2, [r3]
  74:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	return rv;
 1875              		.loc 3 74 0
 1876 08c4 FB1D     		adds	r3, r7, #7
 1877 08c6 1B78     		ldrb	r3, [r3]
  75:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
 1878              		.loc 3 75 0
 1879 08c8 1800     		movs	r0, r3
 1880 08ca BD46     		mov	sp, r7
 1881 08cc 03B0     		add	sp, sp, #12
 1882              		@ sp needed
 1883 08ce 90BD     		pop	{r4, r7, pc}
 1884              	.L113:
 1885              		.align	2
 1886              	.L112:
 1887 08d0 000C0240 		.word	1073875968
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
  76:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     
  77:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void ascii_command(char command, unsigned int delayMicroSec){
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
  78:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     while((ascii_read_status() & 0x80) == 0x80) {
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
  79:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             //TODO implement pip subroutine
  80:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         }
  81:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     delay_micro(8);
 1928              		.loc 3 81 0 is_stmt 1
 1929 08f8 0820     		movs	r0, #8
 1930 08fa FFF7FEFF 		bl	delay_micro
  82:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     ascii_write_cmd(command);
 1931              		.loc 3 82 0
 1932 08fe FB1D     		adds	r3, r7, #7
 1933 0900 1B78     		ldrb	r3, [r3]
 1934 0902 1800     		movs	r0, r3
 1935 0904 FFF7FEFF 		bl	ascii_write_cmd
  83:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     delay_micro(delayMicroSec);
 1936              		.loc 3 83 0
 1937 0908 3B68     		ldr	r3, [r7]
 1938 090a 1800     		movs	r0, r3
 1939 090c FFF7FEFF 		bl	delay_micro
  84:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
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
  85:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	
  86:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void ascii_init(void){
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
  87:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         ascii_ctrl_bit_set(B_SELECT);
 1968              		.loc 3 87 0
 1969 091c 0420     		movs	r0, #4
 1970 091e FFF7FEFF 		bl	ascii_ctrl_bit_set
  88:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         ascii_command(0x38, 40); //Set disp size, delay 40 ms
 1971              		.loc 3 88 0
 1972 0922 2821     		movs	r1, #40
 1973 0924 3820     		movs	r0, #56
 1974 0926 FFF7FEFF 		bl	ascii_command
  89:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         ascii_command(0xE, 40); //delay set to 40 bcs DR.eHugo
 1975              		.loc 3 89 0
 1976 092a 2821     		movs	r1, #40
 1977 092c 0E20     		movs	r0, #14
 1978 092e FFF7FEFF 		bl	ascii_command
  90:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         ascii_command(0x01, 1530); // Cls
 1979              		.loc 3 90 0
 1980 0932 064B     		ldr	r3, .L117
 1981 0934 1900     		movs	r1, r3
 1982 0936 0120     		movs	r0, #1
 1983 0938 FFF7FEFF 		bl	ascii_command
  91:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         ascii_command(0x6, 40); // Inc
 1984              		.loc 3 91 0
 1985 093c 2821     		movs	r1, #40
 1986 093e 0620     		movs	r0, #6
 1987 0940 FFF7FEFF 		bl	ascii_command
  92:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** }
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
  93:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 
  94:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 
  95:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void kbdActivate(unsigned int row){
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
  96:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     switch(row)
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
  97:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         {
  98:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             //activate row N or deactivate with 0 
  99:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             case 1: *GPIO_D_ODR_HIGH = 0x10; break;
 2042              		.loc 3 99 0
 2043 096a 0D4B     		ldr	r3, .L128+4
 2044 096c 1022     		movs	r2, #16
 2045 096e 1A70     		strb	r2, [r3]
 2046 0970 0FE0     		b	.L120
 2047              	.L124:
 100:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             case 2: *GPIO_D_ODR_HIGH = 0x20; break;
 2048              		.loc 3 100 0
 2049 0972 0B4B     		ldr	r3, .L128+4
 2050 0974 2022     		movs	r2, #32
 2051 0976 1A70     		strb	r2, [r3]
 2052 0978 0BE0     		b	.L120
 2053              	.L125:
 101:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             case 3: *GPIO_D_ODR_HIGH = 0x40; break;
 2054              		.loc 3 101 0
 2055 097a 094B     		ldr	r3, .L128+4
 2056 097c 4022     		movs	r2, #64
 2057 097e 1A70     		strb	r2, [r3]
 2058 0980 07E0     		b	.L120
 2059              	.L126:
 102:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             case 4: *GPIO_D_ODR_HIGH = 0x80; break;
 2060              		.loc 3 102 0
 2061 0982 074B     		ldr	r3, .L128+4
 2062 0984 8022     		movs	r2, #128
 2063 0986 1A70     		strb	r2, [r3]
 2064 0988 03E0     		b	.L120
 2065              	.L121:
 103:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             case 0: *GPIO_D_ODR_HIGH = 0x00; break;
 2066              		.loc 3 103 0
 2067 098a 054B     		ldr	r3, .L128+4
 2068 098c 0022     		movs	r2, #0
 2069 098e 1A70     		strb	r2, [r3]
 2070 0990 C046     		nop
 2071              	.L120:
 2072              	.L127:
 104:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         }
 105:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     
 106:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
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
 2083 09a0 150C0240 		.word	1073875989
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
 107:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     
 108:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** int kdbGetCol(void){
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
 109:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         unsigned char idr;
 110:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         idr = *GPIO_D_IDR_HIGH;
 2108              		.loc 3 110 0
 2109 09aa 124A     		ldr	r2, .L136
 2110 09ac FB1D     		adds	r3, r7, #7
 2111 09ae 1278     		ldrb	r2, [r2]
 2112 09b0 1A70     		strb	r2, [r3]
 111:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         
 112:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(idr & 0x8) return 4;
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
 113:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(idr & 0x4) return 3;
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
 114:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(idr & 0x2) return 2;
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
 115:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(idr & 0x1) return 1;
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
 116:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         return 0;
 2153              		.loc 3 116 0 is_stmt 1
 2154 09ea 0023     		movs	r3, #0
 2155              	.L132:
 117:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
 2156              		.loc 3 117 0
 2157 09ec 1800     		movs	r0, r3
 2158 09ee BD46     		mov	sp, r7
 2159 09f0 02B0     		add	sp, sp, #8
 2160              		@ sp needed
 2161 09f2 80BD     		pop	{r7, pc}
 2162              	.L137:
 2163              		.align	2
 2164              	.L136:
 2165 09f4 110C0240 		.word	1073875985
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
 118:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     
 119:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** void outSeg7(unsigned char in)
 120:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     {
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
 121:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         
 122:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x0) *GPIO_D_ODR_LOW = 0x3F;
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
 123:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x1) *GPIO_D_ODR_LOW = 0x06;
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
 124:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x2) *GPIO_D_ODR_LOW = 0x5B;
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
 125:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x3) *GPIO_D_ODR_LOW = 0x4F;
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
 126:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x4) *GPIO_D_ODR_LOW = 0x66;
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
 127:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x5) *GPIO_D_ODR_LOW = 0x6D;
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
 128:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x6) *GPIO_D_ODR_LOW = 0x7D;
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
 129:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x7) *GPIO_D_ODR_LOW = 0x07;
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
 130:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x8) *GPIO_D_ODR_LOW = 0x7F;
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
 131:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0x9) *GPIO_D_ODR_LOW = 0x67;
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
 132:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0xA) *GPIO_D_ODR_LOW = 0x77;
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
 133:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0xB) *GPIO_D_ODR_LOW = 0x7F;
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
 134:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0xC) *GPIO_D_ODR_LOW = 0xFF;
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
 135:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0xD) *GPIO_D_ODR_LOW = 0xBF;
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
 136:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0xE) *GPIO_D_ODR_LOW = 0x79;
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
 137:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         if(in == 0xF) *GPIO_D_ODR_LOW = 0x71;
 2343              		.loc 3 137 0 is_stmt 1
 2344 0ad6 FB1D     		adds	r3, r7, #7
 2345 0ad8 1B78     		ldrb	r3, [r3]
 2346 0ada 0F2B     		cmp	r3, #15
 2347 0adc 03D1     		bne	.L154
 2348              		.loc 3 137 0 is_stmt 0 discriminator 1
 2349 0ade 054B     		ldr	r3, .L157
 2350 0ae0 7122     		movs	r2, #113
 2351 0ae2 1A70     		strb	r2, [r3]
 138:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	else *GPIO_D_ODR_LOW = 0x00;
 139:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         
 140:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****     }
 2352              		.loc 3 140 0 is_stmt 1 discriminator 1
 2353 0ae4 02E0     		b	.L156
 2354              	.L154:
 138:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	else *GPIO_D_ODR_LOW = 0x00;
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
 2369 0af4 140C0240 		.word	1073875988
 2370              		.cfi_endproc
 2371              	.LFE28:
 2373              		.section	.rodata
 2374              		.align	2
 2375              	.LC0:
 2376 0054 01       		.byte	1
 2377 0055 02       		.byte	2
 2378 0056 03       		.byte	3
 2379 0057 0A       		.byte	10
 2380 0058 04       		.byte	4
 2381 0059 05       		.byte	5
 2382 005a 06       		.byte	6
 2383 005b 0B       		.byte	11
 2384 005c 07       		.byte	7
 2385 005d 08       		.byte	8
 2386 005e 09       		.byte	9
 2387 005f 0C       		.byte	12
 2388 0060 0E       		.byte	14
 2389 0061 00       		.byte	0
 2390 0062 0F       		.byte	15
 2391 0063 0D       		.byte	13
 2392              		.text
 2393              		.align	1
 2394              		.global	keyb
 2395              		.syntax unified
 2396              		.code	16
 2397              		.thumb_func
 2398              		.fpu softvfp
 2400              	keyb:
 2401              	.LFB29:
 141:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 	
 142:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** unsigned char keyb(void){
 2402              		.loc 3 142 0
 2403              		.cfi_startproc
 2404              		@ args = 0, pretend = 0, frame = 24
 2405              		@ frame_needed = 1, uses_anonymous_args = 0
 2406 0af8 90B5     		push	{r4, r7, lr}
 2407              		.cfi_def_cfa_offset 12
 2408              		.cfi_offset 4, -12
 2409              		.cfi_offset 7, -8
 2410              		.cfi_offset 14, -4
 2411 0afa 87B0     		sub	sp, sp, #28
 2412              		.cfi_def_cfa_offset 40
 2413 0afc 00AF     		add	r7, sp, #0
 2414              		.cfi_def_cfa_register 7
 143:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
 2415              		.loc 3 143 0
 2416 0afe 3B00     		movs	r3, r7
 2417 0b00 174A     		ldr	r2, .L165
 2418 0b02 13CA     		ldmia	r2!, {r0, r1, r4}
 2419 0b04 13C3     		stmia	r3!, {r0, r1, r4}
 2420 0b06 1268     		ldr	r2, [r2]
 2421 0b08 1A60     		str	r2, [r3]
 144:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         int row, col;
 145:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         for(row = 1; row <= 4; row++)
 2422              		.loc 3 145 0
 2423 0b0a 0123     		movs	r3, #1
 2424 0b0c 7B61     		str	r3, [r7, #20]
 2425 0b0e 1BE0     		b	.L160
 2426              	.L163:
 146:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             {
 147:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             kbdActivate(row);
 2427              		.loc 3 147 0
 2428 0b10 7B69     		ldr	r3, [r7, #20]
 2429 0b12 1800     		movs	r0, r3
 2430 0b14 FFF7FEFF 		bl	kbdActivate
 148:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** 			delay_250ns();
 2431              		.loc 3 148 0
 2432 0b18 FFF7FEFF 		bl	delay_250ns
 149:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             if(col = kdbGetCol())
 2433              		.loc 3 149 0
 2434 0b1c FFF7FEFF 		bl	kdbGetCol
 2435 0b20 0300     		movs	r3, r0
 2436 0b22 3B61     		str	r3, [r7, #16]
 2437 0b24 3B69     		ldr	r3, [r7, #16]
 2438 0b26 002B     		cmp	r3, #0
 2439 0b28 0BD0     		beq	.L161
 150:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****                 {
 151:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****                 kbdActivate(0);
 2440              		.loc 3 151 0
 2441 0b2a 0020     		movs	r0, #0
 2442 0b2c FFF7FEFF 		bl	kbdActivate
 152:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****                 return key[4*(row-1) + (col-1)];
 2443              		.loc 3 152 0
 2444 0b30 7B69     		ldr	r3, [r7, #20]
 2445 0b32 013B     		subs	r3, r3, #1
 2446 0b34 9A00     		lsls	r2, r3, #2
 2447 0b36 3B69     		ldr	r3, [r7, #16]
 2448 0b38 013B     		subs	r3, r3, #1
 2449 0b3a D318     		adds	r3, r2, r3
 2450 0b3c 3A00     		movs	r2, r7
 2451 0b3e D35C     		ldrb	r3, [r2, r3]
 2452 0b40 09E0     		b	.L164
 2453              	.L161:
 145:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             {
 2454              		.loc 3 145 0 discriminator 2
 2455 0b42 7B69     		ldr	r3, [r7, #20]
 2456 0b44 0133     		adds	r3, r3, #1
 2457 0b46 7B61     		str	r3, [r7, #20]
 2458              	.L160:
 145:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             {
 2459              		.loc 3 145 0 is_stmt 0 discriminator 1
 2460 0b48 7B69     		ldr	r3, [r7, #20]
 2461 0b4a 042B     		cmp	r3, #4
 2462 0b4c E0DD     		ble	.L163
 153:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****                 }
 154:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****             }
 155:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         kbdActivate(0);
 2463              		.loc 3 155 0 is_stmt 1
 2464 0b4e 0020     		movs	r0, #0
 2465 0b50 FFF7FEFF 		bl	kbdActivate
 156:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h ****         return 0xFF;
 2466              		.loc 3 156 0
 2467 0b54 FF23     		movs	r3, #255
 2468              	.L164:
 157:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\keypad.h **** }
 2469              		.loc 3 157 0 discriminator 1
 2470 0b56 1800     		movs	r0, r3
 2471 0b58 BD46     		mov	sp, r7
 2472 0b5a 07B0     		add	sp, sp, #28
 2473              		@ sp needed
 2474 0b5c 90BD     		pop	{r4, r7, pc}
 2475              	.L166:
 2476 0b5e C046     		.align	2
 2477              	.L165:
 2478 0b60 54000000 		.word	.LC0
 2479              		.cfi_endproc
 2480              	.LFE29:
 2482              		.align	1
 2483              		.global	set_object_speed
 2484              		.syntax unified
 2485              		.code	16
 2486              		.thumb_func
 2487              		.fpu softvfp
 2489              	set_object_speed:
 2490              	.LFB30:
 2491              		.file 4 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/object.h"
   1:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** #ifndef OBJECT_H
   2:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** #define OBJECT_H
   3:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** 
   4:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** #define MAX_POINTS 75
   5:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** 
   6:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** typedef struct tPoint{
   7:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     unsigned char x;
   8:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     unsigned char y;
   9:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     }POINT;
  10:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     
  11:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     
  12:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** typedef struct tGeometry{
  13:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     int numpoints;
  14:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     int sizeX;
  15:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     int sizeY;
  16:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     POINT px[MAX_POINTS];
  17:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     } GEOMETRY, *PGEOMETRY;
  18:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     
  19:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** typedef struct tObj{
  20:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     PGEOMETRY geo;
  21:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     int dirX, dirY;
  22:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     int posX, posY;
  23:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     void (* draw) (struct tObj*);
  24:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     void (* clear) (struct tObj*);
  25:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     void (* move) (struct tObj*);
  26:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     void (* set_speed) (struct tObj*, int, int);
  27:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     } OBJECT, *POBJECT;
  28:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     
  29:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     
  30:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** void set_object_speed(POBJECT pObj, int speedX, int speedY){
 2492              		.loc 4 30 0
 2493              		.cfi_startproc
 2494              		@ args = 0, pretend = 0, frame = 16
 2495              		@ frame_needed = 1, uses_anonymous_args = 0
 2496 0b64 80B5     		push	{r7, lr}
 2497              		.cfi_def_cfa_offset 8
 2498              		.cfi_offset 7, -8
 2499              		.cfi_offset 14, -4
 2500 0b66 84B0     		sub	sp, sp, #16
 2501              		.cfi_def_cfa_offset 24
 2502 0b68 00AF     		add	r7, sp, #0
 2503              		.cfi_def_cfa_register 7
 2504 0b6a F860     		str	r0, [r7, #12]
 2505 0b6c B960     		str	r1, [r7, #8]
 2506 0b6e 7A60     		str	r2, [r7, #4]
  31:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****         pObj->dirX = speedX;
 2507              		.loc 4 31 0
 2508 0b70 FB68     		ldr	r3, [r7, #12]
 2509 0b72 BA68     		ldr	r2, [r7, #8]
 2510 0b74 5A60     		str	r2, [r3, #4]
  32:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****         pObj->dirY = speedY;
 2511              		.loc 4 32 0
 2512 0b76 FB68     		ldr	r3, [r7, #12]
 2513 0b78 7A68     		ldr	r2, [r7, #4]
 2514 0b7a 9A60     		str	r2, [r3, #8]
  33:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     }
 2515              		.loc 4 33 0
 2516 0b7c C046     		nop
 2517 0b7e BD46     		mov	sp, r7
 2518 0b80 04B0     		add	sp, sp, #16
 2519              		@ sp needed
 2520 0b82 80BD     		pop	{r7, pc}
 2521              		.cfi_endproc
 2522              	.LFE30:
 2524              		.align	1
 2525              		.global	draw_object
 2526              		.syntax unified
 2527              		.code	16
 2528              		.thumb_func
 2529              		.fpu softvfp
 2531              	draw_object:
 2532              	.LFB31:
  34:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     
  35:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** void draw_object(POBJECT pObj){
 2533              		.loc 4 35 0
 2534              		.cfi_startproc
 2535              		@ args = 0, pretend = 0, frame = 16
 2536              		@ frame_needed = 1, uses_anonymous_args = 0
 2537 0b84 80B5     		push	{r7, lr}
 2538              		.cfi_def_cfa_offset 8
 2539              		.cfi_offset 7, -8
 2540              		.cfi_offset 14, -4
 2541 0b86 84B0     		sub	sp, sp, #16
 2542              		.cfi_def_cfa_offset 24
 2543 0b88 00AF     		add	r7, sp, #0
 2544              		.cfi_def_cfa_register 7
 2545 0b8a 7860     		str	r0, [r7, #4]
 2546              	.LBB6:
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2547              		.loc 4 36 0
 2548 0b8c 0023     		movs	r3, #0
 2549 0b8e FB60     		str	r3, [r7, #12]
 2550 0b90 1FE0     		b	.L169
 2551              	.L170:
  37:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 1);
 2552              		.loc 4 37 0 discriminator 3
 2553 0b92 7B68     		ldr	r3, [r7, #4]
 2554 0b94 1A68     		ldr	r2, [r3]
 2555 0b96 FB68     		ldr	r3, [r7, #12]
 2556 0b98 0433     		adds	r3, r3, #4
 2557 0b9a 5B00     		lsls	r3, r3, #1
 2558 0b9c D318     		adds	r3, r2, r3
 2559 0b9e 0433     		adds	r3, r3, #4
 2560 0ba0 1B78     		ldrb	r3, [r3]
 2561 0ba2 1A00     		movs	r2, r3
 2562 0ba4 7B68     		ldr	r3, [r7, #4]
 2563 0ba6 DB68     		ldr	r3, [r3, #12]
 2564 0ba8 D318     		adds	r3, r2, r3
 2565 0baa 1800     		movs	r0, r3
 2566 0bac 7B68     		ldr	r3, [r7, #4]
 2567 0bae 1A68     		ldr	r2, [r3]
 2568 0bb0 FB68     		ldr	r3, [r7, #12]
 2569 0bb2 0433     		adds	r3, r3, #4
 2570 0bb4 5B00     		lsls	r3, r3, #1
 2571 0bb6 D318     		adds	r3, r2, r3
 2572 0bb8 0533     		adds	r3, r3, #5
 2573 0bba 1B78     		ldrb	r3, [r3]
 2574 0bbc 1A00     		movs	r2, r3
 2575 0bbe 7B68     		ldr	r3, [r7, #4]
 2576 0bc0 1B69     		ldr	r3, [r3, #16]
 2577 0bc2 D318     		adds	r3, r2, r3
 2578 0bc4 0122     		movs	r2, #1
 2579 0bc6 1900     		movs	r1, r3
 2580 0bc8 FFF7FEFF 		bl	pixel
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2581              		.loc 4 36 0 discriminator 3
 2582 0bcc FB68     		ldr	r3, [r7, #12]
 2583 0bce 0133     		adds	r3, r3, #1
 2584 0bd0 FB60     		str	r3, [r7, #12]
 2585              	.L169:
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2586              		.loc 4 36 0 is_stmt 0 discriminator 1
 2587 0bd2 FB68     		ldr	r3, [r7, #12]
 2588 0bd4 4A2B     		cmp	r3, #74
 2589 0bd6 DCDD     		ble	.L170
 2590              	.LBE6:
  38:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****         }
  39:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     }
 2591              		.loc 4 39 0 is_stmt 1
 2592 0bd8 C046     		nop
 2593 0bda BD46     		mov	sp, r7
 2594 0bdc 04B0     		add	sp, sp, #16
 2595              		@ sp needed
 2596 0bde 80BD     		pop	{r7, pc}
 2597              		.cfi_endproc
 2598              	.LFE31:
 2600              		.align	1
 2601              		.global	clear_object
 2602              		.syntax unified
 2603              		.code	16
 2604              		.thumb_func
 2605              		.fpu softvfp
 2607              	clear_object:
 2608              	.LFB32:
  40:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** 
  41:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h **** void clear_object(POBJECT pObj){
 2609              		.loc 4 41 0
 2610              		.cfi_startproc
 2611              		@ args = 0, pretend = 0, frame = 16
 2612              		@ frame_needed = 1, uses_anonymous_args = 0
 2613 0be0 80B5     		push	{r7, lr}
 2614              		.cfi_def_cfa_offset 8
 2615              		.cfi_offset 7, -8
 2616              		.cfi_offset 14, -4
 2617 0be2 84B0     		sub	sp, sp, #16
 2618              		.cfi_def_cfa_offset 24
 2619 0be4 00AF     		add	r7, sp, #0
 2620              		.cfi_def_cfa_register 7
 2621 0be6 7860     		str	r0, [r7, #4]
 2622              	.LBB7:
  42:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2623              		.loc 4 42 0
 2624 0be8 0023     		movs	r3, #0
 2625 0bea FB60     		str	r3, [r7, #12]
 2626 0bec 1FE0     		b	.L172
 2627              	.L173:
  43:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 0);
 2628              		.loc 4 43 0 discriminator 3
 2629 0bee 7B68     		ldr	r3, [r7, #4]
 2630 0bf0 1A68     		ldr	r2, [r3]
 2631 0bf2 FB68     		ldr	r3, [r7, #12]
 2632 0bf4 0433     		adds	r3, r3, #4
 2633 0bf6 5B00     		lsls	r3, r3, #1
 2634 0bf8 D318     		adds	r3, r2, r3
 2635 0bfa 0433     		adds	r3, r3, #4
 2636 0bfc 1B78     		ldrb	r3, [r3]
 2637 0bfe 1A00     		movs	r2, r3
 2638 0c00 7B68     		ldr	r3, [r7, #4]
 2639 0c02 DB68     		ldr	r3, [r3, #12]
 2640 0c04 D318     		adds	r3, r2, r3
 2641 0c06 1800     		movs	r0, r3
 2642 0c08 7B68     		ldr	r3, [r7, #4]
 2643 0c0a 1A68     		ldr	r2, [r3]
 2644 0c0c FB68     		ldr	r3, [r7, #12]
 2645 0c0e 0433     		adds	r3, r3, #4
 2646 0c10 5B00     		lsls	r3, r3, #1
 2647 0c12 D318     		adds	r3, r2, r3
 2648 0c14 0533     		adds	r3, r3, #5
 2649 0c16 1B78     		ldrb	r3, [r3]
 2650 0c18 1A00     		movs	r2, r3
 2651 0c1a 7B68     		ldr	r3, [r7, #4]
 2652 0c1c 1B69     		ldr	r3, [r3, #16]
 2653 0c1e D318     		adds	r3, r2, r3
 2654 0c20 0022     		movs	r2, #0
 2655 0c22 1900     		movs	r1, r3
 2656 0c24 FFF7FEFF 		bl	pixel
  42:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2657              		.loc 4 42 0 discriminator 3
 2658 0c28 FB68     		ldr	r3, [r7, #12]
 2659 0c2a 0133     		adds	r3, r3, #1
 2660 0c2c FB60     		str	r3, [r7, #12]
 2661              	.L172:
  42:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     for(int i=0; i < MAX_POINTS; i++){
 2662              		.loc 4 42 0 is_stmt 0 discriminator 1
 2663 0c2e FB68     		ldr	r3, [r7, #12]
 2664 0c30 4A2B     		cmp	r3, #74
 2665 0c32 DCDD     		ble	.L173
 2666              	.LBE7:
  44:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****         }
  45:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\object.h ****     }
 2667              		.loc 4 45 0 is_stmt 1
 2668 0c34 C046     		nop
 2669 0c36 BD46     		mov	sp, r7
 2670 0c38 04B0     		add	sp, sp, #16
 2671              		@ sp needed
 2672 0c3a 80BD     		pop	{r7, pc}
 2673              		.cfi_endproc
 2674              	.LFE32:
 2676              		.align	1
 2677              		.global	move_paddle
 2678              		.syntax unified
 2679              		.code	16
 2680              		.thumb_func
 2681              		.fpu softvfp
 2683              	move_paddle:
 2684              	.LFB33:
 2685              		.file 5 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/paddle.h"
   1:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** extern OBJECT Rpaddle;
   2:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** extern OBJECT Lpaddle;
   3:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 
   4:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** void move_paddle(POBJECT this) {
 2686              		.loc 5 4 0
 2687              		.cfi_startproc
 2688              		@ args = 0, pretend = 0, frame = 8
 2689              		@ frame_needed = 1, uses_anonymous_args = 0
 2690 0c3c 80B5     		push	{r7, lr}
 2691              		.cfi_def_cfa_offset 8
 2692              		.cfi_offset 7, -8
 2693              		.cfi_offset 14, -4
 2694 0c3e 82B0     		sub	sp, sp, #8
 2695              		.cfi_def_cfa_offset 16
 2696 0c40 00AF     		add	r7, sp, #0
 2697              		.cfi_def_cfa_register 7
 2698 0c42 7860     		str	r0, [r7, #4]
   5:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	clear_object(this);
 2699              		.loc 5 5 0
 2700 0c44 7B68     		ldr	r3, [r7, #4]
 2701 0c46 1800     		movs	r0, r3
 2702 0c48 FFF7FEFF 		bl	clear_object
   6:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	
   7:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	this->posY += this->dirY;
 2703              		.loc 5 7 0
 2704 0c4c 7B68     		ldr	r3, [r7, #4]
 2705 0c4e 1A69     		ldr	r2, [r3, #16]
 2706 0c50 7B68     		ldr	r3, [r7, #4]
 2707 0c52 9B68     		ldr	r3, [r3, #8]
 2708 0c54 D218     		adds	r2, r2, r3
 2709 0c56 7B68     		ldr	r3, [r7, #4]
 2710 0c58 1A61     		str	r2, [r3, #16]
   8:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	
   9:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	if(this->posY < 0) {
 2711              		.loc 5 9 0
 2712 0c5a 7B68     		ldr	r3, [r7, #4]
 2713 0c5c 1B69     		ldr	r3, [r3, #16]
 2714 0c5e 002B     		cmp	r3, #0
 2715 0c60 03DA     		bge	.L175
  10:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 		this->posY = 0;
 2716              		.loc 5 10 0
 2717 0c62 7B68     		ldr	r3, [r7, #4]
 2718 0c64 0022     		movs	r2, #0
 2719 0c66 1A61     		str	r2, [r3, #16]
 2720 0c68 0EE0     		b	.L176
 2721              	.L175:
  11:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	} else if(this->posY + this->geo->sizeY > 63) {
 2722              		.loc 5 11 0
 2723 0c6a 7B68     		ldr	r3, [r7, #4]
 2724 0c6c 1A69     		ldr	r2, [r3, #16]
 2725 0c6e 7B68     		ldr	r3, [r7, #4]
 2726 0c70 1B68     		ldr	r3, [r3]
 2727 0c72 9B68     		ldr	r3, [r3, #8]
 2728 0c74 D318     		adds	r3, r2, r3
 2729 0c76 3F2B     		cmp	r3, #63
 2730 0c78 06DD     		ble	.L176
  12:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 		this->posY = 63 - this->geo->sizeY;
 2731              		.loc 5 12 0
 2732 0c7a 7B68     		ldr	r3, [r7, #4]
 2733 0c7c 1B68     		ldr	r3, [r3]
 2734 0c7e 9B68     		ldr	r3, [r3, #8]
 2735 0c80 3F22     		movs	r2, #63
 2736 0c82 D21A     		subs	r2, r2, r3
 2737 0c84 7B68     		ldr	r3, [r7, #4]
 2738 0c86 1A61     		str	r2, [r3, #16]
 2739              	.L176:
  13:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	}
  14:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	
  15:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** 	this->draw(this);
 2740              		.loc 5 15 0
 2741 0c88 7B68     		ldr	r3, [r7, #4]
 2742 0c8a 5B69     		ldr	r3, [r3, #20]
 2743 0c8c 7A68     		ldr	r2, [r7, #4]
 2744 0c8e 1000     		movs	r0, r2
 2745 0c90 9847     		blx	r3
 2746              	.LVL0:
  16:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\paddle.h **** }
 2747              		.loc 5 16 0
 2748 0c92 C046     		nop
 2749 0c94 BD46     		mov	sp, r7
 2750 0c96 02B0     		add	sp, sp, #8
 2751              		@ sp needed
 2752 0c98 80BD     		pop	{r7, pc}
 2753              		.cfi_endproc
 2754              	.LFE33:
 2756              		.global	paddle_geometry
 2757              		.data
 2758              		.align	2
 2761              	paddle_geometry:
 2762 0000 4B000000 		.word	75
 2763 0004 02000000 		.word	2
 2764 0008 19000000 		.word	25
 2765 000c 00       		.byte	0
 2766 000d 01       		.byte	1
 2767 000e 00       		.byte	0
 2768 000f 02       		.byte	2
 2769 0010 00       		.byte	0
 2770 0011 03       		.byte	3
 2771 0012 00       		.byte	0
 2772 0013 04       		.byte	4
 2773 0014 00       		.byte	0
 2774 0015 05       		.byte	5
 2775 0016 00       		.byte	0
 2776 0017 06       		.byte	6
 2777 0018 00       		.byte	0
 2778 0019 07       		.byte	7
 2779 001a 00       		.byte	0
 2780 001b 08       		.byte	8
 2781 001c 00       		.byte	0
 2782 001d 09       		.byte	9
 2783 001e 00       		.byte	0
 2784 001f 0A       		.byte	10
 2785 0020 00       		.byte	0
 2786 0021 0B       		.byte	11
 2787 0022 00       		.byte	0
 2788 0023 0C       		.byte	12
 2789 0024 00       		.byte	0
 2790 0025 0D       		.byte	13
 2791 0026 00       		.byte	0
 2792 0027 0E       		.byte	14
 2793 0028 00       		.byte	0
 2794 0029 0F       		.byte	15
 2795 002a 00       		.byte	0
 2796 002b 10       		.byte	16
 2797 002c 00       		.byte	0
 2798 002d 11       		.byte	17
 2799 002e 00       		.byte	0
 2800 002f 12       		.byte	18
 2801 0030 00       		.byte	0
 2802 0031 13       		.byte	19
 2803 0032 00       		.byte	0
 2804 0033 14       		.byte	20
 2805 0034 00       		.byte	0
 2806 0035 15       		.byte	21
 2807 0036 00       		.byte	0
 2808 0037 16       		.byte	22
 2809 0038 00       		.byte	0
 2810 0039 17       		.byte	23
 2811 003a 00       		.byte	0
 2812 003b 18       		.byte	24
 2813 003c 00       		.byte	0
 2814 003d 19       		.byte	25
 2815 003e 01       		.byte	1
 2816 003f 01       		.byte	1
 2817 0040 01       		.byte	1
 2818 0041 02       		.byte	2
 2819 0042 01       		.byte	1
 2820 0043 03       		.byte	3
 2821 0044 01       		.byte	1
 2822 0045 04       		.byte	4
 2823 0046 01       		.byte	1
 2824 0047 05       		.byte	5
 2825 0048 01       		.byte	1
 2826 0049 06       		.byte	6
 2827 004a 01       		.byte	1
 2828 004b 07       		.byte	7
 2829 004c 01       		.byte	1
 2830 004d 08       		.byte	8
 2831 004e 01       		.byte	1
 2832 004f 09       		.byte	9
 2833 0050 01       		.byte	1
 2834 0051 0A       		.byte	10
 2835 0052 01       		.byte	1
 2836 0053 0B       		.byte	11
 2837 0054 01       		.byte	1
 2838 0055 0C       		.byte	12
 2839 0056 01       		.byte	1
 2840 0057 0D       		.byte	13
 2841 0058 01       		.byte	1
 2842 0059 0E       		.byte	14
 2843 005a 01       		.byte	1
 2844 005b 0F       		.byte	15
 2845 005c 01       		.byte	1
 2846 005d 10       		.byte	16
 2847 005e 01       		.byte	1
 2848 005f 11       		.byte	17
 2849 0060 01       		.byte	1
 2850 0061 12       		.byte	18
 2851 0062 01       		.byte	1
 2852 0063 13       		.byte	19
 2853 0064 01       		.byte	1
 2854 0065 14       		.byte	20
 2855 0066 01       		.byte	1
 2856 0067 15       		.byte	21
 2857 0068 01       		.byte	1
 2858 0069 16       		.byte	22
 2859 006a 01       		.byte	1
 2860 006b 17       		.byte	23
 2861 006c 01       		.byte	1
 2862 006d 18       		.byte	24
 2863 006e 01       		.byte	1
 2864 006f 19       		.byte	25
 2865 0070 02       		.byte	2
 2866 0071 01       		.byte	1
 2867 0072 02       		.byte	2
 2868 0073 02       		.byte	2
 2869 0074 02       		.byte	2
 2870 0075 03       		.byte	3
 2871 0076 02       		.byte	2
 2872 0077 04       		.byte	4
 2873 0078 02       		.byte	2
 2874 0079 05       		.byte	5
 2875 007a 02       		.byte	2
 2876 007b 06       		.byte	6
 2877 007c 02       		.byte	2
 2878 007d 07       		.byte	7
 2879 007e 02       		.byte	2
 2880 007f 08       		.byte	8
 2881 0080 02       		.byte	2
 2882 0081 09       		.byte	9
 2883 0082 02       		.byte	2
 2884 0083 0A       		.byte	10
 2885 0084 02       		.byte	2
 2886 0085 0B       		.byte	11
 2887 0086 02       		.byte	2
 2888 0087 0C       		.byte	12
 2889 0088 02       		.byte	2
 2890 0089 0D       		.byte	13
 2891 008a 02       		.byte	2
 2892 008b 0E       		.byte	14
 2893 008c 02       		.byte	2
 2894 008d 0F       		.byte	15
 2895 008e 02       		.byte	2
 2896 008f 10       		.byte	16
 2897 0090 02       		.byte	2
 2898 0091 11       		.byte	17
 2899 0092 02       		.byte	2
 2900 0093 12       		.byte	18
 2901 0094 02       		.byte	2
 2902 0095 13       		.byte	19
 2903 0096 02       		.byte	2
 2904 0097 14       		.byte	20
 2905 0098 02       		.byte	2
 2906 0099 15       		.byte	21
 2907 009a 02       		.byte	2
 2908 009b 16       		.byte	22
 2909 009c 02       		.byte	2
 2910 009d 17       		.byte	23
 2911 009e 02       		.byte	2
 2912 009f 18       		.byte	24
 2913 00a0 02       		.byte	2
 2914 00a1 19       		.byte	25
 2915 00a2 0000     		.space	2
 2916              		.global	Rpaddle
 2917              		.align	2
 2920              	Rpaddle:
 2921 00a4 00000000 		.word	paddle_geometry
 2922 00a8 00000000 		.word	0
 2923 00ac 00000000 		.word	0
 2924 00b0 7D000000 		.word	125
 2925 00b4 01000000 		.word	1
 2926 00b8 00000000 		.word	draw_object
 2927 00bc 00000000 		.word	clear_object
 2928 00c0 00000000 		.word	move_paddle
 2929 00c4 00000000 		.word	set_object_speed
 2930              		.global	Lpaddle
 2931              		.align	2
 2934              	Lpaddle:
 2935 00c8 00000000 		.word	paddle_geometry
 2936 00cc 00000000 		.word	0
 2937 00d0 00000000 		.word	0
 2938 00d4 01000000 		.word	1
 2939 00d8 01000000 		.word	1
 2940 00dc 00000000 		.word	draw_object
 2941 00e0 00000000 		.word	clear_object
 2942 00e4 00000000 		.word	move_paddle
 2943 00e8 00000000 		.word	set_object_speed
 2944              		.text
 2945              		.align	1
 2946              		.global	move_ball
 2947              		.syntax unified
 2948              		.code	16
 2949              		.thumb_func
 2950              		.fpu softvfp
 2952              	move_ball:
 2953              	.LFB34:
 2954              		.file 6 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/ball.h"
   1:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** #include "object.h"
   2:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** #include "paddle.h"
   3:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 
   4:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** void move_ball(POBJECT this) {
 2955              		.loc 6 4 0
 2956              		.cfi_startproc
 2957              		@ args = 0, pretend = 0, frame = 16
 2958              		@ frame_needed = 1, uses_anonymous_args = 0
 2959 0c9a 80B5     		push	{r7, lr}
 2960              		.cfi_def_cfa_offset 8
 2961              		.cfi_offset 7, -8
 2962              		.cfi_offset 14, -4
 2963 0c9c 84B0     		sub	sp, sp, #16
 2964              		.cfi_def_cfa_offset 24
 2965 0c9e 00AF     		add	r7, sp, #0
 2966              		.cfi_def_cfa_register 7
 2967 0ca0 7860     		str	r0, [r7, #4]
   5:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
   6:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h ****     this->posX += this->dirX;
 2968              		.loc 6 6 0
 2969 0ca2 7B68     		ldr	r3, [r7, #4]
 2970 0ca4 DA68     		ldr	r2, [r3, #12]
 2971 0ca6 7B68     		ldr	r3, [r7, #4]
 2972 0ca8 5B68     		ldr	r3, [r3, #4]
 2973 0caa D218     		adds	r2, r2, r3
 2974 0cac 7B68     		ldr	r3, [r7, #4]
 2975 0cae DA60     		str	r2, [r3, #12]
   7:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	this->posY += this->dirY;
 2976              		.loc 6 7 0
 2977 0cb0 7B68     		ldr	r3, [r7, #4]
 2978 0cb2 1A69     		ldr	r2, [r3, #16]
 2979 0cb4 7B68     		ldr	r3, [r7, #4]
 2980 0cb6 9B68     		ldr	r3, [r3, #8]
 2981 0cb8 D218     		adds	r2, r2, r3
 2982 0cba 7B68     		ldr	r3, [r7, #4]
 2983 0cbc 1A61     		str	r2, [r3, #16]
   8:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
   9:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
  10:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
  11:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	if((this->posY < 0) ||  this->posY > 63 ) {
 2984              		.loc 6 11 0
 2985 0cbe 7B68     		ldr	r3, [r7, #4]
 2986 0cc0 1B69     		ldr	r3, [r3, #16]
 2987 0cc2 002B     		cmp	r3, #0
 2988 0cc4 03DB     		blt	.L178
 2989              		.loc 6 11 0 is_stmt 0 discriminator 1
 2990 0cc6 7B68     		ldr	r3, [r7, #4]
 2991 0cc8 1B69     		ldr	r3, [r3, #16]
 2992 0cca 3F2B     		cmp	r3, #63
 2993 0ccc 04DD     		ble	.L179
 2994              	.L178:
  12:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 		this->dirY = -this->dirY;
 2995              		.loc 6 12 0 is_stmt 1
 2996 0cce 7B68     		ldr	r3, [r7, #4]
 2997 0cd0 9B68     		ldr	r3, [r3, #8]
 2998 0cd2 5A42     		rsbs	r2, r3, #0
 2999 0cd4 7B68     		ldr	r3, [r7, #4]
 3000 0cd6 9A60     		str	r2, [r3, #8]
 3001              	.L179:
  13:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	}
  14:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
  15:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	// Define left and right paddle
  16:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	POBJECT lp = &Lpaddle;
 3002              		.loc 6 16 0
 3003 0cd8 234B     		ldr	r3, .L182
 3004 0cda FB60     		str	r3, [r7, #12]
  17:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	POBJECT rp = &Rpaddle;
 3005              		.loc 6 17 0
 3006 0cdc 234B     		ldr	r3, .L182+4
 3007 0cde BB60     		str	r3, [r7, #8]
  18:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
  19:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	//Rpaddle collision
  20:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	if(this->posX <= lp->posX + lp->geo->sizeX) {
 3008              		.loc 6 20 0
 3009 0ce0 7B68     		ldr	r3, [r7, #4]
 3010 0ce2 DA68     		ldr	r2, [r3, #12]
 3011 0ce4 FB68     		ldr	r3, [r7, #12]
 3012 0ce6 D968     		ldr	r1, [r3, #12]
 3013 0ce8 FB68     		ldr	r3, [r7, #12]
 3014 0cea 1B68     		ldr	r3, [r3]
 3015 0cec 5B68     		ldr	r3, [r3, #4]
 3016 0cee CB18     		adds	r3, r1, r3
 3017 0cf0 9A42     		cmp	r2, r3
 3018 0cf2 14DC     		bgt	.L180
  21:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 		if((this->posY >= lp->posY) && (this->posY <= lp->posY + lp->geo->sizeY)) {
 3019              		.loc 6 21 0
 3020 0cf4 7B68     		ldr	r3, [r7, #4]
 3021 0cf6 1A69     		ldr	r2, [r3, #16]
 3022 0cf8 FB68     		ldr	r3, [r7, #12]
 3023 0cfa 1B69     		ldr	r3, [r3, #16]
 3024 0cfc 9A42     		cmp	r2, r3
 3025 0cfe 0EDB     		blt	.L180
 3026              		.loc 6 21 0 is_stmt 0 discriminator 1
 3027 0d00 7B68     		ldr	r3, [r7, #4]
 3028 0d02 1A69     		ldr	r2, [r3, #16]
 3029 0d04 FB68     		ldr	r3, [r7, #12]
 3030 0d06 1969     		ldr	r1, [r3, #16]
 3031 0d08 FB68     		ldr	r3, [r7, #12]
 3032 0d0a 1B68     		ldr	r3, [r3]
 3033 0d0c 9B68     		ldr	r3, [r3, #8]
 3034 0d0e CB18     		adds	r3, r1, r3
 3035 0d10 9A42     		cmp	r2, r3
 3036 0d12 04DC     		bgt	.L180
  22:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 			this->dirX = -this->dirX;
 3037              		.loc 6 22 0 is_stmt 1
 3038 0d14 7B68     		ldr	r3, [r7, #4]
 3039 0d16 5B68     		ldr	r3, [r3, #4]
 3040 0d18 5A42     		rsbs	r2, r3, #0
 3041 0d1a 7B68     		ldr	r3, [r7, #4]
 3042 0d1c 5A60     		str	r2, [r3, #4]
 3043              	.L180:
  23:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 		} else {
  24:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 			//Print ascii string to show score
  25:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 		}
  26:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	}
  27:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
  28:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	//Lpaddle collision
  29:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	if(this->posX >= rp->posX) {
 3044              		.loc 6 29 0
 3045 0d1e 7B68     		ldr	r3, [r7, #4]
 3046 0d20 DA68     		ldr	r2, [r3, #12]
 3047 0d22 BB68     		ldr	r3, [r7, #8]
 3048 0d24 DB68     		ldr	r3, [r3, #12]
 3049 0d26 9A42     		cmp	r2, r3
 3050 0d28 14DB     		blt	.L181
  30:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 		if((this->posY >= rp->posY) && (this->posY <= rp->posY + rp->geo->sizeY)) {
 3051              		.loc 6 30 0
 3052 0d2a 7B68     		ldr	r3, [r7, #4]
 3053 0d2c 1A69     		ldr	r2, [r3, #16]
 3054 0d2e BB68     		ldr	r3, [r7, #8]
 3055 0d30 1B69     		ldr	r3, [r3, #16]
 3056 0d32 9A42     		cmp	r2, r3
 3057 0d34 0EDB     		blt	.L181
 3058              		.loc 6 30 0 is_stmt 0 discriminator 1
 3059 0d36 7B68     		ldr	r3, [r7, #4]
 3060 0d38 1A69     		ldr	r2, [r3, #16]
 3061 0d3a BB68     		ldr	r3, [r7, #8]
 3062 0d3c 1969     		ldr	r1, [r3, #16]
 3063 0d3e BB68     		ldr	r3, [r7, #8]
 3064 0d40 1B68     		ldr	r3, [r3]
 3065 0d42 9B68     		ldr	r3, [r3, #8]
 3066 0d44 CB18     		adds	r3, r1, r3
 3067 0d46 9A42     		cmp	r2, r3
 3068 0d48 04DC     		bgt	.L181
  31:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 			this->dirX = -this->dirX;
 3069              		.loc 6 31 0 is_stmt 1
 3070 0d4a 7B68     		ldr	r3, [r7, #4]
 3071 0d4c 5B68     		ldr	r3, [r3, #4]
 3072 0d4e 5A42     		rsbs	r2, r3, #0
 3073 0d50 7B68     		ldr	r3, [r7, #4]
 3074 0d52 5A60     		str	r2, [r3, #4]
 3075              	.L181:
  32:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 		} else {
  33:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 			//Print ascii string to show score
  34:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 		}
  35:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	}
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	
  37:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** 	this->draw(this);
 3076              		.loc 6 37 0
 3077 0d54 7B68     		ldr	r3, [r7, #4]
 3078 0d56 5B69     		ldr	r3, [r3, #20]
 3079 0d58 7A68     		ldr	r2, [r7, #4]
 3080 0d5a 1000     		movs	r0, r2
 3081 0d5c 9847     		blx	r3
 3082              	.LVL1:
  38:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\ball.h **** }
 3083              		.loc 6 38 0
 3084 0d5e C046     		nop
 3085 0d60 BD46     		mov	sp, r7
 3086 0d62 04B0     		add	sp, sp, #16
 3087              		@ sp needed
 3088 0d64 80BD     		pop	{r7, pc}
 3089              	.L183:
 3090 0d66 C046     		.align	2
 3091              	.L182:
 3092 0d68 00000000 		.word	Lpaddle
 3093 0d6c 00000000 		.word	Rpaddle
 3094              		.cfi_endproc
 3095              	.LFE34:
 3097              		.global	ball_geometry
 3098              		.data
 3099              		.align	2
 3102              	ball_geometry:
 3103 00ec 0C000000 		.word	12
 3104 00f0 04000000 		.word	4
 3105 00f4 04000000 		.word	4
 3106 00f8 00       		.byte	0
 3107 00f9 01       		.byte	1
 3108 00fa 00       		.byte	0
 3109 00fb 02       		.byte	2
 3110 00fc 01       		.byte	1
 3111 00fd 00       		.byte	0
 3112 00fe 01       		.byte	1
 3113 00ff 01       		.byte	1
 3114 0100 01       		.byte	1
 3115 0101 02       		.byte	2
 3116 0102 01       		.byte	1
 3117 0103 03       		.byte	3
 3118 0104 02       		.byte	2
 3119 0105 00       		.byte	0
 3120 0106 02       		.byte	2
 3121 0107 01       		.byte	1
 3122 0108 02       		.byte	2
 3123 0109 02       		.byte	2
 3124 010a 02       		.byte	2
 3125 010b 03       		.byte	3
 3126 010c 03       		.byte	3
 3127 010d 01       		.byte	1
 3128 010e 03       		.byte	3
 3129 010f 02       		.byte	2
 3130 0110 00000000 		.space	126
 3130      00000000 
 3130      00000000 
 3130      00000000 
 3130      00000000 
 3131 018e 0000     		.space	2
 3132              		.global	ball
 3133              		.align	2
 3136              	ball:
 3137 0190 00000000 		.word	ball_geometry
 3138 0194 00000000 		.word	0
 3139 0198 00000000 		.word	0
 3140 019c 01000000 		.word	1
 3141 01a0 01000000 		.word	1
 3142 01a4 00000000 		.word	draw_object
 3143 01a8 00000000 		.word	clear_object
 3144 01ac 00000000 		.word	move_ball
 3145 01b0 00000000 		.word	set_object_speed
 3146              		.section	.start_section,"ax",%progbits
 3147              		.align	1
 3148              		.global	startup
 3149              		.syntax unified
 3150              		.code	16
 3151              		.thumb_func
 3152              		.fpu softvfp
 3154              	startup:
 3155              	.LFB35:
 3156              		.file 7 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/startup.c"
   1:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** /*
   2:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****  * 	startup.c
   3:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****  *
   4:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****  */
   5:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** #define SIMULATOR
   6:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
   7:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** #include "registers.h"
   8:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** #include "graphics.h"
   9:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** #include "keypad.h"
  10:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** #include "object.h"
  11:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** #include "ball.h"
  12:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  13:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****  
  14:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** extern OBJECT ball;
  15:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****  
  16:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  17:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  18:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** void startup ( void )
  19:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** {
 3157              		.loc 7 19 0
 3158              		.cfi_startproc
 3159              		@ Naked Function: prologue and epilogue provided by programmer.
 3160              		@ args = 0, pretend = 0, frame = 0
 3161              		@ frame_needed = 1, uses_anonymous_args = 0
  20:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** asm volatile(
 3162              		.loc 7 20 0
 3163              		.syntax divided
 3164              	@ 20 "C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000/startup.c" 1
 3165 0000 0248     		 LDR R0,=0x2001C000
 3166 0002 8546     	 MOV SP,R0
 3167 0004 FFF7FEFF 	 BL main
 3168 0008 FEE7     	.L1: B .L1
 3169              	
 3170              	@ 0 "" 2
  21:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  22:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	" MOV SP,R0\n"
  23:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	" BL main\n"				/* call main */
  24:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	".L1: B .L1\n"				/* never return */
  25:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	) ;
  26:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** }
 3171              		.loc 7 26 0
 3172              		.thumb
 3173              		.syntax unified
 3174 000a C046     		nop
 3175              		.cfi_endproc
 3176              	.LFE35:
 3178              		.text
 3179              		.align	1
 3180              		.global	init_app
 3181              		.syntax unified
 3182              		.code	16
 3183              		.thumb_func
 3184              		.fpu softvfp
 3186              	init_app:
 3187              	.LFB36:
  27:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  28:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** void init_app(void){
 3188              		.loc 7 28 0
 3189              		.cfi_startproc
 3190              		@ args = 0, pretend = 0, frame = 0
 3191              		@ frame_needed = 1, uses_anonymous_args = 0
 3192 0d70 80B5     		push	{r7, lr}
 3193              		.cfi_def_cfa_offset 8
 3194              		.cfi_offset 7, -8
 3195              		.cfi_offset 14, -4
 3196 0d72 00AF     		add	r7, sp, #0
 3197              		.cfi_def_cfa_register 7
  29:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         *GPIO_E_MODER = 0x55555555;
 3198              		.loc 7 29 0
 3199 0d74 0C4B     		ldr	r3, .L186
 3200 0d76 0D4A     		ldr	r2, .L186+4
 3201 0d78 1A60     		str	r2, [r3]
  30:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         
  31:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         *GPIO_D_MODER = 0x55555555;
 3202              		.loc 7 31 0
 3203 0d7a 0D4B     		ldr	r3, .L186+8
 3204 0d7c 0B4A     		ldr	r2, .L186+4
 3205 0d7e 1A60     		str	r2, [r3]
  32:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         
  33:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         *GPIO_D_MODER = 0x55005555;
 3206              		.loc 7 33 0
 3207 0d80 0B4B     		ldr	r3, .L186+8
 3208 0d82 0C4A     		ldr	r2, .L186+12
 3209 0d84 1A60     		str	r2, [r3]
  34:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****      //set all bits as push pull
  35:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         *GPIO_D_OTYPER &= 0x0000FFFF;   
 3210              		.loc 7 35 0
 3211 0d86 0C4B     		ldr	r3, .L186+16
 3212 0d88 0B4A     		ldr	r2, .L186+16
 3213 0d8a 1288     		ldrh	r2, [r2]
 3214 0d8c 92B2     		uxth	r2, r2
 3215 0d8e 1A80     		strh	r2, [r3]
  36:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         *GPIO_D_OTYPER |= 0x00000000;   
 3216              		.loc 7 36 0
 3217 0d90 094B     		ldr	r3, .L186+16
 3218 0d92 094A     		ldr	r2, .L186+16
 3219 0d94 1288     		ldrh	r2, [r2]
 3220 0d96 92B2     		uxth	r2, r2
 3221 0d98 1A80     		strh	r2, [r3]
  37:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****      //
  38:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****      //PORT_PUPDR = 0xzz55zzzz;   
  39:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         *GPIO_D_PUPDR = 0x00AA0000;   
 3222              		.loc 7 39 0
 3223 0d9a 084B     		ldr	r3, .L186+20
 3224 0d9c AA22     		movs	r2, #170
 3225 0d9e 1204     		lsls	r2, r2, #16
 3226 0da0 1A60     		str	r2, [r3]
  40:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     }
 3227              		.loc 7 40 0
 3228 0da2 C046     		nop
 3229 0da4 BD46     		mov	sp, r7
 3230              		@ sp needed
 3231 0da6 80BD     		pop	{r7, pc}
 3232              	.L187:
 3233              		.align	2
 3234              	.L186:
 3235 0da8 00100240 		.word	1073876992
 3236 0dac 55555555 		.word	1431655765
 3237 0db0 000C0240 		.word	1073875968
 3238 0db4 55550055 		.word	1426085205
 3239 0db8 040C0240 		.word	1073875972
 3240 0dbc 0C0C0240 		.word	1073875980
 3241              		.cfi_endproc
 3242              	.LFE36:
 3244              		.align	1
 3245              		.global	movePaddles
 3246              		.syntax unified
 3247              		.code	16
 3248              		.thumb_func
 3249              		.fpu softvfp
 3251              	movePaddles:
 3252              	.LFB37:
  41:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	
  42:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** void movePaddles(unsigned char c){
 3253              		.loc 7 42 0
 3254              		.cfi_startproc
 3255              		@ args = 0, pretend = 0, frame = 8
 3256              		@ frame_needed = 1, uses_anonymous_args = 0
 3257 0dc0 80B5     		push	{r7, lr}
 3258              		.cfi_def_cfa_offset 8
 3259              		.cfi_offset 7, -8
 3260              		.cfi_offset 14, -4
 3261 0dc2 82B0     		sub	sp, sp, #8
 3262              		.cfi_def_cfa_offset 16
 3263 0dc4 00AF     		add	r7, sp, #0
 3264              		.cfi_def_cfa_register 7
 3265 0dc6 0200     		movs	r2, r0
 3266 0dc8 FB1D     		adds	r3, r7, #7
 3267 0dca 1A70     		strb	r2, [r3]
  43:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	if(c == 1){Lpaddle.posY--; }
 3268              		.loc 7 43 0
 3269 0dcc FB1D     		adds	r3, r7, #7
 3270 0dce 1B78     		ldrb	r3, [r3]
 3271 0dd0 012B     		cmp	r3, #1
 3272 0dd2 04D1     		bne	.L189
 3273              		.loc 7 43 0 is_stmt 0 discriminator 1
 3274 0dd4 114B     		ldr	r3, .L194
 3275 0dd6 1B69     		ldr	r3, [r3, #16]
 3276 0dd8 5A1E     		subs	r2, r3, #1
 3277 0dda 104B     		ldr	r3, .L194
 3278 0ddc 1A61     		str	r2, [r3, #16]
 3279              	.L189:
  44:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	if(c == 4){Lpaddle.posY++; }
 3280              		.loc 7 44 0 is_stmt 1
 3281 0dde FB1D     		adds	r3, r7, #7
 3282 0de0 1B78     		ldrb	r3, [r3]
 3283 0de2 042B     		cmp	r3, #4
 3284 0de4 04D1     		bne	.L190
 3285              		.loc 7 44 0 is_stmt 0 discriminator 1
 3286 0de6 0D4B     		ldr	r3, .L194
 3287 0de8 1B69     		ldr	r3, [r3, #16]
 3288 0dea 5A1C     		adds	r2, r3, #1
 3289 0dec 0B4B     		ldr	r3, .L194
 3290 0dee 1A61     		str	r2, [r3, #16]
 3291              	.L190:
  45:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	
  46:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	if(c == 3){Rpaddle.posY--; }
 3292              		.loc 7 46 0 is_stmt 1
 3293 0df0 FB1D     		adds	r3, r7, #7
 3294 0df2 1B78     		ldrb	r3, [r3]
 3295 0df4 032B     		cmp	r3, #3
 3296 0df6 04D1     		bne	.L191
 3297              		.loc 7 46 0 is_stmt 0 discriminator 1
 3298 0df8 094B     		ldr	r3, .L194+4
 3299 0dfa 1B69     		ldr	r3, [r3, #16]
 3300 0dfc 5A1E     		subs	r2, r3, #1
 3301 0dfe 084B     		ldr	r3, .L194+4
 3302 0e00 1A61     		str	r2, [r3, #16]
 3303              	.L191:
  47:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	if(c == 6){Rpaddle.posY++; }
 3304              		.loc 7 47 0 is_stmt 1
 3305 0e02 FB1D     		adds	r3, r7, #7
 3306 0e04 1B78     		ldrb	r3, [r3]
 3307 0e06 062B     		cmp	r3, #6
 3308 0e08 04D1     		bne	.L193
 3309              		.loc 7 47 0 is_stmt 0 discriminator 1
 3310 0e0a 054B     		ldr	r3, .L194+4
 3311 0e0c 1B69     		ldr	r3, [r3, #16]
 3312 0e0e 5A1C     		adds	r2, r3, #1
 3313 0e10 034B     		ldr	r3, .L194+4
 3314 0e12 1A61     		str	r2, [r3, #16]
 3315              	.L193:
  48:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	
  49:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	}
 3316              		.loc 7 49 0 is_stmt 1
 3317 0e14 C046     		nop
 3318 0e16 BD46     		mov	sp, r7
 3319 0e18 02B0     		add	sp, sp, #8
 3320              		@ sp needed
 3321 0e1a 80BD     		pop	{r7, pc}
 3322              	.L195:
 3323              		.align	2
 3324              	.L194:
 3325 0e1c 00000000 		.word	Lpaddle
 3326 0e20 00000000 		.word	Rpaddle
 3327              		.cfi_endproc
 3328              	.LFE37:
 3330              		.align	1
 3331              		.global	main
 3332              		.syntax unified
 3333              		.code	16
 3334              		.thumb_func
 3335              		.fpu softvfp
 3337              	main:
 3338              	.LFB38:
  50:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  51:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	
  52:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** //void movePaddles(unsigned char player1, unsigned char player2){
  53:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** //	if(player1 == 1){Lpaddle.posY--; }
  54:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** //	if(player1 == 4){Lpaddle.posY++; }
  55:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	
  56:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** //	if(player2 == 3){Rpaddle.posY--; }
  57:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** //	if(player2 == 6){Rpaddle.posY++; }
  58:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 	
  59:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** //	}
  60:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  61:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** void main(void)
  62:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** {
 3339              		.loc 7 62 0
 3340              		.cfi_startproc
 3341              		@ args = 0, pretend = 0, frame = 16
 3342              		@ frame_needed = 1, uses_anonymous_args = 0
 3343 0e24 80B5     		push	{r7, lr}
 3344              		.cfi_def_cfa_offset 8
 3345              		.cfi_offset 7, -8
 3346              		.cfi_offset 14, -4
 3347 0e26 84B0     		sub	sp, sp, #16
 3348              		.cfi_def_cfa_offset 24
 3349 0e28 00AF     		add	r7, sp, #0
 3350              		.cfi_def_cfa_register 7
  63:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     init_app();
 3351              		.loc 7 63 0
 3352 0e2a FFF7FEFF 		bl	init_app
  64:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     graphic_initialize();
 3353              		.loc 7 64 0
 3354 0e2e FFF7FEFF 		bl	graphic_initialize
  65:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     #ifndef SIMULATOR
  66:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         graphics_clear_screen();
  67:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     #endif
  68:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  69:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     POBJECT p = &ball;
 3355              		.loc 7 69 0
 3356 0e32 134B     		ldr	r3, .L198
 3357 0e34 FB60     		str	r3, [r7, #12]
  70:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     POBJECT Lpad = &Lpaddle;
 3358              		.loc 7 70 0
 3359 0e36 134B     		ldr	r3, .L198+4
 3360 0e38 BB60     		str	r3, [r7, #8]
  71:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     POBJECT Rpad = &Rpaddle;
 3361              		.loc 7 71 0
 3362 0e3a 134B     		ldr	r3, .L198+8
 3363 0e3c 7B60     		str	r3, [r7, #4]
  72:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     
  73:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     p->set_speed(p, 4, 4);
 3364              		.loc 7 73 0
 3365 0e3e FB68     		ldr	r3, [r7, #12]
 3366 0e40 1B6A     		ldr	r3, [r3, #32]
 3367 0e42 F868     		ldr	r0, [r7, #12]
 3368 0e44 0422     		movs	r2, #4
 3369 0e46 0421     		movs	r1, #4
 3370 0e48 9847     		blx	r3
 3371              	.LVL2:
 3372              	.L197:
  74:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     
  75:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****     while(1){
  76:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 		//array move
  77:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 		movePaddles(keyb());
 3373              		.loc 7 77 0 discriminator 1
 3374 0e4a FFF7FEFF 		bl	keyb
 3375 0e4e 0300     		movs	r3, r0
 3376 0e50 1800     		movs	r0, r3
 3377 0e52 FFF7FEFF 		bl	movePaddles
  78:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 		//unsigned char c = keyb()[1];
  79:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 		//movePaddles(keyb()[0], keyb()[2] );
  80:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  81:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         p->move(p);
 3378              		.loc 7 81 0 discriminator 1
 3379 0e56 FB68     		ldr	r3, [r7, #12]
 3380 0e58 DB69     		ldr	r3, [r3, #28]
 3381 0e5a FA68     		ldr	r2, [r7, #12]
 3382 0e5c 1000     		movs	r0, r2
 3383 0e5e 9847     		blx	r3
 3384              	.LVL3:
  82:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         Lpad->move(Lpad);
 3385              		.loc 7 82 0 discriminator 1
 3386 0e60 BB68     		ldr	r3, [r7, #8]
 3387 0e62 DB69     		ldr	r3, [r3, #28]
 3388 0e64 BA68     		ldr	r2, [r7, #8]
 3389 0e66 1000     		movs	r0, r2
 3390 0e68 9847     		blx	r3
 3391              	.LVL4:
  83:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         Rpad->move(Rpad);
 3392              		.loc 7 83 0 discriminator 1
 3393 0e6a 7B68     		ldr	r3, [r7, #4]
 3394 0e6c DB69     		ldr	r3, [r3, #28]
 3395 0e6e 7A68     		ldr	r2, [r7, #4]
 3396 0e70 1000     		movs	r0, r2
 3397 0e72 9847     		blx	r3
 3398              	.LVL5:
  84:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 
  85:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         delay_milli(40);
 3399              		.loc 7 85 0 discriminator 1
 3400 0e74 2820     		movs	r0, #40
 3401 0e76 FFF7FEFF 		bl	delay_milli
  86:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c ****         graphics_clear_screen();
 3402              		.loc 7 86 0 discriminator 1
 3403 0e7a FFF7FEFF 		bl	graphics_clear_screen
  77:C:/Users/jesbli/Desktop/DAT017-master/MD407/Kap5/Moplaborationer/pong2000\startup.c **** 		//unsigned char c = keyb()[1];
 3404              		.loc 7 77 0 discriminator 1
 3405 0e7e E4E7     		b	.L197
 3406              	.L199:
 3407              		.align	2
 3408              	.L198:
 3409 0e80 00000000 		.word	ball
 3410 0e84 00000000 		.word	Lpaddle
 3411 0e88 00000000 		.word	Rpaddle
 3412              		.cfi_endproc
 3413              	.LFE38:
 3415              	.Letext0:
