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
  24              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****  * 	delay.h
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** // Timer setup
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** #define STK 0xE000E010
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** #define STK_CTRL ((volatile unsigned int *) (STK))
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** void delay_250ns(void) {
  25              		.loc 1 11 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 00AF     		add	r7, sp, #0
  34              		.cfi_def_cfa_register 7
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	*STK_CTRL = 0;
  35              		.loc 1 12 0
  36 0004 0C4B     		ldr	r3, .L3
  37 0006 0022     		movs	r2, #0
  38 0008 1A60     		str	r2, [r3]
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  39              		.loc 1 13 0
  40 000a 0C4B     		ldr	r3, .L3+4
  41 000c 3122     		movs	r2, #49
  42 000e 1A60     		str	r2, [r3]
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	*STK_VAL = 0;
  43              		.loc 1 14 0
  44 0010 0B4B     		ldr	r3, .L3+8
  45 0012 0022     		movs	r2, #0
  46 0014 1A60     		str	r2, [r3]
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	*STK_CTRL = 5;
  47              		.loc 1 15 0
  48 0016 084B     		ldr	r3, .L3
  49 0018 0522     		movs	r2, #5
  50 001a 1A60     		str	r2, [r3]
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	while((*STK_CTRL & 0x10000) == 0) {
  51              		.loc 1 16 0
  52 001c C046     		nop
  53              	.L2:
  54              		.loc 1 16 0 is_stmt 0 discriminator 1
  55 001e 064B     		ldr	r3, .L3
  56 0020 1A68     		ldr	r2, [r3]
  57 0022 8023     		movs	r3, #128
  58 0024 5B02     		lsls	r3, r3, #9
  59 0026 1340     		ands	r3, r2
  60 0028 F9D0     		beq	.L2
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		// ??????
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	}
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	*STK_CTRL = 0;
  61              		.loc 1 19 0 is_stmt 1
  62 002a 034B     		ldr	r3, .L3
  63 002c 0022     		movs	r2, #0
  64 002e 1A60     		str	r2, [r3]
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** }
  65              		.loc 1 20 0
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
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** void delay500ns(){
  88              		.loc 1 22 0
  89              		.cfi_startproc
  90              		@ args = 0, pretend = 0, frame = 0
  91              		@ frame_needed = 1, uses_anonymous_args = 0
  92 0044 80B5     		push	{r7, lr}
  93              		.cfi_def_cfa_offset 8
  94              		.cfi_offset 7, -8
  95              		.cfi_offset 14, -4
  96 0046 00AF     		add	r7, sp, #0
  97              		.cfi_def_cfa_register 7
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****     //Delay 500ns in the most efficient way:
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****         delay_250ns();
  98              		.loc 1 24 0
  99 0048 FFF7FEFF 		bl	delay_250ns
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****         delay_250ns();
 100              		.loc 1 25 0
 101 004c FFF7FEFF 		bl	delay_250ns
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****         //Continue executing code efficently/.
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h ****         }
 102              		.loc 1 27 0
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
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** void delay_micro(unsigned int us) {
 119              		.loc 1 29 0
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
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	while(us--) {
 132              		.loc 1 30 0
 133 005e 07E0     		b	.L7
 134              	.L8:
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		delay_250ns();
 135              		.loc 1 31 0
 136 0060 FFF7FEFF 		bl	delay_250ns
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		delay_250ns();
 137              		.loc 1 32 0
 138 0064 FFF7FEFF 		bl	delay_250ns
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		delay_250ns();
 139              		.loc 1 33 0
 140 0068 FFF7FEFF 		bl	delay_250ns
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		delay_250ns();
 141              		.loc 1 34 0
 142 006c FFF7FEFF 		bl	delay_250ns
 143              	.L7:
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		delay_250ns();
 144              		.loc 1 30 0
 145 0070 7B68     		ldr	r3, [r7, #4]
 146 0072 5A1E     		subs	r2, r3, #1
 147 0074 7A60     		str	r2, [r7, #4]
 148 0076 002B     		cmp	r3, #0
 149 0078 F2D1     		bne	.L8
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	}
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** }
 150              		.loc 1 36 0
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
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** void delay_milli(unsigned int ms) {
 168              		.loc 1 38 0
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
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	#ifdef SIMULATOR
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		delay_micro(ms);
 181              		.loc 1 40 0
 182 008a 7B68     		ldr	r3, [r7, #4]
 183 008c 1800     		movs	r0, r3
 184 008e FFF7FEFF 		bl	delay_micro
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	#else
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 		delay_micro(1000 * ms);
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** 	#endif
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/delay.h **** }
 185              		.loc 1 44 0
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
 203              		.file 2 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****  * 	graphics.h
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** // Control for display
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define B_E 0x40
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define B_SELECT 0x04
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define B_RW 0x02
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define B_RS 0x01
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define B_RST 0x20
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define B_CS2 0x10
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define B_CS1 0x08
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define LCD_ON 0x3F
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define LCD_OFF 0x3E
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define LCD_DISP_START 0xC0
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define LCD_SET_ADD 0x40
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define LCD_SET_PAGE 0xB8
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define LCD_BUSY 0x80
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define PAGE 8
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define ADD 63
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define SCREEN_WIDTH  127
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** #define SCREEN_HEIGHT 63
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** typedef unsigned char uint8_t;
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphics_ctrl_bit_set(uint8_t x){
 204              		.loc 2 31 0
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
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
 219              		.loc 2 32 0
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
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 235              		.loc 2 33 0
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
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphics_ctrl_bit_clear(uint8_t x){
 257              		.loc 2 35 0
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
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_ODR_LOW &= ~x;
 272              		.loc 2 36 0
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
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 287              		.loc 2 37 0
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
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void select_controller(uint8_t controller){
 309              		.loc 2 39 0
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
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller == 0) {
 324              		.loc 2 40 0
 325 0110 FB1D     		adds	r3, r7, #7
 326 0112 1B78     		ldrb	r3, [r3]
 327 0114 002B     		cmp	r3, #0
 328 0116 06D1     		bne	.L17
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 329              		.loc 2 41 0
 330 0118 0820     		movs	r0, #8
 331 011a FFF7FEFF 		bl	graphics_ctrl_bit_clear
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 332              		.loc 2 42 0
 333 011e 1020     		movs	r0, #16
 334 0120 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     } else if(controller == B_CS1) {
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     } else if(controller == B_CS2) {
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 335              		.loc 2 53 0
 336 0124 1FE0     		b	.L21
 337              	.L17:
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     } else if(controller == (B_CS1 | B_CS2)) {
 338              		.loc 2 43 0
 339 0126 FB1D     		adds	r3, r7, #7
 340 0128 1B78     		ldrb	r3, [r3]
 341 012a 182B     		cmp	r3, #24
 342 012c 06D1     		bne	.L19
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 343              		.loc 2 44 0
 344 012e 0820     		movs	r0, #8
 345 0130 FFF7FEFF 		bl	graphics_ctrl_bit_set
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     } else if(controller == B_CS1) {
 346              		.loc 2 45 0
 347 0134 1020     		movs	r0, #16
 348 0136 FFF7FEFF 		bl	graphics_ctrl_bit_set
 349              		.loc 2 53 0
 350 013a 14E0     		b	.L21
 351              	.L19:
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_CS1);
 352              		.loc 2 46 0
 353 013c FB1D     		adds	r3, r7, #7
 354 013e 1B78     		ldrb	r3, [r3]
 355 0140 082B     		cmp	r3, #8
 356 0142 06D1     		bne	.L20
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_CS2);
 357              		.loc 2 47 0
 358 0144 0820     		movs	r0, #8
 359 0146 FFF7FEFF 		bl	graphics_ctrl_bit_set
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     } else if(controller == B_CS2) {
 360              		.loc 2 48 0
 361 014a 1020     		movs	r0, #16
 362 014c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 363              		.loc 2 53 0
 364 0150 09E0     		b	.L21
 365              	.L20:
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_CS1);
 366              		.loc 2 49 0
 367 0152 FB1D     		adds	r3, r7, #7
 368 0154 1B78     		ldrb	r3, [r3]
 369 0156 102B     		cmp	r3, #16
 370 0158 05D1     		bne	.L21
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_CS2);
 371              		.loc 2 50 0
 372 015a 0820     		movs	r0, #8
 373 015c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 374              		.loc 2 51 0
 375 0160 1020     		movs	r0, #16
 376 0162 FFF7FEFF 		bl	graphics_ctrl_bit_set
 377              	.L21:
 378              		.loc 2 53 0
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
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_wait_ready(){
 396              		.loc 2 55 0
 397              		.cfi_startproc
 398              		@ args = 0, pretend = 0, frame = 0
 399              		@ frame_needed = 1, uses_anonymous_args = 0
 400 016e 80B5     		push	{r7, lr}
 401              		.cfi_def_cfa_offset 8
 402              		.cfi_offset 7, -8
 403              		.cfi_offset 14, -4
 404 0170 00AF     		add	r7, sp, #0
 405              		.cfi_def_cfa_register 7
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 406              		.loc 2 56 0
 407 0172 4020     		movs	r0, #64
 408 0174 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x00005555;
 409              		.loc 2 57 0
 410 0178 124B     		ldr	r3, .L28
 411 017a 134A     		ldr	r2, .L28+4
 412 017c 1A60     		str	r2, [r3]
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 413              		.loc 2 58 0
 414 017e 0120     		movs	r0, #1
 415 0180 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 416              		.loc 2 59 0
 417 0184 0220     		movs	r0, #2
 418 0186 FFF7FEFF 		bl	graphics_ctrl_bit_set
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 419              		.loc 2 60 0
 420 018a FFF7FEFF 		bl	delay500ns
 421              	.L25:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     while(1) { // Wait for display not to be busy
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_E);
 422              		.loc 2 63 0
 423 018e 4020     		movs	r0, #64
 424 0190 FFF7FEFF 		bl	graphics_ctrl_bit_set
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         delay500ns();
 425              		.loc 2 64 0
 426 0194 FFF7FEFF 		bl	delay500ns
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_E);
 427              		.loc 2 65 0
 428 0198 4020     		movs	r0, #64
 429 019a FFF7FEFF 		bl	graphics_ctrl_bit_clear
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         delay500ns();
 430              		.loc 2 66 0
 431 019e FFF7FEFF 		bl	delay500ns
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         //unsigned char i = *GPIO_IDR_HIGH;
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
 432              		.loc 2 68 0
 433 01a2 0A4B     		ldr	r3, .L28+8
 434 01a4 1B78     		ldrb	r3, [r3]
 435 01a6 DBB2     		uxtb	r3, r3
 436 01a8 5BB2     		sxtb	r3, r3
 437 01aa 002B     		cmp	r3, #0
 438 01ac 00DA     		bge	.L27
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         delay500ns();
 439              		.loc 2 63 0
 440 01ae EEE7     		b	.L25
 441              	.L27:
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****             break;
 442              		.loc 2 69 0
 443 01b0 C046     		nop
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 444              		.loc 2 72 0
 445 01b2 4020     		movs	r0, #64
 446 01b4 FFF7FEFF 		bl	graphics_ctrl_bit_set
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x55555555;
 447              		.loc 2 73 0
 448 01b8 024B     		ldr	r3, .L28
 449 01ba 054A     		ldr	r2, .L28+12
 450 01bc 1A60     		str	r2, [r3]
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 451              		.loc 2 75 0
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
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** uint8_t graphic_read(uint8_t controller){
 475              		.loc 2 77 0
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
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 490              		.loc 2 78 0
 491 01e0 4020     		movs	r0, #64
 492 01e2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x00005555;
 493              		.loc 2 79 0
 494 01e6 1C4B     		ldr	r3, .L34
 495 01e8 1C4A     		ldr	r2, .L34+4
 496 01ea 1A60     		str	r2, [r3]
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 497              		.loc 2 80 0
 498 01ec 0120     		movs	r0, #1
 499 01ee FFF7FEFF 		bl	graphics_ctrl_bit_set
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 500              		.loc 2 81 0
 501 01f2 0220     		movs	r0, #2
 502 01f4 FFF7FEFF 		bl	graphics_ctrl_bit_set
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 503              		.loc 2 82 0
 504 01f8 FB1D     		adds	r3, r7, #7
 505 01fa 1B78     		ldrb	r3, [r3]
 506 01fc 1800     		movs	r0, r3
 507 01fe FFF7FEFF 		bl	select_controller
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 508              		.loc 2 83 0
 509 0202 FFF7FEFF 		bl	delay500ns
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 510              		.loc 2 84 0
 511 0206 4020     		movs	r0, #64
 512 0208 FFF7FEFF 		bl	graphics_ctrl_bit_set
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 513              		.loc 2 85 0
 514 020c FFF7FEFF 		bl	delay500ns
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     uint8_t RV = *GPIO_IDR_HIGH;
 515              		.loc 2 86 0
 516 0210 134A     		ldr	r2, .L34+8
 517 0212 0F23     		movs	r3, #15
 518 0214 FB18     		adds	r3, r7, r3
 519 0216 1278     		ldrb	r2, [r2]
 520 0218 1A70     		strb	r2, [r3]
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 521              		.loc 2 87 0
 522 021a 4020     		movs	r0, #64
 523 021c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x55555555;
 524              		.loc 2 88 0
 525 0220 0D4B     		ldr	r3, .L34
 526 0222 104A     		ldr	r2, .L34+12
 527 0224 1A60     		str	r2, [r3]
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller == B_CS1){
 528              		.loc 2 89 0
 529 0226 FB1D     		adds	r3, r7, #7
 530 0228 1B78     		ldrb	r3, [r3]
 531 022a 082B     		cmp	r3, #8
 532 022c 04D1     		bne	.L31
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS1);
 533              		.loc 2 90 0
 534 022e 0820     		movs	r0, #8
 535 0230 FFF7FEFF 		bl	select_controller
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 536              		.loc 2 91 0
 537 0234 FFF7FEFF 		bl	graphic_wait_ready
 538              	.L31:
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller == B_CS2){
 539              		.loc 2 94 0
 540 0238 FB1D     		adds	r3, r7, #7
 541 023a 1B78     		ldrb	r3, [r3]
 542 023c 102B     		cmp	r3, #16
 543 023e 04D1     		bne	.L32
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS2);
 544              		.loc 2 95 0
 545 0240 1020     		movs	r0, #16
 546 0242 FFF7FEFF 		bl	select_controller
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 547              		.loc 2 96 0
 548 0246 FFF7FEFF 		bl	graphic_wait_ready
 549              	.L32:
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     return RV;
 550              		.loc 2 99 0
 551 024a 0F23     		movs	r3, #15
 552 024c FB18     		adds	r3, r7, r3
 553 024e 1B78     		ldrb	r3, [r3]
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 554              		.loc 2 101 0
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
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_write(uint8_t value, uint8_t controller){
 579              		.loc 2 103 0
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
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_ODR_HIGH = value;
 597              		.loc 2 104 0
 598 027a 1A4A     		ldr	r2, .L39
 599 027c FB1D     		adds	r3, r7, #7
 600 027e 1B78     		ldrb	r3, [r3]
 601 0280 1370     		strb	r3, [r2]
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 602              		.loc 2 105 0
 603 0282 BB1D     		adds	r3, r7, #6
 604 0284 1B78     		ldrb	r3, [r3]
 605 0286 1800     		movs	r0, r3
 606 0288 FFF7FEFF 		bl	select_controller
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 607              		.loc 2 106 0
 608 028c FFF7FEFF 		bl	delay500ns
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 609              		.loc 2 107 0
 610 0290 4020     		movs	r0, #64
 611 0292 FFF7FEFF 		bl	graphics_ctrl_bit_set
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 612              		.loc 2 108 0
 613 0296 FFF7FEFF 		bl	delay500ns
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 614              		.loc 2 109 0
 615 029a 4020     		movs	r0, #64
 616 029c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller & B_CS1){
 617              		.loc 2 111 0
 618 02a0 BB1D     		adds	r3, r7, #6
 619 02a2 1B78     		ldrb	r3, [r3]
 620 02a4 0822     		movs	r2, #8
 621 02a6 1340     		ands	r3, r2
 622 02a8 04D0     		beq	.L37
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS1);
 623              		.loc 2 112 0
 624 02aa 0820     		movs	r0, #8
 625 02ac FFF7FEFF 		bl	select_controller
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 626              		.loc 2 113 0
 627 02b0 FFF7FEFF 		bl	graphic_wait_ready
 628              	.L37:
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller & B_CS2){
 629              		.loc 2 116 0
 630 02b4 BB1D     		adds	r3, r7, #6
 631 02b6 1B78     		ldrb	r3, [r3]
 632 02b8 1022     		movs	r2, #16
 633 02ba 1340     		ands	r3, r2
 634 02bc 04D0     		beq	.L38
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS2);
 635              		.loc 2 117 0
 636 02be 1020     		movs	r0, #16
 637 02c0 FFF7FEFF 		bl	select_controller
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 638              		.loc 2 118 0
 639 02c4 FFF7FEFF 		bl	graphic_wait_ready
 640              	.L38:
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_ODR_HIGH = 0;
 641              		.loc 2 121 0
 642 02c8 064B     		ldr	r3, .L39
 643 02ca 0022     		movs	r2, #0
 644 02cc 1A70     		strb	r2, [r3]
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 645              		.loc 2 122 0
 646 02ce 4020     		movs	r0, #64
 647 02d0 FFF7FEFF 		bl	graphics_ctrl_bit_set
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(0);
 648              		.loc 2 123 0
 649 02d4 0020     		movs	r0, #0
 650 02d6 FFF7FEFF 		bl	select_controller
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 651              		.loc 2 124 0
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
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_write_command(uint8_t command, uint8_t controller){
 673              		.loc 2 126 0
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
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 691              		.loc 2 127 0
 692 02fa 4020     		movs	r0, #64
 693 02fc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 694              		.loc 2 128 0
 695 0300 BB1D     		adds	r3, r7, #6
 696 0302 1B78     		ldrb	r3, [r3]
 697 0304 1800     		movs	r0, r3
 698 0306 FFF7FEFF 		bl	select_controller
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 699              		.loc 2 129 0
 700 030a 0120     		movs	r0, #1
 701 030c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 702              		.loc 2 130 0
 703 0310 0220     		movs	r0, #2
 704 0312 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write(command, controller);
 705              		.loc 2 131 0
 706 0316 BB1D     		adds	r3, r7, #6
 707 0318 1A78     		ldrb	r2, [r3]
 708 031a FB1D     		adds	r3, r7, #7
 709 031c 1B78     		ldrb	r3, [r3]
 710 031e 1100     		movs	r1, r2
 711 0320 1800     		movs	r0, r3
 712 0322 FFF7FEFF 		bl	graphic_write
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 713              		.loc 2 132 0
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
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_write_data(uint8_t data, uint8_t controller){
 731              		.loc 2 134 0
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
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 749              		.loc 2 135 0
 750 0340 4020     		movs	r0, #64
 751 0342 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 752              		.loc 2 136 0
 753 0346 BB1D     		adds	r3, r7, #6
 754 0348 1B78     		ldrb	r3, [r3]
 755 034a 1800     		movs	r0, r3
 756 034c FFF7FEFF 		bl	select_controller
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 757              		.loc 2 137 0
 758 0350 0120     		movs	r0, #1
 759 0352 FFF7FEFF 		bl	graphics_ctrl_bit_set
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 760              		.loc 2 138 0
 761 0356 0220     		movs	r0, #2
 762 0358 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write(data, controller);
 763              		.loc 2 139 0
 764 035c BB1D     		adds	r3, r7, #6
 765 035e 1A78     		ldrb	r2, [r3]
 766 0360 FB1D     		adds	r3, r7, #7
 767 0362 1B78     		ldrb	r3, [r3]
 768 0364 1100     		movs	r1, r2
 769 0366 1800     		movs	r0, r3
 770 0368 FFF7FEFF 		bl	graphic_write
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 771              		.loc 2 140 0
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
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** uint8_t graphics_read_data(uint8_t controller){
 789              		.loc 2 142 0
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
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     (void) graphic_read(controller);
 804              		.loc 2 143 0
 805 0380 FB1D     		adds	r3, r7, #7
 806 0382 1B78     		ldrb	r3, [r3]
 807 0384 1800     		movs	r0, r3
 808 0386 FFF7FEFF 		bl	graphic_read
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     return graphic_read(controller);
 809              		.loc 2 144 0
 810 038a FB1D     		adds	r3, r7, #7
 811 038c 1B78     		ldrb	r3, [r3]
 812 038e 1800     		movs	r0, r3
 813 0390 FFF7FEFF 		bl	graphic_read
 814 0394 0300     		movs	r3, r0
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 815              		.loc 2 145 0
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
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_initialize(void){
 833              		.loc 2 147 0
 834              		.cfi_startproc
 835              		@ args = 0, pretend = 0, frame = 0
 836              		@ frame_needed = 1, uses_anonymous_args = 0
 837 039e 80B5     		push	{r7, lr}
 838              		.cfi_def_cfa_offset 8
 839              		.cfi_offset 7, -8
 840              		.cfi_offset 14, -4
 841 03a0 00AF     		add	r7, sp, #0
 842              		.cfi_def_cfa_register 7
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 843              		.loc 2 148 0
 844 03a2 4020     		movs	r0, #64
 845 03a4 FFF7FEFF 		bl	graphics_ctrl_bit_set
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay_micro(10);
 846              		.loc 2 149 0
 847 03a8 0A20     		movs	r0, #10
 848 03aa FFF7FEFF 		bl	delay_micro
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_CS1);
 849              		.loc 2 150 0
 850 03ae 0820     		movs	r0, #8
 851 03b0 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_CS2);
 852              		.loc 2 151 0
 853 03b4 1020     		movs	r0, #16
 854 03b6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RST);
 855              		.loc 2 152 0
 856 03ba 2020     		movs	r0, #32
 857 03bc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 858              		.loc 2 153 0
 859 03c0 4020     		movs	r0, #64
 860 03c2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay_milli(30);
 861              		.loc 2 154 0
 862 03c6 1E20     		movs	r0, #30
 863 03c8 FFF7FEFF 		bl	delay_milli
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RST);
 864              		.loc 2 155 0
 865 03cc 2020     		movs	r0, #32
 866 03ce FFF7FEFF 		bl	graphics_ctrl_bit_set
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 867              		.loc 2 156 0
 868 03d2 1821     		movs	r1, #24
 869 03d4 3E20     		movs	r0, #62
 870 03d6 FFF7FEFF 		bl	graphic_write_command
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_ON, B_CS1|B_CS2);
 871              		.loc 2 157 0
 872 03da 1821     		movs	r1, #24
 873 03dc 3F20     		movs	r0, #63
 874 03de FFF7FEFF 		bl	graphic_write_command
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 875              		.loc 2 158 0
 876 03e2 1821     		movs	r1, #24
 877 03e4 C020     		movs	r0, #192
 878 03e6 FFF7FEFF 		bl	graphic_write_command
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 879              		.loc 2 159 0
 880 03ea 1821     		movs	r1, #24
 881 03ec 4020     		movs	r0, #64
 882 03ee FFF7FEFF 		bl	graphic_write_command
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 883              		.loc 2 160 0
 884 03f2 1821     		movs	r1, #24
 885 03f4 B820     		movs	r0, #184
 886 03f6 FFF7FEFF 		bl	graphic_write_command
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(0);
 887              		.loc 2 161 0
 888 03fa 0020     		movs	r0, #0
 889 03fc FFF7FEFF 		bl	select_controller
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 890              		.loc 2 162 0
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
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphics_clear_screen(void){
 907              		.loc 2 164 0
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
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     for(int page = 0; page < PAGE; page++){
 920              		.loc 2 165 0
 921 040c 0023     		movs	r3, #0
 922 040e 7B60     		str	r3, [r7, #4]
 923 0410 1EE0     		b	.L47
 924              	.L50:
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 925              		.loc 2 166 0
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
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 936              		.loc 2 167 0
 937 0428 1821     		movs	r1, #24
 938 042a 4020     		movs	r0, #64
 939 042c FFF7FEFF 		bl	graphic_write_command
 940              	.LBB3:
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         for(int add = 0; add < ADD; add++){
 941              		.loc 2 168 0
 942 0430 0023     		movs	r3, #0
 943 0432 3B60     		str	r3, [r7]
 944 0434 06E0     		b	.L48
 945              	.L49:
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****             graphic_write_data(0, B_CS1|B_CS2);
 946              		.loc 2 169 0 discriminator 3
 947 0436 1821     		movs	r1, #24
 948 0438 0020     		movs	r0, #0
 949 043a FFF7FEFF 		bl	graphic_write_data
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         for(int add = 0; add < ADD; add++){
 950              		.loc 2 168 0 discriminator 3
 951 043e 3B68     		ldr	r3, [r7]
 952 0440 0133     		adds	r3, r3, #1
 953 0442 3B60     		str	r3, [r7]
 954              	.L48:
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         for(int add = 0; add < ADD; add++){
 955              		.loc 2 168 0 is_stmt 0 discriminator 1
 956 0444 3B68     		ldr	r3, [r7]
 957 0446 3E2B     		cmp	r3, #62
 958 0448 F5DD     		ble	.L49
 959              	.LBE3:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 960              		.loc 2 165 0 is_stmt 1 discriminator 2
 961 044a 7B68     		ldr	r3, [r7, #4]
 962 044c 0133     		adds	r3, r3, #1
 963 044e 7B60     		str	r3, [r7, #4]
 964              	.L47:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 965              		.loc 2 165 0 is_stmt 0 discriminator 1
 966 0450 7B68     		ldr	r3, [r7, #4]
 967 0452 072B     		cmp	r3, #7
 968 0454 DDDD     		ble	.L50
 969              	.LBE2:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 970              		.loc 2 173 0 is_stmt 1
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
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void pixel(unsigned x, unsigned y, unsigned set){
 988              		.loc 2 176 0
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
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((x < 0 || y < 0) || (x > SCREEN_WIDTH || y > SCREEN_HEIGHT)) return;
 1004              		.loc 2 177 0
 1005 046a FB68     		ldr	r3, [r7, #12]
 1006 046c 7F2B     		cmp	r3, #127
 1007 046e 00D9     		bls	.LCB785
 1008 0470 C7E0     		b	.L68	@long jump
 1009              	.LCB785:
 1010              		.loc 2 177 0 is_stmt 0 discriminator 1
 1011 0472 BB68     		ldr	r3, [r7, #8]
 1012 0474 3F2B     		cmp	r3, #63
 1013 0476 00D9     		bls	.LCB788
 1014 0478 C3E0     		b	.L68	@long jump
 1015              	.LCB788:
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char index = (y-1) / PAGE;
 1016              		.loc 2 179 0 is_stmt 1
 1017 047a BB68     		ldr	r3, [r7, #8]
 1018 047c 013B     		subs	r3, r3, #1
 1019 047e DA08     		lsrs	r2, r3, #3
 1020 0480 1523     		movs	r3, #21
 1021 0482 FB18     		adds	r3, r7, r3
 1022 0484 1A70     		strb	r2, [r3]
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char mask;
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 0){mask = 1;}
 1023              		.loc 2 183 0
 1024 0486 BB68     		ldr	r3, [r7, #8]
 1025 0488 013B     		subs	r3, r3, #1
 1026 048a 0722     		movs	r2, #7
 1027 048c 1340     		ands	r3, r2
 1028 048e 03D1     		bne	.L55
 1029              		.loc 2 183 0 is_stmt 0 discriminator 1
 1030 0490 1723     		movs	r3, #23
 1031 0492 FB18     		adds	r3, r7, r3
 1032 0494 0122     		movs	r2, #1
 1033 0496 1A70     		strb	r2, [r3]
 1034              	.L55:
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 1){mask = 2;}
 1035              		.loc 2 184 0 is_stmt 1
 1036 0498 BB68     		ldr	r3, [r7, #8]
 1037 049a 013B     		subs	r3, r3, #1
 1038 049c 0722     		movs	r2, #7
 1039 049e 1340     		ands	r3, r2
 1040 04a0 012B     		cmp	r3, #1
 1041 04a2 03D1     		bne	.L56
 1042              		.loc 2 184 0 is_stmt 0 discriminator 1
 1043 04a4 1723     		movs	r3, #23
 1044 04a6 FB18     		adds	r3, r7, r3
 1045 04a8 0222     		movs	r2, #2
 1046 04aa 1A70     		strb	r2, [r3]
 1047              	.L56:
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 2){mask = 4;}
 1048              		.loc 2 185 0 is_stmt 1
 1049 04ac BB68     		ldr	r3, [r7, #8]
 1050 04ae 013B     		subs	r3, r3, #1
 1051 04b0 0722     		movs	r2, #7
 1052 04b2 1340     		ands	r3, r2
 1053 04b4 022B     		cmp	r3, #2
 1054 04b6 03D1     		bne	.L57
 1055              		.loc 2 185 0 is_stmt 0 discriminator 1
 1056 04b8 1723     		movs	r3, #23
 1057 04ba FB18     		adds	r3, r7, r3
 1058 04bc 0422     		movs	r2, #4
 1059 04be 1A70     		strb	r2, [r3]
 1060              	.L57:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 3){mask = 8;}
 1061              		.loc 2 186 0 is_stmt 1
 1062 04c0 BB68     		ldr	r3, [r7, #8]
 1063 04c2 013B     		subs	r3, r3, #1
 1064 04c4 0722     		movs	r2, #7
 1065 04c6 1340     		ands	r3, r2
 1066 04c8 032B     		cmp	r3, #3
 1067 04ca 03D1     		bne	.L58
 1068              		.loc 2 186 0 is_stmt 0 discriminator 1
 1069 04cc 1723     		movs	r3, #23
 1070 04ce FB18     		adds	r3, r7, r3
 1071 04d0 0822     		movs	r2, #8
 1072 04d2 1A70     		strb	r2, [r3]
 1073              	.L58:
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 4){mask = 0x10;}
 1074              		.loc 2 187 0 is_stmt 1
 1075 04d4 BB68     		ldr	r3, [r7, #8]
 1076 04d6 013B     		subs	r3, r3, #1
 1077 04d8 0722     		movs	r2, #7
 1078 04da 1340     		ands	r3, r2
 1079 04dc 042B     		cmp	r3, #4
 1080 04de 03D1     		bne	.L59
 1081              		.loc 2 187 0 is_stmt 0 discriminator 1
 1082 04e0 1723     		movs	r3, #23
 1083 04e2 FB18     		adds	r3, r7, r3
 1084 04e4 1022     		movs	r2, #16
 1085 04e6 1A70     		strb	r2, [r3]
 1086              	.L59:
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 5){mask = 0x20;}
 1087              		.loc 2 188 0 is_stmt 1
 1088 04e8 BB68     		ldr	r3, [r7, #8]
 1089 04ea 013B     		subs	r3, r3, #1
 1090 04ec 0722     		movs	r2, #7
 1091 04ee 1340     		ands	r3, r2
 1092 04f0 052B     		cmp	r3, #5
 1093 04f2 03D1     		bne	.L60
 1094              		.loc 2 188 0 is_stmt 0 discriminator 1
 1095 04f4 1723     		movs	r3, #23
 1096 04f6 FB18     		adds	r3, r7, r3
 1097 04f8 2022     		movs	r2, #32
 1098 04fa 1A70     		strb	r2, [r3]
 1099              	.L60:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 6){mask = 0x40;}
 1100              		.loc 2 189 0 is_stmt 1
 1101 04fc BB68     		ldr	r3, [r7, #8]
 1102 04fe 013B     		subs	r3, r3, #1
 1103 0500 0722     		movs	r2, #7
 1104 0502 1340     		ands	r3, r2
 1105 0504 062B     		cmp	r3, #6
 1106 0506 03D1     		bne	.L61
 1107              		.loc 2 189 0 is_stmt 0 discriminator 1
 1108 0508 1723     		movs	r3, #23
 1109 050a FB18     		adds	r3, r7, r3
 1110 050c 4022     		movs	r2, #64
 1111 050e 1A70     		strb	r2, [r3]
 1112              	.L61:
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((y-1) % 8 == 7){mask = 0x80;}
 1113              		.loc 2 190 0 is_stmt 1
 1114 0510 BB68     		ldr	r3, [r7, #8]
 1115 0512 013B     		subs	r3, r3, #1
 1116 0514 0722     		movs	r2, #7
 1117 0516 1340     		ands	r3, r2
 1118 0518 072B     		cmp	r3, #7
 1119 051a 03D1     		bne	.L62
 1120              		.loc 2 190 0 is_stmt 0 discriminator 1
 1121 051c 1723     		movs	r3, #23
 1122 051e FB18     		adds	r3, r7, r3
 1123 0520 8022     		movs	r2, #128
 1124 0522 1A70     		strb	r2, [r3]
 1125              	.L62:
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(set == 9){mask = ~mask;}
 1126              		.loc 2 192 0 is_stmt 1
 1127 0524 7B68     		ldr	r3, [r7, #4]
 1128 0526 092B     		cmp	r3, #9
 1129 0528 06D1     		bne	.L63
 1130              		.loc 2 192 0 is_stmt 0 discriminator 1
 1131 052a 1723     		movs	r3, #23
 1132 052c FB18     		adds	r3, r7, r3
 1133 052e 1722     		movs	r2, #23
 1134 0530 BA18     		adds	r2, r7, r2
 1135 0532 1278     		ldrb	r2, [r2]
 1136 0534 D243     		mvns	r2, r2
 1137 0536 1A70     		strb	r2, [r3]
 1138              	.L63:
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char controller;
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(x > 64){
 1139              		.loc 2 195 0 is_stmt 1
 1140 0538 FB68     		ldr	r3, [r7, #12]
 1141 053a 402B     		cmp	r3, #64
 1142 053c 07D9     		bls	.L64
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         controller = B_CS2;
 1143              		.loc 2 196 0
 1144 053e 1623     		movs	r3, #22
 1145 0540 FB18     		adds	r3, r7, r3
 1146 0542 1022     		movs	r2, #16
 1147 0544 1A70     		strb	r2, [r3]
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         x = x - 65;
 1148              		.loc 2 197 0
 1149 0546 FB68     		ldr	r3, [r7, #12]
 1150 0548 413B     		subs	r3, r3, #65
 1151 054a FB60     		str	r3, [r7, #12]
 1152 054c 06E0     		b	.L65
 1153              	.L64:
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     else{
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         controller = B_CS1;
 1154              		.loc 2 200 0
 1155 054e 1623     		movs	r3, #22
 1156 0550 FB18     		adds	r3, r7, r3
 1157 0552 0822     		movs	r2, #8
 1158 0554 1A70     		strb	r2, [r3]
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         x = x - 1;
 1159              		.loc 2 201 0
 1160 0556 FB68     		ldr	r3, [r7, #12]
 1161 0558 013B     		subs	r3, r3, #1
 1162 055a FB60     		str	r3, [r7, #12]
 1163              	.L65:
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1164              		.loc 2 204 0
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
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_PAGE | index, controller);
 1176              		.loc 2 205 0
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
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char temp = graphic_read(controller);
 1190              		.loc 2 207 0
 1191 0590 1423     		movs	r3, #20
 1192 0592 FC18     		adds	r4, r7, r3
 1193 0594 1623     		movs	r3, #22
 1194 0596 FB18     		adds	r3, r7, r3
 1195 0598 1B78     		ldrb	r3, [r3]
 1196 059a 1800     		movs	r0, r3
 1197 059c FFF7FEFF 		bl	graphic_read
 1198 05a0 0300     		movs	r3, r0
 1199 05a2 2370     		strb	r3, [r4]
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1200              		.loc 2 208 0
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
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(set == 1)
 1212              		.loc 2 210 0
 1213 05bc 7B68     		ldr	r3, [r7, #4]
 1214 05be 012B     		cmp	r3, #1
 1215 05c0 0AD1     		bne	.L66
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         {mask = mask | temp;}
 1216              		.loc 2 211 0
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
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     else
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         {mask = mask & temp;}
 1229              		.loc 2 213 0
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
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_data(mask, controller);
 1241              		.loc 2 215 0
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
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 1253              		.loc 2 177 0
 1254 0602 C046     		nop
 1255              	.L51:
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 1256              		.loc 2 218 0
 1257 0604 BD46     		mov	sp, r7
 1258 0606 07B0     		add	sp, sp, #28
 1259              		@ sp needed
 1260 0608 90BD     		pop	{r4, r7, pc}
 1261              		.cfi_endproc
 1262              	.LFE15:
 1264              		.section	.start_section,"ax",%progbits
 1265              		.align	1
 1266              		.global	startup
 1267              		.syntax unified
 1268              		.code	16
 1269              		.thumb_func
 1270              		.fpu softvfp
 1272              	startup:
 1273              	.LFB16:
 1274              		.file 3 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // Port E setup
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_E 0x40021000
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define SIMULATOR
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #include "delay.h"
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #include "graphics.h"
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup ( void )
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
 1275              		.loc 3 25 0
 1276              		.cfi_startproc
 1277              		@ Naked Function: prologue and epilogue provided by programmer.
 1278              		@ args = 0, pretend = 0, frame = 0
 1279              		@ frame_needed = 1, uses_anonymous_args = 0
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** asm volatile(
 1280              		.loc 3 26 0
 1281              		.syntax divided
 1282              	@ 26 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c" 1
 1283 0000 0248     		 LDR R0,=0x2001C000
 1284 0002 8546     	 MOV SP,R0
 1285 0004 FFF7FEFF 	 BL main
 1286 0008 FEE7     	.L1: B .L1
 1287              	
 1288              	@ 0 "" 2
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" MOV SP,R0\n"
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" BL main\n"				/* call main */
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	".L1: B .L1\n"				/* never return */
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	) ;
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 1289              		.loc 3 32 0
 1290              		.thumb
 1291              		.syntax unified
 1292 000a C046     		nop
 1293              		.cfi_endproc
 1294              	.LFE16:
 1296              		.text
 1297              		.align	1
 1298              		.global	init_app
 1299              		.syntax unified
 1300              		.code	16
 1301              		.thumb_func
 1302              		.fpu softvfp
 1304              	init_app:
 1305              	.LFB17:
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void init_app(void){
 1306              		.loc 3 34 0
 1307              		.cfi_startproc
 1308              		@ args = 0, pretend = 0, frame = 0
 1309              		@ frame_needed = 1, uses_anonymous_args = 0
 1310 060a 80B5     		push	{r7, lr}
 1311              		.cfi_def_cfa_offset 8
 1312              		.cfi_offset 7, -8
 1313              		.cfi_offset 14, -4
 1314 060c 00AF     		add	r7, sp, #0
 1315              		.cfi_def_cfa_register 7
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 1316              		.loc 3 35 0
 1317 060e 034B     		ldr	r3, .L71
 1318 0610 034A     		ldr	r2, .L71+4
 1319 0612 1A60     		str	r2, [r3]
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 1320              		.loc 3 37 0
 1321 0614 C046     		nop
 1322 0616 BD46     		mov	sp, r7
 1323              		@ sp needed
 1324 0618 80BD     		pop	{r7, pc}
 1325              	.L72:
 1326 061a C046     		.align	2
 1327              	.L71:
 1328 061c 00100240 		.word	1073876992
 1329 0620 55555555 		.word	1431655765
 1330              		.cfi_endproc
 1331              	.LFE17:
 1333              		.align	1
 1334              		.global	main
 1335              		.syntax unified
 1336              		.code	16
 1337              		.thumb_func
 1338              		.fpu softvfp
 1340              	main:
 1341              	.LFB18:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void main(void)
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
 1342              		.loc 3 40 0
 1343              		.cfi_startproc
 1344              		@ args = 0, pretend = 0, frame = 16
 1345              		@ frame_needed = 1, uses_anonymous_args = 0
 1346 0624 80B5     		push	{r7, lr}
 1347              		.cfi_def_cfa_offset 8
 1348              		.cfi_offset 7, -8
 1349              		.cfi_offset 14, -4
 1350 0626 84B0     		sub	sp, sp, #16
 1351              		.cfi_def_cfa_offset 24
 1352 0628 00AF     		add	r7, sp, #0
 1353              		.cfi_def_cfa_register 7
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     init_app();
 1354              		.loc 3 41 0
 1355 062a FFF7FEFF 		bl	init_app
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_initialize();
 1356              		.loc 3 42 0
 1357 062e FFF7FEFF 		bl	graphic_initialize
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #ifndef SIMULATOR
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_clear_screen();
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #endif
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1358              		.loc 3 47 0
 1359 0632 1821     		movs	r1, #24
 1360 0634 4A20     		movs	r0, #74
 1361 0636 FFF7FEFF 		bl	graphic_write_command
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1362              		.loc 3 48 0
 1363 063a 1821     		movs	r1, #24
 1364 063c B920     		movs	r0, #185
 1365 063e FFF7FEFF 		bl	graphic_write_command
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_data(0xFF, B_CS1 | B_CS2);
 1366              		.loc 3 49 0
 1367 0642 1821     		movs	r1, #24
 1368 0644 FF20     		movs	r0, #255
 1369 0646 FFF7FEFF 		bl	graphic_write_data
 1370              	.LBB4:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     //Rita horisontell linje
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int i=0; i < 128; i++){
 1371              		.loc 3 52 0
 1372 064a 0023     		movs	r3, #0
 1373 064c FB60     		str	r3, [r7, #12]
 1374 064e 08E0     		b	.L74
 1375              	.L75:
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(i, 10, 1);
 1376              		.loc 3 53 0 discriminator 3
 1377 0650 FB68     		ldr	r3, [r7, #12]
 1378 0652 0122     		movs	r2, #1
 1379 0654 0A21     		movs	r1, #10
 1380 0656 1800     		movs	r0, r3
 1381 0658 FFF7FEFF 		bl	pixel
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(i, 10, 1);
 1382              		.loc 3 52 0 discriminator 3
 1383 065c FB68     		ldr	r3, [r7, #12]
 1384 065e 0133     		adds	r3, r3, #1
 1385 0660 FB60     		str	r3, [r7, #12]
 1386              	.L74:
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(i, 10, 1);
 1387              		.loc 3 52 0 is_stmt 0 discriminator 1
 1388 0662 FB68     		ldr	r3, [r7, #12]
 1389 0664 7F2B     		cmp	r3, #127
 1390 0666 F3DD     		ble	.L75
 1391              	.LBE4:
 1392              	.LBB5:
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     //Rita vertikal linje
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int i=0; i < 64; i++){
 1393              		.loc 3 56 0 is_stmt 1
 1394 0668 0023     		movs	r3, #0
 1395 066a BB60     		str	r3, [r7, #8]
 1396 066c 08E0     		b	.L76
 1397              	.L77:
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(10, i, 1);
 1398              		.loc 3 57 0 discriminator 3
 1399 066e BB68     		ldr	r3, [r7, #8]
 1400 0670 0122     		movs	r2, #1
 1401 0672 1900     		movs	r1, r3
 1402 0674 0A20     		movs	r0, #10
 1403 0676 FFF7FEFF 		bl	pixel
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(10, i, 1);
 1404              		.loc 3 56 0 discriminator 3
 1405 067a BB68     		ldr	r3, [r7, #8]
 1406 067c 0133     		adds	r3, r3, #1
 1407 067e BB60     		str	r3, [r7, #8]
 1408              	.L76:
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(10, i, 1);
 1409              		.loc 3 56 0 is_stmt 0 discriminator 1
 1410 0680 BB68     		ldr	r3, [r7, #8]
 1411 0682 3F2B     		cmp	r3, #63
 1412 0684 F3DD     		ble	.L77
 1413              	.LBE5:
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     delay500ns();
 1414              		.loc 3 60 0 is_stmt 1
 1415 0686 FFF7FEFF 		bl	delay500ns
 1416              	.LBB6:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****       //Sudda horisontell linje
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int i=0; i < 128; i++){
 1417              		.loc 3 63 0
 1418 068a 0023     		movs	r3, #0
 1419 068c 7B60     		str	r3, [r7, #4]
 1420 068e 08E0     		b	.L78
 1421              	.L79:
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(i, 10, 0);
 1422              		.loc 3 64 0 discriminator 3
 1423 0690 7B68     		ldr	r3, [r7, #4]
 1424 0692 0022     		movs	r2, #0
 1425 0694 0A21     		movs	r1, #10
 1426 0696 1800     		movs	r0, r3
 1427 0698 FFF7FEFF 		bl	pixel
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(i, 10, 0);
 1428              		.loc 3 63 0 discriminator 3
 1429 069c 7B68     		ldr	r3, [r7, #4]
 1430 069e 0133     		adds	r3, r3, #1
 1431 06a0 7B60     		str	r3, [r7, #4]
 1432              	.L78:
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(i, 10, 0);
 1433              		.loc 3 63 0 is_stmt 0 discriminator 1
 1434 06a2 7B68     		ldr	r3, [r7, #4]
 1435 06a4 7F2B     		cmp	r3, #127
 1436 06a6 F3DD     		ble	.L79
 1437              	.LBE6:
 1438              	.LBB7:
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     //sudda vertikal linje
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int i=0; i < 64; i++){
 1439              		.loc 3 67 0 is_stmt 1
 1440 06a8 0023     		movs	r3, #0
 1441 06aa 3B60     		str	r3, [r7]
 1442 06ac 08E0     		b	.L80
 1443              	.L81:
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(10, i, 0);
 1444              		.loc 3 68 0 discriminator 3
 1445 06ae 3B68     		ldr	r3, [r7]
 1446 06b0 0022     		movs	r2, #0
 1447 06b2 1900     		movs	r1, r3
 1448 06b4 0A20     		movs	r0, #10
 1449 06b6 FFF7FEFF 		bl	pixel
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(10, i, 0);
 1450              		.loc 3 67 0 discriminator 3
 1451 06ba 3B68     		ldr	r3, [r7]
 1452 06bc 0133     		adds	r3, r3, #1
 1453 06be 3B60     		str	r3, [r7]
 1454              	.L80:
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         pixel(10, i, 0);
 1455              		.loc 3 67 0 is_stmt 0 discriminator 1
 1456 06c0 3B68     		ldr	r3, [r7]
 1457 06c2 3F2B     		cmp	r3, #63
 1458 06c4 F3DD     		ble	.L81
 1459              	.LBE7:
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }    
 1460              		.loc 3 71 0 is_stmt 1
 1461 06c6 C046     		nop
 1462 06c8 BD46     		mov	sp, r7
 1463 06ca 04B0     		add	sp, sp, #16
 1464              		@ sp needed
 1465 06cc 80BD     		pop	{r7, pc}
 1466              		.cfi_endproc
 1467              	.LFE18:
 1469              	.Letext0:
