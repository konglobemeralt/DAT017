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
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** // Timer setup
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define STK 0xE000E010
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** // Port E setup
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_E 0x40021000
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** // AciiiDisplay values
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define B_E 6
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define B_SELECT 2
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define B_RW 1
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** #define B_RS 0
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void startup ( void )
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** {
  26              		.loc 1 27 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** __asm volatile(
  31              		.loc 1 28 0
  32              		.syntax divided
  33              	@ 28 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	" MOV SP,R0\n"
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	" BL main\n"				/* call main */
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	"_exit: B .\n"				/* never return */
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	) ;
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
  40              		.loc 1 34 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	init_app
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_app:
  56              	.LFB1:
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void init_app(void) {
  57              		.loc 1 37 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	// Setup output pins for asciidisplay
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER = 0x55555555;
  67              		.loc 1 39 0
  68 0004 0A4B     		ldr	r3, .L3
  69 0006 0B4A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_OTYPER = 0x7777;
  71              		.loc 1 41 0
  72 000a 0B4B     		ldr	r3, .L3+8
  73 000c 0B4A     		ldr	r2, .L3+12
  74 000e 1A80     		strh	r2, [r3]
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_PUPDR = 0xAAAAAAAA;
  75              		.loc 1 43 0
  76 0010 0B4B     		ldr	r3, .L3+16
  77 0012 0C4A     		ldr	r2, .L3+20
  78 0014 1A60     		str	r2, [r3]
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_ODR_HIGH = 0;
  79              		.loc 1 45 0
  80 0016 0C4B     		ldr	r3, .L3+24
  81 0018 0022     		movs	r2, #0
  82 001a 1A70     		strb	r2, [r3]
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_ODR_LOW = 0;
  83              		.loc 1 46 0
  84 001c 0B4B     		ldr	r3, .L3+28
  85 001e 0022     		movs	r2, #0
  86 0020 1A70     		strb	r2, [r3]
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_IDR_HIGH = 0;
  87              		.loc 1 47 0
  88 0022 0B4B     		ldr	r3, .L3+32
  89 0024 0022     		movs	r2, #0
  90 0026 1A70     		strb	r2, [r3]
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
  91              		.loc 1 49 0
  92 0028 C046     		nop
  93 002a BD46     		mov	sp, r7
  94              		@ sp needed
  95 002c 80BD     		pop	{r7, pc}
  96              	.L4:
  97 002e C046     		.align	2
  98              	.L3:
  99 0030 00100240 		.word	1073876992
 100 0034 55555555 		.word	1431655765
 101 0038 04100240 		.word	1073876996
 102 003c 77770000 		.word	30583
 103 0040 0C100240 		.word	1073877004
 104 0044 AAAAAAAA 		.word	-1431655766
 105 0048 15100240 		.word	1073877013
 106 004c 14100240 		.word	1073877012
 107 0050 11100240 		.word	1073877009
 108              		.cfi_endproc
 109              	.LFE1:
 111              		.align	1
 112              		.global	delay_250ns
 113              		.syntax unified
 114              		.code	16
 115              		.thumb_func
 116              		.fpu softvfp
 118              	delay_250ns:
 119              	.LFB2:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void delay_250ns(void) {
 120              		.loc 1 51 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0054 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0056 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_CTRL = 0;
 130              		.loc 1 52 0
 131 0058 0C4B     		ldr	r3, .L7
 132 005a 0022     		movs	r2, #0
 133 005c 1A60     		str	r2, [r3]
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 134              		.loc 1 53 0
 135 005e 0C4B     		ldr	r3, .L7+4
 136 0060 3122     		movs	r2, #49
 137 0062 1A60     		str	r2, [r3]
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_VAL = 0;
 138              		.loc 1 54 0
 139 0064 0B4B     		ldr	r3, .L7+8
 140 0066 0022     		movs	r2, #0
 141 0068 1A60     		str	r2, [r3]
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_CTRL = 5;
 142              		.loc 1 55 0
 143 006a 084B     		ldr	r3, .L7
 144 006c 0522     		movs	r2, #5
 145 006e 1A60     		str	r2, [r3]
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 146              		.loc 1 56 0
 147 0070 C046     		nop
 148              	.L6:
 149              		.loc 1 56 0 is_stmt 0 discriminator 1
 150 0072 064B     		ldr	r3, .L7
 151 0074 1A68     		ldr	r2, [r3]
 152 0076 8023     		movs	r3, #128
 153 0078 5B02     		lsls	r3, r3, #9
 154 007a 1340     		ands	r3, r2
 155 007c F9D0     		beq	.L6
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		// ??????
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_CTRL = 0;
 156              		.loc 1 59 0 is_stmt 1
 157 007e 034B     		ldr	r3, .L7
 158 0080 0022     		movs	r2, #0
 159 0082 1A60     		str	r2, [r3]
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 160              		.loc 1 60 0
 161 0084 C046     		nop
 162 0086 BD46     		mov	sp, r7
 163              		@ sp needed
 164 0088 80BD     		pop	{r7, pc}
 165              	.L8:
 166 008a C046     		.align	2
 167              	.L7:
 168 008c 10E000E0 		.word	-536813552
 169 0090 14E000E0 		.word	-536813548
 170 0094 18E000E0 		.word	-536813544
 171              		.cfi_endproc
 172              	.LFE2:
 174              		.align	1
 175              		.global	delay_mikro
 176              		.syntax unified
 177              		.code	16
 178              		.thumb_func
 179              		.fpu softvfp
 181              	delay_mikro:
 182              	.LFB3:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void delay_mikro(unsigned int us) {
 183              		.loc 1 62 0
 184              		.cfi_startproc
 185              		@ args = 0, pretend = 0, frame = 8
 186              		@ frame_needed = 1, uses_anonymous_args = 0
 187 0098 80B5     		push	{r7, lr}
 188              		.cfi_def_cfa_offset 8
 189              		.cfi_offset 7, -8
 190              		.cfi_offset 14, -4
 191 009a 82B0     		sub	sp, sp, #8
 192              		.cfi_def_cfa_offset 16
 193 009c 00AF     		add	r7, sp, #0
 194              		.cfi_def_cfa_register 7
 195 009e 7860     		str	r0, [r7, #4]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(us--) {
 196              		.loc 1 63 0
 197 00a0 07E0     		b	.L10
 198              	.L11:
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 199              		.loc 1 64 0
 200 00a2 FFF7FEFF 		bl	delay_250ns
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 201              		.loc 1 65 0
 202 00a6 FFF7FEFF 		bl	delay_250ns
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 203              		.loc 1 66 0
 204 00aa FFF7FEFF 		bl	delay_250ns
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 205              		.loc 1 67 0
 206 00ae FFF7FEFF 		bl	delay_250ns
 207              	.L10:
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 208              		.loc 1 63 0
 209 00b2 7B68     		ldr	r3, [r7, #4]
 210 00b4 5A1E     		subs	r2, r3, #1
 211 00b6 7A60     		str	r2, [r7, #4]
 212 00b8 002B     		cmp	r3, #0
 213 00ba F2D1     		bne	.L11
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 214              		.loc 1 69 0
 215 00bc C046     		nop
 216 00be BD46     		mov	sp, r7
 217 00c0 02B0     		add	sp, sp, #8
 218              		@ sp needed
 219 00c2 80BD     		pop	{r7, pc}
 220              		.cfi_endproc
 221              	.LFE3:
 223              		.align	1
 224              		.global	delay_milli
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	delay_milli:
 231              	.LFB4:
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void delay_milli(unsigned int ms) {
 232              		.loc 1 71 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 8
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00c4 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00c6 82B0     		sub	sp, sp, #8
 241              		.cfi_def_cfa_offset 16
 242 00c8 00AF     		add	r7, sp, #0
 243              		.cfi_def_cfa_register 7
 244 00ca 7860     		str	r0, [r7, #4]
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	#ifdef SIMULATOR
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_mikro(ms);
 245              		.loc 1 73 0
 246 00cc 7B68     		ldr	r3, [r7, #4]
 247 00ce 1800     		movs	r0, r3
 248 00d0 FFF7FEFF 		bl	delay_mikro
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	#else
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_mikro(1000 * ms)
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	#endif
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 249              		.loc 1 77 0
 250 00d4 C046     		nop
 251 00d6 BD46     		mov	sp, r7
 252 00d8 02B0     		add	sp, sp, #8
 253              		@ sp needed
 254 00da 80BD     		pop	{r7, pc}
 255              		.cfi_endproc
 256              	.LFE4:
 258              		.align	1
 259              		.global	main
 260              		.syntax unified
 261              		.code	16
 262              		.thumb_func
 263              		.fpu softvfp
 265              	main:
 266              	.LFB5:
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void main(int argc, char **argv) {
 267              		.loc 1 81 0
 268              		.cfi_startproc
 269              		@ args = 0, pretend = 0, frame = 8
 270              		@ frame_needed = 1, uses_anonymous_args = 0
 271 00dc 80B5     		push	{r7, lr}
 272              		.cfi_def_cfa_offset 8
 273              		.cfi_offset 7, -8
 274              		.cfi_offset 14, -4
 275 00de 82B0     		sub	sp, sp, #8
 276              		.cfi_def_cfa_offset 16
 277 00e0 00AF     		add	r7, sp, #0
 278              		.cfi_def_cfa_register 7
 279 00e2 7860     		str	r0, [r7, #4]
 280 00e4 3960     		str	r1, [r7]
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     init_app();
 281              		.loc 1 82 0
 282 00e6 FFF7FEFF 		bl	init_app
 283              	.L14:
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     while(1)
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     {
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         *GPIO_ODR_LOW = 0;
 284              		.loc 1 85 0 discriminator 1
 285 00ea 084B     		ldr	r3, .L15
 286 00ec 0022     		movs	r2, #0
 287 00ee 1A70     		strb	r2, [r3]
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         delay_milli(500);
 288              		.loc 1 86 0 discriminator 1
 289 00f0 FA23     		movs	r3, #250
 290 00f2 5B00     		lsls	r3, r3, #1
 291 00f4 1800     		movs	r0, r3
 292 00f6 FFF7FEFF 		bl	delay_milli
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         *GPIO_ODR_LOW = 0xFF;
 293              		.loc 1 87 0 discriminator 1
 294 00fa 044B     		ldr	r3, .L15
 295 00fc FF22     		movs	r2, #255
 296 00fe 1A70     		strb	r2, [r3]
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         delay_milli(500);
 297              		.loc 1 88 0 discriminator 1
 298 0100 FA23     		movs	r3, #250
 299 0102 5B00     		lsls	r3, r3, #1
 300 0104 1800     		movs	r0, r3
 301 0106 FFF7FEFF 		bl	delay_milli
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         delay_milli(500);
 302              		.loc 1 85 0 discriminator 1
 303 010a EEE7     		b	.L14
 304              	.L16:
 305              		.align	2
 306              	.L15:
 307 010c 14100240 		.word	1073877012
 308              		.cfi_endproc
 309              	.LFE5:
 311              	.Letext0:
