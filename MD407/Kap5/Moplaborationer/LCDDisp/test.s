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
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 408              		.loc 2 56 0
 409 0174 4020     		movs	r0, #64
 410 0176 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x00005555;
 411              		.loc 2 57 0
 412 017a 154B     		ldr	r3, .L28
 413 017c 154A     		ldr	r2, .L28+4
 414 017e 1A60     		str	r2, [r3]
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 415              		.loc 2 58 0
 416 0180 0120     		movs	r0, #1
 417 0182 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 418              		.loc 2 59 0
 419 0186 0220     		movs	r0, #2
 420 0188 FFF7FEFF 		bl	graphics_ctrl_bit_set
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 421              		.loc 2 60 0
 422 018c FFF7FEFF 		bl	delay500ns
 423              	.L25:
 424              	.LBB2:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     while(1) { // Wait for display not to be busy
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_E);
 425              		.loc 2 63 0
 426 0190 4020     		movs	r0, #64
 427 0192 FFF7FEFF 		bl	graphics_ctrl_bit_set
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         delay500ns();
 428              		.loc 2 64 0
 429 0196 FFF7FEFF 		bl	delay500ns
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_clear(B_E);
 430              		.loc 2 65 0
 431 019a 4020     		movs	r0, #64
 432 019c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         delay500ns();
 433              		.loc 2 66 0
 434 01a0 FFF7FEFF 		bl	delay500ns
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         unsigned char i = *GPIO_IDR_HIGH;
 435              		.loc 2 67 0
 436 01a4 0C4A     		ldr	r2, .L28+8
 437 01a6 FB1D     		adds	r3, r7, #7
 438 01a8 1278     		ldrb	r2, [r2]
 439 01aa 1A70     		strb	r2, [r3]
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
 440              		.loc 2 68 0
 441 01ac 0A4B     		ldr	r3, .L28+8
 442 01ae 1B78     		ldrb	r3, [r3]
 443 01b0 DBB2     		uxtb	r3, r3
 444 01b2 5BB2     		sxtb	r3, r3
 445 01b4 002B     		cmp	r3, #0
 446 01b6 00DA     		bge	.L27
 447              	.LBE2:
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphics_ctrl_bit_set(B_E);
 448              		.loc 2 62 0
 449 01b8 EAE7     		b	.L25
 450              	.L27:
 451              	.LBB3:
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****             break;
 452              		.loc 2 69 0
 453 01ba C046     		nop
 454              	.LBE3:
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 455              		.loc 2 72 0
 456 01bc 4020     		movs	r0, #64
 457 01be FFF7FEFF 		bl	graphics_ctrl_bit_set
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x55555555;
 458              		.loc 2 73 0
 459 01c2 034B     		ldr	r3, .L28
 460 01c4 054A     		ldr	r2, .L28+12
 461 01c6 1A60     		str	r2, [r3]
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 462              		.loc 2 75 0
 463 01c8 C046     		nop
 464 01ca BD46     		mov	sp, r7
 465 01cc 02B0     		add	sp, sp, #8
 466              		@ sp needed
 467 01ce 80BD     		pop	{r7, pc}
 468              	.L29:
 469              		.align	2
 470              	.L28:
 471 01d0 00100240 		.word	1073876992
 472 01d4 55550000 		.word	21845
 473 01d8 11100240 		.word	1073877009
 474 01dc 55555555 		.word	1431655765
 475              		.cfi_endproc
 476              	.LFE7:
 478              		.align	1
 479              		.global	graphic_read
 480              		.syntax unified
 481              		.code	16
 482              		.thumb_func
 483              		.fpu softvfp
 485              	graphic_read:
 486              	.LFB8:
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** uint8_t graphic_read(uint8_t controller){
 487              		.loc 2 77 0
 488              		.cfi_startproc
 489              		@ args = 0, pretend = 0, frame = 16
 490              		@ frame_needed = 1, uses_anonymous_args = 0
 491 01e0 80B5     		push	{r7, lr}
 492              		.cfi_def_cfa_offset 8
 493              		.cfi_offset 7, -8
 494              		.cfi_offset 14, -4
 495 01e2 84B0     		sub	sp, sp, #16
 496              		.cfi_def_cfa_offset 24
 497 01e4 00AF     		add	r7, sp, #0
 498              		.cfi_def_cfa_register 7
 499 01e6 0200     		movs	r2, r0
 500 01e8 FB1D     		adds	r3, r7, #7
 501 01ea 1A70     		strb	r2, [r3]
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 502              		.loc 2 78 0
 503 01ec 4020     		movs	r0, #64
 504 01ee FFF7FEFF 		bl	graphics_ctrl_bit_clear
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x00005555;
 505              		.loc 2 79 0
 506 01f2 1C4B     		ldr	r3, .L34
 507 01f4 1C4A     		ldr	r2, .L34+4
 508 01f6 1A60     		str	r2, [r3]
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 509              		.loc 2 80 0
 510 01f8 0120     		movs	r0, #1
 511 01fa FFF7FEFF 		bl	graphics_ctrl_bit_set
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RW);
 512              		.loc 2 81 0
 513 01fe 0220     		movs	r0, #2
 514 0200 FFF7FEFF 		bl	graphics_ctrl_bit_set
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 515              		.loc 2 82 0
 516 0204 FB1D     		adds	r3, r7, #7
 517 0206 1B78     		ldrb	r3, [r3]
 518 0208 1800     		movs	r0, r3
 519 020a FFF7FEFF 		bl	select_controller
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 520              		.loc 2 83 0
 521 020e FFF7FEFF 		bl	delay500ns
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 522              		.loc 2 84 0
 523 0212 4020     		movs	r0, #64
 524 0214 FFF7FEFF 		bl	graphics_ctrl_bit_set
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 525              		.loc 2 85 0
 526 0218 FFF7FEFF 		bl	delay500ns
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     uint8_t RV = *GPIO_IDR_HIGH;
 527              		.loc 2 86 0
 528 021c 134A     		ldr	r2, .L34+8
 529 021e 0F23     		movs	r3, #15
 530 0220 FB18     		adds	r3, r7, r3
 531 0222 1278     		ldrb	r2, [r2]
 532 0224 1A70     		strb	r2, [r3]
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 533              		.loc 2 87 0
 534 0226 4020     		movs	r0, #64
 535 0228 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_MODER = 0x55555555;
 536              		.loc 2 88 0
 537 022c 0D4B     		ldr	r3, .L34
 538 022e 104A     		ldr	r2, .L34+12
 539 0230 1A60     		str	r2, [r3]
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller == B_CS1){
 540              		.loc 2 89 0
 541 0232 FB1D     		adds	r3, r7, #7
 542 0234 1B78     		ldrb	r3, [r3]
 543 0236 082B     		cmp	r3, #8
 544 0238 04D1     		bne	.L31
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS1);
 545              		.loc 2 90 0
 546 023a 0820     		movs	r0, #8
 547 023c FFF7FEFF 		bl	select_controller
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 548              		.loc 2 91 0
 549 0240 FFF7FEFF 		bl	graphic_wait_ready
 550              	.L31:
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller == B_CS2){
 551              		.loc 2 94 0
 552 0244 FB1D     		adds	r3, r7, #7
 553 0246 1B78     		ldrb	r3, [r3]
 554 0248 102B     		cmp	r3, #16
 555 024a 04D1     		bne	.L32
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS2);
 556              		.loc 2 95 0
 557 024c 1020     		movs	r0, #16
 558 024e FFF7FEFF 		bl	select_controller
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 559              		.loc 2 96 0
 560 0252 FFF7FEFF 		bl	graphic_wait_ready
 561              	.L32:
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     return RV;
 562              		.loc 2 99 0
 563 0256 0F23     		movs	r3, #15
 564 0258 FB18     		adds	r3, r7, r3
 565 025a 1B78     		ldrb	r3, [r3]
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 566              		.loc 2 101 0
 567 025c 1800     		movs	r0, r3
 568 025e BD46     		mov	sp, r7
 569 0260 04B0     		add	sp, sp, #16
 570              		@ sp needed
 571 0262 80BD     		pop	{r7, pc}
 572              	.L35:
 573              		.align	2
 574              	.L34:
 575 0264 00100240 		.word	1073876992
 576 0268 55550000 		.word	21845
 577 026c 11100240 		.word	1073877009
 578 0270 55555555 		.word	1431655765
 579              		.cfi_endproc
 580              	.LFE8:
 582              		.align	1
 583              		.global	graphic_write
 584              		.syntax unified
 585              		.code	16
 586              		.thumb_func
 587              		.fpu softvfp
 589              	graphic_write:
 590              	.LFB9:
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_write(uint8_t value, uint8_t controller){
 591              		.loc 2 103 0
 592              		.cfi_startproc
 593              		@ args = 0, pretend = 0, frame = 8
 594              		@ frame_needed = 1, uses_anonymous_args = 0
 595 0274 80B5     		push	{r7, lr}
 596              		.cfi_def_cfa_offset 8
 597              		.cfi_offset 7, -8
 598              		.cfi_offset 14, -4
 599 0276 82B0     		sub	sp, sp, #8
 600              		.cfi_def_cfa_offset 16
 601 0278 00AF     		add	r7, sp, #0
 602              		.cfi_def_cfa_register 7
 603 027a 0200     		movs	r2, r0
 604 027c FB1D     		adds	r3, r7, #7
 605 027e 1A70     		strb	r2, [r3]
 606 0280 BB1D     		adds	r3, r7, #6
 607 0282 0A1C     		adds	r2, r1, #0
 608 0284 1A70     		strb	r2, [r3]
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_ODR_HIGH = value;
 609              		.loc 2 104 0
 610 0286 1A4A     		ldr	r2, .L39
 611 0288 FB1D     		adds	r3, r7, #7
 612 028a 1B78     		ldrb	r3, [r3]
 613 028c 1370     		strb	r3, [r2]
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 614              		.loc 2 105 0
 615 028e BB1D     		adds	r3, r7, #6
 616 0290 1B78     		ldrb	r3, [r3]
 617 0292 1800     		movs	r0, r3
 618 0294 FFF7FEFF 		bl	select_controller
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 619              		.loc 2 106 0
 620 0298 FFF7FEFF 		bl	delay500ns
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 621              		.loc 2 107 0
 622 029c 4020     		movs	r0, #64
 623 029e FFF7FEFF 		bl	graphics_ctrl_bit_set
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay500ns();
 624              		.loc 2 108 0
 625 02a2 FFF7FEFF 		bl	delay500ns
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 626              		.loc 2 109 0
 627 02a6 4020     		movs	r0, #64
 628 02a8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller & B_CS1){
 629              		.loc 2 111 0
 630 02ac BB1D     		adds	r3, r7, #6
 631 02ae 1B78     		ldrb	r3, [r3]
 632 02b0 0822     		movs	r2, #8
 633 02b2 1340     		ands	r3, r2
 634 02b4 04D0     		beq	.L37
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS1);
 635              		.loc 2 112 0
 636 02b6 0820     		movs	r0, #8
 637 02b8 FFF7FEFF 		bl	select_controller
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 638              		.loc 2 113 0
 639 02bc FFF7FEFF 		bl	graphic_wait_ready
 640              	.L37:
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(controller & B_CS2){
 641              		.loc 2 116 0
 642 02c0 BB1D     		adds	r3, r7, #6
 643 02c2 1B78     		ldrb	r3, [r3]
 644 02c4 1022     		movs	r2, #16
 645 02c6 1340     		ands	r3, r2
 646 02c8 04D0     		beq	.L38
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         select_controller(B_CS2);
 647              		.loc 2 117 0
 648 02ca 1020     		movs	r0, #16
 649 02cc FFF7FEFF 		bl	select_controller
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_wait_ready();
 650              		.loc 2 118 0
 651 02d0 FFF7FEFF 		bl	graphic_wait_ready
 652              	.L38:
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     *GPIO_ODR_HIGH = 0;
 653              		.loc 2 121 0
 654 02d4 064B     		ldr	r3, .L39
 655 02d6 0022     		movs	r2, #0
 656 02d8 1A70     		strb	r2, [r3]
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 657              		.loc 2 122 0
 658 02da 4020     		movs	r0, #64
 659 02dc FFF7FEFF 		bl	graphics_ctrl_bit_set
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(0);
 660              		.loc 2 123 0
 661 02e0 0020     		movs	r0, #0
 662 02e2 FFF7FEFF 		bl	select_controller
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 663              		.loc 2 124 0
 664 02e6 C046     		nop
 665 02e8 BD46     		mov	sp, r7
 666 02ea 02B0     		add	sp, sp, #8
 667              		@ sp needed
 668 02ec 80BD     		pop	{r7, pc}
 669              	.L40:
 670 02ee C046     		.align	2
 671              	.L39:
 672 02f0 15100240 		.word	1073877013
 673              		.cfi_endproc
 674              	.LFE9:
 676              		.align	1
 677              		.global	graphic_write_command
 678              		.syntax unified
 679              		.code	16
 680              		.thumb_func
 681              		.fpu softvfp
 683              	graphic_write_command:
 684              	.LFB10:
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_write_command(uint8_t command, uint8_t controller){
 685              		.loc 2 126 0
 686              		.cfi_startproc
 687              		@ args = 0, pretend = 0, frame = 8
 688              		@ frame_needed = 1, uses_anonymous_args = 0
 689 02f4 80B5     		push	{r7, lr}
 690              		.cfi_def_cfa_offset 8
 691              		.cfi_offset 7, -8
 692              		.cfi_offset 14, -4
 693 02f6 82B0     		sub	sp, sp, #8
 694              		.cfi_def_cfa_offset 16
 695 02f8 00AF     		add	r7, sp, #0
 696              		.cfi_def_cfa_register 7
 697 02fa 0200     		movs	r2, r0
 698 02fc FB1D     		adds	r3, r7, #7
 699 02fe 1A70     		strb	r2, [r3]
 700 0300 BB1D     		adds	r3, r7, #6
 701 0302 0A1C     		adds	r2, r1, #0
 702 0304 1A70     		strb	r2, [r3]
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 703              		.loc 2 127 0
 704 0306 4020     		movs	r0, #64
 705 0308 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 706              		.loc 2 128 0
 707 030c BB1D     		adds	r3, r7, #6
 708 030e 1B78     		ldrb	r3, [r3]
 709 0310 1800     		movs	r0, r3
 710 0312 FFF7FEFF 		bl	select_controller
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RS);
 711              		.loc 2 129 0
 712 0316 0120     		movs	r0, #1
 713 0318 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 714              		.loc 2 130 0
 715 031c 0220     		movs	r0, #2
 716 031e FFF7FEFF 		bl	graphics_ctrl_bit_clear
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write(command, controller);
 717              		.loc 2 131 0
 718 0322 BB1D     		adds	r3, r7, #6
 719 0324 1A78     		ldrb	r2, [r3]
 720 0326 FB1D     		adds	r3, r7, #7
 721 0328 1B78     		ldrb	r3, [r3]
 722 032a 1100     		movs	r1, r2
 723 032c 1800     		movs	r0, r3
 724 032e FFF7FEFF 		bl	graphic_write
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 725              		.loc 2 132 0
 726 0332 C046     		nop
 727 0334 BD46     		mov	sp, r7
 728 0336 02B0     		add	sp, sp, #8
 729              		@ sp needed
 730 0338 80BD     		pop	{r7, pc}
 731              		.cfi_endproc
 732              	.LFE10:
 734              		.align	1
 735              		.global	graphic_write_data
 736              		.syntax unified
 737              		.code	16
 738              		.thumb_func
 739              		.fpu softvfp
 741              	graphic_write_data:
 742              	.LFB11:
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_write_data(uint8_t data, uint8_t controller){
 743              		.loc 2 134 0
 744              		.cfi_startproc
 745              		@ args = 0, pretend = 0, frame = 8
 746              		@ frame_needed = 1, uses_anonymous_args = 0
 747 033a 80B5     		push	{r7, lr}
 748              		.cfi_def_cfa_offset 8
 749              		.cfi_offset 7, -8
 750              		.cfi_offset 14, -4
 751 033c 82B0     		sub	sp, sp, #8
 752              		.cfi_def_cfa_offset 16
 753 033e 00AF     		add	r7, sp, #0
 754              		.cfi_def_cfa_register 7
 755 0340 0200     		movs	r2, r0
 756 0342 FB1D     		adds	r3, r7, #7
 757 0344 1A70     		strb	r2, [r3]
 758 0346 BB1D     		adds	r3, r7, #6
 759 0348 0A1C     		adds	r2, r1, #0
 760 034a 1A70     		strb	r2, [r3]
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 761              		.loc 2 135 0
 762 034c 4020     		movs	r0, #64
 763 034e FFF7FEFF 		bl	graphics_ctrl_bit_clear
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(controller);
 764              		.loc 2 136 0
 765 0352 BB1D     		adds	r3, r7, #6
 766 0354 1B78     		ldrb	r3, [r3]
 767 0356 1800     		movs	r0, r3
 768 0358 FFF7FEFF 		bl	select_controller
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RS);
 769              		.loc 2 137 0
 770 035c 0120     		movs	r0, #1
 771 035e FFF7FEFF 		bl	graphics_ctrl_bit_set
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RW);
 772              		.loc 2 138 0
 773 0362 0220     		movs	r0, #2
 774 0364 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write(data, controller);
 775              		.loc 2 139 0
 776 0368 BB1D     		adds	r3, r7, #6
 777 036a 1A78     		ldrb	r2, [r3]
 778 036c FB1D     		adds	r3, r7, #7
 779 036e 1B78     		ldrb	r3, [r3]
 780 0370 1100     		movs	r1, r2
 781 0372 1800     		movs	r0, r3
 782 0374 FFF7FEFF 		bl	graphic_write
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 783              		.loc 2 140 0
 784 0378 C046     		nop
 785 037a BD46     		mov	sp, r7
 786 037c 02B0     		add	sp, sp, #8
 787              		@ sp needed
 788 037e 80BD     		pop	{r7, pc}
 789              		.cfi_endproc
 790              	.LFE11:
 792              		.align	1
 793              		.global	graphics_read_data
 794              		.syntax unified
 795              		.code	16
 796              		.thumb_func
 797              		.fpu softvfp
 799              	graphics_read_data:
 800              	.LFB12:
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** uint8_t graphics_read_data(uint8_t controller){
 801              		.loc 2 142 0
 802              		.cfi_startproc
 803              		@ args = 0, pretend = 0, frame = 8
 804              		@ frame_needed = 1, uses_anonymous_args = 0
 805 0380 80B5     		push	{r7, lr}
 806              		.cfi_def_cfa_offset 8
 807              		.cfi_offset 7, -8
 808              		.cfi_offset 14, -4
 809 0382 82B0     		sub	sp, sp, #8
 810              		.cfi_def_cfa_offset 16
 811 0384 00AF     		add	r7, sp, #0
 812              		.cfi_def_cfa_register 7
 813 0386 0200     		movs	r2, r0
 814 0388 FB1D     		adds	r3, r7, #7
 815 038a 1A70     		strb	r2, [r3]
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     (void) graphic_read(controller);
 816              		.loc 2 143 0
 817 038c FB1D     		adds	r3, r7, #7
 818 038e 1B78     		ldrb	r3, [r3]
 819 0390 1800     		movs	r0, r3
 820 0392 FFF7FEFF 		bl	graphic_read
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     return graphic_read(controller);
 821              		.loc 2 144 0
 822 0396 FB1D     		adds	r3, r7, #7
 823 0398 1B78     		ldrb	r3, [r3]
 824 039a 1800     		movs	r0, r3
 825 039c FFF7FEFF 		bl	graphic_read
 826 03a0 0300     		movs	r3, r0
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 827              		.loc 2 145 0
 828 03a2 1800     		movs	r0, r3
 829 03a4 BD46     		mov	sp, r7
 830 03a6 02B0     		add	sp, sp, #8
 831              		@ sp needed
 832 03a8 80BD     		pop	{r7, pc}
 833              		.cfi_endproc
 834              	.LFE12:
 836              		.align	1
 837              		.global	graphic_initialize
 838              		.syntax unified
 839              		.code	16
 840              		.thumb_func
 841              		.fpu softvfp
 843              	graphic_initialize:
 844              	.LFB13:
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphic_initialize(void){
 845              		.loc 2 147 0
 846              		.cfi_startproc
 847              		@ args = 0, pretend = 0, frame = 0
 848              		@ frame_needed = 1, uses_anonymous_args = 0
 849 03aa 80B5     		push	{r7, lr}
 850              		.cfi_def_cfa_offset 8
 851              		.cfi_offset 7, -8
 852              		.cfi_offset 14, -4
 853 03ac 00AF     		add	r7, sp, #0
 854              		.cfi_def_cfa_register 7
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_E);
 855              		.loc 2 148 0
 856 03ae 4020     		movs	r0, #64
 857 03b0 FFF7FEFF 		bl	graphics_ctrl_bit_set
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay_micro(10);
 858              		.loc 2 149 0
 859 03b4 0A20     		movs	r0, #10
 860 03b6 FFF7FEFF 		bl	delay_micro
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_CS1);
 861              		.loc 2 150 0
 862 03ba 0820     		movs	r0, #8
 863 03bc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_CS2);
 864              		.loc 2 151 0
 865 03c0 1020     		movs	r0, #16
 866 03c2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_RST);
 867              		.loc 2 152 0
 868 03c6 2020     		movs	r0, #32
 869 03c8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_clear(B_E);
 870              		.loc 2 153 0
 871 03cc 4020     		movs	r0, #64
 872 03ce FFF7FEFF 		bl	graphics_ctrl_bit_clear
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     delay_milli(30);
 873              		.loc 2 154 0
 874 03d2 1E20     		movs	r0, #30
 875 03d4 FFF7FEFF 		bl	delay_milli
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphics_ctrl_bit_set(B_RST);
 876              		.loc 2 155 0
 877 03d8 2020     		movs	r0, #32
 878 03da FFF7FEFF 		bl	graphics_ctrl_bit_set
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 879              		.loc 2 156 0
 880 03de 1821     		movs	r1, #24
 881 03e0 3E20     		movs	r0, #62
 882 03e2 FFF7FEFF 		bl	graphic_write_command
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_ON, B_CS1|B_CS2);
 883              		.loc 2 157 0
 884 03e6 1821     		movs	r1, #24
 885 03e8 3F20     		movs	r0, #63
 886 03ea FFF7FEFF 		bl	graphic_write_command
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 887              		.loc 2 158 0
 888 03ee 1821     		movs	r1, #24
 889 03f0 C020     		movs	r0, #192
 890 03f2 FFF7FEFF 		bl	graphic_write_command
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 891              		.loc 2 159 0
 892 03f6 1821     		movs	r1, #24
 893 03f8 4020     		movs	r0, #64
 894 03fa FFF7FEFF 		bl	graphic_write_command
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 895              		.loc 2 160 0
 896 03fe 1821     		movs	r1, #24
 897 0400 B820     		movs	r0, #184
 898 0402 FFF7FEFF 		bl	graphic_write_command
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     select_controller(0);
 899              		.loc 2 161 0
 900 0406 0020     		movs	r0, #0
 901 0408 FFF7FEFF 		bl	select_controller
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 902              		.loc 2 162 0
 903 040c C046     		nop
 904 040e BD46     		mov	sp, r7
 905              		@ sp needed
 906 0410 80BD     		pop	{r7, pc}
 907              		.cfi_endproc
 908              	.LFE13:
 910              		.align	1
 911              		.global	graphics_clear_screen
 912              		.syntax unified
 913              		.code	16
 914              		.thumb_func
 915              		.fpu softvfp
 917              	graphics_clear_screen:
 918              	.LFB14:
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void graphics_clear_screen(void){
 919              		.loc 2 164 0
 920              		.cfi_startproc
 921              		@ args = 0, pretend = 0, frame = 8
 922              		@ frame_needed = 1, uses_anonymous_args = 0
 923 0412 80B5     		push	{r7, lr}
 924              		.cfi_def_cfa_offset 8
 925              		.cfi_offset 7, -8
 926              		.cfi_offset 14, -4
 927 0414 82B0     		sub	sp, sp, #8
 928              		.cfi_def_cfa_offset 16
 929 0416 00AF     		add	r7, sp, #0
 930              		.cfi_def_cfa_register 7
 931              	.LBB4:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     for(int page = 0; page < PAGE; page++){
 932              		.loc 2 165 0
 933 0418 0023     		movs	r3, #0
 934 041a 7B60     		str	r3, [r7, #4]
 935 041c 1EE0     		b	.L47
 936              	.L50:
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 937              		.loc 2 166 0
 938 041e 7B68     		ldr	r3, [r7, #4]
 939 0420 5BB2     		sxtb	r3, r3
 940 0422 4822     		movs	r2, #72
 941 0424 5242     		rsbs	r2, r2, #0
 942 0426 1343     		orrs	r3, r2
 943 0428 5BB2     		sxtb	r3, r3
 944 042a DBB2     		uxtb	r3, r3
 945 042c 1821     		movs	r1, #24
 946 042e 1800     		movs	r0, r3
 947 0430 FFF7FEFF 		bl	graphic_write_command
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 948              		.loc 2 167 0
 949 0434 1821     		movs	r1, #24
 950 0436 4020     		movs	r0, #64
 951 0438 FFF7FEFF 		bl	graphic_write_command
 952              	.LBB5:
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         for(int add = 0; add < ADD; add++){
 953              		.loc 2 168 0
 954 043c 0023     		movs	r3, #0
 955 043e 3B60     		str	r3, [r7]
 956 0440 06E0     		b	.L48
 957              	.L49:
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****             graphic_write_data(0, B_CS1|B_CS2);
 958              		.loc 2 169 0 discriminator 3
 959 0442 1821     		movs	r1, #24
 960 0444 0020     		movs	r0, #0
 961 0446 FFF7FEFF 		bl	graphic_write_data
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         for(int add = 0; add < ADD; add++){
 962              		.loc 2 168 0 discriminator 3
 963 044a 3B68     		ldr	r3, [r7]
 964 044c 0133     		adds	r3, r3, #1
 965 044e 3B60     		str	r3, [r7]
 966              	.L48:
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         for(int add = 0; add < ADD; add++){
 967              		.loc 2 168 0 is_stmt 0 discriminator 1
 968 0450 3B68     		ldr	r3, [r7]
 969 0452 3E2B     		cmp	r3, #62
 970 0454 F5DD     		ble	.L49
 971              	.LBE5:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 972              		.loc 2 165 0 is_stmt 1 discriminator 2
 973 0456 7B68     		ldr	r3, [r7, #4]
 974 0458 0133     		adds	r3, r3, #1
 975 045a 7B60     		str	r3, [r7, #4]
 976              	.L47:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 977              		.loc 2 165 0 is_stmt 0 discriminator 1
 978 045c 7B68     		ldr	r3, [r7, #4]
 979 045e 072B     		cmp	r3, #7
 980 0460 DDDD     		ble	.L50
 981              	.LBE4:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** }
 982              		.loc 2 173 0 is_stmt 1
 983 0462 C046     		nop
 984 0464 BD46     		mov	sp, r7
 985 0466 02B0     		add	sp, sp, #8
 986              		@ sp needed
 987 0468 80BD     		pop	{r7, pc}
 988              		.cfi_endproc
 989              	.LFE14:
 991              		.align	1
 992              		.global	pixel
 993              		.syntax unified
 994              		.code	16
 995              		.thumb_func
 996              		.fpu softvfp
 998              	pixel:
 999              	.LFB15:
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** 
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h **** void pixel(unsigned x, unsigned y, unsigned set){
 1000              		.loc 2 176 0
 1001              		.cfi_startproc
 1002              		@ args = 0, pretend = 0, frame = 24
 1003              		@ frame_needed = 1, uses_anonymous_args = 0
 1004 046a 90B5     		push	{r4, r7, lr}
 1005              		.cfi_def_cfa_offset 12
 1006              		.cfi_offset 4, -12
 1007              		.cfi_offset 7, -8
 1008              		.cfi_offset 14, -4
 1009 046c 87B0     		sub	sp, sp, #28
 1010              		.cfi_def_cfa_offset 40
 1011 046e 00AF     		add	r7, sp, #0
 1012              		.cfi_def_cfa_register 7
 1013 0470 F860     		str	r0, [r7, #12]
 1014 0472 B960     		str	r1, [r7, #8]
 1015 0474 7A60     		str	r2, [r7, #4]
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if((x < 0 || y < 0) || (x > SCREEN_WIDTH || y > SCREEN_HEIGHT)) return;
 1016              		.loc 2 177 0
 1017 0476 FB68     		ldr	r3, [r7, #12]
 1018 0478 7F2B     		cmp	r3, #127
 1019 047a 00D9     		bls	.LCB797
 1020 047c C0E0     		b	.L68	@long jump
 1021              	.LCB797:
 1022              		.loc 2 177 0 is_stmt 0 discriminator 1
 1023 047e BB68     		ldr	r3, [r7, #8]
 1024 0480 3F2B     		cmp	r3, #63
 1025 0482 00D9     		bls	.LCB800
 1026 0484 BCE0     		b	.L68	@long jump
 1027              	.LCB800:
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char index = (y-1) / PAGE;
 1028              		.loc 2 179 0 is_stmt 1
 1029 0486 BB68     		ldr	r3, [r7, #8]
 1030 0488 013B     		subs	r3, r3, #1
 1031 048a DA08     		lsrs	r2, r3, #3
 1032 048c 1523     		movs	r3, #21
 1033 048e FB18     		adds	r3, r7, r3
 1034 0490 1A70     		strb	r2, [r3]
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char mask;
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 0){mask = 1;}
 1035              		.loc 2 182 0
 1036 0492 1523     		movs	r3, #21
 1037 0494 FB18     		adds	r3, r7, r3
 1038 0496 1B78     		ldrb	r3, [r3]
 1039 0498 002B     		cmp	r3, #0
 1040 049a 03D1     		bne	.L55
 1041              		.loc 2 182 0 is_stmt 0 discriminator 1
 1042 049c 1723     		movs	r3, #23
 1043 049e FB18     		adds	r3, r7, r3
 1044 04a0 0122     		movs	r2, #1
 1045 04a2 1A70     		strb	r2, [r3]
 1046              	.L55:
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 1){mask = 2;}
 1047              		.loc 2 183 0 is_stmt 1
 1048 04a4 1523     		movs	r3, #21
 1049 04a6 FB18     		adds	r3, r7, r3
 1050 04a8 1B78     		ldrb	r3, [r3]
 1051 04aa 012B     		cmp	r3, #1
 1052 04ac 03D1     		bne	.L56
 1053              		.loc 2 183 0 is_stmt 0 discriminator 1
 1054 04ae 1723     		movs	r3, #23
 1055 04b0 FB18     		adds	r3, r7, r3
 1056 04b2 0222     		movs	r2, #2
 1057 04b4 1A70     		strb	r2, [r3]
 1058              	.L56:
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 2){mask = 4;}
 1059              		.loc 2 184 0 is_stmt 1
 1060 04b6 1523     		movs	r3, #21
 1061 04b8 FB18     		adds	r3, r7, r3
 1062 04ba 1B78     		ldrb	r3, [r3]
 1063 04bc 022B     		cmp	r3, #2
 1064 04be 03D1     		bne	.L57
 1065              		.loc 2 184 0 is_stmt 0 discriminator 1
 1066 04c0 1723     		movs	r3, #23
 1067 04c2 FB18     		adds	r3, r7, r3
 1068 04c4 0422     		movs	r2, #4
 1069 04c6 1A70     		strb	r2, [r3]
 1070              	.L57:
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 3){mask = 8;}
 1071              		.loc 2 185 0 is_stmt 1
 1072 04c8 1523     		movs	r3, #21
 1073 04ca FB18     		adds	r3, r7, r3
 1074 04cc 1B78     		ldrb	r3, [r3]
 1075 04ce 032B     		cmp	r3, #3
 1076 04d0 03D1     		bne	.L58
 1077              		.loc 2 185 0 is_stmt 0 discriminator 1
 1078 04d2 1723     		movs	r3, #23
 1079 04d4 FB18     		adds	r3, r7, r3
 1080 04d6 0822     		movs	r2, #8
 1081 04d8 1A70     		strb	r2, [r3]
 1082              	.L58:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 4){mask = 0x10;}
 1083              		.loc 2 186 0 is_stmt 1
 1084 04da 1523     		movs	r3, #21
 1085 04dc FB18     		adds	r3, r7, r3
 1086 04de 1B78     		ldrb	r3, [r3]
 1087 04e0 042B     		cmp	r3, #4
 1088 04e2 03D1     		bne	.L59
 1089              		.loc 2 186 0 is_stmt 0 discriminator 1
 1090 04e4 1723     		movs	r3, #23
 1091 04e6 FB18     		adds	r3, r7, r3
 1092 04e8 1022     		movs	r2, #16
 1093 04ea 1A70     		strb	r2, [r3]
 1094              	.L59:
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 5){mask = 0x20;}
 1095              		.loc 2 187 0 is_stmt 1
 1096 04ec 1523     		movs	r3, #21
 1097 04ee FB18     		adds	r3, r7, r3
 1098 04f0 1B78     		ldrb	r3, [r3]
 1099 04f2 052B     		cmp	r3, #5
 1100 04f4 03D1     		bne	.L60
 1101              		.loc 2 187 0 is_stmt 0 discriminator 1
 1102 04f6 1723     		movs	r3, #23
 1103 04f8 FB18     		adds	r3, r7, r3
 1104 04fa 2022     		movs	r2, #32
 1105 04fc 1A70     		strb	r2, [r3]
 1106              	.L60:
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 6){mask = 0x40;}
 1107              		.loc 2 188 0 is_stmt 1
 1108 04fe 1523     		movs	r3, #21
 1109 0500 FB18     		adds	r3, r7, r3
 1110 0502 1B78     		ldrb	r3, [r3]
 1111 0504 062B     		cmp	r3, #6
 1112 0506 03D1     		bne	.L61
 1113              		.loc 2 188 0 is_stmt 0 discriminator 1
 1114 0508 1723     		movs	r3, #23
 1115 050a FB18     		adds	r3, r7, r3
 1116 050c 4022     		movs	r2, #64
 1117 050e 1A70     		strb	r2, [r3]
 1118              	.L61:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(index == 7){mask = 0x80;}
 1119              		.loc 2 189 0 is_stmt 1
 1120 0510 1523     		movs	r3, #21
 1121 0512 FB18     		adds	r3, r7, r3
 1122 0514 1B78     		ldrb	r3, [r3]
 1123 0516 072B     		cmp	r3, #7
 1124 0518 03D1     		bne	.L62
 1125              		.loc 2 189 0 is_stmt 0 discriminator 1
 1126 051a 1723     		movs	r3, #23
 1127 051c FB18     		adds	r3, r7, r3
 1128 051e 8022     		movs	r2, #128
 1129 0520 1A70     		strb	r2, [r3]
 1130              	.L62:
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(set == 9){mask = ~mask;}
 1131              		.loc 2 191 0 is_stmt 1
 1132 0522 7B68     		ldr	r3, [r7, #4]
 1133 0524 092B     		cmp	r3, #9
 1134 0526 06D1     		bne	.L63
 1135              		.loc 2 191 0 is_stmt 0 discriminator 1
 1136 0528 1723     		movs	r3, #23
 1137 052a FB18     		adds	r3, r7, r3
 1138 052c 1722     		movs	r2, #23
 1139 052e BA18     		adds	r2, r7, r2
 1140 0530 1278     		ldrb	r2, [r2]
 1141 0532 D243     		mvns	r2, r2
 1142 0534 1A70     		strb	r2, [r3]
 1143              	.L63:
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char controller;
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(x > 64){
 1144              		.loc 2 194 0 is_stmt 1
 1145 0536 FB68     		ldr	r3, [r7, #12]
 1146 0538 402B     		cmp	r3, #64
 1147 053a 07D9     		bls	.L64
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         controller = B_CS2;
 1148              		.loc 2 195 0
 1149 053c 1623     		movs	r3, #22
 1150 053e FB18     		adds	r3, r7, r3
 1151 0540 1022     		movs	r2, #16
 1152 0542 1A70     		strb	r2, [r3]
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         x = x - 65;
 1153              		.loc 2 196 0
 1154 0544 FB68     		ldr	r3, [r7, #12]
 1155 0546 413B     		subs	r3, r3, #65
 1156 0548 FB60     		str	r3, [r7, #12]
 1157 054a 06E0     		b	.L65
 1158              	.L64:
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     else{
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         controller = B_CS1;
 1159              		.loc 2 199 0
 1160 054c 1623     		movs	r3, #22
 1161 054e FB18     		adds	r3, r7, r3
 1162 0550 0822     		movs	r2, #8
 1163 0552 1A70     		strb	r2, [r3]
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         x = x - 1;
 1164              		.loc 2 200 0
 1165 0554 FB68     		ldr	r3, [r7, #12]
 1166 0556 013B     		subs	r3, r3, #1
 1167 0558 FB60     		str	r3, [r7, #12]
 1168              	.L65:
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         }
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1169              		.loc 2 203 0
 1170 055a FB68     		ldr	r3, [r7, #12]
 1171 055c DBB2     		uxtb	r3, r3
 1172 055e 4022     		movs	r2, #64
 1173 0560 1343     		orrs	r3, r2
 1174 0562 DAB2     		uxtb	r2, r3
 1175 0564 1623     		movs	r3, #22
 1176 0566 FB18     		adds	r3, r7, r3
 1177 0568 1B78     		ldrb	r3, [r3]
 1178 056a 1900     		movs	r1, r3
 1179 056c 1000     		movs	r0, r2
 1180 056e FFF7FEFF 		bl	graphic_write_command
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_PAGE | index, controller);
 1181              		.loc 2 204 0
 1182 0572 1523     		movs	r3, #21
 1183 0574 FB18     		adds	r3, r7, r3
 1184 0576 1B78     		ldrb	r3, [r3]
 1185 0578 4822     		movs	r2, #72
 1186 057a 5242     		rsbs	r2, r2, #0
 1187 057c 1343     		orrs	r3, r2
 1188 057e DAB2     		uxtb	r2, r3
 1189 0580 1623     		movs	r3, #22
 1190 0582 FB18     		adds	r3, r7, r3
 1191 0584 1B78     		ldrb	r3, [r3]
 1192 0586 1900     		movs	r1, r3
 1193 0588 1000     		movs	r0, r2
 1194 058a FFF7FEFF 		bl	graphic_write_command
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     unsigned char temp = graphic_read(controller);
 1195              		.loc 2 206 0
 1196 058e 1423     		movs	r3, #20
 1197 0590 FC18     		adds	r4, r7, r3
 1198 0592 1623     		movs	r3, #22
 1199 0594 FB18     		adds	r3, r7, r3
 1200 0596 1B78     		ldrb	r3, [r3]
 1201 0598 1800     		movs	r0, r3
 1202 059a FFF7FEFF 		bl	graphic_read
 1203 059e 0300     		movs	r3, r0
 1204 05a0 2370     		strb	r3, [r4]
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_command(LCD_SET_ADD | x, controller);
 1205              		.loc 2 207 0
 1206 05a2 FB68     		ldr	r3, [r7, #12]
 1207 05a4 DBB2     		uxtb	r3, r3
 1208 05a6 4022     		movs	r2, #64
 1209 05a8 1343     		orrs	r3, r2
 1210 05aa DAB2     		uxtb	r2, r3
 1211 05ac 1623     		movs	r3, #22
 1212 05ae FB18     		adds	r3, r7, r3
 1213 05b0 1B78     		ldrb	r3, [r3]
 1214 05b2 1900     		movs	r1, r3
 1215 05b4 1000     		movs	r0, r2
 1216 05b6 FFF7FEFF 		bl	graphic_write_command
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     if(set == 1)
 1217              		.loc 2 209 0
 1218 05ba 7B68     		ldr	r3, [r7, #4]
 1219 05bc 012B     		cmp	r3, #1
 1220 05be 0AD1     		bne	.L66
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         {mask = mask | temp;}
 1221              		.loc 2 210 0
 1222 05c0 1723     		movs	r3, #23
 1223 05c2 FB18     		adds	r3, r7, r3
 1224 05c4 1722     		movs	r2, #23
 1225 05c6 B918     		adds	r1, r7, r2
 1226 05c8 1422     		movs	r2, #20
 1227 05ca BA18     		adds	r2, r7, r2
 1228 05cc 0978     		ldrb	r1, [r1]
 1229 05ce 1278     		ldrb	r2, [r2]
 1230 05d0 0A43     		orrs	r2, r1
 1231 05d2 1A70     		strb	r2, [r3]
 1232 05d4 09E0     		b	.L67
 1233              	.L66:
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     else
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****         {mask = mask & temp;}
 1234              		.loc 2 212 0
 1235 05d6 1723     		movs	r3, #23
 1236 05d8 FB18     		adds	r3, r7, r3
 1237 05da 1722     		movs	r2, #23
 1238 05dc BA18     		adds	r2, r7, r2
 1239 05de 1421     		movs	r1, #20
 1240 05e0 7918     		adds	r1, r7, r1
 1241 05e2 1278     		ldrb	r2, [r2]
 1242 05e4 0978     		ldrb	r1, [r1]
 1243 05e6 0A40     		ands	r2, r1
 1244 05e8 1A70     		strb	r2, [r3]
 1245              	.L67:
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     graphic_write_data(mask, controller);
 1246              		.loc 2 214 0
 1247 05ea 1623     		movs	r3, #22
 1248 05ec FB18     		adds	r3, r7, r3
 1249 05ee 1A78     		ldrb	r2, [r3]
 1250 05f0 1723     		movs	r3, #23
 1251 05f2 FB18     		adds	r3, r7, r3
 1252 05f4 1B78     		ldrb	r3, [r3]
 1253 05f6 1100     		movs	r1, r2
 1254 05f8 1800     		movs	r0, r3
 1255 05fa FFF7FEFF 		bl	graphic_write_data
 1256 05fe 00E0     		b	.L51
 1257              	.L68:
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 1258              		.loc 2 177 0
 1259 0600 C046     		nop
 1260              	.L51:
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/graphics.h ****     }
 1261              		.loc 2 217 0
 1262 0602 BD46     		mov	sp, r7
 1263 0604 07B0     		add	sp, sp, #28
 1264              		@ sp needed
 1265 0606 90BD     		pop	{r4, r7, pc}
 1266              		.cfi_endproc
 1267              	.LFE15:
 1269              		.section	.start_section,"ax",%progbits
 1270              		.align	1
 1271              		.global	startup
 1272              		.syntax unified
 1273              		.code	16
 1274              		.thumb_func
 1275              		.fpu softvfp
 1277              	startup:
 1278              	.LFB16:
 1279              		.file 3 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c"
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
 1280              		.loc 3 25 0
 1281              		.cfi_startproc
 1282              		@ Naked Function: prologue and epilogue provided by programmer.
 1283              		@ args = 0, pretend = 0, frame = 0
 1284              		@ frame_needed = 1, uses_anonymous_args = 0
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** asm volatile(
 1285              		.loc 3 26 0
 1286              		.syntax divided
 1287              	@ 26 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c" 1
 1288 0000 0248     		 LDR R0,=0x2001C000
 1289 0002 8546     	 MOV SP,R0
 1290 0004 FFF7FEFF 	 BL main
 1291 0008 FEE7     	.L1: B .L1
 1292              	
 1293              	@ 0 "" 2
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" MOV SP,R0\n"
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" BL main\n"				/* call main */
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	".L1: B .L1\n"				/* never return */
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	) ;
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 1294              		.loc 3 32 0
 1295              		.thumb
 1296              		.syntax unified
 1297 000a C046     		nop
 1298              		.cfi_endproc
 1299              	.LFE16:
 1301              		.text
 1302              		.align	1
 1303              		.global	init_app
 1304              		.syntax unified
 1305              		.code	16
 1306              		.thumb_func
 1307              		.fpu softvfp
 1309              	init_app:
 1310              	.LFB17:
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void init_app(void){
 1311              		.loc 3 34 0
 1312              		.cfi_startproc
 1313              		@ args = 0, pretend = 0, frame = 0
 1314              		@ frame_needed = 1, uses_anonymous_args = 0
 1315 0608 80B5     		push	{r7, lr}
 1316              		.cfi_def_cfa_offset 8
 1317              		.cfi_offset 7, -8
 1318              		.cfi_offset 14, -4
 1319 060a 00AF     		add	r7, sp, #0
 1320              		.cfi_def_cfa_register 7
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 1321              		.loc 3 35 0
 1322 060c 024B     		ldr	r3, .L71
 1323 060e 034A     		ldr	r2, .L71+4
 1324 0610 1A60     		str	r2, [r3]
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 1325              		.loc 3 37 0
 1326 0612 C046     		nop
 1327 0614 BD46     		mov	sp, r7
 1328              		@ sp needed
 1329 0616 80BD     		pop	{r7, pc}
 1330              	.L72:
 1331              		.align	2
 1332              	.L71:
 1333 0618 00100240 		.word	1073876992
 1334 061c 55555555 		.word	1431655765
 1335              		.cfi_endproc
 1336              	.LFE17:
 1338              		.align	1
 1339              		.global	main
 1340              		.syntax unified
 1341              		.code	16
 1342              		.thumb_func
 1343              		.fpu softvfp
 1345              	main:
 1346              	.LFB18:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void main(void)
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
 1347              		.loc 3 40 0
 1348              		.cfi_startproc
 1349              		@ args = 0, pretend = 0, frame = 0
 1350              		@ frame_needed = 1, uses_anonymous_args = 0
 1351 0620 80B5     		push	{r7, lr}
 1352              		.cfi_def_cfa_offset 8
 1353              		.cfi_offset 7, -8
 1354              		.cfi_offset 14, -4
 1355 0622 00AF     		add	r7, sp, #0
 1356              		.cfi_def_cfa_register 7
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     init_app();
 1357              		.loc 3 41 0
 1358 0624 FFF7FEFF 		bl	init_app
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_initialize();
 1359              		.loc 3 42 0
 1360 0628 FFF7FEFF 		bl	graphic_initialize
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #ifndef SIMULATOR
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_clear_screen();
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #endif
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1361              		.loc 3 47 0
 1362 062c 1821     		movs	r1, #24
 1363 062e 4A20     		movs	r0, #74
 1364 0630 FFF7FEFF 		bl	graphic_write_command
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1365              		.loc 3 48 0
 1366 0634 1821     		movs	r1, #24
 1367 0636 B920     		movs	r0, #185
 1368 0638 FFF7FEFF 		bl	graphic_write_command
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_data(0xFF, B_CS1 | B_CS2);
 1369              		.loc 3 49 0
 1370 063c 1821     		movs	r1, #24
 1371 063e FF20     		movs	r0, #255
 1372 0640 FFF7FEFF 		bl	graphic_write_data
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }    
 1373              		.loc 3 50 0
 1374 0644 C046     		nop
 1375 0646 BD46     		mov	sp, r7
 1376              		@ sp needed
 1377 0648 80BD     		pop	{r7, pc}
 1378              		.cfi_endproc
 1379              	.LFE18:
 1381              	.Letext0:
