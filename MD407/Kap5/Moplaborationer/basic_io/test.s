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
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	// set pins for asciidisplay
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
 175              		.global	delay_micro
 176              		.syntax unified
 177              		.code	16
 178              		.thumb_func
 179              		.fpu softvfp
 181              	delay_micro:
 182              	.LFB3:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void delay_micro(unsigned int us) {
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
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_micro(ms);
 245              		.loc 1 73 0
 246 00cc 7B68     		ldr	r3, [r7, #4]
 247 00ce 1800     		movs	r0, r3
 248 00d0 FFF7FEFF 		bl	delay_micro
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	#else
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_micro(1000 * ms)
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
 259              		.global	ascii_ctrl_bit_set
 260              		.syntax unified
 261              		.code	16
 262              		.thumb_func
 263              		.fpu softvfp
 265              	ascii_ctrl_bit_set:
 266              	.LFB5:
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** ascii_ctrl_bit_set( unsigned char in )
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** { /* Funktion för att 1-ställa bitar lmao */
 267              		.loc 1 80 0
 268              		.cfi_startproc
 269              		@ args = 0, pretend = 0, frame = 16
 270              		@ frame_needed = 1, uses_anonymous_args = 0
 271 00dc 80B5     		push	{r7, lr}
 272              		.cfi_def_cfa_offset 8
 273              		.cfi_offset 7, -8
 274              		.cfi_offset 14, -4
 275 00de 84B0     		sub	sp, sp, #16
 276              		.cfi_def_cfa_offset 24
 277 00e0 00AF     		add	r7, sp, #0
 278              		.cfi_def_cfa_register 7
 279 00e2 0200     		movs	r2, r0
 280 00e4 FB1D     		adds	r3, r7, #7
 281 00e6 1A70     		strb	r2, [r3]
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     unsigned char c;
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     c = *GPIO_ODR_LOW;
 282              		.loc 1 82 0
 283 00e8 0D4A     		ldr	r2, .L14
 284 00ea 0F23     		movs	r3, #15
 285 00ec FB18     		adds	r3, r7, r3
 286 00ee 1278     		ldrb	r2, [r2]
 287 00f0 1A70     		strb	r2, [r3]
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     c |= ( B_SELECT | in );
 288              		.loc 1 83 0
 289 00f2 FA1D     		adds	r2, r7, #7
 290 00f4 0F23     		movs	r3, #15
 291 00f6 FB18     		adds	r3, r7, r3
 292 00f8 1278     		ldrb	r2, [r2]
 293 00fa 1B78     		ldrb	r3, [r3]
 294 00fc 1343     		orrs	r3, r2
 295 00fe DAB2     		uxtb	r2, r3
 296 0100 0F23     		movs	r3, #15
 297 0102 FB18     		adds	r3, r7, r3
 298 0104 0221     		movs	r1, #2
 299 0106 0A43     		orrs	r2, r1
 300 0108 1A70     		strb	r2, [r3]
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     *GPIO_ODR_LOW = c;
 301              		.loc 1 84 0
 302 010a 054A     		ldr	r2, .L14
 303 010c 0F23     		movs	r3, #15
 304 010e FB18     		adds	r3, r7, r3
 305 0110 1B78     		ldrb	r3, [r3]
 306 0112 1370     		strb	r3, [r2]
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 307              		.loc 1 85 0
 308 0114 C046     		nop
 309 0116 1800     		movs	r0, r3
 310 0118 BD46     		mov	sp, r7
 311 011a 04B0     		add	sp, sp, #16
 312              		@ sp needed
 313 011c 80BD     		pop	{r7, pc}
 314              	.L15:
 315 011e C046     		.align	2
 316              	.L14:
 317 0120 14100240 		.word	1073877012
 318              		.cfi_endproc
 319              	.LFE5:
 321              		.align	1
 322              		.global	ascii_ctrl_bit_clear
 323              		.syntax unified
 324              		.code	16
 325              		.thumb_func
 326              		.fpu softvfp
 328              	ascii_ctrl_bit_clear:
 329              	.LFB6:
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_ctrl_bit_clear( unsigned char x ) {
 330              		.loc 1 86 0
 331              		.cfi_startproc
 332              		@ args = 0, pretend = 0, frame = 16
 333              		@ frame_needed = 1, uses_anonymous_args = 0
 334 0124 80B5     		push	{r7, lr}
 335              		.cfi_def_cfa_offset 8
 336              		.cfi_offset 7, -8
 337              		.cfi_offset 14, -4
 338 0126 84B0     		sub	sp, sp, #16
 339              		.cfi_def_cfa_offset 24
 340 0128 00AF     		add	r7, sp, #0
 341              		.cfi_def_cfa_register 7
 342 012a 0200     		movs	r2, r0
 343 012c FB1D     		adds	r3, r7, #7
 344 012e 1A70     		strb	r2, [r3]
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     unsigned char c;
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     c = *GPIO_ODR_LOW;
 345              		.loc 1 88 0
 346 0130 0F4A     		ldr	r2, .L17
 347 0132 0F23     		movs	r3, #15
 348 0134 FB18     		adds	r3, r7, r3
 349 0136 1278     		ldrb	r2, [r2]
 350 0138 1A70     		strb	r2, [r3]
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     c = B_SELECT | ( c & ~x );
 351              		.loc 1 89 0
 352 013a FB1D     		adds	r3, r7, #7
 353 013c 1B78     		ldrb	r3, [r3]
 354 013e 5BB2     		sxtb	r3, r3
 355 0140 DB43     		mvns	r3, r3
 356 0142 5BB2     		sxtb	r3, r3
 357 0144 0F22     		movs	r2, #15
 358 0146 BA18     		adds	r2, r7, r2
 359 0148 1278     		ldrb	r2, [r2]
 360 014a 52B2     		sxtb	r2, r2
 361 014c 1340     		ands	r3, r2
 362 014e 5BB2     		sxtb	r3, r3
 363 0150 0222     		movs	r2, #2
 364 0152 1343     		orrs	r3, r2
 365 0154 5AB2     		sxtb	r2, r3
 366 0156 0F23     		movs	r3, #15
 367 0158 FB18     		adds	r3, r7, r3
 368 015a 1A70     		strb	r2, [r3]
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     *GPIO_ODR_LOW = c;
 369              		.loc 1 90 0
 370 015c 044A     		ldr	r2, .L17
 371 015e 0F23     		movs	r3, #15
 372 0160 FB18     		adds	r3, r7, r3
 373 0162 1B78     		ldrb	r3, [r3]
 374 0164 1370     		strb	r3, [r2]
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 375              		.loc 1 91 0
 376 0166 C046     		nop
 377 0168 BD46     		mov	sp, r7
 378 016a 04B0     		add	sp, sp, #16
 379              		@ sp needed
 380 016c 80BD     		pop	{r7, pc}
 381              	.L18:
 382 016e C046     		.align	2
 383              	.L17:
 384 0170 14100240 		.word	1073877012
 385              		.cfi_endproc
 386              	.LFE6:
 388              		.align	1
 389              		.global	ascii_write_controller
 390              		.syntax unified
 391              		.code	16
 392              		.thumb_func
 393              		.fpu softvfp
 395              	ascii_write_controller:
 396              	.LFB7:
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_write_controller( unsigned char c ) {
 397              		.loc 1 93 0
 398              		.cfi_startproc
 399              		@ args = 0, pretend = 0, frame = 8
 400              		@ frame_needed = 1, uses_anonymous_args = 0
 401 0174 80B5     		push	{r7, lr}
 402              		.cfi_def_cfa_offset 8
 403              		.cfi_offset 7, -8
 404              		.cfi_offset 14, -4
 405 0176 82B0     		sub	sp, sp, #8
 406              		.cfi_def_cfa_offset 16
 407 0178 00AF     		add	r7, sp, #0
 408              		.cfi_def_cfa_register 7
 409 017a 0200     		movs	r2, r0
 410 017c FB1D     		adds	r3, r7, #7
 411 017e 1A70     		strb	r2, [r3]
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_set( B_E );
 412              		.loc 1 94 0
 413 0180 0620     		movs	r0, #6
 414 0182 FFF7FEFF 		bl	ascii_ctrl_bit_set
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     *GPIO_ODR_HIGH = c;
 415              		.loc 1 95 0
 416 0186 064A     		ldr	r2, .L20
 417 0188 FB1D     		adds	r3, r7, #7
 418 018a 1B78     		ldrb	r3, [r3]
 419 018c 1370     		strb	r3, [r2]
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_250ns();
 420              		.loc 1 96 0
 421 018e FFF7FEFF 		bl	delay_250ns
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_clear( B_E );
 422              		.loc 1 97 0
 423 0192 0620     		movs	r0, #6
 424 0194 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 425              		.loc 1 98 0
 426 0198 C046     		nop
 427 019a BD46     		mov	sp, r7
 428 019c 02B0     		add	sp, sp, #8
 429              		@ sp needed
 430 019e 80BD     		pop	{r7, pc}
 431              	.L21:
 432              		.align	2
 433              	.L20:
 434 01a0 15100240 		.word	1073877013
 435              		.cfi_endproc
 436              	.LFE7:
 438              		.align	1
 439              		.global	ascii_read_controller
 440              		.syntax unified
 441              		.code	16
 442              		.thumb_func
 443              		.fpu softvfp
 445              	ascii_read_controller:
 446              	.LFB8:
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** unsigned char ascii_read_controller( void )
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** {
 447              		.loc 1 101 0
 448              		.cfi_startproc
 449              		@ args = 0, pretend = 0, frame = 8
 450              		@ frame_needed = 1, uses_anonymous_args = 0
 451 01a4 80B5     		push	{r7, lr}
 452              		.cfi_def_cfa_offset 8
 453              		.cfi_offset 7, -8
 454              		.cfi_offset 14, -4
 455 01a6 82B0     		sub	sp, sp, #8
 456              		.cfi_def_cfa_offset 16
 457 01a8 00AF     		add	r7, sp, #0
 458              		.cfi_def_cfa_register 7
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     unsigned char rv;
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_set( B_E );
 459              		.loc 1 103 0
 460 01aa 0620     		movs	r0, #6
 461 01ac FFF7FEFF 		bl	ascii_ctrl_bit_set
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_250ns();
 462              		.loc 1 104 0
 463 01b0 FFF7FEFF 		bl	delay_250ns
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_250ns();
 464              		.loc 1 105 0
 465 01b4 FFF7FEFF 		bl	delay_250ns
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     rv = *GPIO_IDR_HIGH;
 466              		.loc 1 106 0
 467 01b8 064A     		ldr	r2, .L24
 468 01ba FB1D     		adds	r3, r7, #7
 469 01bc 1278     		ldrb	r2, [r2]
 470 01be 1A70     		strb	r2, [r3]
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_clear( B_E );
 471              		.loc 1 107 0
 472 01c0 0620     		movs	r0, #6
 473 01c2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     return rv;
 474              		.loc 1 108 0
 475 01c6 FB1D     		adds	r3, r7, #7
 476 01c8 1B78     		ldrb	r3, [r3]
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 477              		.loc 1 109 0
 478 01ca 1800     		movs	r0, r3
 479 01cc BD46     		mov	sp, r7
 480 01ce 02B0     		add	sp, sp, #8
 481              		@ sp needed
 482 01d0 80BD     		pop	{r7, pc}
 483              	.L25:
 484 01d2 C046     		.align	2
 485              	.L24:
 486 01d4 11100240 		.word	1073877009
 487              		.cfi_endproc
 488              	.LFE8:
 490              		.align	1
 491              		.global	ascii_write_cmd
 492              		.syntax unified
 493              		.code	16
 494              		.thumb_func
 495              		.fpu softvfp
 497              	ascii_write_cmd:
 498              	.LFB9:
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_write_cmd(unsigned char command){
 499              		.loc 1 111 0
 500              		.cfi_startproc
 501              		@ args = 0, pretend = 0, frame = 8
 502              		@ frame_needed = 1, uses_anonymous_args = 0
 503 01d8 80B5     		push	{r7, lr}
 504              		.cfi_def_cfa_offset 8
 505              		.cfi_offset 7, -8
 506              		.cfi_offset 14, -4
 507 01da 82B0     		sub	sp, sp, #8
 508              		.cfi_def_cfa_offset 16
 509 01dc 00AF     		add	r7, sp, #0
 510              		.cfi_def_cfa_register 7
 511 01de 0200     		movs	r2, r0
 512 01e0 FB1D     		adds	r3, r7, #7
 513 01e2 1A70     		strb	r2, [r3]
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_clear(B_RS);
 514              		.loc 1 112 0
 515 01e4 0020     		movs	r0, #0
 516 01e6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 517              		.loc 1 113 0
 518 01ea 0120     		movs	r0, #1
 519 01ec FFF7FEFF 		bl	ascii_ctrl_bit_clear
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_write_controller(command);
 520              		.loc 1 114 0
 521 01f0 FB1D     		adds	r3, r7, #7
 522 01f2 1B78     		ldrb	r3, [r3]
 523 01f4 1800     		movs	r0, r3
 524 01f6 FFF7FEFF 		bl	ascii_write_controller
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 525              		.loc 1 115 0
 526 01fa C046     		nop
 527 01fc BD46     		mov	sp, r7
 528 01fe 02B0     		add	sp, sp, #8
 529              		@ sp needed
 530 0200 80BD     		pop	{r7, pc}
 531              		.cfi_endproc
 532              	.LFE9:
 534              		.align	1
 535              		.global	ascii_write_data
 536              		.syntax unified
 537              		.code	16
 538              		.thumb_func
 539              		.fpu softvfp
 541              	ascii_write_data:
 542              	.LFB10:
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_write_data(unsigned char data){
 543              		.loc 1 117 0
 544              		.cfi_startproc
 545              		@ args = 0, pretend = 0, frame = 8
 546              		@ frame_needed = 1, uses_anonymous_args = 0
 547 0202 80B5     		push	{r7, lr}
 548              		.cfi_def_cfa_offset 8
 549              		.cfi_offset 7, -8
 550              		.cfi_offset 14, -4
 551 0204 82B0     		sub	sp, sp, #8
 552              		.cfi_def_cfa_offset 16
 553 0206 00AF     		add	r7, sp, #0
 554              		.cfi_def_cfa_register 7
 555 0208 0200     		movs	r2, r0
 556 020a FB1D     		adds	r3, r7, #7
 557 020c 1A70     		strb	r2, [r3]
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_set(B_RS);
 558              		.loc 1 118 0
 559 020e 0020     		movs	r0, #0
 560 0210 FFF7FEFF 		bl	ascii_ctrl_bit_set
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 561              		.loc 1 119 0
 562 0214 0120     		movs	r0, #1
 563 0216 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_write_controller(data);
 564              		.loc 1 120 0
 565 021a FB1D     		adds	r3, r7, #7
 566 021c 1B78     		ldrb	r3, [r3]
 567 021e 1800     		movs	r0, r3
 568 0220 FFF7FEFF 		bl	ascii_write_controller
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 569              		.loc 1 121 0
 570 0224 C046     		nop
 571 0226 BD46     		mov	sp, r7
 572 0228 02B0     		add	sp, sp, #8
 573              		@ sp needed
 574 022a 80BD     		pop	{r7, pc}
 575              		.cfi_endproc
 576              	.LFE10:
 578              		.align	1
 579              		.global	ascii_read_status
 580              		.syntax unified
 581              		.code	16
 582              		.thumb_func
 583              		.fpu softvfp
 585              	ascii_read_status:
 586              	.LFB11:
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** unsigned char ascii_read_status(void){
 587              		.loc 1 123 0
 588              		.cfi_startproc
 589              		@ args = 0, pretend = 0, frame = 8
 590              		@ frame_needed = 1, uses_anonymous_args = 0
 591 022c 90B5     		push	{r4, r7, lr}
 592              		.cfi_def_cfa_offset 12
 593              		.cfi_offset 4, -12
 594              		.cfi_offset 7, -8
 595              		.cfi_offset 14, -4
 596 022e 83B0     		sub	sp, sp, #12
 597              		.cfi_def_cfa_offset 24
 598 0230 00AF     		add	r7, sp, #0
 599              		.cfi_def_cfa_register 7
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     *GPIO_MODER &= 0x0000FFFF;	
 600              		.loc 1 124 0
 601 0232 114B     		ldr	r3, .L30
 602 0234 104A     		ldr	r2, .L30
 603 0236 1268     		ldr	r2, [r2]
 604 0238 1204     		lsls	r2, r2, #16
 605 023a 120C     		lsrs	r2, r2, #16
 606 023c 1A60     		str	r2, [r3]
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 607              		.loc 1 125 0
 608 023e 0020     		movs	r0, #0
 609 0240 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_set(B_RW);
 610              		.loc 1 126 0
 611 0244 0120     		movs	r0, #1
 612 0246 FFF7FEFF 		bl	ascii_ctrl_bit_set
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	unsigned char rv = ascii_read_controller();
 613              		.loc 1 127 0
 614 024a FC1D     		adds	r4, r7, #7
 615 024c FFF7FEFF 		bl	ascii_read_controller
 616 0250 0300     		movs	r3, r0
 617 0252 2370     		strb	r3, [r4]
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 618              		.loc 1 128 0
 619 0254 084B     		ldr	r3, .L30
 620 0256 084A     		ldr	r2, .L30
 621 0258 1268     		ldr	r2, [r2]
 622 025a 1204     		lsls	r2, r2, #16
 623 025c 120C     		lsrs	r2, r2, #16
 624 025e 1A60     		str	r2, [r3]
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER |= 0x55550000;	
 625              		.loc 1 129 0
 626 0260 054B     		ldr	r3, .L30
 627 0262 054A     		ldr	r2, .L30
 628 0264 1268     		ldr	r2, [r2]
 629 0266 0549     		ldr	r1, .L30+4
 630 0268 0A43     		orrs	r2, r1
 631 026a 1A60     		str	r2, [r3]
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	return rv;
 632              		.loc 1 130 0
 633 026c FB1D     		adds	r3, r7, #7
 634 026e 1B78     		ldrb	r3, [r3]
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 635              		.loc 1 131 0
 636 0270 1800     		movs	r0, r3
 637 0272 BD46     		mov	sp, r7
 638 0274 03B0     		add	sp, sp, #12
 639              		@ sp needed
 640 0276 90BD     		pop	{r4, r7, pc}
 641              	.L31:
 642              		.align	2
 643              	.L30:
 644 0278 00100240 		.word	1073876992
 645 027c 00005555 		.word	1431633920
 646              		.cfi_endproc
 647              	.LFE11:
 649              		.align	1
 650              		.global	ascii_read_data
 651              		.syntax unified
 652              		.code	16
 653              		.thumb_func
 654              		.fpu softvfp
 656              	ascii_read_data:
 657              	.LFB12:
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** unsigned char ascii_read_data(void){
 658              		.loc 1 133 0
 659              		.cfi_startproc
 660              		@ args = 0, pretend = 0, frame = 8
 661              		@ frame_needed = 1, uses_anonymous_args = 0
 662 0280 90B5     		push	{r4, r7, lr}
 663              		.cfi_def_cfa_offset 12
 664              		.cfi_offset 4, -12
 665              		.cfi_offset 7, -8
 666              		.cfi_offset 14, -4
 667 0282 83B0     		sub	sp, sp, #12
 668              		.cfi_def_cfa_offset 24
 669 0284 00AF     		add	r7, sp, #0
 670              		.cfi_def_cfa_register 7
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     *GPIO_MODER &= 0x0000FFFF;	
 671              		.loc 1 134 0
 672 0286 114B     		ldr	r3, .L34
 673 0288 104A     		ldr	r2, .L34
 674 028a 1268     		ldr	r2, [r2]
 675 028c 1204     		lsls	r2, r2, #16
 676 028e 120C     		lsrs	r2, r2, #16
 677 0290 1A60     		str	r2, [r3]
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_set(B_RS);
 678              		.loc 1 135 0
 679 0292 0020     		movs	r0, #0
 680 0294 FFF7FEFF 		bl	ascii_ctrl_bit_set
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_set(B_RW);
 681              		.loc 1 136 0
 682 0298 0120     		movs	r0, #1
 683 029a FFF7FEFF 		bl	ascii_ctrl_bit_set
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	unsigned char rv = ascii_read_controller();
 684              		.loc 1 137 0
 685 029e FC1D     		adds	r4, r7, #7
 686 02a0 FFF7FEFF 		bl	ascii_read_controller
 687 02a4 0300     		movs	r3, r0
 688 02a6 2370     		strb	r3, [r4]
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 689              		.loc 1 138 0
 690 02a8 084B     		ldr	r3, .L34
 691 02aa 084A     		ldr	r2, .L34
 692 02ac 1268     		ldr	r2, [r2]
 693 02ae 1204     		lsls	r2, r2, #16
 694 02b0 120C     		lsrs	r2, r2, #16
 695 02b2 1A60     		str	r2, [r3]
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER |= 0x55550000;	
 696              		.loc 1 139 0
 697 02b4 054B     		ldr	r3, .L34
 698 02b6 054A     		ldr	r2, .L34
 699 02b8 1268     		ldr	r2, [r2]
 700 02ba 0549     		ldr	r1, .L34+4
 701 02bc 0A43     		orrs	r2, r1
 702 02be 1A60     		str	r2, [r3]
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	return rv;
 703              		.loc 1 140 0
 704 02c0 FB1D     		adds	r3, r7, #7
 705 02c2 1B78     		ldrb	r3, [r3]
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 706              		.loc 1 141 0
 707 02c4 1800     		movs	r0, r3
 708 02c6 BD46     		mov	sp, r7
 709 02c8 03B0     		add	sp, sp, #12
 710              		@ sp needed
 711 02ca 90BD     		pop	{r4, r7, pc}
 712              	.L35:
 713              		.align	2
 714              	.L34:
 715 02cc 00100240 		.word	1073876992
 716 02d0 00005555 		.word	1431633920
 717              		.cfi_endproc
 718              	.LFE12:
 720              		.align	1
 721              		.global	ascii_command
 722              		.syntax unified
 723              		.code	16
 724              		.thumb_func
 725              		.fpu softvfp
 727              	ascii_command:
 728              	.LFB13:
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_command(char command, unsigned int delayMicroSec){
 729              		.loc 1 143 0
 730              		.cfi_startproc
 731              		@ args = 0, pretend = 0, frame = 8
 732              		@ frame_needed = 1, uses_anonymous_args = 0
 733 02d4 80B5     		push	{r7, lr}
 734              		.cfi_def_cfa_offset 8
 735              		.cfi_offset 7, -8
 736              		.cfi_offset 14, -4
 737 02d6 82B0     		sub	sp, sp, #8
 738              		.cfi_def_cfa_offset 16
 739 02d8 00AF     		add	r7, sp, #0
 740              		.cfi_def_cfa_register 7
 741 02da 0200     		movs	r2, r0
 742 02dc 3960     		str	r1, [r7]
 743 02de FB1D     		adds	r3, r7, #7
 744 02e0 1A70     		strb	r2, [r3]
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     while(ascii_read_status() & 0x80 == 0x80){
 745              		.loc 1 144 0
 746 02e2 C046     		nop
 747              	.L37:
 748              		.loc 1 144 0 is_stmt 0 discriminator 1
 749 02e4 FFF7FEFF 		bl	ascii_read_status
 750 02e8 0300     		movs	r3, r0
 751 02ea 1A00     		movs	r2, r3
 752 02ec 0123     		movs	r3, #1
 753 02ee 1340     		ands	r3, r2
 754 02f0 F8D1     		bne	.L37
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****             //TODO implement pip subroutine
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         }
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(8);
 755              		.loc 1 147 0 is_stmt 1
 756 02f2 0820     		movs	r0, #8
 757 02f4 FFF7FEFF 		bl	delay_micro
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_write_cmd(command);
 758              		.loc 1 148 0
 759 02f8 FB1D     		adds	r3, r7, #7
 760 02fa 1B78     		ldrb	r3, [r3]
 761 02fc 1800     		movs	r0, r3
 762 02fe FFF7FEFF 		bl	ascii_write_cmd
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(delayMicroSec);
 763              		.loc 1 149 0
 764 0302 3B68     		ldr	r3, [r7]
 765 0304 1800     		movs	r0, r3
 766 0306 FFF7FEFF 		bl	delay_micro
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 767              		.loc 1 150 0
 768 030a C046     		nop
 769 030c BD46     		mov	sp, r7
 770 030e 02B0     		add	sp, sp, #8
 771              		@ sp needed
 772 0310 80BD     		pop	{r7, pc}
 773              		.cfi_endproc
 774              	.LFE13:
 776              		.align	1
 777              		.global	ascii_init
 778              		.syntax unified
 779              		.code	16
 780              		.thumb_func
 781              		.fpu softvfp
 783              	ascii_init:
 784              	.LFB14:
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_init(void){
 785              		.loc 1 152 0
 786              		.cfi_startproc
 787              		@ args = 0, pretend = 0, frame = 0
 788              		@ frame_needed = 1, uses_anonymous_args = 0
 789 0312 80B5     		push	{r7, lr}
 790              		.cfi_def_cfa_offset 8
 791              		.cfi_offset 7, -8
 792              		.cfi_offset 14, -4
 793 0314 00AF     		add	r7, sp, #0
 794              		.cfi_def_cfa_register 7
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_ctrl_bit_set(B_SELECT);
 795              		.loc 1 153 0
 796 0316 0220     		movs	r0, #2
 797 0318 FFF7FEFF 		bl	ascii_ctrl_bit_set
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0x38, 40); //Set disp size, delay 40 ms
 798              		.loc 1 154 0
 799 031c 2821     		movs	r1, #40
 800 031e 3820     		movs	r0, #56
 801 0320 FFF7FEFF 		bl	ascii_command
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0xE, 40); //delay set to 40 bcs DR.eHugo
 802              		.loc 1 155 0
 803 0324 2821     		movs	r1, #40
 804 0326 0E20     		movs	r0, #14
 805 0328 FFF7FEFF 		bl	ascii_command
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0x01, 1530); // Cls
 806              		.loc 1 156 0
 807 032c 054B     		ldr	r3, .L39
 808 032e 1900     		movs	r1, r3
 809 0330 0120     		movs	r0, #1
 810 0332 FFF7FEFF 		bl	ascii_command
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0x6, 40); // Inc
 811              		.loc 1 157 0
 812 0336 2821     		movs	r1, #40
 813 0338 0620     		movs	r0, #6
 814 033a FFF7FEFF 		bl	ascii_command
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 815              		.loc 1 158 0
 816 033e C046     		nop
 817 0340 BD46     		mov	sp, r7
 818              		@ sp needed
 819 0342 80BD     		pop	{r7, pc}
 820              	.L40:
 821              		.align	2
 822              	.L39:
 823 0344 FA050000 		.word	1530
 824              		.cfi_endproc
 825              	.LFE14:
 827              		.align	1
 828              		.global	ascii_write_char
 829              		.syntax unified
 830              		.code	16
 831              		.thumb_func
 832              		.fpu softvfp
 834              	ascii_write_char:
 835              	.LFB15:
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** ascii_write_char(char c){
 836              		.loc 1 160 0
 837              		.cfi_startproc
 838              		@ args = 0, pretend = 0, frame = 8
 839              		@ frame_needed = 1, uses_anonymous_args = 0
 840 0348 80B5     		push	{r7, lr}
 841              		.cfi_def_cfa_offset 8
 842              		.cfi_offset 7, -8
 843              		.cfi_offset 14, -4
 844 034a 82B0     		sub	sp, sp, #8
 845              		.cfi_def_cfa_offset 16
 846 034c 00AF     		add	r7, sp, #0
 847              		.cfi_def_cfa_register 7
 848 034e 0200     		movs	r2, r0
 849 0350 FB1D     		adds	r3, r7, #7
 850 0352 1A70     		strb	r2, [r3]
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     while(ascii_read_status() & 0x80 == 0x80){
 851              		.loc 1 161 0
 852 0354 C046     		nop
 853              	.L42:
 854              		.loc 1 161 0 is_stmt 0 discriminator 1
 855 0356 FFF7FEFF 		bl	ascii_read_status
 856 035a 0300     		movs	r3, r0
 857 035c 1A00     		movs	r2, r3
 858 035e 0123     		movs	r3, #1
 859 0360 1340     		ands	r3, r2
 860 0362 F8D1     		bne	.L42
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****             //TODO implement pip subroutine
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         }
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(8);
 861              		.loc 1 164 0 is_stmt 1
 862 0364 0820     		movs	r0, #8
 863 0366 FFF7FEFF 		bl	delay_micro
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_write_data(c);
 864              		.loc 1 165 0
 865 036a FB1D     		adds	r3, r7, #7
 866 036c 1B78     		ldrb	r3, [r3]
 867 036e 1800     		movs	r0, r3
 868 0370 FFF7FEFF 		bl	ascii_write_data
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(45);
 869              		.loc 1 166 0
 870 0374 2D20     		movs	r0, #45
 871 0376 FFF7FEFF 		bl	delay_micro
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 872              		.loc 1 167 0
 873 037a C046     		nop
 874 037c 1800     		movs	r0, r3
 875 037e BD46     		mov	sp, r7
 876 0380 02B0     		add	sp, sp, #8
 877              		@ sp needed
 878 0382 80BD     		pop	{r7, pc}
 879              		.cfi_endproc
 880              	.LFE15:
 882              		.align	1
 883              		.global	goToXY
 884              		.syntax unified
 885              		.code	16
 886              		.thumb_func
 887              		.fpu softvfp
 889              	goToXY:
 890              	.LFB16:
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void goToXY(unsigned char row, unsigned char column) {
 891              		.loc 1 169 0
 892              		.cfi_startproc
 893              		@ args = 0, pretend = 0, frame = 16
 894              		@ frame_needed = 1, uses_anonymous_args = 0
 895 0384 80B5     		push	{r7, lr}
 896              		.cfi_def_cfa_offset 8
 897              		.cfi_offset 7, -8
 898              		.cfi_offset 14, -4
 899 0386 84B0     		sub	sp, sp, #16
 900              		.cfi_def_cfa_offset 24
 901 0388 00AF     		add	r7, sp, #0
 902              		.cfi_def_cfa_register 7
 903 038a 0200     		movs	r2, r0
 904 038c FB1D     		adds	r3, r7, #7
 905 038e 1A70     		strb	r2, [r3]
 906 0390 BB1D     		adds	r3, r7, #6
 907 0392 0A1C     		adds	r2, r1, #0
 908 0394 1A70     		strb	r2, [r3]
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	unsigned char address = row - 1;
 909              		.loc 1 170 0
 910 0396 0F23     		movs	r3, #15
 911 0398 FB18     		adds	r3, r7, r3
 912 039a FA1D     		adds	r2, r7, #7
 913 039c 1278     		ldrb	r2, [r2]
 914 039e 013A     		subs	r2, r2, #1
 915 03a0 1A70     		strb	r2, [r3]
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	if(column == 2) {
 916              		.loc 1 171 0
 917 03a2 BB1D     		adds	r3, r7, #6
 918 03a4 1B78     		ldrb	r3, [r3]
 919 03a6 022B     		cmp	r3, #2
 920 03a8 06D1     		bne	.L44
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		address = address + 0x40;
 921              		.loc 1 172 0
 922 03aa 0F23     		movs	r3, #15
 923 03ac FB18     		adds	r3, r7, r3
 924 03ae 0F22     		movs	r2, #15
 925 03b0 BA18     		adds	r2, r7, r2
 926 03b2 1278     		ldrb	r2, [r2]
 927 03b4 4032     		adds	r2, r2, #64
 928 03b6 1A70     		strb	r2, [r3]
 929              	.L44:
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_write_cmd(0x80 | address);
 930              		.loc 1 174 0
 931 03b8 0F23     		movs	r3, #15
 932 03ba FB18     		adds	r3, r7, r3
 933 03bc 1B78     		ldrb	r3, [r3]
 934 03be 8022     		movs	r2, #128
 935 03c0 5242     		rsbs	r2, r2, #0
 936 03c2 1343     		orrs	r3, r2
 937 03c4 DBB2     		uxtb	r3, r3
 938 03c6 1800     		movs	r0, r3
 939 03c8 FFF7FEFF 		bl	ascii_write_cmd
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 940              		.loc 1 175 0
 941 03cc C046     		nop
 942 03ce BD46     		mov	sp, r7
 943 03d0 04B0     		add	sp, sp, #16
 944              		@ sp needed
 945 03d2 80BD     		pop	{r7, pc}
 946              		.cfi_endproc
 947              	.LFE16:
 949              		.section	.rodata
 950              		.align	2
 951              	.LC0:
 952 0000 416C6661 		.ascii	"Alfanumerisk \000"
 952      6E756D65 
 952      7269736B 
 952      2000
 953 000e 0000     		.align	2
 954              	.LC2:
 955 0010 44697370 		.ascii	"Display - test\000"
 955      6C617920 
 955      2D207465 
 955      737400
 956              		.text
 957              		.align	1
 958              		.global	main
 959              		.syntax unified
 960              		.code	16
 961              		.thumb_func
 962              		.fpu softvfp
 964              	main:
 965              	.LFB17:
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void main(int argc, char **argv) {
 966              		.loc 1 179 0
 967              		.cfi_startproc
 968              		@ args = 0, pretend = 0, frame = 48
 969              		@ frame_needed = 1, uses_anonymous_args = 0
 970 03d4 90B5     		push	{r4, r7, lr}
 971              		.cfi_def_cfa_offset 12
 972              		.cfi_offset 4, -12
 973              		.cfi_offset 7, -8
 974              		.cfi_offset 14, -4
 975 03d6 8DB0     		sub	sp, sp, #52
 976              		.cfi_def_cfa_offset 64
 977 03d8 00AF     		add	r7, sp, #0
 978              		.cfi_def_cfa_register 7
 979 03da 7860     		str	r0, [r7, #4]
 980 03dc 3960     		str	r1, [r7]
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     char *s;
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	char test1[] = "Alfanumerisk ";
 981              		.loc 1 182 0
 982 03de 1C23     		movs	r3, #28
 983 03e0 FB18     		adds	r3, r7, r3
 984 03e2 1E4A     		ldr	r2, .L51
 985 03e4 13CA     		ldmia	r2!, {r0, r1, r4}
 986 03e6 13C3     		stmia	r3!, {r0, r1, r4}
 987 03e8 1288     		ldrh	r2, [r2]
 988 03ea 1A80     		strh	r2, [r3]
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	char test2[] = "Display - test";
 989              		.loc 1 183 0
 990 03ec 0C23     		movs	r3, #12
 991 03ee FB18     		adds	r3, r7, r3
 992 03f0 1B4A     		ldr	r2, .L51+4
 993 03f2 13CA     		ldmia	r2!, {r0, r1, r4}
 994 03f4 13C3     		stmia	r3!, {r0, r1, r4}
 995 03f6 1188     		ldrh	r1, [r2]
 996 03f8 1980     		strh	r1, [r3]
 997 03fa 9278     		ldrb	r2, [r2, #2]
 998 03fc 9A70     		strb	r2, [r3, #2]
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     init_app();
 999              		.loc 1 185 0
 1000 03fe FFF7FEFF 		bl	init_app
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_init();
 1001              		.loc 1 186 0
 1002 0402 FFF7FEFF 		bl	ascii_init
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	goToXY(1,1);
 1003              		.loc 1 187 0
 1004 0406 0121     		movs	r1, #1
 1005 0408 0120     		movs	r0, #1
 1006 040a FFF7FEFF 		bl	goToXY
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	s = test1;
 1007              		.loc 1 189 0
 1008 040e 1C23     		movs	r3, #28
 1009 0410 FB18     		adds	r3, r7, r3
 1010 0412 FB62     		str	r3, [r7, #44]
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1011              		.loc 1 190 0
 1012 0414 06E0     		b	.L46
 1013              	.L47:
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		ascii_write_char(*s++);
 1014              		.loc 1 191 0
 1015 0416 FB6A     		ldr	r3, [r7, #44]
 1016 0418 5A1C     		adds	r2, r3, #1
 1017 041a FA62     		str	r2, [r7, #44]
 1018 041c 1B78     		ldrb	r3, [r3]
 1019 041e 1800     		movs	r0, r3
 1020 0420 FFF7FEFF 		bl	ascii_write_char
 1021              	.L46:
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1022              		.loc 1 190 0
 1023 0424 FB6A     		ldr	r3, [r7, #44]
 1024 0426 1B78     		ldrb	r3, [r3]
 1025 0428 002B     		cmp	r3, #0
 1026 042a F4D1     		bne	.L47
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	goToXY(1,2);
 1027              		.loc 1 193 0
 1028 042c 0221     		movs	r1, #2
 1029 042e 0120     		movs	r0, #1
 1030 0430 FFF7FEFF 		bl	goToXY
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	s = test2;
 1031              		.loc 1 194 0
 1032 0434 0C23     		movs	r3, #12
 1033 0436 FB18     		adds	r3, r7, r3
 1034 0438 FB62     		str	r3, [r7, #44]
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1035              		.loc 1 195 0
 1036 043a 06E0     		b	.L48
 1037              	.L49:
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		ascii_write_char(*s++);
 1038              		.loc 1 196 0
 1039 043c FB6A     		ldr	r3, [r7, #44]
 1040 043e 5A1C     		adds	r2, r3, #1
 1041 0440 FA62     		str	r2, [r7, #44]
 1042 0442 1B78     		ldrb	r3, [r3]
 1043 0444 1800     		movs	r0, r3
 1044 0446 FFF7FEFF 		bl	ascii_write_char
 1045              	.L48:
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1046              		.loc 1 195 0
 1047 044a FB6A     		ldr	r3, [r7, #44]
 1048 044c 1B78     		ldrb	r3, [r3]
 1049 044e 002B     		cmp	r3, #0
 1050 0450 F4D1     		bne	.L49
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	return 0;
 1051              		.loc 1 198 0
 1052 0452 C046     		nop
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }...
 1053              		.loc 1 199 0
 1054 0454 BD46     		mov	sp, r7
 1055 0456 0DB0     		add	sp, sp, #52
 1056              		@ sp needed
 1057 0458 90BD     		pop	{r4, r7, pc}
 1058              	.L52:
 1059 045a C046     		.align	2
 1060              	.L51:
 1061 045c 00000000 		.word	.LC0
 1062 0460 10000000 		.word	.LC2
 1063              		.cfi_endproc
 1064              	.LFE17:
 1066              	.Letext0:
