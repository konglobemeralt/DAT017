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
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #include "registers.h"
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI3_IRQVEC ((void (**) (void)) 0x2001C064)
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI2_IRQVEC ((void (**) (void)) 0x2001C060)
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI1_IRQVEC ((void (**) (void)) 0x2001C05C)
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI0_IRQVEC ((void (**) (void)) 0x2001C058)
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define NVIC_ISER0 ((volatile unsigned int *) 0xE000E100)
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define NVIC_EXTI3_IRQ_BPOS (1<<9)
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define NVIC_EXTI2_IRQ_BPOS (1<<8)
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define NVIC_EXTI1_IRQ_BPOS (1<<7)
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define NVIC_EXTI0_IRQ_BPOS (1<<6)
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI3_IRQ_BPOS (1<<3)
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI2_IRQ_BPOS (1<<2)
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI1_IRQ_BPOS (1<<1)
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** #define EXTI0_IRQ_BPOS (1<<0)
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void startup ( void )
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** {
  26              		.loc 1 23 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** __asm volatile(
  31              		.loc 1 24 0
  32              		.syntax divided
  33              	@ 24 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	" MOV SP,R0\n"
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	" BL main\n"				/* call main */
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	"_exit: B .\n"				/* never return */
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	) ;
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** }
  40              		.loc 1 30 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.global	counter
  48              		.bss
  51              	counter:
  52 0000 00       		.space	1
  53              		.text
  54              		.align	1
  55              		.global	interrupt_handler
  56              		.syntax unified
  57              		.code	16
  58              		.thumb_func
  59              		.fpu softvfp
  61              	interrupt_handler:
  62              	.LFB1:
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** volatile unsigned char counter  = 0;
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void interrupt_handler(void) {
  63              		.loc 1 34 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	if(*EXTI_PR & 0x08) {
  73              		.loc 1 35 0
  74 0004 204B     		ldr	r3, .L8
  75 0006 1B68     		ldr	r3, [r3]
  76 0008 0822     		movs	r2, #8
  77 000a 1340     		ands	r3, r2
  78 000c 39D0     		beq	.L7
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		// IRQ0
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		if(*EXTI_PR & 0x01) {
  79              		.loc 1 37 0
  80 000e 1E4B     		ldr	r3, .L8
  81 0010 1B68     		ldr	r3, [r3]
  82 0012 0122     		movs	r2, #1
  83 0014 1340     		ands	r3, r2
  84 0016 0DD0     		beq	.L4
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 			counter++;
  85              		.loc 1 38 0
  86 0018 1C4B     		ldr	r3, .L8+4
  87 001a 1B78     		ldrb	r3, [r3]
  88 001c DBB2     		uxtb	r3, r3
  89 001e 0133     		adds	r3, r3, #1
  90 0020 DAB2     		uxtb	r2, r3
  91 0022 1A4B     		ldr	r3, .L8+4
  92 0024 1A70     		strb	r2, [r3]
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 			*EXTI_PR |= 0x01;
  93              		.loc 1 39 0
  94 0026 184B     		ldr	r3, .L8
  95 0028 174A     		ldr	r2, .L8
  96 002a 1268     		ldr	r2, [r2]
  97 002c 0121     		movs	r1, #1
  98 002e 0A43     		orrs	r2, r1
  99 0030 1A60     		str	r2, [r3]
 100 0032 20E0     		b	.L5
 101              	.L4:
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		}
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		// IRQ1
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		else if(*EXTI_PR & 0x02) {
 102              		.loc 1 42 0
 103 0034 144B     		ldr	r3, .L8
 104 0036 1B68     		ldr	r3, [r3]
 105 0038 0222     		movs	r2, #2
 106 003a 1340     		ands	r3, r2
 107 003c 09D0     		beq	.L6
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 			counter = 0;
 108              		.loc 1 43 0
 109 003e 134B     		ldr	r3, .L8+4
 110 0040 0022     		movs	r2, #0
 111 0042 1A70     		strb	r2, [r3]
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 			*EXTI_PR |= 0x02;
 112              		.loc 1 44 0
 113 0044 104B     		ldr	r3, .L8
 114 0046 104A     		ldr	r2, .L8
 115 0048 1268     		ldr	r2, [r2]
 116 004a 0221     		movs	r1, #2
 117 004c 0A43     		orrs	r2, r1
 118 004e 1A60     		str	r2, [r3]
 119 0050 11E0     		b	.L5
 120              	.L6:
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		}
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		// IRQ2
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		else if(*EXTI_PR & 0x04) {
 121              		.loc 1 47 0
 122 0052 0D4B     		ldr	r3, .L8
 123 0054 1B68     		ldr	r3, [r3]
 124 0056 0422     		movs	r2, #4
 125 0058 1340     		ands	r3, r2
 126 005a 0CD0     		beq	.L5
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 			counter = ~counter;
 127              		.loc 1 48 0
 128 005c 0B4B     		ldr	r3, .L8+4
 129 005e 1B78     		ldrb	r3, [r3]
 130 0060 DBB2     		uxtb	r3, r3
 131 0062 DB43     		mvns	r3, r3
 132 0064 DAB2     		uxtb	r2, r3
 133 0066 094B     		ldr	r3, .L8+4
 134 0068 1A70     		strb	r2, [r3]
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 			*EXTI_PR |= 0x04;
 135              		.loc 1 49 0
 136 006a 074B     		ldr	r3, .L8
 137 006c 064A     		ldr	r2, .L8
 138 006e 1268     		ldr	r2, [r2]
 139 0070 0421     		movs	r1, #4
 140 0072 0A43     		orrs	r2, r1
 141 0074 1A60     		str	r2, [r3]
 142              	.L5:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		}
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		*EXTI_PR |= 0x08;
 143              		.loc 1 51 0
 144 0076 044B     		ldr	r3, .L8
 145 0078 034A     		ldr	r2, .L8
 146 007a 1268     		ldr	r2, [r2]
 147 007c 0821     		movs	r1, #8
 148 007e 0A43     		orrs	r2, r1
 149 0080 1A60     		str	r2, [r3]
 150              	.L7:
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	}
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** }
 151              		.loc 1 54 0
 152 0082 C046     		nop
 153 0084 BD46     		mov	sp, r7
 154              		@ sp needed
 155 0086 80BD     		pop	{r7, pc}
 156              	.L9:
 157              		.align	2
 158              	.L8:
 159 0088 143C0140 		.word	1073822740
 160 008c 00000000 		.word	counter
 161              		.cfi_endproc
 162              	.LFE1:
 164              		.align	1
 165              		.global	IRQ_0
 166              		.syntax unified
 167              		.code	16
 168              		.thumb_func
 169              		.fpu softvfp
 171              	IRQ_0:
 172              	.LFB2:
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void IRQ_0(void) {
 173              		.loc 1 56 0
 174              		.cfi_startproc
 175              		@ args = 0, pretend = 0, frame = 0
 176              		@ frame_needed = 1, uses_anonymous_args = 0
 177 0090 80B5     		push	{r7, lr}
 178              		.cfi_def_cfa_offset 8
 179              		.cfi_offset 7, -8
 180              		.cfi_offset 14, -4
 181 0092 00AF     		add	r7, sp, #0
 182              		.cfi_def_cfa_register 7
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	counter++;
 183              		.loc 1 57 0
 184 0094 074B     		ldr	r3, .L11
 185 0096 1B78     		ldrb	r3, [r3]
 186 0098 DBB2     		uxtb	r3, r3
 187 009a 0133     		adds	r3, r3, #1
 188 009c DAB2     		uxtb	r2, r3
 189 009e 054B     		ldr	r3, .L11
 190 00a0 1A70     		strb	r2, [r3]
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*EXTI_PR |= EXTI0_IRQ_BPOS;
 191              		.loc 1 58 0
 192 00a2 054B     		ldr	r3, .L11+4
 193 00a4 044A     		ldr	r2, .L11+4
 194 00a6 1268     		ldr	r2, [r2]
 195 00a8 0121     		movs	r1, #1
 196 00aa 0A43     		orrs	r2, r1
 197 00ac 1A60     		str	r2, [r3]
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** }
 198              		.loc 1 59 0
 199 00ae C046     		nop
 200 00b0 BD46     		mov	sp, r7
 201              		@ sp needed
 202 00b2 80BD     		pop	{r7, pc}
 203              	.L12:
 204              		.align	2
 205              	.L11:
 206 00b4 00000000 		.word	counter
 207 00b8 143C0140 		.word	1073822740
 208              		.cfi_endproc
 209              	.LFE2:
 211              		.align	1
 212              		.global	IRQ_1
 213              		.syntax unified
 214              		.code	16
 215              		.thumb_func
 216              		.fpu softvfp
 218              	IRQ_1:
 219              	.LFB3:
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void IRQ_1(void) {
 220              		.loc 1 60 0
 221              		.cfi_startproc
 222              		@ args = 0, pretend = 0, frame = 0
 223              		@ frame_needed = 1, uses_anonymous_args = 0
 224 00bc 80B5     		push	{r7, lr}
 225              		.cfi_def_cfa_offset 8
 226              		.cfi_offset 7, -8
 227              		.cfi_offset 14, -4
 228 00be 00AF     		add	r7, sp, #0
 229              		.cfi_def_cfa_register 7
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	counter = 0;
 230              		.loc 1 61 0
 231 00c0 054B     		ldr	r3, .L14
 232 00c2 0022     		movs	r2, #0
 233 00c4 1A70     		strb	r2, [r3]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*EXTI_PR |= EXTI1_IRQ_BPOS;
 234              		.loc 1 62 0
 235 00c6 054B     		ldr	r3, .L14+4
 236 00c8 044A     		ldr	r2, .L14+4
 237 00ca 1268     		ldr	r2, [r2]
 238 00cc 0221     		movs	r1, #2
 239 00ce 0A43     		orrs	r2, r1
 240 00d0 1A60     		str	r2, [r3]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** }
 241              		.loc 1 63 0
 242 00d2 C046     		nop
 243 00d4 BD46     		mov	sp, r7
 244              		@ sp needed
 245 00d6 80BD     		pop	{r7, pc}
 246              	.L15:
 247              		.align	2
 248              	.L14:
 249 00d8 00000000 		.word	counter
 250 00dc 143C0140 		.word	1073822740
 251              		.cfi_endproc
 252              	.LFE3:
 254              		.align	1
 255              		.global	IRQ_2
 256              		.syntax unified
 257              		.code	16
 258              		.thumb_func
 259              		.fpu softvfp
 261              	IRQ_2:
 262              	.LFB4:
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void IRQ_2(void) {
 263              		.loc 1 64 0
 264              		.cfi_startproc
 265              		@ args = 0, pretend = 0, frame = 0
 266              		@ frame_needed = 1, uses_anonymous_args = 0
 267 00e0 80B5     		push	{r7, lr}
 268              		.cfi_def_cfa_offset 8
 269              		.cfi_offset 7, -8
 270              		.cfi_offset 14, -4
 271 00e2 00AF     		add	r7, sp, #0
 272              		.cfi_def_cfa_register 7
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	counter = ~counter;
 273              		.loc 1 65 0
 274 00e4 074B     		ldr	r3, .L17
 275 00e6 1B78     		ldrb	r3, [r3]
 276 00e8 DBB2     		uxtb	r3, r3
 277 00ea DB43     		mvns	r3, r3
 278 00ec DAB2     		uxtb	r2, r3
 279 00ee 054B     		ldr	r3, .L17
 280 00f0 1A70     		strb	r2, [r3]
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*EXTI_PR |= EXTI2_IRQ_BPOS;
 281              		.loc 1 66 0
 282 00f2 054B     		ldr	r3, .L17+4
 283 00f4 044A     		ldr	r2, .L17+4
 284 00f6 1268     		ldr	r2, [r2]
 285 00f8 0421     		movs	r1, #4
 286 00fa 0A43     		orrs	r2, r1
 287 00fc 1A60     		str	r2, [r3]
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** }
 288              		.loc 1 67 0
 289 00fe C046     		nop
 290 0100 BD46     		mov	sp, r7
 291              		@ sp needed
 292 0102 80BD     		pop	{r7, pc}
 293              	.L18:
 294              		.align	2
 295              	.L17:
 296 0104 00000000 		.word	counter
 297 0108 143C0140 		.word	1073822740
 298              		.cfi_endproc
 299              	.LFE4:
 301              		.align	1
 302              		.global	init_app
 303              		.syntax unified
 304              		.code	16
 305              		.thumb_func
 306              		.fpu softvfp
 308              	init_app:
 309              	.LFB5:
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void init_app(void) {
 310              		.loc 1 69 0
 311              		.cfi_startproc
 312              		@ args = 0, pretend = 0, frame = 0
 313              		@ frame_needed = 1, uses_anonymous_args = 0
 314 010c 80B5     		push	{r7, lr}
 315              		.cfi_def_cfa_offset 8
 316              		.cfi_offset 7, -8
 317              		.cfi_offset 14, -4
 318 010e 00AF     		add	r7, sp, #0
 319              		.cfi_def_cfa_register 7
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	// Setup hex display
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*GPIO_D_MODER &= 0xFFFF0000;
 320              		.loc 1 71 0
 321 0110 224B     		ldr	r3, .L20
 322 0112 224A     		ldr	r2, .L20
 323 0114 1268     		ldr	r2, [r2]
 324 0116 120C     		lsrs	r2, r2, #16
 325 0118 1204     		lsls	r2, r2, #16
 326 011a 1A60     		str	r2, [r3]
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*GPIO_D_MODER |= 0x00005555;
 327              		.loc 1 72 0
 328 011c 1F4B     		ldr	r3, .L20
 329 011e 1F4A     		ldr	r2, .L20
 330 0120 1268     		ldr	r2, [r2]
 331 0122 1F49     		ldr	r1, .L20+4
 332 0124 0A43     		orrs	r2, r1
 333 0126 1A60     		str	r2, [r3]
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	// Setup E as input
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*GPIO_E_MODER = 0;
 334              		.loc 1 75 0
 335 0128 1E4B     		ldr	r3, .L20+8
 336 012a 0022     		movs	r2, #0
 337 012c 1A60     		str	r2, [r3]
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	// Setup PE2,PE1,PE0 to EXTICR1
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*SYSCFG_EXTICR1 &= 0xFFFFF000; 
 338              		.loc 1 78 0
 339 012e 1E4B     		ldr	r3, .L20+12
 340 0130 1D4A     		ldr	r2, .L20+12
 341 0132 1268     		ldr	r2, [r2]
 342 0134 120B     		lsrs	r2, r2, #12
 343 0136 1203     		lsls	r2, r2, #12
 344 0138 1A60     		str	r2, [r3]
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*SYSCFG_EXTICR1 |= 0x00000444;
 345              		.loc 1 79 0
 346 013a 1B4B     		ldr	r3, .L20+12
 347 013c 1A4A     		ldr	r2, .L20+12
 348 013e 1268     		ldr	r2, [r2]
 349 0140 1A49     		ldr	r1, .L20+16
 350 0142 0A43     		orrs	r2, r1
 351 0144 1A60     		str	r2, [r3]
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	// Setup EXTI for PE2,PE1,PE0
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*EXTI_IMR |= (EXTI2_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI0_IRQ_BPOS);
 352              		.loc 1 82 0
 353 0146 1A4B     		ldr	r3, .L20+20
 354 0148 194A     		ldr	r2, .L20+20
 355 014a 1268     		ldr	r2, [r2]
 356 014c 0721     		movs	r1, #7
 357 014e 0A43     		orrs	r2, r1
 358 0150 1A60     		str	r2, [r3]
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*EXTI_FTSR |= (EXTI2_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI0_IRQ_BPOS);
 359              		.loc 1 83 0
 360 0152 184B     		ldr	r3, .L20+24
 361 0154 174A     		ldr	r2, .L20+24
 362 0156 1268     		ldr	r2, [r2]
 363 0158 0721     		movs	r1, #7
 364 015a 0A43     		orrs	r2, r1
 365 015c 1A60     		str	r2, [r3]
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	// Setup EXTI2,EXTI1,EXTI0 interrupt function
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*((void (**)(void)) EXTI2_IRQVEC) = IRQ_2;
 366              		.loc 1 86 0
 367 015e 164B     		ldr	r3, .L20+28
 368 0160 164A     		ldr	r2, .L20+32
 369 0162 1A60     		str	r2, [r3]
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*((void (**)(void)) EXTI1_IRQVEC) = IRQ_1;
 370              		.loc 1 87 0
 371 0164 164B     		ldr	r3, .L20+36
 372 0166 174A     		ldr	r2, .L20+40
 373 0168 1A60     		str	r2, [r3]
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*((void (**)(void)) EXTI0_IRQVEC) = IRQ_0;
 374              		.loc 1 88 0
 375 016a 174B     		ldr	r3, .L20+44
 376 016c 174A     		ldr	r2, .L20+48
 377 016e 1A60     		str	r2, [r3]
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	// Enable EXTI2,EXTI1,EXTI0 in NVIC
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI2_IRQ_BPOS;
 378              		.loc 1 91 0
 379 0170 174B     		ldr	r3, .L20+52
 380 0172 174A     		ldr	r2, .L20+52
 381 0174 1268     		ldr	r2, [r2]
 382 0176 8021     		movs	r1, #128
 383 0178 4900     		lsls	r1, r1, #1
 384 017a 0A43     		orrs	r2, r1
 385 017c 1A60     		str	r2, [r3]
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI1_IRQ_BPOS;
 386              		.loc 1 92 0
 387 017e 144B     		ldr	r3, .L20+52
 388 0180 134A     		ldr	r2, .L20+52
 389 0182 1268     		ldr	r2, [r2]
 390 0184 8021     		movs	r1, #128
 391 0186 0A43     		orrs	r2, r1
 392 0188 1A60     		str	r2, [r3]
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI0_IRQ_BPOS;
 393              		.loc 1 93 0
 394 018a 114B     		ldr	r3, .L20+52
 395 018c 104A     		ldr	r2, .L20+52
 396 018e 1268     		ldr	r2, [r2]
 397 0190 4021     		movs	r1, #64
 398 0192 0A43     		orrs	r2, r1
 399 0194 1A60     		str	r2, [r3]
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** }
 400              		.loc 1 94 0
 401 0196 C046     		nop
 402 0198 BD46     		mov	sp, r7
 403              		@ sp needed
 404 019a 80BD     		pop	{r7, pc}
 405              	.L21:
 406              		.align	2
 407              	.L20:
 408 019c 000C0240 		.word	1073875968
 409 01a0 55550000 		.word	21845
 410 01a4 00100240 		.word	1073876992
 411 01a8 08380140 		.word	1073821704
 412 01ac 44040000 		.word	1092
 413 01b0 003C0140 		.word	1073822720
 414 01b4 0C3C0140 		.word	1073822732
 415 01b8 60C00120 		.word	536985696
 416 01bc 00000000 		.word	IRQ_2
 417 01c0 5CC00120 		.word	536985692
 418 01c4 00000000 		.word	IRQ_1
 419 01c8 58C00120 		.word	536985688
 420 01cc 00000000 		.word	IRQ_0
 421 01d0 00E100E0 		.word	-536813312
 422              		.cfi_endproc
 423              	.LFE5:
 425              		.align	1
 426              		.global	main
 427              		.syntax unified
 428              		.code	16
 429              		.thumb_func
 430              		.fpu softvfp
 432              	main:
 433              	.LFB6:
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c ****  
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** void main(void) {
 434              		.loc 1 96 0
 435              		.cfi_startproc
 436              		@ args = 0, pretend = 0, frame = 0
 437              		@ frame_needed = 1, uses_anonymous_args = 0
 438 01d4 80B5     		push	{r7, lr}
 439              		.cfi_def_cfa_offset 8
 440              		.cfi_offset 7, -8
 441              		.cfi_offset 14, -4
 442 01d6 00AF     		add	r7, sp, #0
 443              		.cfi_def_cfa_register 7
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	init_app();
 444              		.loc 1 97 0
 445 01d8 FFF7FEFF 		bl	init_app
 446              	.L23:
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 	while(1) {
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_6/startup.c **** 		*GPIO_D_ODR_LOW = counter;
 447              		.loc 1 99 0 discriminator 1
 448 01dc 024A     		ldr	r2, .L24
 449 01de 034B     		ldr	r3, .L24+4
 450 01e0 1B78     		ldrb	r3, [r3]
 451 01e2 DBB2     		uxtb	r3, r3
 452 01e4 1370     		strb	r3, [r2]
 453 01e6 F9E7     		b	.L23
 454              	.L25:
 455              		.align	2
 456              	.L24:
 457 01e8 140C0240 		.word	1073875988
 458 01ec 00000000 		.word	counter
 459              		.cfi_endproc
 460              	.LFE6:
 462              	.Letext0:
