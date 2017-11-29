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
  24              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****  * 	delay.h
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** // Timer setup
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** #ifndef TIMER_H
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** #define TIMER_H
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** #define STK 0xE000E010
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** #define STK_CTRL ((volatile unsigned int *) (STK))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** void delay_250ns(void) {
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
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	*STK_CTRL = 0;
  35              		.loc 1 15 0
  36 0004 0C4B     		ldr	r3, .L3
  37 0006 0022     		movs	r2, #0
  38 0008 1A60     		str	r2, [r3]
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  39              		.loc 1 16 0
  40 000a 0C4B     		ldr	r3, .L3+4
  41 000c 3122     		movs	r2, #49
  42 000e 1A60     		str	r2, [r3]
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	*STK_VAL = 0;
  43              		.loc 1 17 0
  44 0010 0B4B     		ldr	r3, .L3+8
  45 0012 0022     		movs	r2, #0
  46 0014 1A60     		str	r2, [r3]
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	*STK_CTRL = 5;
  47              		.loc 1 18 0
  48 0016 084B     		ldr	r3, .L3
  49 0018 0522     		movs	r2, #5
  50 001a 1A60     		str	r2, [r3]
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	while((*STK_CTRL & 0x10000) == 0) {
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
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		// ??????
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	}
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	*STK_CTRL = 0;
  61              		.loc 1 22 0 is_stmt 1
  62 002a 034B     		ldr	r3, .L3
  63 002c 0022     		movs	r2, #0
  64 002e 1A60     		str	r2, [r3]
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** }
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
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** void delay500ns(){
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
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****     //Delay 500ns in the most efficient way:
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****         delay_250ns();
  98              		.loc 1 27 0
  99 0048 FFF7FEFF 		bl	delay_250ns
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****         delay_250ns();
 100              		.loc 1 28 0
 101 004c FFF7FEFF 		bl	delay_250ns
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****         //Continue executing code efficently/.
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h ****         }
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
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** void delay_micro(unsigned int us) {
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
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	while(us--) {
 132              		.loc 1 33 0
 133 005e 07E0     		b	.L7
 134              	.L8:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		delay_250ns();
 135              		.loc 1 34 0
 136 0060 FFF7FEFF 		bl	delay_250ns
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		delay_250ns();
 137              		.loc 1 35 0
 138 0064 FFF7FEFF 		bl	delay_250ns
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		delay_250ns();
 139              		.loc 1 36 0
 140 0068 FFF7FEFF 		bl	delay_250ns
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		delay_250ns();
 141              		.loc 1 37 0
 142 006c FFF7FEFF 		bl	delay_250ns
 143              	.L7:
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		delay_250ns();
 144              		.loc 1 33 0
 145 0070 7B68     		ldr	r3, [r7, #4]
 146 0072 5A1E     		subs	r2, r3, #1
 147 0074 7A60     		str	r2, [r7, #4]
 148 0076 002B     		cmp	r3, #0
 149 0078 F2D1     		bne	.L8
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	}
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** }
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
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** void delay_milli(unsigned int ms) {
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
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	#ifdef SIMULATOR
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		delay_micro(ms);
 181              		.loc 1 43 0
 182 008a 7B68     		ldr	r3, [r7, #4]
 183 008c 1800     		movs	r0, r3
 184 008e FFF7FEFF 		bl	delay_micro
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	#else
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 		delay_micro(1000 * ms);
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** 	#endif
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/delay.h **** }
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
 203              		.file 2 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****  * 	graphics.h
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #ifndef GRAPHICS_H
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define GRAPHICS_H
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** // Control for display
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define B_E 0x40
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define B_SELECT 0x04
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define B_RW 0x02
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define B_RS 0x01
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define B_RST 0x20
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define B_CS2 0x10
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define B_CS1 0x08
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define LCD_ON 0x3F
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define LCD_OFF 0x3E
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define LCD_DISP_START 0xC0
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define LCD_SET_ADD 0x40
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define LCD_SET_PAGE 0xB8
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define LCD_BUSY 0x80
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define PAGE 8
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define ADD 63
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define SCREEN_WIDTH  127
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** #define SCREEN_HEIGHT 63
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** typedef unsigned char uint8_t;
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphics_ctrl_bit_set(uint8_t x){
 204              		.loc 2 33 0
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
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
 219              		.loc 2 34 0
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
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 235              		.loc 2 35 0
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
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphics_ctrl_bit_clear(uint8_t x){
 257              		.loc 2 37 0
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
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_ODR_LOW &= ~x;
 272              		.loc 2 38 0
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
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 287              		.loc 2 39 0
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
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void select_controller(uint8_t controller){
 309              		.loc 2 41 0
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
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(controller == 0) {
 324              		.loc 2 42 0
 325 0110 FB1D     		adds	r3, r7, #7
 326 0112 1B78     		ldrb	r3, [r3]
 327 0114 002B     		cmp	r3, #0
 328 0116 06D1     		bne	.L17
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 329              		.loc 2 43 0
 330 0118 0820     		movs	r0, #8
 331 011a FFF7FEFF 		bl	graphics_ctrl_bit_clear
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 332              		.loc 2 44 0
 333 011e 1020     		movs	r0, #16
 334 0120 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     } else if(controller == B_CS1) {
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     } else if(controller == B_CS2) {
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 335              		.loc 2 55 0
 336 0124 1FE0     		b	.L21
 337              	.L17:
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
 338              		.loc 2 45 0
 339 0126 FB1D     		adds	r3, r7, #7
 340 0128 1B78     		ldrb	r3, [r3]
 341 012a 182B     		cmp	r3, #24
 342 012c 06D1     		bne	.L19
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 343              		.loc 2 46 0
 344 012e 0820     		movs	r0, #8
 345 0130 FFF7FEFF 		bl	graphics_ctrl_bit_set
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     } else if(controller == B_CS1) {
 346              		.loc 2 47 0
 347 0134 1020     		movs	r0, #16
 348 0136 FFF7FEFF 		bl	graphics_ctrl_bit_set
 349              		.loc 2 55 0
 350 013a 14E0     		b	.L21
 351              	.L19:
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
 352              		.loc 2 48 0
 353 013c FB1D     		adds	r3, r7, #7
 354 013e 1B78     		ldrb	r3, [r3]
 355 0140 082B     		cmp	r3, #8
 356 0142 06D1     		bne	.L20
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 357              		.loc 2 49 0
 358 0144 0820     		movs	r0, #8
 359 0146 FFF7FEFF 		bl	graphics_ctrl_bit_set
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     } else if(controller == B_CS2) {
 360              		.loc 2 50 0
 361 014a 1020     		movs	r0, #16
 362 014c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 363              		.loc 2 55 0
 364 0150 09E0     		b	.L21
 365              	.L20:
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 366              		.loc 2 51 0
 367 0152 FB1D     		adds	r3, r7, #7
 368 0154 1B78     		ldrb	r3, [r3]
 369 0156 102B     		cmp	r3, #16
 370 0158 05D1     		bne	.L21
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 371              		.loc 2 52 0
 372 015a 0820     		movs	r0, #8
 373 015c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
 374              		.loc 2 53 0
 375 0160 1020     		movs	r0, #16
 376 0162 FFF7FEFF 		bl	graphics_ctrl_bit_set
 377              	.L21:
 378              		.loc 2 55 0
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
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphic_wait_ready(){
 396              		.loc 2 57 0
 397              		.cfi_startproc
 398              		@ args = 0, pretend = 0, frame = 0
 399              		@ frame_needed = 1, uses_anonymous_args = 0
 400 016e 80B5     		push	{r7, lr}
 401              		.cfi_def_cfa_offset 8
 402              		.cfi_offset 7, -8
 403              		.cfi_offset 14, -4
 404 0170 00AF     		add	r7, sp, #0
 405              		.cfi_def_cfa_register 7
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 406              		.loc 2 58 0
 407 0172 4020     		movs	r0, #64
 408 0174 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_MODER = 0x00005555;
 409              		.loc 2 59 0
 410 0178 124B     		ldr	r3, .L28
 411 017a 134A     		ldr	r2, .L28+4
 412 017c 1A60     		str	r2, [r3]
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 413              		.loc 2 60 0
 414 017e 0120     		movs	r0, #1
 415 0180 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 416              		.loc 2 61 0
 417 0184 0220     		movs	r0, #2
 418 0186 FFF7FEFF 		bl	graphics_ctrl_bit_set
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     delay500ns();
 419              		.loc 2 62 0
 420 018a FFF7FEFF 		bl	delay500ns
 421              	.L25:
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     while(1) { // Wait for display not to be busy
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_set(B_E);
 422              		.loc 2 65 0
 423 018e 4020     		movs	r0, #64
 424 0190 FFF7FEFF 		bl	graphics_ctrl_bit_set
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         delay500ns();
 425              		.loc 2 66 0
 426 0194 FFF7FEFF 		bl	delay500ns
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphics_ctrl_bit_clear(B_E);
 427              		.loc 2 67 0
 428 0198 4020     		movs	r0, #64
 429 019a FFF7FEFF 		bl	graphics_ctrl_bit_clear
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         delay500ns();
 430              		.loc 2 68 0
 431 019e FFF7FEFF 		bl	delay500ns
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         //unsigned char i = *GPIO_IDR_HIGH;
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
 432              		.loc 2 70 0
 433 01a2 0A4B     		ldr	r3, .L28+8
 434 01a4 1B78     		ldrb	r3, [r3]
 435 01a6 DBB2     		uxtb	r3, r3
 436 01a8 5BB2     		sxtb	r3, r3
 437 01aa 002B     		cmp	r3, #0
 438 01ac 00DA     		bge	.L27
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         delay500ns();
 439              		.loc 2 65 0
 440 01ae EEE7     		b	.L25
 441              	.L27:
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****             break;
 442              		.loc 2 71 0
 443 01b0 C046     		nop
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         }
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_E);
 444              		.loc 2 74 0
 445 01b2 4020     		movs	r0, #64
 446 01b4 FFF7FEFF 		bl	graphics_ctrl_bit_set
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_MODER = 0x55555555;
 447              		.loc 2 75 0
 448 01b8 024B     		ldr	r3, .L28
 449 01ba 054A     		ldr	r2, .L28+12
 450 01bc 1A60     		str	r2, [r3]
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 451              		.loc 2 77 0
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
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** uint8_t graphic_read(uint8_t controller){
 475              		.loc 2 79 0
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
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 490              		.loc 2 80 0
 491 01e0 4020     		movs	r0, #64
 492 01e2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_MODER = 0x00005555;
 493              		.loc 2 81 0
 494 01e6 1C4B     		ldr	r3, .L34
 495 01e8 1C4A     		ldr	r2, .L34+4
 496 01ea 1A60     		str	r2, [r3]
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 497              		.loc 2 82 0
 498 01ec 0120     		movs	r0, #1
 499 01ee FFF7FEFF 		bl	graphics_ctrl_bit_set
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 500              		.loc 2 83 0
 501 01f2 0220     		movs	r0, #2
 502 01f4 FFF7FEFF 		bl	graphics_ctrl_bit_set
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     select_controller(controller);
 503              		.loc 2 84 0
 504 01f8 FB1D     		adds	r3, r7, #7
 505 01fa 1B78     		ldrb	r3, [r3]
 506 01fc 1800     		movs	r0, r3
 507 01fe FFF7FEFF 		bl	select_controller
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     delay500ns();
 508              		.loc 2 85 0
 509 0202 FFF7FEFF 		bl	delay500ns
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_E);
 510              		.loc 2 86 0
 511 0206 4020     		movs	r0, #64
 512 0208 FFF7FEFF 		bl	graphics_ctrl_bit_set
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     delay500ns();
 513              		.loc 2 87 0
 514 020c FFF7FEFF 		bl	delay500ns
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     uint8_t RV = *GPIO_IDR_HIGH;
 515              		.loc 2 88 0
 516 0210 134A     		ldr	r2, .L34+8
 517 0212 0F23     		movs	r3, #15
 518 0214 FB18     		adds	r3, r7, r3
 519 0216 1278     		ldrb	r2, [r2]
 520 0218 1A70     		strb	r2, [r3]
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 521              		.loc 2 89 0
 522 021a 4020     		movs	r0, #64
 523 021c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_MODER = 0x55555555;
 524              		.loc 2 90 0
 525 0220 0D4B     		ldr	r3, .L34
 526 0222 104A     		ldr	r2, .L34+12
 527 0224 1A60     		str	r2, [r3]
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(controller == B_CS1){
 528              		.loc 2 91 0
 529 0226 FB1D     		adds	r3, r7, #7
 530 0228 1B78     		ldrb	r3, [r3]
 531 022a 082B     		cmp	r3, #8
 532 022c 04D1     		bne	.L31
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         select_controller(B_CS1);
 533              		.loc 2 92 0
 534 022e 0820     		movs	r0, #8
 535 0230 FFF7FEFF 		bl	select_controller
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_wait_ready();
 536              		.loc 2 93 0
 537 0234 FFF7FEFF 		bl	graphic_wait_ready
 538              	.L31:
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(controller == B_CS2){
 539              		.loc 2 96 0
 540 0238 FB1D     		adds	r3, r7, #7
 541 023a 1B78     		ldrb	r3, [r3]
 542 023c 102B     		cmp	r3, #16
 543 023e 04D1     		bne	.L32
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         select_controller(B_CS2);
 544              		.loc 2 97 0
 545 0240 1020     		movs	r0, #16
 546 0242 FFF7FEFF 		bl	select_controller
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_wait_ready();
 547              		.loc 2 98 0
 548 0246 FFF7FEFF 		bl	graphic_wait_ready
 549              	.L32:
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     return RV;
 550              		.loc 2 101 0
 551 024a 0F23     		movs	r3, #15
 552 024c FB18     		adds	r3, r7, r3
 553 024e 1B78     		ldrb	r3, [r3]
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 554              		.loc 2 103 0
 555 0250 1800     		movs	r0, r3
 556 0252 BD46     		mov	sp, r7
 557 0254 04B0     		add	sp, sp, #16
 558              		@ sp needed
 559 0256 80BD     		pop	{r7, pc}
 560              	.L35:
 561              		.align	2
 562              	.L34:
 563 0258 00100240 		.word	1073876992
 564 025c 55550000 		.word	21845
 565 0260 11100240 		.word	1073877009
 566 0264 55555555 		.word	1431655765
 567              		.cfi_endproc
 568              	.LFE8:
 570              		.align	1
 571              		.global	graphic_write
 572              		.syntax unified
 573              		.code	16
 574              		.thumb_func
 575              		.fpu softvfp
 577              	graphic_write:
 578              	.LFB9:
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphic_write(uint8_t value, uint8_t controller){
 579              		.loc 2 105 0
 580              		.cfi_startproc
 581              		@ args = 0, pretend = 0, frame = 8
 582              		@ frame_needed = 1, uses_anonymous_args = 0
 583 0268 80B5     		push	{r7, lr}
 584              		.cfi_def_cfa_offset 8
 585              		.cfi_offset 7, -8
 586              		.cfi_offset 14, -4
 587 026a 82B0     		sub	sp, sp, #8
 588              		.cfi_def_cfa_offset 16
 589 026c 00AF     		add	r7, sp, #0
 590              		.cfi_def_cfa_register 7
 591 026e 0200     		movs	r2, r0
 592 0270 FB1D     		adds	r3, r7, #7
 593 0272 1A70     		strb	r2, [r3]
 594 0274 BB1D     		adds	r3, r7, #6
 595 0276 0A1C     		adds	r2, r1, #0
 596 0278 1A70     		strb	r2, [r3]
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_ODR_HIGH = value;
 597              		.loc 2 106 0
 598 027a 1A4A     		ldr	r2, .L39
 599 027c FB1D     		adds	r3, r7, #7
 600 027e 1B78     		ldrb	r3, [r3]
 601 0280 1370     		strb	r3, [r2]
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     select_controller(controller);
 602              		.loc 2 107 0
 603 0282 BB1D     		adds	r3, r7, #6
 604 0284 1B78     		ldrb	r3, [r3]
 605 0286 1800     		movs	r0, r3
 606 0288 FFF7FEFF 		bl	select_controller
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     delay500ns();
 607              		.loc 2 108 0
 608 028c FFF7FEFF 		bl	delay500ns
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_E);
 609              		.loc 2 109 0
 610 0290 4020     		movs	r0, #64
 611 0292 FFF7FEFF 		bl	graphics_ctrl_bit_set
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     delay500ns();
 612              		.loc 2 110 0
 613 0296 FFF7FEFF 		bl	delay500ns
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 614              		.loc 2 111 0
 615 029a 4020     		movs	r0, #64
 616 029c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(controller & B_CS1){
 617              		.loc 2 113 0
 618 02a0 BB1D     		adds	r3, r7, #6
 619 02a2 1B78     		ldrb	r3, [r3]
 620 02a4 0822     		movs	r2, #8
 621 02a6 1340     		ands	r3, r2
 622 02a8 04D0     		beq	.L37
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         select_controller(B_CS1);
 623              		.loc 2 114 0
 624 02aa 0820     		movs	r0, #8
 625 02ac FFF7FEFF 		bl	select_controller
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_wait_ready();
 626              		.loc 2 115 0
 627 02b0 FFF7FEFF 		bl	graphic_wait_ready
 628              	.L37:
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(controller & B_CS2){
 629              		.loc 2 118 0
 630 02b4 BB1D     		adds	r3, r7, #6
 631 02b6 1B78     		ldrb	r3, [r3]
 632 02b8 1022     		movs	r2, #16
 633 02ba 1340     		ands	r3, r2
 634 02bc 04D0     		beq	.L38
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         select_controller(B_CS2);
 635              		.loc 2 119 0
 636 02be 1020     		movs	r0, #16
 637 02c0 FFF7FEFF 		bl	select_controller
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_wait_ready();
 638              		.loc 2 120 0
 639 02c4 FFF7FEFF 		bl	graphic_wait_ready
 640              	.L38:
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     *GPIO_ODR_HIGH = 0;
 641              		.loc 2 123 0
 642 02c8 064B     		ldr	r3, .L39
 643 02ca 0022     		movs	r2, #0
 644 02cc 1A70     		strb	r2, [r3]
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_E);
 645              		.loc 2 124 0
 646 02ce 4020     		movs	r0, #64
 647 02d0 FFF7FEFF 		bl	graphics_ctrl_bit_set
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     select_controller(0);
 648              		.loc 2 125 0
 649 02d4 0020     		movs	r0, #0
 650 02d6 FFF7FEFF 		bl	select_controller
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 651              		.loc 2 126 0
 652 02da C046     		nop
 653 02dc BD46     		mov	sp, r7
 654 02de 02B0     		add	sp, sp, #8
 655              		@ sp needed
 656 02e0 80BD     		pop	{r7, pc}
 657              	.L40:
 658 02e2 C046     		.align	2
 659              	.L39:
 660 02e4 15100240 		.word	1073877013
 661              		.cfi_endproc
 662              	.LFE9:
 664              		.align	1
 665              		.global	graphic_write_command
 666              		.syntax unified
 667              		.code	16
 668              		.thumb_func
 669              		.fpu softvfp
 671              	graphic_write_command:
 672              	.LFB10:
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphic_write_command(uint8_t command, uint8_t controller){
 673              		.loc 2 128 0
 674              		.cfi_startproc
 675              		@ args = 0, pretend = 0, frame = 8
 676              		@ frame_needed = 1, uses_anonymous_args = 0
 677 02e8 80B5     		push	{r7, lr}
 678              		.cfi_def_cfa_offset 8
 679              		.cfi_offset 7, -8
 680              		.cfi_offset 14, -4
 681 02ea 82B0     		sub	sp, sp, #8
 682              		.cfi_def_cfa_offset 16
 683 02ec 00AF     		add	r7, sp, #0
 684              		.cfi_def_cfa_register 7
 685 02ee 0200     		movs	r2, r0
 686 02f0 FB1D     		adds	r3, r7, #7
 687 02f2 1A70     		strb	r2, [r3]
 688 02f4 BB1D     		adds	r3, r7, #6
 689 02f6 0A1C     		adds	r2, r1, #0
 690 02f8 1A70     		strb	r2, [r3]
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 691              		.loc 2 129 0
 692 02fa 4020     		movs	r0, #64
 693 02fc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     select_controller(controller);
 694              		.loc 2 130 0
 695 0300 BB1D     		adds	r3, r7, #6
 696 0302 1B78     		ldrb	r3, [r3]
 697 0304 1800     		movs	r0, r3
 698 0306 FFF7FEFF 		bl	select_controller
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 699              		.loc 2 131 0
 700 030a 0120     		movs	r0, #1
 701 030c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 702              		.loc 2 132 0
 703 0310 0220     		movs	r0, #2
 704 0312 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write(command, controller);
 705              		.loc 2 133 0
 706 0316 BB1D     		adds	r3, r7, #6
 707 0318 1A78     		ldrb	r2, [r3]
 708 031a FB1D     		adds	r3, r7, #7
 709 031c 1B78     		ldrb	r3, [r3]
 710 031e 1100     		movs	r1, r2
 711 0320 1800     		movs	r0, r3
 712 0322 FFF7FEFF 		bl	graphic_write
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 713              		.loc 2 134 0
 714 0326 C046     		nop
 715 0328 BD46     		mov	sp, r7
 716 032a 02B0     		add	sp, sp, #8
 717              		@ sp needed
 718 032c 80BD     		pop	{r7, pc}
 719              		.cfi_endproc
 720              	.LFE10:
 722              		.align	1
 723              		.global	graphic_write_data
 724              		.syntax unified
 725              		.code	16
 726              		.thumb_func
 727              		.fpu softvfp
 729              	graphic_write_data:
 730              	.LFB11:
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphic_write_data(uint8_t data, uint8_t controller){
 731              		.loc 2 136 0
 732              		.cfi_startproc
 733              		@ args = 0, pretend = 0, frame = 8
 734              		@ frame_needed = 1, uses_anonymous_args = 0
 735 032e 80B5     		push	{r7, lr}
 736              		.cfi_def_cfa_offset 8
 737              		.cfi_offset 7, -8
 738              		.cfi_offset 14, -4
 739 0330 82B0     		sub	sp, sp, #8
 740              		.cfi_def_cfa_offset 16
 741 0332 00AF     		add	r7, sp, #0
 742              		.cfi_def_cfa_register 7
 743 0334 0200     		movs	r2, r0
 744 0336 FB1D     		adds	r3, r7, #7
 745 0338 1A70     		strb	r2, [r3]
 746 033a BB1D     		adds	r3, r7, #6
 747 033c 0A1C     		adds	r2, r1, #0
 748 033e 1A70     		strb	r2, [r3]
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 749              		.loc 2 137 0
 750 0340 4020     		movs	r0, #64
 751 0342 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     select_controller(controller);
 752              		.loc 2 138 0
 753 0346 BB1D     		adds	r3, r7, #6
 754 0348 1B78     		ldrb	r3, [r3]
 755 034a 1800     		movs	r0, r3
 756 034c FFF7FEFF 		bl	select_controller
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 757              		.loc 2 139 0
 758 0350 0120     		movs	r0, #1
 759 0352 FFF7FEFF 		bl	graphics_ctrl_bit_set
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 760              		.loc 2 140 0
 761 0356 0220     		movs	r0, #2
 762 0358 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write(data, controller);
 763              		.loc 2 141 0
 764 035c BB1D     		adds	r3, r7, #6
 765 035e 1A78     		ldrb	r2, [r3]
 766 0360 FB1D     		adds	r3, r7, #7
 767 0362 1B78     		ldrb	r3, [r3]
 768 0364 1100     		movs	r1, r2
 769 0366 1800     		movs	r0, r3
 770 0368 FFF7FEFF 		bl	graphic_write
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 771              		.loc 2 142 0
 772 036c C046     		nop
 773 036e BD46     		mov	sp, r7
 774 0370 02B0     		add	sp, sp, #8
 775              		@ sp needed
 776 0372 80BD     		pop	{r7, pc}
 777              		.cfi_endproc
 778              	.LFE11:
 780              		.align	1
 781              		.global	graphics_read_data
 782              		.syntax unified
 783              		.code	16
 784              		.thumb_func
 785              		.fpu softvfp
 787              	graphics_read_data:
 788              	.LFB12:
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** uint8_t graphics_read_data(uint8_t controller){
 789              		.loc 2 144 0
 790              		.cfi_startproc
 791              		@ args = 0, pretend = 0, frame = 8
 792              		@ frame_needed = 1, uses_anonymous_args = 0
 793 0374 80B5     		push	{r7, lr}
 794              		.cfi_def_cfa_offset 8
 795              		.cfi_offset 7, -8
 796              		.cfi_offset 14, -4
 797 0376 82B0     		sub	sp, sp, #8
 798              		.cfi_def_cfa_offset 16
 799 0378 00AF     		add	r7, sp, #0
 800              		.cfi_def_cfa_register 7
 801 037a 0200     		movs	r2, r0
 802 037c FB1D     		adds	r3, r7, #7
 803 037e 1A70     		strb	r2, [r3]
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     (void) graphic_read(controller);
 804              		.loc 2 145 0
 805 0380 FB1D     		adds	r3, r7, #7
 806 0382 1B78     		ldrb	r3, [r3]
 807 0384 1800     		movs	r0, r3
 808 0386 FFF7FEFF 		bl	graphic_read
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     return graphic_read(controller);
 809              		.loc 2 146 0
 810 038a FB1D     		adds	r3, r7, #7
 811 038c 1B78     		ldrb	r3, [r3]
 812 038e 1800     		movs	r0, r3
 813 0390 FFF7FEFF 		bl	graphic_read
 814 0394 0300     		movs	r3, r0
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 815              		.loc 2 147 0
 816 0396 1800     		movs	r0, r3
 817 0398 BD46     		mov	sp, r7
 818 039a 02B0     		add	sp, sp, #8
 819              		@ sp needed
 820 039c 80BD     		pop	{r7, pc}
 821              		.cfi_endproc
 822              	.LFE12:
 824              		.align	1
 825              		.global	graphic_initialize
 826              		.syntax unified
 827              		.code	16
 828              		.thumb_func
 829              		.fpu softvfp
 831              	graphic_initialize:
 832              	.LFB13:
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphic_initialize(void){
 833              		.loc 2 149 0
 834              		.cfi_startproc
 835              		@ args = 0, pretend = 0, frame = 0
 836              		@ frame_needed = 1, uses_anonymous_args = 0
 837 039e 80B5     		push	{r7, lr}
 838              		.cfi_def_cfa_offset 8
 839              		.cfi_offset 7, -8
 840              		.cfi_offset 14, -4
 841 03a0 00AF     		add	r7, sp, #0
 842              		.cfi_def_cfa_register 7
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_E);
 843              		.loc 2 150 0
 844 03a2 4020     		movs	r0, #64
 845 03a4 FFF7FEFF 		bl	graphics_ctrl_bit_set
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     delay_micro(10);
 846              		.loc 2 151 0
 847 03a8 0A20     		movs	r0, #10
 848 03aa FFF7FEFF 		bl	delay_micro
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_CS1);
 849              		.loc 2 152 0
 850 03ae 0820     		movs	r0, #8
 851 03b0 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_CS2);
 852              		.loc 2 153 0
 853 03b4 1020     		movs	r0, #16
 854 03b6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_RST);
 855              		.loc 2 154 0
 856 03ba 2020     		movs	r0, #32
 857 03bc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 858              		.loc 2 155 0
 859 03c0 4020     		movs	r0, #64
 860 03c2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     delay_milli(30);
 861              		.loc 2 156 0
 862 03c6 1E20     		movs	r0, #30
 863 03c8 FFF7FEFF 		bl	delay_milli
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphics_ctrl_bit_set(B_RST);
 864              		.loc 2 157 0
 865 03cc 2020     		movs	r0, #32
 866 03ce FFF7FEFF 		bl	graphics_ctrl_bit_set
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 867              		.loc 2 158 0
 868 03d2 1821     		movs	r1, #24
 869 03d4 3E20     		movs	r0, #62
 870 03d6 FFF7FEFF 		bl	graphic_write_command
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_ON, B_CS1|B_CS2);
 871              		.loc 2 159 0
 872 03da 1821     		movs	r1, #24
 873 03dc 3F20     		movs	r0, #63
 874 03de FFF7FEFF 		bl	graphic_write_command
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 875              		.loc 2 160 0
 876 03e2 1821     		movs	r1, #24
 877 03e4 C020     		movs	r0, #192
 878 03e6 FFF7FEFF 		bl	graphic_write_command
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 879              		.loc 2 161 0
 880 03ea 1821     		movs	r1, #24
 881 03ec 4020     		movs	r0, #64
 882 03ee FFF7FEFF 		bl	graphic_write_command
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 883              		.loc 2 162 0
 884 03f2 1821     		movs	r1, #24
 885 03f4 B820     		movs	r0, #184
 886 03f6 FFF7FEFF 		bl	graphic_write_command
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     select_controller(0);
 887              		.loc 2 163 0
 888 03fa 0020     		movs	r0, #0
 889 03fc FFF7FEFF 		bl	select_controller
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 890              		.loc 2 164 0
 891 0400 C046     		nop
 892 0402 BD46     		mov	sp, r7
 893              		@ sp needed
 894 0404 80BD     		pop	{r7, pc}
 895              		.cfi_endproc
 896              	.LFE13:
 898              		.align	1
 899              		.global	graphics_clear_screen
 900              		.syntax unified
 901              		.code	16
 902              		.thumb_func
 903              		.fpu softvfp
 905              	graphics_clear_screen:
 906              	.LFB14:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void graphics_clear_screen(void){
 907              		.loc 2 166 0
 908              		.cfi_startproc
 909              		@ args = 0, pretend = 0, frame = 8
 910              		@ frame_needed = 1, uses_anonymous_args = 0
 911 0406 80B5     		push	{r7, lr}
 912              		.cfi_def_cfa_offset 8
 913              		.cfi_offset 7, -8
 914              		.cfi_offset 14, -4
 915 0408 82B0     		sub	sp, sp, #8
 916              		.cfi_def_cfa_offset 16
 917 040a 00AF     		add	r7, sp, #0
 918              		.cfi_def_cfa_register 7
 919              	.LBB2:
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     for(int page = 0; page < PAGE; page++){
 920              		.loc 2 167 0
 921 040c 0023     		movs	r3, #0
 922 040e 7B60     		str	r3, [r7, #4]
 923 0410 1EE0     		b	.L47
 924              	.L50:
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 925              		.loc 2 168 0
 926 0412 7B68     		ldr	r3, [r7, #4]
 927 0414 5BB2     		sxtb	r3, r3
 928 0416 4822     		movs	r2, #72
 929 0418 5242     		rsbs	r2, r2, #0
 930 041a 1343     		orrs	r3, r2
 931 041c 5BB2     		sxtb	r3, r3
 932 041e DBB2     		uxtb	r3, r3
 933 0420 1821     		movs	r1, #24
 934 0422 1800     		movs	r0, r3
 935 0424 FFF7FEFF 		bl	graphic_write_command
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 936              		.loc 2 169 0
 937 0428 1821     		movs	r1, #24
 938 042a 4020     		movs	r0, #64
 939 042c FFF7FEFF 		bl	graphic_write_command
 940              	.LBB3:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         for(int add = 0; add < ADD; add++){
 941              		.loc 2 170 0
 942 0430 0023     		movs	r3, #0
 943 0432 3B60     		str	r3, [r7]
 944 0434 06E0     		b	.L48
 945              	.L49:
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****             graphic_write_data(0, B_CS1|B_CS2);
 946              		.loc 2 171 0 discriminator 3
 947 0436 1821     		movs	r1, #24
 948 0438 0020     		movs	r0, #0
 949 043a FFF7FEFF 		bl	graphic_write_data
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         for(int add = 0; add < ADD; add++){
 950              		.loc 2 170 0 discriminator 3
 951 043e 3B68     		ldr	r3, [r7]
 952 0440 0133     		adds	r3, r3, #1
 953 0442 3B60     		str	r3, [r7]
 954              	.L48:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         for(int add = 0; add < ADD; add++){
 955              		.loc 2 170 0 is_stmt 0 discriminator 1
 956 0444 3B68     		ldr	r3, [r7]
 957 0446 3E2B     		cmp	r3, #62
 958 0448 F5DD     		ble	.L49
 959              	.LBE3:
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 960              		.loc 2 167 0 is_stmt 1 discriminator 2
 961 044a 7B68     		ldr	r3, [r7, #4]
 962 044c 0133     		adds	r3, r3, #1
 963 044e 7B60     		str	r3, [r7, #4]
 964              	.L47:
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 965              		.loc 2 167 0 is_stmt 0 discriminator 1
 966 0450 7B68     		ldr	r3, [r7, #4]
 967 0452 072B     		cmp	r3, #7
 968 0454 DDDD     		ble	.L50
 969              	.LBE2:
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         }
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** }
 970              		.loc 2 175 0 is_stmt 1
 971 0456 C046     		nop
 972 0458 BD46     		mov	sp, r7
 973 045a 02B0     		add	sp, sp, #8
 974              		@ sp needed
 975 045c 80BD     		pop	{r7, pc}
 976              		.cfi_endproc
 977              	.LFE14:
 979              		.align	1
 980              		.global	pixel
 981              		.syntax unified
 982              		.code	16
 983              		.thumb_func
 984              		.fpu softvfp
 986              	pixel:
 987              	.LFB15:
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** 
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h **** void pixel(unsigned x, unsigned y, unsigned set){
 988              		.loc 2 178 0
 989              		.cfi_startproc
 990              		@ args = 0, pretend = 0, frame = 24
 991              		@ frame_needed = 1, uses_anonymous_args = 0
 992 045e 90B5     		push	{r4, r7, lr}
 993              		.cfi_def_cfa_offset 12
 994              		.cfi_offset 4, -12
 995              		.cfi_offset 7, -8
 996              		.cfi_offset 14, -4
 997 0460 87B0     		sub	sp, sp, #28
 998              		.cfi_def_cfa_offset 40
 999 0462 00AF     		add	r7, sp, #0
 1000              		.cfi_def_cfa_register 7
 1001 0464 F860     		str	r0, [r7, #12]
 1002 0466 B960     		str	r1, [r7, #8]
 1003 0468 7A60     		str	r2, [r7, #4]
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((x < 0 || y < 0) || (x > SCREEN_WIDTH || y > SCREEN_HEIGHT)) return;
 1004              		.loc 2 179 0
 1005 046a FB68     		ldr	r3, [r7, #12]
 1006 046c 7F2B     		cmp	r3, #127
 1007 046e 00D9     		bls	.LCB785
 1008 0470 C7E0     		b	.L68	@long jump
 1009              	.LCB785:
 1010              		.loc 2 179 0 is_stmt 0 discriminator 1
 1011 0472 BB68     		ldr	r3, [r7, #8]
 1012 0474 3F2B     		cmp	r3, #63
 1013 0476 00D9     		bls	.LCB788
 1014 0478 C3E0     		b	.L68	@long jump
 1015              	.LCB788:
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     unsigned char index = (y-1) / PAGE;
 1016              		.loc 2 181 0 is_stmt 1
 1017 047a BB68     		ldr	r3, [r7, #8]
 1018 047c 013B     		subs	r3, r3, #1
 1019 047e DA08     		lsrs	r2, r3, #3
 1020 0480 1523     		movs	r3, #21
 1021 0482 FB18     		adds	r3, r7, r3
 1022 0484 1A70     		strb	r2, [r3]
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     unsigned char mask;
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 0){mask = 1;}
 1023              		.loc 2 184 0
 1024 0486 BB68     		ldr	r3, [r7, #8]
 1025 0488 013B     		subs	r3, r3, #1
 1026 048a 0722     		movs	r2, #7
 1027 048c 1340     		ands	r3, r2
 1028 048e 03D1     		bne	.L55
 1029              		.loc 2 184 0 is_stmt 0 discriminator 1
 1030 0490 1723     		movs	r3, #23
 1031 0492 FB18     		adds	r3, r7, r3
 1032 0494 0122     		movs	r2, #1
 1033 0496 1A70     		strb	r2, [r3]
 1034              	.L55:
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 1){mask = 2;}
 1035              		.loc 2 185 0 is_stmt 1
 1036 0498 BB68     		ldr	r3, [r7, #8]
 1037 049a 013B     		subs	r3, r3, #1
 1038 049c 0722     		movs	r2, #7
 1039 049e 1340     		ands	r3, r2
 1040 04a0 012B     		cmp	r3, #1
 1041 04a2 03D1     		bne	.L56
 1042              		.loc 2 185 0 is_stmt 0 discriminator 1
 1043 04a4 1723     		movs	r3, #23
 1044 04a6 FB18     		adds	r3, r7, r3
 1045 04a8 0222     		movs	r2, #2
 1046 04aa 1A70     		strb	r2, [r3]
 1047              	.L56:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 2){mask = 4;}
 1048              		.loc 2 186 0 is_stmt 1
 1049 04ac BB68     		ldr	r3, [r7, #8]
 1050 04ae 013B     		subs	r3, r3, #1
 1051 04b0 0722     		movs	r2, #7
 1052 04b2 1340     		ands	r3, r2
 1053 04b4 022B     		cmp	r3, #2
 1054 04b6 03D1     		bne	.L57
 1055              		.loc 2 186 0 is_stmt 0 discriminator 1
 1056 04b8 1723     		movs	r3, #23
 1057 04ba FB18     		adds	r3, r7, r3
 1058 04bc 0422     		movs	r2, #4
 1059 04be 1A70     		strb	r2, [r3]
 1060              	.L57:
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 3){mask = 8;}
 1061              		.loc 2 187 0 is_stmt 1
 1062 04c0 BB68     		ldr	r3, [r7, #8]
 1063 04c2 013B     		subs	r3, r3, #1
 1064 04c4 0722     		movs	r2, #7
 1065 04c6 1340     		ands	r3, r2
 1066 04c8 032B     		cmp	r3, #3
 1067 04ca 03D1     		bne	.L58
 1068              		.loc 2 187 0 is_stmt 0 discriminator 1
 1069 04cc 1723     		movs	r3, #23
 1070 04ce FB18     		adds	r3, r7, r3
 1071 04d0 0822     		movs	r2, #8
 1072 04d2 1A70     		strb	r2, [r3]
 1073              	.L58:
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 4){mask = 0x10;}
 1074              		.loc 2 188 0 is_stmt 1
 1075 04d4 BB68     		ldr	r3, [r7, #8]
 1076 04d6 013B     		subs	r3, r3, #1
 1077 04d8 0722     		movs	r2, #7
 1078 04da 1340     		ands	r3, r2
 1079 04dc 042B     		cmp	r3, #4
 1080 04de 03D1     		bne	.L59
 1081              		.loc 2 188 0 is_stmt 0 discriminator 1
 1082 04e0 1723     		movs	r3, #23
 1083 04e2 FB18     		adds	r3, r7, r3
 1084 04e4 1022     		movs	r2, #16
 1085 04e6 1A70     		strb	r2, [r3]
 1086              	.L59:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 5){mask = 0x20;}
 1087              		.loc 2 189 0 is_stmt 1
 1088 04e8 BB68     		ldr	r3, [r7, #8]
 1089 04ea 013B     		subs	r3, r3, #1
 1090 04ec 0722     		movs	r2, #7
 1091 04ee 1340     		ands	r3, r2
 1092 04f0 052B     		cmp	r3, #5
 1093 04f2 03D1     		bne	.L60
 1094              		.loc 2 189 0 is_stmt 0 discriminator 1
 1095 04f4 1723     		movs	r3, #23
 1096 04f6 FB18     		adds	r3, r7, r3
 1097 04f8 2022     		movs	r2, #32
 1098 04fa 1A70     		strb	r2, [r3]
 1099              	.L60:
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 6){mask = 0x40;}
 1100              		.loc 2 190 0 is_stmt 1
 1101 04fc BB68     		ldr	r3, [r7, #8]
 1102 04fe 013B     		subs	r3, r3, #1
 1103 0500 0722     		movs	r2, #7
 1104 0502 1340     		ands	r3, r2
 1105 0504 062B     		cmp	r3, #6
 1106 0506 03D1     		bne	.L61
 1107              		.loc 2 190 0 is_stmt 0 discriminator 1
 1108 0508 1723     		movs	r3, #23
 1109 050a FB18     		adds	r3, r7, r3
 1110 050c 4022     		movs	r2, #64
 1111 050e 1A70     		strb	r2, [r3]
 1112              	.L61:
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if((y-1) % 8 == 7){mask = 0x80;}
 1113              		.loc 2 191 0 is_stmt 1
 1114 0510 BB68     		ldr	r3, [r7, #8]
 1115 0512 013B     		subs	r3, r3, #1
 1116 0514 0722     		movs	r2, #7
 1117 0516 1340     		ands	r3, r2
 1118 0518 072B     		cmp	r3, #7
 1119 051a 03D1     		bne	.L62
 1120              		.loc 2 191 0 is_stmt 0 discriminator 1
 1121 051c 1723     		movs	r3, #23
 1122 051e FB18     		adds	r3, r7, r3
 1123 0520 8022     		movs	r2, #128
 1124 0522 1A70     		strb	r2, [r3]
 1125              	.L62:
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(set == 0){mask = ~mask;}
 1126              		.loc 2 193 0 is_stmt 1
 1127 0524 7B68     		ldr	r3, [r7, #4]
 1128 0526 002B     		cmp	r3, #0
 1129 0528 06D1     		bne	.L63
 1130              		.loc 2 193 0 is_stmt 0 discriminator 1
 1131 052a 1723     		movs	r3, #23
 1132 052c FB18     		adds	r3, r7, r3
 1133 052e 1722     		movs	r2, #23
 1134 0530 BA18     		adds	r2, r7, r2
 1135 0532 1278     		ldrb	r2, [r2]
 1136 0534 D243     		mvns	r2, r2
 1137 0536 1A70     		strb	r2, [r3]
 1138              	.L63:
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     unsigned char controller;
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(x > 64){
 1139              		.loc 2 196 0 is_stmt 1
 1140 0538 FB68     		ldr	r3, [r7, #12]
 1141 053a 402B     		cmp	r3, #64
 1142 053c 07D9     		bls	.L64
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         controller = B_CS2;
 1143              		.loc 2 197 0
 1144 053e 1623     		movs	r3, #22
 1145 0540 FB18     		adds	r3, r7, r3
 1146 0542 1022     		movs	r2, #16
 1147 0544 1A70     		strb	r2, [r3]
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         x = x - 65;
 1148              		.loc 2 198 0
 1149 0546 FB68     		ldr	r3, [r7, #12]
 1150 0548 413B     		subs	r3, r3, #65
 1151 054a FB60     		str	r3, [r7, #12]
 1152 054c 06E0     		b	.L65
 1153              	.L64:
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         }
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     else{
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         controller = B_CS1;
 1154              		.loc 2 201 0
 1155 054e 1623     		movs	r3, #22
 1156 0550 FB18     		adds	r3, r7, r3
 1157 0552 0822     		movs	r2, #8
 1158 0554 1A70     		strb	r2, [r3]
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         x = x - 1;
 1159              		.loc 2 202 0
 1160 0556 FB68     		ldr	r3, [r7, #12]
 1161 0558 013B     		subs	r3, r3, #1
 1162 055a FB60     		str	r3, [r7, #12]
 1163              	.L65:
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         }
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1164              		.loc 2 205 0
 1165 055c FB68     		ldr	r3, [r7, #12]
 1166 055e DBB2     		uxtb	r3, r3
 1167 0560 4022     		movs	r2, #64
 1168 0562 1343     		orrs	r3, r2
 1169 0564 DAB2     		uxtb	r2, r3
 1170 0566 1623     		movs	r3, #22
 1171 0568 FB18     		adds	r3, r7, r3
 1172 056a 1B78     		ldrb	r3, [r3]
 1173 056c 1900     		movs	r1, r3
 1174 056e 1000     		movs	r0, r2
 1175 0570 FFF7FEFF 		bl	graphic_write_command
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_SET_PAGE | index, controller);
 1176              		.loc 2 206 0
 1177 0574 1523     		movs	r3, #21
 1178 0576 FB18     		adds	r3, r7, r3
 1179 0578 1B78     		ldrb	r3, [r3]
 1180 057a 4822     		movs	r2, #72
 1181 057c 5242     		rsbs	r2, r2, #0
 1182 057e 1343     		orrs	r3, r2
 1183 0580 DAB2     		uxtb	r2, r3
 1184 0582 1623     		movs	r3, #22
 1185 0584 FB18     		adds	r3, r7, r3
 1186 0586 1B78     		ldrb	r3, [r3]
 1187 0588 1900     		movs	r1, r3
 1188 058a 1000     		movs	r0, r2
 1189 058c FFF7FEFF 		bl	graphic_write_command
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     unsigned char temp = graphic_read(controller);
 1190              		.loc 2 208 0
 1191 0590 1423     		movs	r3, #20
 1192 0592 FC18     		adds	r4, r7, r3
 1193 0594 1623     		movs	r3, #22
 1194 0596 FB18     		adds	r3, r7, r3
 1195 0598 1B78     		ldrb	r3, [r3]
 1196 059a 1800     		movs	r0, r3
 1197 059c FFF7FEFF 		bl	graphic_read
 1198 05a0 0300     		movs	r3, r0
 1199 05a2 2370     		strb	r3, [r4]
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1200              		.loc 2 209 0
 1201 05a4 FB68     		ldr	r3, [r7, #12]
 1202 05a6 DBB2     		uxtb	r3, r3
 1203 05a8 4022     		movs	r2, #64
 1204 05aa 1343     		orrs	r3, r2
 1205 05ac DAB2     		uxtb	r2, r3
 1206 05ae 1623     		movs	r3, #22
 1207 05b0 FB18     		adds	r3, r7, r3
 1208 05b2 1B78     		ldrb	r3, [r3]
 1209 05b4 1900     		movs	r1, r3
 1210 05b6 1000     		movs	r0, r2
 1211 05b8 FFF7FEFF 		bl	graphic_write_command
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     if(set == 1)
 1212              		.loc 2 211 0
 1213 05bc 7B68     		ldr	r3, [r7, #4]
 1214 05be 012B     		cmp	r3, #1
 1215 05c0 0AD1     		bne	.L66
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         {mask = mask | temp;}
 1216              		.loc 2 212 0
 1217 05c2 1723     		movs	r3, #23
 1218 05c4 FB18     		adds	r3, r7, r3
 1219 05c6 1722     		movs	r2, #23
 1220 05c8 B918     		adds	r1, r7, r2
 1221 05ca 1422     		movs	r2, #20
 1222 05cc BA18     		adds	r2, r7, r2
 1223 05ce 0978     		ldrb	r1, [r1]
 1224 05d0 1278     		ldrb	r2, [r2]
 1225 05d2 0A43     		orrs	r2, r1
 1226 05d4 1A70     		strb	r2, [r3]
 1227 05d6 09E0     		b	.L67
 1228              	.L66:
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     else
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****         {mask = mask & temp;}
 1229              		.loc 2 214 0
 1230 05d8 1723     		movs	r3, #23
 1231 05da FB18     		adds	r3, r7, r3
 1232 05dc 1722     		movs	r2, #23
 1233 05de BA18     		adds	r2, r7, r2
 1234 05e0 1421     		movs	r1, #20
 1235 05e2 7918     		adds	r1, r7, r1
 1236 05e4 1278     		ldrb	r2, [r2]
 1237 05e6 0978     		ldrb	r1, [r1]
 1238 05e8 0A40     		ands	r2, r1
 1239 05ea 1A70     		strb	r2, [r3]
 1240              	.L67:
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     graphic_write_data(mask, controller);
 1241              		.loc 2 216 0
 1242 05ec 1623     		movs	r3, #22
 1243 05ee FB18     		adds	r3, r7, r3
 1244 05f0 1A78     		ldrb	r2, [r3]
 1245 05f2 1723     		movs	r3, #23
 1246 05f4 FB18     		adds	r3, r7, r3
 1247 05f6 1B78     		ldrb	r3, [r3]
 1248 05f8 1100     		movs	r1, r2
 1249 05fa 1800     		movs	r0, r3
 1250 05fc FFF7FEFF 		bl	graphic_write_data
 1251 0600 00E0     		b	.L51
 1252              	.L68:
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 1253              		.loc 2 179 0
 1254 0602 C046     		nop
 1255              	.L51:
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     
 219:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/graphics.h ****     }
 1256              		.loc 2 219 0
 1257 0604 BD46     		mov	sp, r7
 1258 0606 07B0     		add	sp, sp, #28
 1259              		@ sp needed
 1260 0608 90BD     		pop	{r4, r7, pc}
 1261              		.cfi_endproc
 1262              	.LFE15:
 1264              		.align	1
 1265              		.global	set_object_speed
 1266              		.syntax unified
 1267              		.code	16
 1268              		.thumb_func
 1269              		.fpu softvfp
 1271              	set_object_speed:
 1272              	.LFB16:
 1273              		.file 3 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** #ifndef OBJECT_H
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** #define OBJECT_H
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** #define MAX_POINTS 20
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** typedef struct tPoint{
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     unsigned char x;
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     unsigned char y;
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     }POINT;
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** typedef struct tGeometry{
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     int numpoints;
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     int sizeX;
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     int sizeY;
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     POINT px[MAX_POINTS];
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     } GEOMETRY, *PGEOMETRY;
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** typedef struct tObj{
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     PGEOMETRY geo;
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     int dirX, dirY;
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     int posX, posY;
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     void (* draw) (struct tObj*);
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     void (* clear) (struct tObj*);
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     void (* move) (struct tObj*);
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     void (* set_speed) (struct tObj*, int, int);
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     } OBJECT, *POBJECT;
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** void set_object_speed(POBJECT pObj, int speedX, int speedY){
 1274              		.loc 3 30 0
 1275              		.cfi_startproc
 1276              		@ args = 0, pretend = 0, frame = 16
 1277              		@ frame_needed = 1, uses_anonymous_args = 0
 1278 060a 80B5     		push	{r7, lr}
 1279              		.cfi_def_cfa_offset 8
 1280              		.cfi_offset 7, -8
 1281              		.cfi_offset 14, -4
 1282 060c 84B0     		sub	sp, sp, #16
 1283              		.cfi_def_cfa_offset 24
 1284 060e 00AF     		add	r7, sp, #0
 1285              		.cfi_def_cfa_register 7
 1286 0610 F860     		str	r0, [r7, #12]
 1287 0612 B960     		str	r1, [r7, #8]
 1288 0614 7A60     		str	r2, [r7, #4]
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****         pObj->dirX = speedX;
 1289              		.loc 3 31 0
 1290 0616 FB68     		ldr	r3, [r7, #12]
 1291 0618 BA68     		ldr	r2, [r7, #8]
 1292 061a 5A60     		str	r2, [r3, #4]
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****         pObj->dirY = speedY;
 1293              		.loc 3 32 0
 1294 061c FB68     		ldr	r3, [r7, #12]
 1295 061e 7A68     		ldr	r2, [r7, #4]
 1296 0620 9A60     		str	r2, [r3, #8]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     }
 1297              		.loc 3 33 0
 1298 0622 C046     		nop
 1299 0624 BD46     		mov	sp, r7
 1300 0626 04B0     		add	sp, sp, #16
 1301              		@ sp needed
 1302 0628 80BD     		pop	{r7, pc}
 1303              		.cfi_endproc
 1304              	.LFE16:
 1306              		.align	1
 1307              		.global	draw_object
 1308              		.syntax unified
 1309              		.code	16
 1310              		.thumb_func
 1311              		.fpu softvfp
 1313              	draw_object:
 1314              	.LFB17:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** void draw_object(POBJECT pObj){
 1315              		.loc 3 35 0
 1316              		.cfi_startproc
 1317              		@ args = 0, pretend = 0, frame = 16
 1318              		@ frame_needed = 1, uses_anonymous_args = 0
 1319 062a 80B5     		push	{r7, lr}
 1320              		.cfi_def_cfa_offset 8
 1321              		.cfi_offset 7, -8
 1322              		.cfi_offset 14, -4
 1323 062c 84B0     		sub	sp, sp, #16
 1324              		.cfi_def_cfa_offset 24
 1325 062e 00AF     		add	r7, sp, #0
 1326              		.cfi_def_cfa_register 7
 1327 0630 7860     		str	r0, [r7, #4]
 1328              	.LBB4:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1329              		.loc 3 36 0
 1330 0632 0023     		movs	r3, #0
 1331 0634 FB60     		str	r3, [r7, #12]
 1332 0636 1FE0     		b	.L71
 1333              	.L72:
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 1);
 1334              		.loc 3 37 0 discriminator 3
 1335 0638 7B68     		ldr	r3, [r7, #4]
 1336 063a 1A68     		ldr	r2, [r3]
 1337 063c FB68     		ldr	r3, [r7, #12]
 1338 063e 0433     		adds	r3, r3, #4
 1339 0640 5B00     		lsls	r3, r3, #1
 1340 0642 D318     		adds	r3, r2, r3
 1341 0644 0433     		adds	r3, r3, #4
 1342 0646 1B78     		ldrb	r3, [r3]
 1343 0648 1A00     		movs	r2, r3
 1344 064a 7B68     		ldr	r3, [r7, #4]
 1345 064c DB68     		ldr	r3, [r3, #12]
 1346 064e D318     		adds	r3, r2, r3
 1347 0650 1800     		movs	r0, r3
 1348 0652 7B68     		ldr	r3, [r7, #4]
 1349 0654 1A68     		ldr	r2, [r3]
 1350 0656 FB68     		ldr	r3, [r7, #12]
 1351 0658 0433     		adds	r3, r3, #4
 1352 065a 5B00     		lsls	r3, r3, #1
 1353 065c D318     		adds	r3, r2, r3
 1354 065e 0533     		adds	r3, r3, #5
 1355 0660 1B78     		ldrb	r3, [r3]
 1356 0662 1A00     		movs	r2, r3
 1357 0664 7B68     		ldr	r3, [r7, #4]
 1358 0666 1B69     		ldr	r3, [r3, #16]
 1359 0668 D318     		adds	r3, r2, r3
 1360 066a 0122     		movs	r2, #1
 1361 066c 1900     		movs	r1, r3
 1362 066e FFF7FEFF 		bl	pixel
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1363              		.loc 3 36 0 discriminator 3
 1364 0672 FB68     		ldr	r3, [r7, #12]
 1365 0674 0133     		adds	r3, r3, #1
 1366 0676 FB60     		str	r3, [r7, #12]
 1367              	.L71:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1368              		.loc 3 36 0 is_stmt 0 discriminator 1
 1369 0678 FB68     		ldr	r3, [r7, #12]
 1370 067a 132B     		cmp	r3, #19
 1371 067c DCDD     		ble	.L72
 1372              	.LBE4:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****         }
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     }
 1373              		.loc 3 39 0 is_stmt 1
 1374 067e C046     		nop
 1375 0680 BD46     		mov	sp, r7
 1376 0682 04B0     		add	sp, sp, #16
 1377              		@ sp needed
 1378 0684 80BD     		pop	{r7, pc}
 1379              		.cfi_endproc
 1380              	.LFE17:
 1382              		.align	1
 1383              		.global	clear_object
 1384              		.syntax unified
 1385              		.code	16
 1386              		.thumb_func
 1387              		.fpu softvfp
 1389              	clear_object:
 1390              	.LFB18:
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** void clear_object(POBJECT pObj){
 1391              		.loc 3 41 0
 1392              		.cfi_startproc
 1393              		@ args = 0, pretend = 0, frame = 16
 1394              		@ frame_needed = 1, uses_anonymous_args = 0
 1395 0686 80B5     		push	{r7, lr}
 1396              		.cfi_def_cfa_offset 8
 1397              		.cfi_offset 7, -8
 1398              		.cfi_offset 14, -4
 1399 0688 84B0     		sub	sp, sp, #16
 1400              		.cfi_def_cfa_offset 24
 1401 068a 00AF     		add	r7, sp, #0
 1402              		.cfi_def_cfa_register 7
 1403 068c 7860     		str	r0, [r7, #4]
 1404              	.LBB5:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1405              		.loc 3 42 0
 1406 068e 0023     		movs	r3, #0
 1407 0690 FB60     		str	r3, [r7, #12]
 1408 0692 1FE0     		b	.L74
 1409              	.L75:
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****             pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 0);
 1410              		.loc 3 43 0 discriminator 3
 1411 0694 7B68     		ldr	r3, [r7, #4]
 1412 0696 1A68     		ldr	r2, [r3]
 1413 0698 FB68     		ldr	r3, [r7, #12]
 1414 069a 0433     		adds	r3, r3, #4
 1415 069c 5B00     		lsls	r3, r3, #1
 1416 069e D318     		adds	r3, r2, r3
 1417 06a0 0433     		adds	r3, r3, #4
 1418 06a2 1B78     		ldrb	r3, [r3]
 1419 06a4 1A00     		movs	r2, r3
 1420 06a6 7B68     		ldr	r3, [r7, #4]
 1421 06a8 DB68     		ldr	r3, [r3, #12]
 1422 06aa D318     		adds	r3, r2, r3
 1423 06ac 1800     		movs	r0, r3
 1424 06ae 7B68     		ldr	r3, [r7, #4]
 1425 06b0 1A68     		ldr	r2, [r3]
 1426 06b2 FB68     		ldr	r3, [r7, #12]
 1427 06b4 0433     		adds	r3, r3, #4
 1428 06b6 5B00     		lsls	r3, r3, #1
 1429 06b8 D318     		adds	r3, r2, r3
 1430 06ba 0533     		adds	r3, r3, #5
 1431 06bc 1B78     		ldrb	r3, [r3]
 1432 06be 1A00     		movs	r2, r3
 1433 06c0 7B68     		ldr	r3, [r7, #4]
 1434 06c2 1B69     		ldr	r3, [r3, #16]
 1435 06c4 D318     		adds	r3, r2, r3
 1436 06c6 0022     		movs	r2, #0
 1437 06c8 1900     		movs	r1, r3
 1438 06ca FFF7FEFF 		bl	pixel
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1439              		.loc 3 42 0 discriminator 3
 1440 06ce FB68     		ldr	r3, [r7, #12]
 1441 06d0 0133     		adds	r3, r3, #1
 1442 06d2 FB60     		str	r3, [r7, #12]
 1443              	.L74:
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     for(int i=0; i < MAX_POINTS; i++){
 1444              		.loc 3 42 0 is_stmt 0 discriminator 1
 1445 06d4 FB68     		ldr	r3, [r7, #12]
 1446 06d6 132B     		cmp	r3, #19
 1447 06d8 DCDD     		ble	.L75
 1448              	.LBE5:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****         }
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     }
 1449              		.loc 3 45 0 is_stmt 1
 1450 06da C046     		nop
 1451 06dc BD46     		mov	sp, r7
 1452 06de 04B0     		add	sp, sp, #16
 1453              		@ sp needed
 1454 06e0 80BD     		pop	{r7, pc}
 1455              		.cfi_endproc
 1456              	.LFE18:
 1458              		.align	1
 1459              		.global	move_object
 1460              		.syntax unified
 1461              		.code	16
 1462              		.thumb_func
 1463              		.fpu softvfp
 1465              	move_object:
 1466              	.LFB19:
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** void move_object(POBJECT pObj){
 1467              		.loc 3 47 0
 1468              		.cfi_startproc
 1469              		@ args = 0, pretend = 0, frame = 8
 1470              		@ frame_needed = 1, uses_anonymous_args = 0
 1471 06e2 80B5     		push	{r7, lr}
 1472              		.cfi_def_cfa_offset 8
 1473              		.cfi_offset 7, -8
 1474              		.cfi_offset 14, -4
 1475 06e4 82B0     		sub	sp, sp, #8
 1476              		.cfi_def_cfa_offset 16
 1477 06e6 00AF     		add	r7, sp, #0
 1478              		.cfi_def_cfa_register 7
 1479 06e8 7860     		str	r0, [r7, #4]
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     clear_object(pObj);
 1480              		.loc 3 48 0
 1481 06ea 7B68     		ldr	r3, [r7, #4]
 1482 06ec 1800     		movs	r0, r3
 1483 06ee FFF7FEFF 		bl	clear_object
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     pObj->posX += pObj->dirX;
 1484              		.loc 3 49 0
 1485 06f2 7B68     		ldr	r3, [r7, #4]
 1486 06f4 DA68     		ldr	r2, [r3, #12]
 1487 06f6 7B68     		ldr	r3, [r7, #4]
 1488 06f8 5B68     		ldr	r3, [r3, #4]
 1489 06fa D218     		adds	r2, r2, r3
 1490 06fc 7B68     		ldr	r3, [r7, #4]
 1491 06fe DA60     		str	r2, [r3, #12]
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     pObj->posY += pObj->dirY;
 1492              		.loc 3 50 0
 1493 0700 7B68     		ldr	r3, [r7, #4]
 1494 0702 1A69     		ldr	r2, [r3, #16]
 1495 0704 7B68     		ldr	r3, [r7, #4]
 1496 0706 9B68     		ldr	r3, [r3, #8]
 1497 0708 D218     		adds	r2, r2, r3
 1498 070a 7B68     		ldr	r3, [r7, #4]
 1499 070c 1A61     		str	r2, [r3, #16]
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     if((pObj->posX < 0) || pObj->posX > 128 ) {
 1500              		.loc 3 52 0
 1501 070e 7B68     		ldr	r3, [r7, #4]
 1502 0710 DB68     		ldr	r3, [r3, #12]
 1503 0712 002B     		cmp	r3, #0
 1504 0714 03DB     		blt	.L77
 1505              		.loc 3 52 0 is_stmt 0 discriminator 1
 1506 0716 7B68     		ldr	r3, [r7, #4]
 1507 0718 DB68     		ldr	r3, [r3, #12]
 1508 071a 802B     		cmp	r3, #128
 1509 071c 04DD     		ble	.L78
 1510              	.L77:
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 		pObj->dirX = -pObj->dirX;
 1511              		.loc 3 53 0 is_stmt 1
 1512 071e 7B68     		ldr	r3, [r7, #4]
 1513 0720 5B68     		ldr	r3, [r3, #4]
 1514 0722 5A42     		rsbs	r2, r3, #0
 1515 0724 7B68     		ldr	r3, [r7, #4]
 1516 0726 5A60     		str	r2, [r3, #4]
 1517              	.L78:
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 	}
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 	if((pObj->posY < 0) || pObj->posY > 64 ) {
 1518              		.loc 3 56 0
 1519 0728 7B68     		ldr	r3, [r7, #4]
 1520 072a 1B69     		ldr	r3, [r3, #16]
 1521 072c 002B     		cmp	r3, #0
 1522 072e 03DB     		blt	.L79
 1523              		.loc 3 56 0 is_stmt 0 discriminator 1
 1524 0730 7B68     		ldr	r3, [r7, #4]
 1525 0732 1B69     		ldr	r3, [r3, #16]
 1526 0734 402B     		cmp	r3, #64
 1527 0736 04DD     		ble	.L80
 1528              	.L79:
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 		pObj->dirY = -pObj->dirY;
 1529              		.loc 3 57 0 is_stmt 1
 1530 0738 7B68     		ldr	r3, [r7, #4]
 1531 073a 9B68     		ldr	r3, [r3, #8]
 1532 073c 5A42     		rsbs	r2, r3, #0
 1533 073e 7B68     		ldr	r3, [r7, #4]
 1534 0740 9A60     		str	r2, [r3, #8]
 1535              	.L80:
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 	}
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h **** 	pObj->draw(pObj);
 1536              		.loc 3 60 0
 1537 0742 7B68     		ldr	r3, [r7, #4]
 1538 0744 5B69     		ldr	r3, [r3, #20]
 1539 0746 7A68     		ldr	r2, [r7, #4]
 1540 0748 1000     		movs	r0, r2
 1541 074a 9847     		blx	r3
 1542              	.LVL0:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/object.h ****     }    
 1543              		.loc 3 62 0
 1544 074c C046     		nop
 1545 074e BD46     		mov	sp, r7
 1546 0750 02B0     		add	sp, sp, #8
 1547              		@ sp needed
 1548 0752 80BD     		pop	{r7, pc}
 1549              		.cfi_endproc
 1550              	.LFE19:
 1552              		.global	ball_geometry
 1553              		.data
 1554              		.align	2
 1557              	ball_geometry:
 1558 0000 0C000000 		.word	12
 1559 0004 04000000 		.word	4
 1560 0008 04000000 		.word	4
 1561 000c 00       		.byte	0
 1562 000d 01       		.byte	1
 1563 000e 00       		.byte	0
 1564 000f 02       		.byte	2
 1565 0010 01       		.byte	1
 1566 0011 00       		.byte	0
 1567 0012 01       		.byte	1
 1568 0013 01       		.byte	1
 1569 0014 01       		.byte	1
 1570 0015 02       		.byte	2
 1571 0016 01       		.byte	1
 1572 0017 03       		.byte	3
 1573 0018 02       		.byte	2
 1574 0019 00       		.byte	0
 1575 001a 02       		.byte	2
 1576 001b 01       		.byte	1
 1577 001c 02       		.byte	2
 1578 001d 02       		.byte	2
 1579 001e 02       		.byte	2
 1580 001f 03       		.byte	3
 1581 0020 03       		.byte	3
 1582 0021 01       		.byte	1
 1583 0022 03       		.byte	3
 1584 0023 02       		.byte	2
 1585 0024 00000000 		.space	16
 1585      00000000 
 1585      00000000 
 1585      00000000 
 1586              		.align	2
 1589              	ball:
 1590 0034 00000000 		.word	ball_geometry
 1591 0038 00000000 		.word	0
 1592 003c 00000000 		.word	0
 1593 0040 01000000 		.word	1
 1594 0044 01000000 		.word	1
 1595 0048 00000000 		.word	draw_object
 1596 004c 00000000 		.word	clear_object
 1597 0050 00000000 		.word	move_object
 1598 0054 00000000 		.word	set_object_speed
 1599              		.section	.start_section,"ax",%progbits
 1600              		.align	1
 1601              		.global	startup
 1602              		.syntax unified
 1603              		.code	16
 1604              		.thumb_func
 1605              		.fpu softvfp
 1607              	startup:
 1608              	.LFB20:
 1609              		.file 4 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** // Port E setup
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_E 0x40021000
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #define SIMULATOR
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #include "delay.h"
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #include "graphics.h"
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #include "object.h"
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** #include "ball.h"
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** void startup ( void )
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** {
 1610              		.loc 4 26 0
 1611              		.cfi_startproc
 1612              		@ Naked Function: prologue and epilogue provided by programmer.
 1613              		@ args = 0, pretend = 0, frame = 0
 1614              		@ frame_needed = 1, uses_anonymous_args = 0
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** asm volatile(
 1615              		.loc 4 27 0
 1616              		.syntax divided
 1617              	@ 27 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c" 1
 1618 0000 0248     		 LDR R0,=0x2001C000
 1619 0002 8546     	 MOV SP,R0
 1620 0004 FFF7FEFF 	 BL main
 1621 0008 FEE7     	.L1: B .L1
 1622              	
 1623              	@ 0 "" 2
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 	" MOV SP,R0\n"
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 	" BL main\n"				/* call main */
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 	".L1: B .L1\n"				/* never return */
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 	) ;
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** }
 1624              		.loc 4 33 0
 1625              		.thumb
 1626              		.syntax unified
 1627 000a C046     		nop
 1628              		.cfi_endproc
 1629              	.LFE20:
 1631              		.text
 1632              		.align	1
 1633              		.global	init_app
 1634              		.syntax unified
 1635              		.code	16
 1636              		.thumb_func
 1637              		.fpu softvfp
 1639              	init_app:
 1640              	.LFB21:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** void init_app(void){
 1641              		.loc 4 35 0
 1642              		.cfi_startproc
 1643              		@ args = 0, pretend = 0, frame = 0
 1644              		@ frame_needed = 1, uses_anonymous_args = 0
 1645 0754 80B5     		push	{r7, lr}
 1646              		.cfi_def_cfa_offset 8
 1647              		.cfi_offset 7, -8
 1648              		.cfi_offset 14, -4
 1649 0756 00AF     		add	r7, sp, #0
 1650              		.cfi_def_cfa_register 7
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****         *GPIO_MODER = 0x55555555;
 1651              		.loc 4 36 0
 1652 0758 024B     		ldr	r3, .L83
 1653 075a 034A     		ldr	r2, .L83+4
 1654 075c 1A60     		str	r2, [r3]
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****         
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****     }
 1655              		.loc 4 38 0
 1656 075e C046     		nop
 1657 0760 BD46     		mov	sp, r7
 1658              		@ sp needed
 1659 0762 80BD     		pop	{r7, pc}
 1660              	.L84:
 1661              		.align	2
 1662              	.L83:
 1663 0764 00100240 		.word	1073876992
 1664 0768 55555555 		.word	1431655765
 1665              		.cfi_endproc
 1666              	.LFE21:
 1668              		.align	1
 1669              		.global	main
 1670              		.syntax unified
 1671              		.code	16
 1672              		.thumb_func
 1673              		.fpu softvfp
 1675              	main:
 1676              	.LFB22:
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** void main(void)
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** {
 1677              		.loc 4 41 0
 1678              		.cfi_startproc
 1679              		@ args = 0, pretend = 0, frame = 8
 1680              		@ frame_needed = 1, uses_anonymous_args = 0
 1681 076c 80B5     		push	{r7, lr}
 1682              		.cfi_def_cfa_offset 8
 1683              		.cfi_offset 7, -8
 1684              		.cfi_offset 14, -4
 1685 076e 82B0     		sub	sp, sp, #8
 1686              		.cfi_def_cfa_offset 16
 1687 0770 00AF     		add	r7, sp, #0
 1688              		.cfi_def_cfa_register 7
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****      init_app();
 1689              		.loc 4 42 0
 1690 0772 FFF7FEFF 		bl	init_app
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****     graphic_initialize();
 1691              		.loc 4 43 0
 1692 0776 FFF7FEFF 		bl	graphic_initialize
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****     #ifndef SIMULATOR
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****         graphics_clear_screen();
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****     #endif
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c **** 
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****     POBJECT p = &ball;
 1693              		.loc 4 48 0
 1694 077a 084B     		ldr	r3, .L87
 1695 077c 7B60     		str	r3, [r7, #4]
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****     p->set_speed(p, 4, 1);
 1696              		.loc 4 49 0
 1697 077e 7B68     		ldr	r3, [r7, #4]
 1698 0780 1B6A     		ldr	r3, [r3, #32]
 1699 0782 7868     		ldr	r0, [r7, #4]
 1700 0784 0122     		movs	r2, #1
 1701 0786 0421     		movs	r1, #4
 1702 0788 9847     		blx	r3
 1703              	.LVL1:
 1704              	.L86:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****     while(1){
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****         p->move(p);
 1705              		.loc 4 51 0 discriminator 1
 1706 078a 7B68     		ldr	r3, [r7, #4]
 1707 078c DB69     		ldr	r3, [r3, #28]
 1708 078e 7A68     		ldr	r2, [r7, #4]
 1709 0790 1000     		movs	r0, r2
 1710 0792 9847     		blx	r3
 1711              	.LVL2:
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****         delay_milli(40);
 1712              		.loc 4 52 0 discriminator 1
 1713 0794 2820     		movs	r0, #40
 1714 0796 FFF7FEFF 		bl	delay_milli
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/startup.c ****         delay_milli(40);
 1715              		.loc 4 51 0 discriminator 1
 1716 079a F6E7     		b	.L86
 1717              	.L88:
 1718              		.align	2
 1719              	.L87:
 1720 079c 34000000 		.word	ball
 1721              		.cfi_endproc
 1722              	.LFE22:
 1724              	.Letext0:
 1725              		.file 5 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/autopong/ball.h"
