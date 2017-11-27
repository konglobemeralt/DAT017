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
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	//*GPIO_OTYPER = 0x7777;
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	//*GPIO_PUPDR = 0xAAAAAAAA;
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	//*GPIO_ODR_HIGH = 0;
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	//*GPIO_ODR_LOW = 0;
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	//*GPIO_IDR_HIGH = 0;
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
  71              		.loc 1 49 0
  72 000a C046     		nop
  73 000c BD46     		mov	sp, r7
  74              		@ sp needed
  75 000e 80BD     		pop	{r7, pc}
  76              	.L4:
  77              		.align	2
  78              	.L3:
  79 0010 00100240 		.word	1073876992
  80 0014 55555555 		.word	1431655765
  81              		.cfi_endproc
  82              	.LFE1:
  84              		.align	1
  85              		.global	delay_250ns
  86              		.syntax unified
  87              		.code	16
  88              		.thumb_func
  89              		.fpu softvfp
  91              	delay_250ns:
  92              	.LFB2:
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void delay_250ns(void) {
  93              		.loc 1 51 0
  94              		.cfi_startproc
  95              		@ args = 0, pretend = 0, frame = 0
  96              		@ frame_needed = 1, uses_anonymous_args = 0
  97 0018 80B5     		push	{r7, lr}
  98              		.cfi_def_cfa_offset 8
  99              		.cfi_offset 7, -8
 100              		.cfi_offset 14, -4
 101 001a 00AF     		add	r7, sp, #0
 102              		.cfi_def_cfa_register 7
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_CTRL = 0;
 103              		.loc 1 52 0
 104 001c 0C4B     		ldr	r3, .L7
 105 001e 0022     		movs	r2, #0
 106 0020 1A60     		str	r2, [r3]
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 107              		.loc 1 53 0
 108 0022 0C4B     		ldr	r3, .L7+4
 109 0024 3122     		movs	r2, #49
 110 0026 1A60     		str	r2, [r3]
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_VAL = 0;
 111              		.loc 1 54 0
 112 0028 0B4B     		ldr	r3, .L7+8
 113 002a 0022     		movs	r2, #0
 114 002c 1A60     		str	r2, [r3]
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_CTRL = 5;
 115              		.loc 1 55 0
 116 002e 084B     		ldr	r3, .L7
 117 0030 0522     		movs	r2, #5
 118 0032 1A60     		str	r2, [r3]
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 119              		.loc 1 56 0
 120 0034 C046     		nop
 121              	.L6:
 122              		.loc 1 56 0 is_stmt 0 discriminator 1
 123 0036 064B     		ldr	r3, .L7
 124 0038 1A68     		ldr	r2, [r3]
 125 003a 8023     		movs	r3, #128
 126 003c 5B02     		lsls	r3, r3, #9
 127 003e 1340     		ands	r3, r2
 128 0040 F9D0     		beq	.L6
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		// ??????
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*STK_CTRL = 0;
 129              		.loc 1 59 0 is_stmt 1
 130 0042 034B     		ldr	r3, .L7
 131 0044 0022     		movs	r2, #0
 132 0046 1A60     		str	r2, [r3]
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 133              		.loc 1 60 0
 134 0048 C046     		nop
 135 004a BD46     		mov	sp, r7
 136              		@ sp needed
 137 004c 80BD     		pop	{r7, pc}
 138              	.L8:
 139 004e C046     		.align	2
 140              	.L7:
 141 0050 10E000E0 		.word	-536813552
 142 0054 14E000E0 		.word	-536813548
 143 0058 18E000E0 		.word	-536813544
 144              		.cfi_endproc
 145              	.LFE2:
 147              		.align	1
 148              		.global	delay_micro
 149              		.syntax unified
 150              		.code	16
 151              		.thumb_func
 152              		.fpu softvfp
 154              	delay_micro:
 155              	.LFB3:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void delay_micro(unsigned int us) {
 156              		.loc 1 62 0
 157              		.cfi_startproc
 158              		@ args = 0, pretend = 0, frame = 8
 159              		@ frame_needed = 1, uses_anonymous_args = 0
 160 005c 80B5     		push	{r7, lr}
 161              		.cfi_def_cfa_offset 8
 162              		.cfi_offset 7, -8
 163              		.cfi_offset 14, -4
 164 005e 82B0     		sub	sp, sp, #8
 165              		.cfi_def_cfa_offset 16
 166 0060 00AF     		add	r7, sp, #0
 167              		.cfi_def_cfa_register 7
 168 0062 7860     		str	r0, [r7, #4]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(us--) {
 169              		.loc 1 63 0
 170 0064 07E0     		b	.L10
 171              	.L11:
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 172              		.loc 1 64 0
 173 0066 FFF7FEFF 		bl	delay_250ns
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 174              		.loc 1 65 0
 175 006a FFF7FEFF 		bl	delay_250ns
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 176              		.loc 1 66 0
 177 006e FFF7FEFF 		bl	delay_250ns
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 178              		.loc 1 67 0
 179 0072 FFF7FEFF 		bl	delay_250ns
 180              	.L10:
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_250ns();
 181              		.loc 1 63 0
 182 0076 7B68     		ldr	r3, [r7, #4]
 183 0078 5A1E     		subs	r2, r3, #1
 184 007a 7A60     		str	r2, [r7, #4]
 185 007c 002B     		cmp	r3, #0
 186 007e F2D1     		bne	.L11
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 187              		.loc 1 69 0
 188 0080 C046     		nop
 189 0082 BD46     		mov	sp, r7
 190 0084 02B0     		add	sp, sp, #8
 191              		@ sp needed
 192 0086 80BD     		pop	{r7, pc}
 193              		.cfi_endproc
 194              	.LFE3:
 196              		.align	1
 197              		.global	delay_milli
 198              		.syntax unified
 199              		.code	16
 200              		.thumb_func
 201              		.fpu softvfp
 203              	delay_milli:
 204              	.LFB4:
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void delay_milli(unsigned int ms) {
 205              		.loc 1 71 0
 206              		.cfi_startproc
 207              		@ args = 0, pretend = 0, frame = 8
 208              		@ frame_needed = 1, uses_anonymous_args = 0
 209 0088 80B5     		push	{r7, lr}
 210              		.cfi_def_cfa_offset 8
 211              		.cfi_offset 7, -8
 212              		.cfi_offset 14, -4
 213 008a 82B0     		sub	sp, sp, #8
 214              		.cfi_def_cfa_offset 16
 215 008c 00AF     		add	r7, sp, #0
 216              		.cfi_def_cfa_register 7
 217 008e 7860     		str	r0, [r7, #4]
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	#ifdef SIMULATOR
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_micro(ms);
 218              		.loc 1 73 0
 219 0090 7B68     		ldr	r3, [r7, #4]
 220 0092 1800     		movs	r0, r3
 221 0094 FFF7FEFF 		bl	delay_micro
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	#else
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		delay_micro(1000 * ms)
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	#endif
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 222              		.loc 1 77 0
 223 0098 C046     		nop
 224 009a BD46     		mov	sp, r7
 225 009c 02B0     		add	sp, sp, #8
 226              		@ sp needed
 227 009e 80BD     		pop	{r7, pc}
 228              		.cfi_endproc
 229              	.LFE4:
 231              		.align	1
 232              		.global	ascii_ctrl_bit_set
 233              		.syntax unified
 234              		.code	16
 235              		.thumb_func
 236              		.fpu softvfp
 238              	ascii_ctrl_bit_set:
 239              	.LFB5:
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_ctrl_bit_set(unsigned int x) {
 240              		.loc 1 79 0
 241              		.cfi_startproc
 242              		@ args = 0, pretend = 0, frame = 8
 243              		@ frame_needed = 1, uses_anonymous_args = 0
 244 00a0 80B5     		push	{r7, lr}
 245              		.cfi_def_cfa_offset 8
 246              		.cfi_offset 7, -8
 247              		.cfi_offset 14, -4
 248 00a2 82B0     		sub	sp, sp, #8
 249              		.cfi_def_cfa_offset 16
 250 00a4 00AF     		add	r7, sp, #0
 251              		.cfi_def_cfa_register 7
 252 00a6 7860     		str	r0, [r7, #4]
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	switch(x) {
 253              		.loc 1 80 0
 254 00a8 7B68     		ldr	r3, [r7, #4]
 255 00aa 072B     		cmp	r3, #7
 256 00ac 4ED8     		bhi	.L24
 257 00ae 7B68     		ldr	r3, [r7, #4]
 258 00b0 9A00     		lsls	r2, r3, #2
 259 00b2 284B     		ldr	r3, .L25
 260 00b4 D318     		adds	r3, r2, r3
 261 00b6 1B68     		ldr	r3, [r3]
 262 00b8 9F46     		mov	pc, r3
 263              		.section	.rodata
 264              		.align	2
 265              	.L16:
 266 0000 BA000000 		.word	.L15
 267 0004 CC000000 		.word	.L17
 268 0008 DE000000 		.word	.L18
 269 000c F0000000 		.word	.L19
 270 0010 02010000 		.word	.L20
 271 0014 14010000 		.word	.L21
 272 0018 26010000 		.word	.L22
 273 001c 38010000 		.word	.L23
 274              		.text
 275              	.L15:
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 0: *GPIO_ODR_LOW |= 1; break;
 276              		.loc 1 81 0
 277 00ba 274A     		ldr	r2, .L25+4
 278 00bc 264B     		ldr	r3, .L25+4
 279 00be 1B78     		ldrb	r3, [r3]
 280 00c0 DBB2     		uxtb	r3, r3
 281 00c2 0121     		movs	r1, #1
 282 00c4 0B43     		orrs	r3, r1
 283 00c6 DBB2     		uxtb	r3, r3
 284 00c8 1370     		strb	r3, [r2]
 285 00ca 3FE0     		b	.L14
 286              	.L17:
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 1: *GPIO_ODR_LOW |= 2; break;
 287              		.loc 1 82 0
 288 00cc 224A     		ldr	r2, .L25+4
 289 00ce 224B     		ldr	r3, .L25+4
 290 00d0 1B78     		ldrb	r3, [r3]
 291 00d2 DBB2     		uxtb	r3, r3
 292 00d4 0221     		movs	r1, #2
 293 00d6 0B43     		orrs	r3, r1
 294 00d8 DBB2     		uxtb	r3, r3
 295 00da 1370     		strb	r3, [r2]
 296 00dc 36E0     		b	.L14
 297              	.L18:
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 2: *GPIO_ODR_LOW |= 4; break;
 298              		.loc 1 83 0
 299 00de 1E4A     		ldr	r2, .L25+4
 300 00e0 1D4B     		ldr	r3, .L25+4
 301 00e2 1B78     		ldrb	r3, [r3]
 302 00e4 DBB2     		uxtb	r3, r3
 303 00e6 0421     		movs	r1, #4
 304 00e8 0B43     		orrs	r3, r1
 305 00ea DBB2     		uxtb	r3, r3
 306 00ec 1370     		strb	r3, [r2]
 307 00ee 2DE0     		b	.L14
 308              	.L19:
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 3: *GPIO_ODR_LOW |= 8; break;
 309              		.loc 1 84 0
 310 00f0 194A     		ldr	r2, .L25+4
 311 00f2 194B     		ldr	r3, .L25+4
 312 00f4 1B78     		ldrb	r3, [r3]
 313 00f6 DBB2     		uxtb	r3, r3
 314 00f8 0821     		movs	r1, #8
 315 00fa 0B43     		orrs	r3, r1
 316 00fc DBB2     		uxtb	r3, r3
 317 00fe 1370     		strb	r3, [r2]
 318 0100 24E0     		b	.L14
 319              	.L20:
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 4: *GPIO_ODR_LOW |= 16; break;
 320              		.loc 1 85 0
 321 0102 154A     		ldr	r2, .L25+4
 322 0104 144B     		ldr	r3, .L25+4
 323 0106 1B78     		ldrb	r3, [r3]
 324 0108 DBB2     		uxtb	r3, r3
 325 010a 1021     		movs	r1, #16
 326 010c 0B43     		orrs	r3, r1
 327 010e DBB2     		uxtb	r3, r3
 328 0110 1370     		strb	r3, [r2]
 329 0112 1BE0     		b	.L14
 330              	.L21:
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 5: *GPIO_ODR_LOW |= 32; break;
 331              		.loc 1 86 0
 332 0114 104A     		ldr	r2, .L25+4
 333 0116 104B     		ldr	r3, .L25+4
 334 0118 1B78     		ldrb	r3, [r3]
 335 011a DBB2     		uxtb	r3, r3
 336 011c 2021     		movs	r1, #32
 337 011e 0B43     		orrs	r3, r1
 338 0120 DBB2     		uxtb	r3, r3
 339 0122 1370     		strb	r3, [r2]
 340 0124 12E0     		b	.L14
 341              	.L22:
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 6: *GPIO_ODR_LOW |= 64; break;
 342              		.loc 1 87 0
 343 0126 0C4A     		ldr	r2, .L25+4
 344 0128 0B4B     		ldr	r3, .L25+4
 345 012a 1B78     		ldrb	r3, [r3]
 346 012c DBB2     		uxtb	r3, r3
 347 012e 4021     		movs	r1, #64
 348 0130 0B43     		orrs	r3, r1
 349 0132 DBB2     		uxtb	r3, r3
 350 0134 1370     		strb	r3, [r2]
 351 0136 09E0     		b	.L14
 352              	.L23:
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case 7: *GPIO_ODR_LOW |= 128; break;
 353              		.loc 1 88 0
 354 0138 0749     		ldr	r1, .L25+4
 355 013a 074B     		ldr	r3, .L25+4
 356 013c 1B78     		ldrb	r3, [r3]
 357 013e DBB2     		uxtb	r3, r3
 358 0140 8022     		movs	r2, #128
 359 0142 5242     		rsbs	r2, r2, #0
 360 0144 1343     		orrs	r3, r2
 361 0146 DBB2     		uxtb	r3, r3
 362 0148 0B70     		strb	r3, [r1]
 363 014a C046     		nop
 364              	.L14:
 365              	.L24:
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 366              		.loc 1 90 0
 367 014c C046     		nop
 368 014e BD46     		mov	sp, r7
 369 0150 02B0     		add	sp, sp, #8
 370              		@ sp needed
 371 0152 80BD     		pop	{r7, pc}
 372              	.L26:
 373              		.align	2
 374              	.L25:
 375 0154 00000000 		.word	.L16
 376 0158 14100240 		.word	1073877012
 377              		.cfi_endproc
 378              	.LFE5:
 380              		.align	1
 381              		.global	ascii_ctrl_bit_clear
 382              		.syntax unified
 383              		.code	16
 384              		.thumb_func
 385              		.fpu softvfp
 387              	ascii_ctrl_bit_clear:
 388              	.LFB6:
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_ctrl_bit_clear(unsigned int x) {
 389              		.loc 1 92 0
 390              		.cfi_startproc
 391              		@ args = 0, pretend = 0, frame = 8
 392              		@ frame_needed = 1, uses_anonymous_args = 0
 393 015c 80B5     		push	{r7, lr}
 394              		.cfi_def_cfa_offset 8
 395              		.cfi_offset 7, -8
 396              		.cfi_offset 14, -4
 397 015e 82B0     		sub	sp, sp, #8
 398              		.cfi_def_cfa_offset 16
 399 0160 00AF     		add	r7, sp, #0
 400              		.cfi_def_cfa_register 7
 401 0162 7860     		str	r0, [r7, #4]
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	switch(x) {
 402              		.loc 1 93 0
 403 0164 7B68     		ldr	r3, [r7, #4]
 404 0166 072B     		cmp	r3, #7
 405 0168 4DD8     		bhi	.L38
 406 016a 7B68     		ldr	r3, [r7, #4]
 407 016c 9A00     		lsls	r2, r3, #2
 408 016e 284B     		ldr	r3, .L39
 409 0170 D318     		adds	r3, r2, r3
 410 0172 1B68     		ldr	r3, [r3]
 411 0174 9F46     		mov	pc, r3
 412              		.section	.rodata
 413              		.align	2
 414              	.L30:
 415 0020 76010000 		.word	.L29
 416 0024 88010000 		.word	.L31
 417 0028 9A010000 		.word	.L32
 418 002c AC010000 		.word	.L33
 419 0030 BE010000 		.word	.L34
 420 0034 D0010000 		.word	.L35
 421 0038 E2010000 		.word	.L36
 422 003c F4010000 		.word	.L37
 423              		.text
 424              	.L29:
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(0): *GPIO_ODR_LOW &= 0xFE; break;
 425              		.loc 1 94 0
 426 0176 274A     		ldr	r2, .L39+4
 427 0178 264B     		ldr	r3, .L39+4
 428 017a 1B78     		ldrb	r3, [r3]
 429 017c DBB2     		uxtb	r3, r3
 430 017e 0121     		movs	r1, #1
 431 0180 8B43     		bics	r3, r1
 432 0182 DBB2     		uxtb	r3, r3
 433 0184 1370     		strb	r3, [r2]
 434 0186 3EE0     		b	.L28
 435              	.L31:
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(1): *GPIO_ODR_LOW &= 0xFD; break;
 436              		.loc 1 95 0
 437 0188 224A     		ldr	r2, .L39+4
 438 018a 224B     		ldr	r3, .L39+4
 439 018c 1B78     		ldrb	r3, [r3]
 440 018e DBB2     		uxtb	r3, r3
 441 0190 0221     		movs	r1, #2
 442 0192 8B43     		bics	r3, r1
 443 0194 DBB2     		uxtb	r3, r3
 444 0196 1370     		strb	r3, [r2]
 445 0198 35E0     		b	.L28
 446              	.L32:
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(2): *GPIO_ODR_LOW &= 0xFB; break;
 447              		.loc 1 96 0
 448 019a 1E4A     		ldr	r2, .L39+4
 449 019c 1D4B     		ldr	r3, .L39+4
 450 019e 1B78     		ldrb	r3, [r3]
 451 01a0 DBB2     		uxtb	r3, r3
 452 01a2 0421     		movs	r1, #4
 453 01a4 8B43     		bics	r3, r1
 454 01a6 DBB2     		uxtb	r3, r3
 455 01a8 1370     		strb	r3, [r2]
 456 01aa 2CE0     		b	.L28
 457              	.L33:
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(3): *GPIO_ODR_LOW &= 0xF7; break;
 458              		.loc 1 97 0
 459 01ac 194A     		ldr	r2, .L39+4
 460 01ae 194B     		ldr	r3, .L39+4
 461 01b0 1B78     		ldrb	r3, [r3]
 462 01b2 DBB2     		uxtb	r3, r3
 463 01b4 0821     		movs	r1, #8
 464 01b6 8B43     		bics	r3, r1
 465 01b8 DBB2     		uxtb	r3, r3
 466 01ba 1370     		strb	r3, [r2]
 467 01bc 23E0     		b	.L28
 468              	.L34:
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(4): *GPIO_ODR_LOW &= 0xEF; break;
 469              		.loc 1 98 0
 470 01be 154A     		ldr	r2, .L39+4
 471 01c0 144B     		ldr	r3, .L39+4
 472 01c2 1B78     		ldrb	r3, [r3]
 473 01c4 DBB2     		uxtb	r3, r3
 474 01c6 1021     		movs	r1, #16
 475 01c8 8B43     		bics	r3, r1
 476 01ca DBB2     		uxtb	r3, r3
 477 01cc 1370     		strb	r3, [r2]
 478 01ce 1AE0     		b	.L28
 479              	.L35:
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(5): *GPIO_ODR_LOW &= 0xDF; break;
 480              		.loc 1 99 0
 481 01d0 104A     		ldr	r2, .L39+4
 482 01d2 104B     		ldr	r3, .L39+4
 483 01d4 1B78     		ldrb	r3, [r3]
 484 01d6 DBB2     		uxtb	r3, r3
 485 01d8 2021     		movs	r1, #32
 486 01da 8B43     		bics	r3, r1
 487 01dc DBB2     		uxtb	r3, r3
 488 01de 1370     		strb	r3, [r2]
 489 01e0 11E0     		b	.L28
 490              	.L36:
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(6): *GPIO_ODR_LOW &= 0xBF; break;
 491              		.loc 1 100 0
 492 01e2 0C4A     		ldr	r2, .L39+4
 493 01e4 0B4B     		ldr	r3, .L39+4
 494 01e6 1B78     		ldrb	r3, [r3]
 495 01e8 DBB2     		uxtb	r3, r3
 496 01ea 4021     		movs	r1, #64
 497 01ec 8B43     		bics	r3, r1
 498 01ee DBB2     		uxtb	r3, r3
 499 01f0 1370     		strb	r3, [r2]
 500 01f2 08E0     		b	.L28
 501              	.L37:
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		case(7): *GPIO_ODR_LOW &= 0x7F; break;
 502              		.loc 1 101 0
 503 01f4 074A     		ldr	r2, .L39+4
 504 01f6 074B     		ldr	r3, .L39+4
 505 01f8 1B78     		ldrb	r3, [r3]
 506 01fa DBB2     		uxtb	r3, r3
 507 01fc 7F21     		movs	r1, #127
 508 01fe 0B40     		ands	r3, r1
 509 0200 DBB2     		uxtb	r3, r3
 510 0202 1370     		strb	r3, [r2]
 511 0204 C046     		nop
 512              	.L28:
 513              	.L38:
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 514              		.loc 1 103 0
 515 0206 C046     		nop
 516 0208 BD46     		mov	sp, r7
 517 020a 02B0     		add	sp, sp, #8
 518              		@ sp needed
 519 020c 80BD     		pop	{r7, pc}
 520              	.L40:
 521 020e C046     		.align	2
 522              	.L39:
 523 0210 20000000 		.word	.L30
 524 0214 14100240 		.word	1073877012
 525              		.cfi_endproc
 526              	.LFE6:
 528              		.align	1
 529              		.global	ascii_write_controller
 530              		.syntax unified
 531              		.code	16
 532              		.thumb_func
 533              		.fpu softvfp
 535              	ascii_write_controller:
 536              	.LFB7:
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_write_controller( unsigned char c ) {
 537              		.loc 1 106 0
 538              		.cfi_startproc
 539              		@ args = 0, pretend = 0, frame = 8
 540              		@ frame_needed = 1, uses_anonymous_args = 0
 541 0218 80B5     		push	{r7, lr}
 542              		.cfi_def_cfa_offset 8
 543              		.cfi_offset 7, -8
 544              		.cfi_offset 14, -4
 545 021a 82B0     		sub	sp, sp, #8
 546              		.cfi_def_cfa_offset 16
 547 021c 00AF     		add	r7, sp, #0
 548              		.cfi_def_cfa_register 7
 549 021e 0200     		movs	r2, r0
 550 0220 FB1D     		adds	r3, r7, #7
 551 0222 1A70     		strb	r2, [r3]
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_set(B_E);
 552              		.loc 1 107 0
 553 0224 0620     		movs	r0, #6
 554 0226 FFF7FEFF 		bl	ascii_ctrl_bit_set
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_ODR_HIGH = c;
 555              		.loc 1 108 0
 556 022a 064A     		ldr	r2, .L42
 557 022c FB1D     		adds	r3, r7, #7
 558 022e 1B78     		ldrb	r3, [r3]
 559 0230 1370     		strb	r3, [r2]
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	delay_250ns();
 560              		.loc 1 109 0
 561 0232 FFF7FEFF 		bl	delay_250ns
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_E);
 562              		.loc 1 110 0
 563 0236 0620     		movs	r0, #6
 564 0238 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 565              		.loc 1 111 0
 566 023c C046     		nop
 567 023e BD46     		mov	sp, r7
 568 0240 02B0     		add	sp, sp, #8
 569              		@ sp needed
 570 0242 80BD     		pop	{r7, pc}
 571              	.L43:
 572              		.align	2
 573              	.L42:
 574 0244 15100240 		.word	1073877013
 575              		.cfi_endproc
 576              	.LFE7:
 578              		.align	1
 579              		.global	ascii_read_controller
 580              		.syntax unified
 581              		.code	16
 582              		.thumb_func
 583              		.fpu softvfp
 585              	ascii_read_controller:
 586              	.LFB8:
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** unsigned char ascii_read_controller( void )
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** {
 587              		.loc 1 114 0
 588              		.cfi_startproc
 589              		@ args = 0, pretend = 0, frame = 8
 590              		@ frame_needed = 1, uses_anonymous_args = 0
 591 0248 80B5     		push	{r7, lr}
 592              		.cfi_def_cfa_offset 8
 593              		.cfi_offset 7, -8
 594              		.cfi_offset 14, -4
 595 024a 82B0     		sub	sp, sp, #8
 596              		.cfi_def_cfa_offset 16
 597 024c 00AF     		add	r7, sp, #0
 598              		.cfi_def_cfa_register 7
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_set(B_E);
 599              		.loc 1 115 0
 600 024e 0620     		movs	r0, #6
 601 0250 FFF7FEFF 		bl	ascii_ctrl_bit_set
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	delay_250ns();
 602              		.loc 1 116 0
 603 0254 FFF7FEFF 		bl	delay_250ns
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	delay_250ns();
 604              		.loc 1 117 0
 605 0258 FFF7FEFF 		bl	delay_250ns
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	unsigned char rv = *GPIO_IDR_HIGH;
 606              		.loc 1 118 0
 607 025c 064A     		ldr	r2, .L46
 608 025e FB1D     		adds	r3, r7, #7
 609 0260 1278     		ldrb	r2, [r2]
 610 0262 1A70     		strb	r2, [r3]
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_E);
 611              		.loc 1 119 0
 612 0264 0620     		movs	r0, #6
 613 0266 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	return rv;
 614              		.loc 1 120 0
 615 026a FB1D     		adds	r3, r7, #7
 616 026c 1B78     		ldrb	r3, [r3]
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 617              		.loc 1 121 0
 618 026e 1800     		movs	r0, r3
 619 0270 BD46     		mov	sp, r7
 620 0272 02B0     		add	sp, sp, #8
 621              		@ sp needed
 622 0274 80BD     		pop	{r7, pc}
 623              	.L47:
 624 0276 C046     		.align	2
 625              	.L46:
 626 0278 11100240 		.word	1073877009
 627              		.cfi_endproc
 628              	.LFE8:
 630              		.align	1
 631              		.global	ascii_write_cmd
 632              		.syntax unified
 633              		.code	16
 634              		.thumb_func
 635              		.fpu softvfp
 637              	ascii_write_cmd:
 638              	.LFB9:
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_write_cmd(unsigned char command){
 639              		.loc 1 123 0
 640              		.cfi_startproc
 641              		@ args = 0, pretend = 0, frame = 8
 642              		@ frame_needed = 1, uses_anonymous_args = 0
 643 027c 80B5     		push	{r7, lr}
 644              		.cfi_def_cfa_offset 8
 645              		.cfi_offset 7, -8
 646              		.cfi_offset 14, -4
 647 027e 82B0     		sub	sp, sp, #8
 648              		.cfi_def_cfa_offset 16
 649 0280 00AF     		add	r7, sp, #0
 650              		.cfi_def_cfa_register 7
 651 0282 0200     		movs	r2, r0
 652 0284 FB1D     		adds	r3, r7, #7
 653 0286 1A70     		strb	r2, [r3]
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_clear(B_RS);
 654              		.loc 1 124 0
 655 0288 0020     		movs	r0, #0
 656 028a FFF7FEFF 		bl	ascii_ctrl_bit_clear
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 657              		.loc 1 125 0
 658 028e 0120     		movs	r0, #1
 659 0290 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_write_controller(command);
 660              		.loc 1 126 0
 661 0294 FB1D     		adds	r3, r7, #7
 662 0296 1B78     		ldrb	r3, [r3]
 663 0298 1800     		movs	r0, r3
 664 029a FFF7FEFF 		bl	ascii_write_controller
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 665              		.loc 1 127 0
 666 029e C046     		nop
 667 02a0 BD46     		mov	sp, r7
 668 02a2 02B0     		add	sp, sp, #8
 669              		@ sp needed
 670 02a4 80BD     		pop	{r7, pc}
 671              		.cfi_endproc
 672              	.LFE9:
 674              		.align	1
 675              		.global	ascii_write_data
 676              		.syntax unified
 677              		.code	16
 678              		.thumb_func
 679              		.fpu softvfp
 681              	ascii_write_data:
 682              	.LFB10:
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_write_data(unsigned char data){
 683              		.loc 1 129 0
 684              		.cfi_startproc
 685              		@ args = 0, pretend = 0, frame = 8
 686              		@ frame_needed = 1, uses_anonymous_args = 0
 687 02a6 80B5     		push	{r7, lr}
 688              		.cfi_def_cfa_offset 8
 689              		.cfi_offset 7, -8
 690              		.cfi_offset 14, -4
 691 02a8 82B0     		sub	sp, sp, #8
 692              		.cfi_def_cfa_offset 16
 693 02aa 00AF     		add	r7, sp, #0
 694              		.cfi_def_cfa_register 7
 695 02ac 0200     		movs	r2, r0
 696 02ae FB1D     		adds	r3, r7, #7
 697 02b0 1A70     		strb	r2, [r3]
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_ctrl_bit_set(B_RS);
 698              		.loc 1 130 0
 699 02b2 0020     		movs	r0, #0
 700 02b4 FFF7FEFF 		bl	ascii_ctrl_bit_set
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 701              		.loc 1 131 0
 702 02b8 0120     		movs	r0, #1
 703 02ba FFF7FEFF 		bl	ascii_ctrl_bit_clear
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_write_controller(data);
 704              		.loc 1 132 0
 705 02be FB1D     		adds	r3, r7, #7
 706 02c0 1B78     		ldrb	r3, [r3]
 707 02c2 1800     		movs	r0, r3
 708 02c4 FFF7FEFF 		bl	ascii_write_controller
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 709              		.loc 1 133 0
 710 02c8 C046     		nop
 711 02ca BD46     		mov	sp, r7
 712 02cc 02B0     		add	sp, sp, #8
 713              		@ sp needed
 714 02ce 80BD     		pop	{r7, pc}
 715              		.cfi_endproc
 716              	.LFE10:
 718              		.align	1
 719              		.global	ascii_read_status
 720              		.syntax unified
 721              		.code	16
 722              		.thumb_func
 723              		.fpu softvfp
 725              	ascii_read_status:
 726              	.LFB11:
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** unsigned char ascii_read_status(void){
 727              		.loc 1 135 0
 728              		.cfi_startproc
 729              		@ args = 0, pretend = 0, frame = 8
 730              		@ frame_needed = 1, uses_anonymous_args = 0
 731 02d0 90B5     		push	{r4, r7, lr}
 732              		.cfi_def_cfa_offset 12
 733              		.cfi_offset 4, -12
 734              		.cfi_offset 7, -8
 735              		.cfi_offset 14, -4
 736 02d2 83B0     		sub	sp, sp, #12
 737              		.cfi_def_cfa_offset 24
 738 02d4 00AF     		add	r7, sp, #0
 739              		.cfi_def_cfa_register 7
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     *GPIO_MODER &= 0x0000FFFF;	
 740              		.loc 1 136 0
 741 02d6 114B     		ldr	r3, .L52
 742 02d8 104A     		ldr	r2, .L52
 743 02da 1268     		ldr	r2, [r2]
 744 02dc 1204     		lsls	r2, r2, #16
 745 02de 120C     		lsrs	r2, r2, #16
 746 02e0 1A60     		str	r2, [r3]
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 747              		.loc 1 137 0
 748 02e2 0020     		movs	r0, #0
 749 02e4 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_set(B_RW);
 750              		.loc 1 138 0
 751 02e8 0120     		movs	r0, #1
 752 02ea FFF7FEFF 		bl	ascii_ctrl_bit_set
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	unsigned char rv = ascii_read_controller();
 753              		.loc 1 139 0
 754 02ee FC1D     		adds	r4, r7, #7
 755 02f0 FFF7FEFF 		bl	ascii_read_controller
 756 02f4 0300     		movs	r3, r0
 757 02f6 2370     		strb	r3, [r4]
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 758              		.loc 1 140 0
 759 02f8 084B     		ldr	r3, .L52
 760 02fa 084A     		ldr	r2, .L52
 761 02fc 1268     		ldr	r2, [r2]
 762 02fe 1204     		lsls	r2, r2, #16
 763 0300 120C     		lsrs	r2, r2, #16
 764 0302 1A60     		str	r2, [r3]
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER |= 0x55550000;	
 765              		.loc 1 141 0
 766 0304 054B     		ldr	r3, .L52
 767 0306 054A     		ldr	r2, .L52
 768 0308 1268     		ldr	r2, [r2]
 769 030a 0549     		ldr	r1, .L52+4
 770 030c 0A43     		orrs	r2, r1
 771 030e 1A60     		str	r2, [r3]
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	return rv;
 772              		.loc 1 142 0
 773 0310 FB1D     		adds	r3, r7, #7
 774 0312 1B78     		ldrb	r3, [r3]
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 775              		.loc 1 143 0
 776 0314 1800     		movs	r0, r3
 777 0316 BD46     		mov	sp, r7
 778 0318 03B0     		add	sp, sp, #12
 779              		@ sp needed
 780 031a 90BD     		pop	{r4, r7, pc}
 781              	.L53:
 782              		.align	2
 783              	.L52:
 784 031c 00100240 		.word	1073876992
 785 0320 00005555 		.word	1431633920
 786              		.cfi_endproc
 787              	.LFE11:
 789              		.align	1
 790              		.global	ascii_read_data
 791              		.syntax unified
 792              		.code	16
 793              		.thumb_func
 794              		.fpu softvfp
 796              	ascii_read_data:
 797              	.LFB12:
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** unsigned char ascii_read_data(void){
 798              		.loc 1 145 0
 799              		.cfi_startproc
 800              		@ args = 0, pretend = 0, frame = 8
 801              		@ frame_needed = 1, uses_anonymous_args = 0
 802 0324 90B5     		push	{r4, r7, lr}
 803              		.cfi_def_cfa_offset 12
 804              		.cfi_offset 4, -12
 805              		.cfi_offset 7, -8
 806              		.cfi_offset 14, -4
 807 0326 83B0     		sub	sp, sp, #12
 808              		.cfi_def_cfa_offset 24
 809 0328 00AF     		add	r7, sp, #0
 810              		.cfi_def_cfa_register 7
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     *GPIO_MODER &= 0x0000FFFF;	
 811              		.loc 1 146 0
 812 032a 114B     		ldr	r3, .L56
 813 032c 104A     		ldr	r2, .L56
 814 032e 1268     		ldr	r2, [r2]
 815 0330 1204     		lsls	r2, r2, #16
 816 0332 120C     		lsrs	r2, r2, #16
 817 0334 1A60     		str	r2, [r3]
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_set(B_RS);
 818              		.loc 1 147 0
 819 0336 0020     		movs	r0, #0
 820 0338 FFF7FEFF 		bl	ascii_ctrl_bit_set
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_ctrl_bit_set(B_RW);
 821              		.loc 1 148 0
 822 033c 0120     		movs	r0, #1
 823 033e FFF7FEFF 		bl	ascii_ctrl_bit_set
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	unsigned char rv = ascii_read_controller();
 824              		.loc 1 149 0
 825 0342 FC1D     		adds	r4, r7, #7
 826 0344 FFF7FEFF 		bl	ascii_read_controller
 827 0348 0300     		movs	r3, r0
 828 034a 2370     		strb	r3, [r4]
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 829              		.loc 1 150 0
 830 034c 084B     		ldr	r3, .L56
 831 034e 084A     		ldr	r2, .L56
 832 0350 1268     		ldr	r2, [r2]
 833 0352 1204     		lsls	r2, r2, #16
 834 0354 120C     		lsrs	r2, r2, #16
 835 0356 1A60     		str	r2, [r3]
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	*GPIO_MODER |= 0x55550000;	
 836              		.loc 1 151 0
 837 0358 054B     		ldr	r3, .L56
 838 035a 054A     		ldr	r2, .L56
 839 035c 1268     		ldr	r2, [r2]
 840 035e 0549     		ldr	r1, .L56+4
 841 0360 0A43     		orrs	r2, r1
 842 0362 1A60     		str	r2, [r3]
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	return rv;
 843              		.loc 1 152 0
 844 0364 FB1D     		adds	r3, r7, #7
 845 0366 1B78     		ldrb	r3, [r3]
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 846              		.loc 1 153 0
 847 0368 1800     		movs	r0, r3
 848 036a BD46     		mov	sp, r7
 849 036c 03B0     		add	sp, sp, #12
 850              		@ sp needed
 851 036e 90BD     		pop	{r4, r7, pc}
 852              	.L57:
 853              		.align	2
 854              	.L56:
 855 0370 00100240 		.word	1073876992
 856 0374 00005555 		.word	1431633920
 857              		.cfi_endproc
 858              	.LFE12:
 860              		.align	1
 861              		.global	ascii_command
 862              		.syntax unified
 863              		.code	16
 864              		.thumb_func
 865              		.fpu softvfp
 867              	ascii_command:
 868              	.LFB13:
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_command(char command, unsigned int delayMicroSec){
 869              		.loc 1 155 0
 870              		.cfi_startproc
 871              		@ args = 0, pretend = 0, frame = 8
 872              		@ frame_needed = 1, uses_anonymous_args = 0
 873 0378 80B5     		push	{r7, lr}
 874              		.cfi_def_cfa_offset 8
 875              		.cfi_offset 7, -8
 876              		.cfi_offset 14, -4
 877 037a 82B0     		sub	sp, sp, #8
 878              		.cfi_def_cfa_offset 16
 879 037c 00AF     		add	r7, sp, #0
 880              		.cfi_def_cfa_register 7
 881 037e 0200     		movs	r2, r0
 882 0380 3960     		str	r1, [r7]
 883 0382 FB1D     		adds	r3, r7, #7
 884 0384 1A70     		strb	r2, [r3]
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     while((ascii_read_status() & 0x80) == 0x80) {
 885              		.loc 1 156 0
 886 0386 C046     		nop
 887              	.L59:
 888              		.loc 1 156 0 is_stmt 0 discriminator 1
 889 0388 FFF7FEFF 		bl	ascii_read_status
 890 038c 0300     		movs	r3, r0
 891 038e 1A00     		movs	r2, r3
 892 0390 8023     		movs	r3, #128
 893 0392 1340     		ands	r3, r2
 894 0394 802B     		cmp	r3, #128
 895 0396 F7D0     		beq	.L59
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****             //TODO implement pip subroutine
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         }
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(8);
 896              		.loc 1 159 0 is_stmt 1
 897 0398 0820     		movs	r0, #8
 898 039a FFF7FEFF 		bl	delay_micro
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_write_cmd(command);
 899              		.loc 1 160 0
 900 039e FB1D     		adds	r3, r7, #7
 901 03a0 1B78     		ldrb	r3, [r3]
 902 03a2 1800     		movs	r0, r3
 903 03a4 FFF7FEFF 		bl	ascii_write_cmd
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(delayMicroSec);
 904              		.loc 1 161 0
 905 03a8 3B68     		ldr	r3, [r7]
 906 03aa 1800     		movs	r0, r3
 907 03ac FFF7FEFF 		bl	delay_micro
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 908              		.loc 1 162 0
 909 03b0 C046     		nop
 910 03b2 BD46     		mov	sp, r7
 911 03b4 02B0     		add	sp, sp, #8
 912              		@ sp needed
 913 03b6 80BD     		pop	{r7, pc}
 914              		.cfi_endproc
 915              	.LFE13:
 917              		.align	1
 918              		.global	ascii_init
 919              		.syntax unified
 920              		.code	16
 921              		.thumb_func
 922              		.fpu softvfp
 924              	ascii_init:
 925              	.LFB14:
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_init(void){
 926              		.loc 1 164 0
 927              		.cfi_startproc
 928              		@ args = 0, pretend = 0, frame = 0
 929              		@ frame_needed = 1, uses_anonymous_args = 0
 930 03b8 80B5     		push	{r7, lr}
 931              		.cfi_def_cfa_offset 8
 932              		.cfi_offset 7, -8
 933              		.cfi_offset 14, -4
 934 03ba 00AF     		add	r7, sp, #0
 935              		.cfi_def_cfa_register 7
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_ctrl_bit_set(B_SELECT);
 936              		.loc 1 165 0
 937 03bc 0220     		movs	r0, #2
 938 03be FFF7FEFF 		bl	ascii_ctrl_bit_set
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0x38, 40); //Set disp size, delay 40 ms
 939              		.loc 1 166 0
 940 03c2 2821     		movs	r1, #40
 941 03c4 3820     		movs	r0, #56
 942 03c6 FFF7FEFF 		bl	ascii_command
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0xE, 40); //delay set to 40 bcs DR.eHugo
 943              		.loc 1 167 0
 944 03ca 2821     		movs	r1, #40
 945 03cc 0E20     		movs	r0, #14
 946 03ce FFF7FEFF 		bl	ascii_command
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0x01, 1530); // Cls
 947              		.loc 1 168 0
 948 03d2 064B     		ldr	r3, .L61
 949 03d4 1900     		movs	r1, r3
 950 03d6 0120     		movs	r0, #1
 951 03d8 FFF7FEFF 		bl	ascii_command
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****         ascii_command(0x6, 40); // Inc
 952              		.loc 1 169 0
 953 03dc 2821     		movs	r1, #40
 954 03de 0620     		movs	r0, #6
 955 03e0 FFF7FEFF 		bl	ascii_command
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 956              		.loc 1 170 0
 957 03e4 C046     		nop
 958 03e6 BD46     		mov	sp, r7
 959              		@ sp needed
 960 03e8 80BD     		pop	{r7, pc}
 961              	.L62:
 962 03ea C046     		.align	2
 963              	.L61:
 964 03ec FA050000 		.word	1530
 965              		.cfi_endproc
 966              	.LFE14:
 968              		.align	1
 969              		.global	ascii_write_char
 970              		.syntax unified
 971              		.code	16
 972              		.thumb_func
 973              		.fpu softvfp
 975              	ascii_write_char:
 976              	.LFB15:
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void ascii_write_char(char c){
 977              		.loc 1 172 0
 978              		.cfi_startproc
 979              		@ args = 0, pretend = 0, frame = 8
 980              		@ frame_needed = 1, uses_anonymous_args = 0
 981 03f0 80B5     		push	{r7, lr}
 982              		.cfi_def_cfa_offset 8
 983              		.cfi_offset 7, -8
 984              		.cfi_offset 14, -4
 985 03f2 82B0     		sub	sp, sp, #8
 986              		.cfi_def_cfa_offset 16
 987 03f4 00AF     		add	r7, sp, #0
 988              		.cfi_def_cfa_register 7
 989 03f6 0200     		movs	r2, r0
 990 03f8 FB1D     		adds	r3, r7, #7
 991 03fa 1A70     		strb	r2, [r3]
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     while((ascii_read_status() & 0x80) == 0x80) {
 992              		.loc 1 173 0
 993 03fc C046     		nop
 994              	.L64:
 995              		.loc 1 173 0 is_stmt 0 discriminator 1
 996 03fe FFF7FEFF 		bl	ascii_read_status
 997 0402 0300     		movs	r3, r0
 998 0404 1A00     		movs	r2, r3
 999 0406 8023     		movs	r3, #128
 1000 0408 1340     		ands	r3, r2
 1001 040a 802B     		cmp	r3, #128
 1002 040c F7D0     		beq	.L64
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	// TODO: implement pip subroutines
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(8);
 1003              		.loc 1 176 0 is_stmt 1
 1004 040e 0820     		movs	r0, #8
 1005 0410 FFF7FEFF 		bl	delay_micro
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_write_data(c);
 1006              		.loc 1 177 0
 1007 0414 FB1D     		adds	r3, r7, #7
 1008 0416 1B78     		ldrb	r3, [r3]
 1009 0418 1800     		movs	r0, r3
 1010 041a FFF7FEFF 		bl	ascii_write_data
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     delay_micro(45);
 1011              		.loc 1 178 0
 1012 041e 2D20     		movs	r0, #45
 1013 0420 FFF7FEFF 		bl	delay_micro
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     }
 1014              		.loc 1 179 0
 1015 0424 C046     		nop
 1016 0426 BD46     		mov	sp, r7
 1017 0428 02B0     		add	sp, sp, #8
 1018              		@ sp needed
 1019 042a 80BD     		pop	{r7, pc}
 1020              		.cfi_endproc
 1021              	.LFE15:
 1023              		.align	1
 1024              		.global	goToXY
 1025              		.syntax unified
 1026              		.code	16
 1027              		.thumb_func
 1028              		.fpu softvfp
 1030              	goToXY:
 1031              	.LFB16:
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** void goToXY(unsigned char row, unsigned char column) {
 1032              		.loc 1 181 0
 1033              		.cfi_startproc
 1034              		@ args = 0, pretend = 0, frame = 16
 1035              		@ frame_needed = 1, uses_anonymous_args = 0
 1036 042c 80B5     		push	{r7, lr}
 1037              		.cfi_def_cfa_offset 8
 1038              		.cfi_offset 7, -8
 1039              		.cfi_offset 14, -4
 1040 042e 84B0     		sub	sp, sp, #16
 1041              		.cfi_def_cfa_offset 24
 1042 0430 00AF     		add	r7, sp, #0
 1043              		.cfi_def_cfa_register 7
 1044 0432 0200     		movs	r2, r0
 1045 0434 FB1D     		adds	r3, r7, #7
 1046 0436 1A70     		strb	r2, [r3]
 1047 0438 BB1D     		adds	r3, r7, #6
 1048 043a 0A1C     		adds	r2, r1, #0
 1049 043c 1A70     		strb	r2, [r3]
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	unsigned char address = row - 1;
 1050              		.loc 1 182 0
 1051 043e 0F23     		movs	r3, #15
 1052 0440 FB18     		adds	r3, r7, r3
 1053 0442 FA1D     		adds	r2, r7, #7
 1054 0444 1278     		ldrb	r2, [r2]
 1055 0446 013A     		subs	r2, r2, #1
 1056 0448 1A70     		strb	r2, [r3]
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	if(column == 2) {
 1057              		.loc 1 183 0
 1058 044a BB1D     		adds	r3, r7, #6
 1059 044c 1B78     		ldrb	r3, [r3]
 1060 044e 022B     		cmp	r3, #2
 1061 0450 06D1     		bne	.L66
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		address = address + 0x40;
 1062              		.loc 1 184 0
 1063 0452 0F23     		movs	r3, #15
 1064 0454 FB18     		adds	r3, r7, r3
 1065 0456 0F22     		movs	r2, #15
 1066 0458 BA18     		adds	r2, r7, r2
 1067 045a 1278     		ldrb	r2, [r2]
 1068 045c 4032     		adds	r2, r2, #64
 1069 045e 1A70     		strb	r2, [r3]
 1070              	.L66:
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	ascii_write_cmd(0x80 | address);
 1071              		.loc 1 186 0
 1072 0460 0F23     		movs	r3, #15
 1073 0462 FB18     		adds	r3, r7, r3
 1074 0464 1B78     		ldrb	r3, [r3]
 1075 0466 8022     		movs	r2, #128
 1076 0468 5242     		rsbs	r2, r2, #0
 1077 046a 1343     		orrs	r3, r2
 1078 046c DBB2     		uxtb	r3, r3
 1079 046e 1800     		movs	r0, r3
 1080 0470 FFF7FEFF 		bl	ascii_write_cmd
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 1081              		.loc 1 187 0
 1082 0474 C046     		nop
 1083 0476 BD46     		mov	sp, r7
 1084 0478 04B0     		add	sp, sp, #16
 1085              		@ sp needed
 1086 047a 80BD     		pop	{r7, pc}
 1087              		.cfi_endproc
 1088              	.LFE16:
 1090              		.section	.rodata
 1091              		.align	2
 1092              	.LC2:
 1093 0040 416C6661 		.ascii	"Alfanumerisk \000"
 1093      6E756D65 
 1093      7269736B 
 1093      2000
 1094 004e 0000     		.align	2
 1095              	.LC4:
 1096 0050 44697370 		.ascii	"Display - test\000"
 1096      6C617920 
 1096      2D207465 
 1096      737400
 1097              		.text
 1098              		.align	1
 1099              		.global	main
 1100              		.syntax unified
 1101              		.code	16
 1102              		.thumb_func
 1103              		.fpu softvfp
 1105              	main:
 1106              	.LFB17:
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** int main(int argc, char **argv) {
 1107              		.loc 1 191 0
 1108              		.cfi_startproc
 1109              		@ args = 0, pretend = 0, frame = 48
 1110              		@ frame_needed = 1, uses_anonymous_args = 0
 1111 047c 90B5     		push	{r4, r7, lr}
 1112              		.cfi_def_cfa_offset 12
 1113              		.cfi_offset 4, -12
 1114              		.cfi_offset 7, -8
 1115              		.cfi_offset 14, -4
 1116 047e 8DB0     		sub	sp, sp, #52
 1117              		.cfi_def_cfa_offset 64
 1118 0480 00AF     		add	r7, sp, #0
 1119              		.cfi_def_cfa_register 7
 1120 0482 7860     		str	r0, [r7, #4]
 1121 0484 3960     		str	r1, [r7]
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     char *s;
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	char test1[] = "Alfanumerisk ";
 1122              		.loc 1 194 0
 1123 0486 1C23     		movs	r3, #28
 1124 0488 FB18     		adds	r3, r7, r3
 1125 048a 1E4A     		ldr	r2, .L73
 1126 048c 13CA     		ldmia	r2!, {r0, r1, r4}
 1127 048e 13C3     		stmia	r3!, {r0, r1, r4}
 1128 0490 1288     		ldrh	r2, [r2]
 1129 0492 1A80     		strh	r2, [r3]
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	char test2[] = "Display - test";
 1130              		.loc 1 195 0
 1131 0494 0C23     		movs	r3, #12
 1132 0496 FB18     		adds	r3, r7, r3
 1133 0498 1B4A     		ldr	r2, .L73+4
 1134 049a 13CA     		ldmia	r2!, {r0, r1, r4}
 1135 049c 13C3     		stmia	r3!, {r0, r1, r4}
 1136 049e 1188     		ldrh	r1, [r2]
 1137 04a0 1980     		strh	r1, [r3]
 1138 04a2 9278     		ldrb	r2, [r2, #2]
 1139 04a4 9A70     		strb	r2, [r3, #2]
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     init_app();
 1140              		.loc 1 197 0
 1141 04a6 FFF7FEFF 		bl	init_app
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c ****     ascii_init();
 1142              		.loc 1 198 0
 1143 04aa FFF7FEFF 		bl	ascii_init
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	goToXY(1,1);
 1144              		.loc 1 199 0
 1145 04ae 0121     		movs	r1, #1
 1146 04b0 0120     		movs	r0, #1
 1147 04b2 FFF7FEFF 		bl	goToXY
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	s = test1;
 1148              		.loc 1 201 0
 1149 04b6 1C23     		movs	r3, #28
 1150 04b8 FB18     		adds	r3, r7, r3
 1151 04ba FB62     		str	r3, [r7, #44]
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1152              		.loc 1 202 0
 1153 04bc 06E0     		b	.L68
 1154              	.L69:
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		ascii_write_char(*s++);
 1155              		.loc 1 203 0
 1156 04be FB6A     		ldr	r3, [r7, #44]
 1157 04c0 5A1C     		adds	r2, r3, #1
 1158 04c2 FA62     		str	r2, [r7, #44]
 1159 04c4 1B78     		ldrb	r3, [r3]
 1160 04c6 1800     		movs	r0, r3
 1161 04c8 FFF7FEFF 		bl	ascii_write_char
 1162              	.L68:
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1163              		.loc 1 202 0
 1164 04cc FB6A     		ldr	r3, [r7, #44]
 1165 04ce 1B78     		ldrb	r3, [r3]
 1166 04d0 002B     		cmp	r3, #0
 1167 04d2 F4D1     		bne	.L69
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	goToXY(1,2);
 1168              		.loc 1 205 0
 1169 04d4 0221     		movs	r1, #2
 1170 04d6 0120     		movs	r0, #1
 1171 04d8 FFF7FEFF 		bl	goToXY
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	s = test2;
 1172              		.loc 1 206 0
 1173 04dc 0C23     		movs	r3, #12
 1174 04de FB18     		adds	r3, r7, r3
 1175 04e0 FB62     		str	r3, [r7, #44]
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1176              		.loc 1 207 0
 1177 04e2 06E0     		b	.L70
 1178              	.L71:
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 		ascii_write_char(*s++);
 1179              		.loc 1 208 0
 1180 04e4 FB6A     		ldr	r3, [r7, #44]
 1181 04e6 5A1C     		adds	r2, r3, #1
 1182 04e8 FA62     		str	r2, [r7, #44]
 1183 04ea 1B78     		ldrb	r3, [r3]
 1184 04ec 1800     		movs	r0, r3
 1185 04ee FFF7FEFF 		bl	ascii_write_char
 1186              	.L70:
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	while(*s) {
 1187              		.loc 1 207 0
 1188 04f2 FB6A     		ldr	r3, [r7, #44]
 1189 04f4 1B78     		ldrb	r3, [r3]
 1190 04f6 002B     		cmp	r3, #0
 1191 04f8 F4D1     		bne	.L71
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	}
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** 	return 0;
 1192              		.loc 1 210 0
 1193 04fa 0023     		movs	r3, #0
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/basic_io/startup.c **** }
 1194              		.loc 1 211 0
 1195 04fc 1800     		movs	r0, r3
 1196 04fe BD46     		mov	sp, r7
 1197 0500 0DB0     		add	sp, sp, #52
 1198              		@ sp needed
 1199 0502 90BD     		pop	{r4, r7, pc}
 1200              	.L74:
 1201              		.align	2
 1202              	.L73:
 1203 0504 40000000 		.word	.LC2
 1204 0508 50000000 		.word	.LC4
 1205              		.cfi_endproc
 1206              	.LFE17:
 1208              	.Letext0:
