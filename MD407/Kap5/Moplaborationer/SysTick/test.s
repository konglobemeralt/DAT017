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
  15              		.bss
  16              	systick_flag:
  17 0000 00       		.space	1
  19 0001 000000   		.align	2
  20              	delay_counter:
  21 0004 00000000 		.space	4
  23              		.text
  24              		.align	1
  25              		.global	delay_250ns
  26              		.syntax unified
  27              		.code	16
  28              		.thumb_func
  29              		.fpu softvfp
  31              	delay_250ns:
  32              	.LFB0:
  33              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****  * 	delay.h
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** // Timer setup
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #ifndef TIMER_H
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #define TIMER_H
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #define STK 0xE000E010
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #define STK_CTRL ((volatile unsigned int *) (STK))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** //Start adress
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #define SYS_TICK_ADDRESS 0xE000E010
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** //nextlevl struct 
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** typedef struct {
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	unsigned char 		    CTRL;
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	const unsigned char 	RES_CTRL1;
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	unsigned char 		    CTRL_COUNT;
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	const unsigned char 	RES_CTRL2;	
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	unsigned int  		    LOAD;
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	unsigned int  		    VAL;
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** } systick;
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** typedef volatile systick* SysTickPtr;
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** #define SYS_TICK (*((SysTickPtr) SYS_TICK_ADDRESS))
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** static unsigned char systick_flag;
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** static volatile unsigned int delay_counter;
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** void delay_250ns(void) {
  34              		.loc 1 34 0
  35              		.cfi_startproc
  36              		@ args = 0, pretend = 0, frame = 0
  37              		@ frame_needed = 1, uses_anonymous_args = 0
  38 0000 80B5     		push	{r7, lr}
  39              		.cfi_def_cfa_offset 8
  40              		.cfi_offset 7, -8
  41              		.cfi_offset 14, -4
  42 0002 00AF     		add	r7, sp, #0
  43              		.cfi_def_cfa_register 7
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	*STK_CTRL = 0;
  44              		.loc 1 35 0
  45 0004 0C4B     		ldr	r3, .L3
  46 0006 0022     		movs	r2, #0
  47 0008 1A60     		str	r2, [r3]
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  48              		.loc 1 36 0
  49 000a 0C4B     		ldr	r3, .L3+4
  50 000c 3122     		movs	r2, #49
  51 000e 1A60     		str	r2, [r3]
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	*STK_VAL = 0;
  52              		.loc 1 37 0
  53 0010 0B4B     		ldr	r3, .L3+8
  54 0012 0022     		movs	r2, #0
  55 0014 1A60     		str	r2, [r3]
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	*STK_CTRL = 5;
  56              		.loc 1 38 0
  57 0016 084B     		ldr	r3, .L3
  58 0018 0522     		movs	r2, #5
  59 001a 1A60     		str	r2, [r3]
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	while((*STK_CTRL & 0x10000) == 0) {
  60              		.loc 1 39 0
  61 001c C046     		nop
  62              	.L2:
  63              		.loc 1 39 0 is_stmt 0 discriminator 1
  64 001e 064B     		ldr	r3, .L3
  65 0020 1A68     		ldr	r2, [r3]
  66 0022 8023     		movs	r3, #128
  67 0024 5B02     		lsls	r3, r3, #9
  68 0026 1340     		ands	r3, r2
  69 0028 F9D0     		beq	.L2
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		// ??????
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	}
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	*STK_CTRL = 0;
  70              		.loc 1 42 0 is_stmt 1
  71 002a 034B     		ldr	r3, .L3
  72 002c 0022     		movs	r2, #0
  73 002e 1A60     		str	r2, [r3]
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** }
  74              		.loc 1 43 0
  75 0030 C046     		nop
  76 0032 BD46     		mov	sp, r7
  77              		@ sp needed
  78 0034 80BD     		pop	{r7, pc}
  79              	.L4:
  80 0036 C046     		.align	2
  81              	.L3:
  82 0038 10E000E0 		.word	-536813552
  83 003c 14E000E0 		.word	-536813548
  84 0040 18E000E0 		.word	-536813544
  85              		.cfi_endproc
  86              	.LFE0:
  88              		.align	1
  89              		.global	delay500ns
  90              		.syntax unified
  91              		.code	16
  92              		.thumb_func
  93              		.fpu softvfp
  95              	delay500ns:
  96              	.LFB1:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** void delay500ns(){
  97              		.loc 1 45 0
  98              		.cfi_startproc
  99              		@ args = 0, pretend = 0, frame = 0
 100              		@ frame_needed = 1, uses_anonymous_args = 0
 101 0044 80B5     		push	{r7, lr}
 102              		.cfi_def_cfa_offset 8
 103              		.cfi_offset 7, -8
 104              		.cfi_offset 14, -4
 105 0046 00AF     		add	r7, sp, #0
 106              		.cfi_def_cfa_register 7
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****     //Delay 500ns in the most efficient way:
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****         delay_250ns();
 107              		.loc 1 47 0
 108 0048 FFF7FEFF 		bl	delay_250ns
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****         delay_250ns();
 109              		.loc 1 48 0
 110 004c FFF7FEFF 		bl	delay_250ns
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****         //Continue executing code efficently/.
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h ****         }
 111              		.loc 1 50 0
 112 0050 C046     		nop
 113 0052 BD46     		mov	sp, r7
 114              		@ sp needed
 115 0054 80BD     		pop	{r7, pc}
 116              		.cfi_endproc
 117              	.LFE1:
 119              		.align	1
 120              		.global	delay_micro
 121              		.syntax unified
 122              		.code	16
 123              		.thumb_func
 124              		.fpu softvfp
 126              	delay_micro:
 127              	.LFB2:
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** void delay_micro(unsigned int us) {
 128              		.loc 1 52 0
 129              		.cfi_startproc
 130              		@ args = 0, pretend = 0, frame = 8
 131              		@ frame_needed = 1, uses_anonymous_args = 0
 132 0056 80B5     		push	{r7, lr}
 133              		.cfi_def_cfa_offset 8
 134              		.cfi_offset 7, -8
 135              		.cfi_offset 14, -4
 136 0058 82B0     		sub	sp, sp, #8
 137              		.cfi_def_cfa_offset 16
 138 005a 00AF     		add	r7, sp, #0
 139              		.cfi_def_cfa_register 7
 140 005c 7860     		str	r0, [r7, #4]
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	while(us--) {
 141              		.loc 1 53 0
 142 005e 07E0     		b	.L7
 143              	.L8:
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		delay_250ns();
 144              		.loc 1 54 0
 145 0060 FFF7FEFF 		bl	delay_250ns
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		delay_250ns();
 146              		.loc 1 55 0
 147 0064 FFF7FEFF 		bl	delay_250ns
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		delay_250ns();
 148              		.loc 1 56 0
 149 0068 FFF7FEFF 		bl	delay_250ns
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		delay_250ns();
 150              		.loc 1 57 0
 151 006c FFF7FEFF 		bl	delay_250ns
 152              	.L7:
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		delay_250ns();
 153              		.loc 1 53 0
 154 0070 7B68     		ldr	r3, [r7, #4]
 155 0072 5A1E     		subs	r2, r3, #1
 156 0074 7A60     		str	r2, [r7, #4]
 157 0076 002B     		cmp	r3, #0
 158 0078 F2D1     		bne	.L8
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	}
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** }
 159              		.loc 1 59 0
 160 007a C046     		nop
 161 007c BD46     		mov	sp, r7
 162 007e 02B0     		add	sp, sp, #8
 163              		@ sp needed
 164 0080 80BD     		pop	{r7, pc}
 165              		.cfi_endproc
 166              	.LFE2:
 168              		.align	1
 169              		.global	delay_milli
 170              		.syntax unified
 171              		.code	16
 172              		.thumb_func
 173              		.fpu softvfp
 175              	delay_milli:
 176              	.LFB3:
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** void delay_milli(unsigned int ms) {
 177              		.loc 1 61 0
 178              		.cfi_startproc
 179              		@ args = 0, pretend = 0, frame = 8
 180              		@ frame_needed = 1, uses_anonymous_args = 0
 181 0082 80B5     		push	{r7, lr}
 182              		.cfi_def_cfa_offset 8
 183              		.cfi_offset 7, -8
 184              		.cfi_offset 14, -4
 185 0084 82B0     		sub	sp, sp, #8
 186              		.cfi_def_cfa_offset 16
 187 0086 00AF     		add	r7, sp, #0
 188              		.cfi_def_cfa_register 7
 189 0088 7860     		str	r0, [r7, #4]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	#ifdef SIMULATOR
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		delay_micro(ms);
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	#else
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 		delay_micro(1000 * ms);
 190              		.loc 1 65 0
 191 008a 7B68     		ldr	r3, [r7, #4]
 192 008c FA22     		movs	r2, #250
 193 008e 9200     		lsls	r2, r2, #2
 194 0090 5343     		muls	r3, r2
 195 0092 1800     		movs	r0, r3
 196 0094 FFF7FEFF 		bl	delay_micro
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	#endif
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** }
 197              		.loc 1 67 0
 198 0098 C046     		nop
 199 009a BD46     		mov	sp, r7
 200 009c 02B0     		add	sp, sp, #8
 201              		@ sp needed
 202 009e 80BD     		pop	{r7, pc}
 203              		.cfi_endproc
 204              	.LFE3:
 206              		.align	1
 207              		.global	delay_1micro
 208              		.syntax unified
 209              		.code	16
 210              		.thumb_func
 211              		.fpu softvfp
 213              	delay_1micro:
 214              	.LFB4:
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** void delay_1micro(void)
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** {
 215              		.loc 1 70 0
 216              		.cfi_startproc
 217              		@ args = 0, pretend = 0, frame = 0
 218              		@ frame_needed = 1, uses_anonymous_args = 0
 219 00a0 80B5     		push	{r7, lr}
 220              		.cfi_def_cfa_offset 8
 221              		.cfi_offset 7, -8
 222              		.cfi_offset 14, -4
 223 00a2 00AF     		add	r7, sp, #0
 224              		.cfi_def_cfa_register 7
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	SYS_TICK.CTRL = 0;
 225              		.loc 1 71 0
 226 00a4 084B     		ldr	r3, .L11
 227 00a6 0022     		movs	r2, #0
 228 00a8 1A70     		strb	r2, [r3]
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	SYS_TICK.CTRL_COUNT = 0;
 229              		.loc 1 72 0
 230 00aa 074B     		ldr	r3, .L11
 231 00ac 0022     		movs	r2, #0
 232 00ae 9A70     		strb	r2, [r3, #2]
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	SYS_TICK.VAL = 0;
 233              		.loc 1 73 0
 234 00b0 054B     		ldr	r3, .L11
 235 00b2 0022     		movs	r2, #0
 236 00b4 9A60     		str	r2, [r3, #8]
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	SYS_TICK.LOAD = 167;
 237              		.loc 1 74 0
 238 00b6 044B     		ldr	r3, .L11
 239 00b8 A722     		movs	r2, #167
 240 00ba 5A60     		str	r2, [r3, #4]
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	SYS_TICK.CTRL = 0x07;
 241              		.loc 1 75 0
 242 00bc 024B     		ldr	r3, .L11
 243 00be 0722     		movs	r2, #7
 244 00c0 1A70     		strb	r2, [r3]
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** }
 245              		.loc 1 76 0
 246 00c2 C046     		nop
 247 00c4 BD46     		mov	sp, r7
 248              		@ sp needed
 249 00c6 80BD     		pop	{r7, pc}
 250              	.L12:
 251              		.align	2
 252              	.L11:
 253 00c8 10E000E0 		.word	-536813552
 254              		.cfi_endproc
 255              	.LFE4:
 257              		.align	1
 258              		.global	delay
 259              		.syntax unified
 260              		.code	16
 261              		.thumb_func
 262              		.fpu softvfp
 264              	delay:
 265              	.LFB5:
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** void delay(unsigned int counter)
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** {
 266              		.loc 1 79 0
 267              		.cfi_startproc
 268              		@ args = 0, pretend = 0, frame = 8
 269              		@ frame_needed = 1, uses_anonymous_args = 0
 270 00cc 80B5     		push	{r7, lr}
 271              		.cfi_def_cfa_offset 8
 272              		.cfi_offset 7, -8
 273              		.cfi_offset 14, -4
 274 00ce 82B0     		sub	sp, sp, #8
 275              		.cfi_def_cfa_offset 16
 276 00d0 00AF     		add	r7, sp, #0
 277              		.cfi_def_cfa_register 7
 278 00d2 7860     		str	r0, [r7, #4]
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	delay_counter = counter;
 279              		.loc 1 80 0
 280 00d4 054B     		ldr	r3, .L14
 281 00d6 7A68     		ldr	r2, [r7, #4]
 282 00d8 1A60     		str	r2, [r3]
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	systick_flag = 0;
 283              		.loc 1 81 0
 284 00da 054B     		ldr	r3, .L14+4
 285 00dc 0022     		movs	r2, #0
 286 00de 1A70     		strb	r2, [r3]
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** 	delay_1micro();
 287              		.loc 1 82 0
 288 00e0 FFF7FEFF 		bl	delay_1micro
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/delay.h **** }
 289              		.loc 1 83 0
 290 00e4 C046     		nop
 291 00e6 BD46     		mov	sp, r7
 292 00e8 02B0     		add	sp, sp, #8
 293              		@ sp needed
 294 00ea 80BD     		pop	{r7, pc}
 295              	.L15:
 296              		.align	2
 297              	.L14:
 298 00ec 04000000 		.word	delay_counter
 299 00f0 00000000 		.word	systick_flag
 300              		.cfi_endproc
 301              	.LFE5:
 303              		.section	.start_section,"ax",%progbits
 304              		.align	1
 305              		.global	startup
 306              		.syntax unified
 307              		.code	16
 308              		.thumb_func
 309              		.fpu softvfp
 311              	startup:
 312              	.LFB6:
 313              		.file 2 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c"
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
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****   
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** extern unsigned char systick_flag; 
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void startup ( void )
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** {
 314              		.loc 2 41 0
 315              		.cfi_startproc
 316              		@ Naked Function: prologue and epilogue provided by programmer.
 317              		@ args = 0, pretend = 0, frame = 0
 318              		@ frame_needed = 1, uses_anonymous_args = 0
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** asm volatile(
 319              		.loc 2 42 0
 320              		.syntax divided
 321              	@ 42 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c" 1
 322 0000 0248     		 LDR R0,=0x2001C000
 323 0002 8546     	 MOV SP,R0
 324 0004 FFF7FEFF 	 BL main
 325 0008 FEE7     	.L1: B .L1
 326              	
 327              	@ 0 "" 2
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" MOV SP,R0\n"
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" BL main\n"				/* call main */
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	".L1: B .L1\n"				/* never return */
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	) ;
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
 328              		.loc 2 48 0
 329              		.thumb
 330              		.syntax unified
 331 000a C046     		nop
 332              		.cfi_endproc
 333              	.LFE6:
 335              		.text
 336              		.align	1
 337              		.global	systick_irq_handler
 338              		.syntax unified
 339              		.code	16
 340              		.thumb_func
 341              		.fpu softvfp
 343              	systick_irq_handler:
 344              	.LFB7:
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void systick_irq_handler(){
 345              		.loc 2 50 0
 346              		.cfi_startproc
 347              		@ args = 0, pretend = 0, frame = 0
 348              		@ frame_needed = 1, uses_anonymous_args = 0
 349 00f4 80B5     		push	{r7, lr}
 350              		.cfi_def_cfa_offset 8
 351              		.cfi_offset 7, -8
 352              		.cfi_offset 14, -4
 353 00f6 00AF     		add	r7, sp, #0
 354              		.cfi_def_cfa_register 7
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     //deaktivera flaggan
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     systick_flag = 1;
 355              		.loc 2 52 0
 356 00f8 024B     		ldr	r3, .L18
 357 00fa 0122     		movs	r2, #1
 358 00fc 1A70     		strb	r2, [r3]
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     }
 359              		.loc 2 53 0
 360 00fe C046     		nop
 361 0100 BD46     		mov	sp, r7
 362              		@ sp needed
 363 0102 80BD     		pop	{r7, pc}
 364              	.L19:
 365              		.align	2
 366              	.L18:
 367 0104 00000000 		.word	systick_flag
 368              		.cfi_endproc
 369              	.LFE7:
 371              		.align	1
 372              		.global	init_app
 373              		.syntax unified
 374              		.code	16
 375              		.thumb_func
 376              		.fpu softvfp
 378              	init_app:
 379              	.LFB8:
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void init_app(){
 380              		.loc 2 56 0
 381              		.cfi_startproc
 382              		@ args = 0, pretend = 0, frame = 0
 383              		@ frame_needed = 1, uses_anonymous_args = 0
 384 0108 80B5     		push	{r7, lr}
 385              		.cfi_def_cfa_offset 8
 386              		.cfi_offset 7, -8
 387              		.cfi_offset 14, -4
 388 010a 00AF     		add	r7, sp, #0
 389              		.cfi_def_cfa_register 7
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_MODER = 0x55555555;
 390              		.loc 2 57 0
 391 010c 044B     		ldr	r3, .L21
 392 010e 054A     		ldr	r2, .L21+4
 393 0110 1A60     		str	r2, [r3]
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *((void (**) (void)) 0x2001C03C ) = systick_irq_handler;
 394              		.loc 2 58 0
 395 0112 054B     		ldr	r3, .L21+8
 396 0114 054A     		ldr	r2, .L21+12
 397 0116 1A60     		str	r2, [r3]
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     }
 398              		.loc 2 59 0
 399 0118 C046     		nop
 400 011a BD46     		mov	sp, r7
 401              		@ sp needed
 402 011c 80BD     		pop	{r7, pc}
 403              	.L22:
 404 011e C046     		.align	2
 405              	.L21:
 406 0120 000C0240 		.word	1073875968
 407 0124 55555555 		.word	1431655765
 408 0128 3CC00120 		.word	536985660
 409 012c 00000000 		.word	systick_irq_handler
 410              		.cfi_endproc
 411              	.LFE8:
 413              		.align	1
 414              		.global	main
 415              		.syntax unified
 416              		.code	16
 417              		.thumb_func
 418              		.fpu softvfp
 420              	main:
 421              	.LFB9:
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void main(void)
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** {
 422              		.loc 2 62 0
 423              		.cfi_startproc
 424              		@ args = 0, pretend = 0, frame = 0
 425              		@ frame_needed = 1, uses_anonymous_args = 0
 426 0130 80B5     		push	{r7, lr}
 427              		.cfi_def_cfa_offset 8
 428              		.cfi_offset 7, -8
 429              		.cfi_offset 14, -4
 430 0132 00AF     		add	r7, sp, #0
 431              		.cfi_def_cfa_register 7
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     init_app();
 432              		.loc 2 63 0
 433 0134 FFF7FEFF 		bl	init_app
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_ODR_LOW = 0;
 434              		.loc 2 64 0
 435 0138 0A4B     		ldr	r3, .L29
 436 013a 0022     		movs	r2, #0
 437 013c 1A70     		strb	r2, [r3]
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     delay( DELAY_COUNT );
 438              		.loc 2 65 0
 439 013e 0A4B     		ldr	r3, .L29+4
 440 0140 1800     		movs	r0, r3
 441 0142 FFF7FEFF 		bl	delay
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_ODR_LOW = 0xFF;
 442              		.loc 2 66 0
 443 0146 074B     		ldr	r3, .L29
 444 0148 FF22     		movs	r2, #255
 445 014a 1A70     		strb	r2, [r3]
 446              	.L26:
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     while(1){
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****         if ( systick_flag ) 
 447              		.loc 2 69 0
 448 014c 074B     		ldr	r3, .L29+8
 449 014e 1B78     		ldrb	r3, [r3]
 450 0150 002B     		cmp	r3, #0
 451 0152 00D1     		bne	.L28
 452 0154 FAE7     		b	.L26
 453              	.L28:
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****             break;
 454              		.loc 2 70 0
 455 0156 C046     		nop
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****             //kod som utfors under vantetiden
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****         }
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     //Kod som vantar p[ timeout
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c ****     *GPIOD_ODR_LOW = 0;
 456              		.loc 2 74 0
 457 0158 024B     		ldr	r3, .L29
 458 015a 0022     		movs	r2, #0
 459 015c 1A70     		strb	r2, [r3]
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
 460              		.loc 2 75 0
 461 015e C046     		nop
 462 0160 BD46     		mov	sp, r7
 463              		@ sp needed
 464 0162 80BD     		pop	{r7, pc}
 465              	.L30:
 466              		.align	2
 467              	.L29:
 468 0164 140C0240 		.word	1073875988
 469 0168 40420F00 		.word	1000000
 470 016c 00000000 		.word	systick_flag
 471              		.cfi_endproc
 472              	.LFE9:
 474              	.Letext0:
