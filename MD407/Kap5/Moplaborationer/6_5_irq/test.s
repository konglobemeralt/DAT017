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
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** #include "registers.h"
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** void startup ( void )
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** {
  26              		.loc 1 7 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** __asm volatile(
  31              		.loc 1 8 0
  32              		.syntax divided
  33              	@ 8 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	" MOV SP,R0\n"
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	" BL main\n"				/* call main */
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	"_exit: B .\n"				/* never return */
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	) ;
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** }
  40              		.loc 1 14 0
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
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** volatile unsigned char counter  = 0;
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** void interrupt_handler(void) {
  63              		.loc 1 18 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	if(*EXTI_PR & 0x08) {
  73              		.loc 1 19 0
  74 0004 204B     		ldr	r3, .L8
  75 0006 1B68     		ldr	r3, [r3]
  76 0008 0822     		movs	r2, #8
  77 000a 1340     		ands	r3, r2
  78 000c 39D0     		beq	.L7
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		// IRQ0
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		if(*EXTI_PR & 0x01) {
  79              		.loc 1 21 0
  80 000e 1E4B     		ldr	r3, .L8
  81 0010 1B68     		ldr	r3, [r3]
  82 0012 0122     		movs	r2, #1
  83 0014 1340     		ands	r3, r2
  84 0016 0DD0     		beq	.L4
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 			counter++;
  85              		.loc 1 22 0
  86 0018 1C4B     		ldr	r3, .L8+4
  87 001a 1B78     		ldrb	r3, [r3]
  88 001c DBB2     		uxtb	r3, r3
  89 001e 0133     		adds	r3, r3, #1
  90 0020 DAB2     		uxtb	r2, r3
  91 0022 1A4B     		ldr	r3, .L8+4
  92 0024 1A70     		strb	r2, [r3]
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 			*EXTI_PR |= 0x01;
  93              		.loc 1 23 0
  94 0026 184B     		ldr	r3, .L8
  95 0028 174A     		ldr	r2, .L8
  96 002a 1268     		ldr	r2, [r2]
  97 002c 0121     		movs	r1, #1
  98 002e 0A43     		orrs	r2, r1
  99 0030 1A60     		str	r2, [r3]
 100 0032 20E0     		b	.L5
 101              	.L4:
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		}
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		// IRQ1
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		else if(*EXTI_PR & 0x02) {
 102              		.loc 1 26 0
 103 0034 144B     		ldr	r3, .L8
 104 0036 1B68     		ldr	r3, [r3]
 105 0038 0222     		movs	r2, #2
 106 003a 1340     		ands	r3, r2
 107 003c 09D0     		beq	.L6
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 			counter = 0;
 108              		.loc 1 27 0
 109 003e 134B     		ldr	r3, .L8+4
 110 0040 0022     		movs	r2, #0
 111 0042 1A70     		strb	r2, [r3]
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 			*EXTI_PR |= 0x02;
 112              		.loc 1 28 0
 113 0044 104B     		ldr	r3, .L8
 114 0046 104A     		ldr	r2, .L8
 115 0048 1268     		ldr	r2, [r2]
 116 004a 0221     		movs	r1, #2
 117 004c 0A43     		orrs	r2, r1
 118 004e 1A60     		str	r2, [r3]
 119 0050 11E0     		b	.L5
 120              	.L6:
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		}
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		// IRQ2
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		else if(*EXTI_PR & 0x04) {
 121              		.loc 1 31 0
 122 0052 0D4B     		ldr	r3, .L8
 123 0054 1B68     		ldr	r3, [r3]
 124 0056 0422     		movs	r2, #4
 125 0058 1340     		ands	r3, r2
 126 005a 0CD0     		beq	.L5
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 			counter = ~counter;
 127              		.loc 1 32 0
 128 005c 0B4B     		ldr	r3, .L8+4
 129 005e 1B78     		ldrb	r3, [r3]
 130 0060 DBB2     		uxtb	r3, r3
 131 0062 DB43     		mvns	r3, r3
 132 0064 DAB2     		uxtb	r2, r3
 133 0066 094B     		ldr	r3, .L8+4
 134 0068 1A70     		strb	r2, [r3]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 			*EXTI_PR |= 0x04;
 135              		.loc 1 33 0
 136 006a 074B     		ldr	r3, .L8
 137 006c 064A     		ldr	r2, .L8
 138 006e 1268     		ldr	r2, [r2]
 139 0070 0421     		movs	r1, #4
 140 0072 0A43     		orrs	r2, r1
 141 0074 1A60     		str	r2, [r3]
 142              	.L5:
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		}
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		*EXTI_PR |= 0x08;
 143              		.loc 1 35 0
 144 0076 044B     		ldr	r3, .L8
 145 0078 034A     		ldr	r2, .L8
 146 007a 1268     		ldr	r2, [r2]
 147 007c 0821     		movs	r1, #8
 148 007e 0A43     		orrs	r2, r1
 149 0080 1A60     		str	r2, [r3]
 150              	.L7:
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	}
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** }
 151              		.loc 1 38 0
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
 165              		.global	init_app
 166              		.syntax unified
 167              		.code	16
 168              		.thumb_func
 169              		.fpu softvfp
 171              	init_app:
 172              	.LFB2:
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** void init_app(void) {
 173              		.loc 1 40 0
 174              		.cfi_startproc
 175              		@ args = 0, pretend = 0, frame = 0
 176              		@ frame_needed = 1, uses_anonymous_args = 0
 177 0090 80B5     		push	{r7, lr}
 178              		.cfi_def_cfa_offset 8
 179              		.cfi_offset 7, -8
 180              		.cfi_offset 14, -4
 181 0092 00AF     		add	r7, sp, #0
 182              		.cfi_def_cfa_register 7
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	// Setup hex display
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*GPIO_D_MODER &= 0xFFFF0000;
 183              		.loc 1 42 0
 184 0094 194B     		ldr	r3, .L11
 185 0096 194A     		ldr	r2, .L11
 186 0098 1268     		ldr	r2, [r2]
 187 009a 120C     		lsrs	r2, r2, #16
 188 009c 1204     		lsls	r2, r2, #16
 189 009e 1A60     		str	r2, [r3]
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*GPIO_D_MODER |= 0x00005555;
 190              		.loc 1 43 0
 191 00a0 164B     		ldr	r3, .L11
 192 00a2 164A     		ldr	r2, .L11
 193 00a4 1268     		ldr	r2, [r2]
 194 00a6 1649     		ldr	r1, .L11+4
 195 00a8 0A43     		orrs	r2, r1
 196 00aa 1A60     		str	r2, [r3]
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	// Setup E as input
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*GPIO_E_MODER = 0;
 197              		.loc 1 46 0
 198 00ac 154B     		ldr	r3, .L11+8
 199 00ae 0022     		movs	r2, #0
 200 00b0 1A60     		str	r2, [r3]
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	// Setup PE3,PE2,PE1,PE0 to EXTICR1
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*SYSCFG_EXTICR1 &= 0xFFFF0000; 
 201              		.loc 1 49 0
 202 00b2 154B     		ldr	r3, .L11+12
 203 00b4 144A     		ldr	r2, .L11+12
 204 00b6 1268     		ldr	r2, [r2]
 205 00b8 120C     		lsrs	r2, r2, #16
 206 00ba 1204     		lsls	r2, r2, #16
 207 00bc 1A60     		str	r2, [r3]
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*SYSCFG_EXTICR1 |= 0x00004444;
 208              		.loc 1 50 0
 209 00be 124B     		ldr	r3, .L11+12
 210 00c0 114A     		ldr	r2, .L11+12
 211 00c2 1268     		ldr	r2, [r2]
 212 00c4 1149     		ldr	r1, .L11+16
 213 00c6 0A43     		orrs	r2, r1
 214 00c8 1A60     		str	r2, [r3]
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	// Setup EXTI for P3,PE2,PE1,PE0
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*EXTI_IMR |= 0x0F;
 215              		.loc 1 53 0
 216 00ca 114B     		ldr	r3, .L11+20
 217 00cc 104A     		ldr	r2, .L11+20
 218 00ce 1268     		ldr	r2, [r2]
 219 00d0 0F21     		movs	r1, #15
 220 00d2 0A43     		orrs	r2, r1
 221 00d4 1A60     		str	r2, [r3]
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*EXTI_FTSR |= 0x0F;
 222              		.loc 1 54 0
 223 00d6 0F4B     		ldr	r3, .L11+24
 224 00d8 0E4A     		ldr	r2, .L11+24
 225 00da 1268     		ldr	r2, [r2]
 226 00dc 0F21     		movs	r1, #15
 227 00de 0A43     		orrs	r2, r1
 228 00e0 1A60     		str	r2, [r3]
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	// Setup EXTI2,EXTI1,EXTI0 interrupt function
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*((void (**)(void)) 0x2001C064) = interrupt_handler;
 229              		.loc 1 57 0
 230 00e2 0D4B     		ldr	r3, .L11+28
 231 00e4 0D4A     		ldr	r2, .L11+32
 232 00e6 1A60     		str	r2, [r3]
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	// Enable EXT13,EXTI2,EXTI1,EXTI0 in NVIC
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	*((unsigned int *) 0xE000E100) |= ( (1<<9) | (1<<8) | (1<<7) | (1<<6) );
 233              		.loc 1 60 0
 234 00e8 0D4B     		ldr	r3, .L11+36
 235 00ea 0D4A     		ldr	r2, .L11+36
 236 00ec 1268     		ldr	r2, [r2]
 237 00ee F021     		movs	r1, #240
 238 00f0 8900     		lsls	r1, r1, #2
 239 00f2 0A43     		orrs	r2, r1
 240 00f4 1A60     		str	r2, [r3]
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** }
 241              		.loc 1 61 0
 242 00f6 C046     		nop
 243 00f8 BD46     		mov	sp, r7
 244              		@ sp needed
 245 00fa 80BD     		pop	{r7, pc}
 246              	.L12:
 247              		.align	2
 248              	.L11:
 249 00fc 000C0240 		.word	1073875968
 250 0100 55550000 		.word	21845
 251 0104 00100240 		.word	1073876992
 252 0108 08380140 		.word	1073821704
 253 010c 44440000 		.word	17476
 254 0110 003C0140 		.word	1073822720
 255 0114 0C3C0140 		.word	1073822732
 256 0118 64C00120 		.word	536985700
 257 011c 00000000 		.word	interrupt_handler
 258 0120 00E100E0 		.word	-536813312
 259              		.cfi_endproc
 260              	.LFE2:
 262              		.align	1
 263              		.global	main
 264              		.syntax unified
 265              		.code	16
 266              		.thumb_func
 267              		.fpu softvfp
 269              	main:
 270              	.LFB3:
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c ****  
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** void main(void) {
 271              		.loc 1 63 0
 272              		.cfi_startproc
 273              		@ args = 0, pretend = 0, frame = 0
 274              		@ frame_needed = 1, uses_anonymous_args = 0
 275 0124 80B5     		push	{r7, lr}
 276              		.cfi_def_cfa_offset 8
 277              		.cfi_offset 7, -8
 278              		.cfi_offset 14, -4
 279 0126 00AF     		add	r7, sp, #0
 280              		.cfi_def_cfa_register 7
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	init_app();
 281              		.loc 1 64 0
 282 0128 FFF7FEFF 		bl	init_app
 283              	.L14:
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 	while(1) {
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_5_irq/startup.c **** 		*GPIO_D_ODR_LOW = counter;
 284              		.loc 1 66 0 discriminator 1
 285 012c 024A     		ldr	r2, .L15
 286 012e 034B     		ldr	r3, .L15+4
 287 0130 1B78     		ldrb	r3, [r3]
 288 0132 DBB2     		uxtb	r3, r3
 289 0134 1370     		strb	r3, [r2]
 290 0136 F9E7     		b	.L14
 291              	.L16:
 292              		.align	2
 293              	.L15:
 294 0138 140C0240 		.word	1073875988
 295 013c 00000000 		.word	counter
 296              		.cfi_endproc
 297              	.LFE3:
 299              	.Letext0:
