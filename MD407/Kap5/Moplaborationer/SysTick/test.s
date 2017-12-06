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
  15              		.global	systick_flag
  16              		.bss
  19              	systick_flag:
  20 0000 00       		.space	1
  21              		.global	delay_count
  24              	delay_count:
  25 0001 00       		.space	1
  26              		.section	.start_section,"ax",%progbits
  27              		.align	1
  28              		.global	startup
  29              		.syntax unified
  30              		.code	16
  31              		.thumb_func
  32              		.fpu softvfp
  34              	startup:
  35              	.LFB0:
  36              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define SIMULATOR
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define STK 0xE000E010
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_E 0x40021000
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #ifdef SIMULATOR
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define DELAY_COUNT 1000
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #else
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #define DELAY_COUNT 1000000
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** #endif
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** volatile char systick_flag = 0;
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** volatile char delay_count = 0;
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void startup ( void )
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** {
  37              		.loc 1 30 0
  38              		.cfi_startproc
  39              		@ Naked Function: prologue and epilogue provided by programmer.
  40              		@ args = 0, pretend = 0, frame = 0
  41              		@ frame_needed = 1, uses_anonymous_args = 0
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** __asm volatile(
  42              		.loc 1 31 0
  43              		.syntax divided
  44              	@ 31 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c" 1
  45 0000 0248     		 LDR R0,=0x2001C000
  46 0002 8546     	 MOV SP,R0
  47 0004 FFF7FEFF 	 BL main
  48 0008 FEE7     	_exit: B .
  49              	
  50              	@ 0 "" 2
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" MOV SP,R0\n"
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	" BL main\n"				/* call main */
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	"_exit: B .\n"				/* never return */
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	) ;
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
  51              		.loc 1 37 0
  52              		.thumb
  53              		.syntax unified
  54 000a C046     		nop
  55              		.cfi_endproc
  56              	.LFE0:
  58              		.text
  59              		.align	1
  60              		.global	systick_irq_handler
  61              		.syntax unified
  62              		.code	16
  63              		.thumb_func
  64              		.fpu softvfp
  66              	systick_irq_handler:
  67              	.LFB1:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void systick_irq_handler(void) {
  68              		.loc 1 39 0
  69              		.cfi_startproc
  70              		@ args = 0, pretend = 0, frame = 0
  71              		@ frame_needed = 1, uses_anonymous_args = 0
  72 0000 80B5     		push	{r7, lr}
  73              		.cfi_def_cfa_offset 8
  74              		.cfi_offset 7, -8
  75              		.cfi_offset 14, -4
  76 0002 00AF     		add	r7, sp, #0
  77              		.cfi_def_cfa_register 7
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	if(delay_count-- == 0) {
  78              		.loc 1 40 0
  79 0004 084B     		ldr	r3, .L6
  80 0006 1B78     		ldrb	r3, [r3]
  81 0008 DBB2     		uxtb	r3, r3
  82 000a 5A1E     		subs	r2, r3, #1
  83 000c D1B2     		uxtb	r1, r2
  84 000e 064A     		ldr	r2, .L6
  85 0010 1170     		strb	r1, [r2]
  86 0012 002B     		cmp	r3, #0
  87 0014 03D1     		bne	.L3
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 		systick_flag = 1;
  88              		.loc 1 41 0
  89 0016 054B     		ldr	r3, .L6+4
  90 0018 0122     		movs	r2, #1
  91 001a 1A70     		strb	r2, [r3]
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	} else {
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 		delay_1micro();
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	}
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
  92              		.loc 1 45 0
  93 001c 01E0     		b	.L5
  94              	.L3:
  95              	.LBB2:
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	}
  96              		.loc 1 43 0
  97 001e FFF7FEFF 		bl	delay_1micro
  98              	.L5:
  99              	.LBE2:
 100              		.loc 1 45 0
 101 0022 C046     		nop
 102 0024 BD46     		mov	sp, r7
 103              		@ sp needed
 104 0026 80BD     		pop	{r7, pc}
 105              	.L7:
 106              		.align	2
 107              	.L6:
 108 0028 00000000 		.word	delay_count
 109 002c 00000000 		.word	systick_flag
 110              		.cfi_endproc
 111              	.LFE1:
 113              		.align	1
 114              		.global	init_app
 115              		.syntax unified
 116              		.code	16
 117              		.thumb_func
 118              		.fpu softvfp
 120              	init_app:
 121              	.LFB2:
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void init_app(void) {
 122              		.loc 1 47 0
 123              		.cfi_startproc
 124              		@ args = 0, pretend = 0, frame = 0
 125              		@ frame_needed = 1, uses_anonymous_args = 0
 126 0030 80B5     		push	{r7, lr}
 127              		.cfi_def_cfa_offset 8
 128              		.cfi_offset 7, -8
 129              		.cfi_offset 14, -4
 130 0032 00AF     		add	r7, sp, #0
 131              		.cfi_def_cfa_register 7
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*GPIO_MODER &= 0xFFFF0000;
 132              		.loc 1 48 0
 133 0034 084B     		ldr	r3, .L9
 134 0036 084A     		ldr	r2, .L9
 135 0038 1268     		ldr	r2, [r2]
 136 003a 120C     		lsrs	r2, r2, #16
 137 003c 1204     		lsls	r2, r2, #16
 138 003e 1A60     		str	r2, [r3]
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*GPIO_MODER |= 0x00005555;
 139              		.loc 1 49 0
 140 0040 054B     		ldr	r3, .L9
 141 0042 054A     		ldr	r2, .L9
 142 0044 1268     		ldr	r2, [r2]
 143 0046 0549     		ldr	r1, .L9+4
 144 0048 0A43     		orrs	r2, r1
 145 004a 1A60     		str	r2, [r3]
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*((void(**)(void)) 0x2001C03C ) = systick_irq_handler;
 146              		.loc 1 50 0
 147 004c 044B     		ldr	r3, .L9+8
 148 004e 054A     		ldr	r2, .L9+12
 149 0050 1A60     		str	r2, [r3]
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
 150              		.loc 1 51 0
 151 0052 C046     		nop
 152 0054 BD46     		mov	sp, r7
 153              		@ sp needed
 154 0056 80BD     		pop	{r7, pc}
 155              	.L10:
 156              		.align	2
 157              	.L9:
 158 0058 00100240 		.word	1073876992
 159 005c 55550000 		.word	21845
 160 0060 3CC00120 		.word	536985660
 161 0064 00000000 		.word	systick_irq_handler
 162              		.cfi_endproc
 163              	.LFE2:
 165              		.align	1
 166              		.global	delay_1micro
 167              		.syntax unified
 168              		.code	16
 169              		.thumb_func
 170              		.fpu softvfp
 172              	delay_1micro:
 173              	.LFB3:
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void delay_1micro() {
 174              		.loc 1 53 0
 175              		.cfi_startproc
 176              		@ args = 0, pretend = 0, frame = 0
 177              		@ frame_needed = 1, uses_anonymous_args = 0
 178 0068 80B5     		push	{r7, lr}
 179              		.cfi_def_cfa_offset 8
 180              		.cfi_offset 7, -8
 181              		.cfi_offset 14, -4
 182 006a 00AF     		add	r7, sp, #0
 183              		.cfi_def_cfa_register 7
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	systick_flag = 0;
 184              		.loc 1 54 0
 185 006c 084B     		ldr	r3, .L12
 186 006e 0022     		movs	r2, #0
 187 0070 1A70     		strb	r2, [r3]
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*STK_CTRL = 0;
 188              		.loc 1 55 0
 189 0072 084B     		ldr	r3, .L12+4
 190 0074 0022     		movs	r2, #0
 191 0076 1A60     		str	r2, [r3]
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*STK_LOAD = 192; //  48 * 4. 48 is 250ns
 192              		.loc 1 56 0
 193 0078 074B     		ldr	r3, .L12+8
 194 007a C022     		movs	r2, #192
 195 007c 1A60     		str	r2, [r3]
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*STK_VAL = 0;
 196              		.loc 1 57 0
 197 007e 074B     		ldr	r3, .L12+12
 198 0080 0022     		movs	r2, #0
 199 0082 1A60     		str	r2, [r3]
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*STK_CTRL = 7; // Enable interrupts by setting bit 1 to 1.
 200              		.loc 1 58 0
 201 0084 034B     		ldr	r3, .L12+4
 202 0086 0722     		movs	r2, #7
 203 0088 1A60     		str	r2, [r3]
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
 204              		.loc 1 59 0
 205 008a C046     		nop
 206 008c BD46     		mov	sp, r7
 207              		@ sp needed
 208 008e 80BD     		pop	{r7, pc}
 209              	.L13:
 210              		.align	2
 211              	.L12:
 212 0090 00000000 		.word	systick_flag
 213 0094 10E000E0 		.word	-536813552
 214 0098 14E000E0 		.word	-536813548
 215 009c 18E000E0 		.word	-536813544
 216              		.cfi_endproc
 217              	.LFE3:
 219              		.align	1
 220              		.global	delay
 221              		.syntax unified
 222              		.code	16
 223              		.thumb_func
 224              		.fpu softvfp
 226              	delay:
 227              	.LFB4:
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void delay(unsigned int count) {
 228              		.loc 1 61 0
 229              		.cfi_startproc
 230              		@ args = 0, pretend = 0, frame = 8
 231              		@ frame_needed = 1, uses_anonymous_args = 0
 232 00a0 80B5     		push	{r7, lr}
 233              		.cfi_def_cfa_offset 8
 234              		.cfi_offset 7, -8
 235              		.cfi_offset 14, -4
 236 00a2 82B0     		sub	sp, sp, #8
 237              		.cfi_def_cfa_offset 16
 238 00a4 00AF     		add	r7, sp, #0
 239              		.cfi_def_cfa_register 7
 240 00a6 7860     		str	r0, [r7, #4]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	systick_flag = 0;
 241              		.loc 1 62 0
 242 00a8 064B     		ldr	r3, .L15
 243 00aa 0022     		movs	r2, #0
 244 00ac 1A70     		strb	r2, [r3]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	delay_count = count;
 245              		.loc 1 63 0
 246 00ae 7B68     		ldr	r3, [r7, #4]
 247 00b0 DAB2     		uxtb	r2, r3
 248 00b2 054B     		ldr	r3, .L15+4
 249 00b4 1A70     		strb	r2, [r3]
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	delay_1micro();
 250              		.loc 1 64 0
 251 00b6 FFF7FEFF 		bl	delay_1micro
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //	*STK_CTRL = 0;
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //	*STK_LOAD = 192*count; //  48 * 4. 48 is 250ns
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //	*STK_VAL = 0;
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //	*STK_CTRL = 7; 
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	// Enable interrupts by setting bit 1 to 1.
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //	for(int i = 0; i < count; i++) {
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //		delay_1micro();
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //		while(!systick_flag) {
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //			//Wait
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //		}
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** //	}
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
 252              		.loc 1 77 0
 253 00ba C046     		nop
 254 00bc BD46     		mov	sp, r7
 255 00be 02B0     		add	sp, sp, #8
 256              		@ sp needed
 257 00c0 80BD     		pop	{r7, pc}
 258              	.L16:
 259 00c2 C046     		.align	2
 260              	.L15:
 261 00c4 00000000 		.word	systick_flag
 262 00c8 00000000 		.word	delay_count
 263              		.cfi_endproc
 264              	.LFE4:
 266              		.align	1
 267              		.global	main
 268              		.syntax unified
 269              		.code	16
 270              		.thumb_func
 271              		.fpu softvfp
 273              	main:
 274              	.LFB5:
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** void main(void) {
 275              		.loc 1 79 0
 276              		.cfi_startproc
 277              		@ args = 0, pretend = 0, frame = 0
 278              		@ frame_needed = 1, uses_anonymous_args = 0
 279 00cc 80B5     		push	{r7, lr}
 280              		.cfi_def_cfa_offset 8
 281              		.cfi_offset 7, -8
 282              		.cfi_offset 14, -4
 283 00ce 00AF     		add	r7, sp, #0
 284              		.cfi_def_cfa_register 7
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	init_app();
 285              		.loc 1 80 0
 286 00d0 FFF7FEFF 		bl	init_app
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*GPIO_ODR_LOW = 0;
 287              		.loc 1 81 0
 288 00d4 0B4B     		ldr	r3, .L23
 289 00d6 0022     		movs	r2, #0
 290 00d8 1A70     		strb	r2, [r3]
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	delay(DELAY_COUNT);
 291              		.loc 1 82 0
 292 00da FA23     		movs	r3, #250
 293 00dc 9B00     		lsls	r3, r3, #2
 294 00de 1800     		movs	r0, r3
 295 00e0 FFF7FEFF 		bl	delay
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*GPIO_ODR_LOW = 0xFF;
 296              		.loc 1 83 0
 297 00e4 074B     		ldr	r3, .L23
 298 00e6 FF22     		movs	r2, #255
 299 00e8 1A70     		strb	r2, [r3]
 300              	.L20:
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	while(1) {
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 		if(systick_flag) {
 301              		.loc 1 85 0
 302 00ea 074B     		ldr	r3, .L23+4
 303 00ec 1B78     		ldrb	r3, [r3]
 304 00ee DBB2     		uxtb	r3, r3
 305 00f0 002B     		cmp	r3, #0
 306 00f2 00D1     		bne	.L22
 307 00f4 F9E7     		b	.L20
 308              	.L22:
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 			break;
 309              		.loc 1 86 0
 310 00f6 C046     		nop
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 		}
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	}
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** 	*GPIO_ODR_LOW = 0;
 311              		.loc 1 89 0
 312 00f8 024B     		ldr	r3, .L23
 313 00fa 0022     		movs	r2, #0
 314 00fc 1A70     		strb	r2, [r3]
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/SysTick/startup.c **** }
 315              		.loc 1 90 0
 316 00fe C046     		nop
 317 0100 BD46     		mov	sp, r7
 318              		@ sp needed
 319 0102 80BD     		pop	{r7, pc}
 320              	.L24:
 321              		.align	2
 322              	.L23:
 323 0104 14100240 		.word	1073877012
 324 0108 00000000 		.word	systick_flag
 325              		.cfi_endproc
 326              	.LFE5:
 328              	.Letext0:
