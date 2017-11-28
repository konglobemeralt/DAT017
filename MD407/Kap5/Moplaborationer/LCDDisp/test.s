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
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // Timer setup
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK 0xE000E010
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // Port E setup
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_E 0x40021000
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // Control for display
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_E 0x40
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_SELECT 0x04
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RW 0x02
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RS 0x01
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RST 0x20
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_CS2 0x10
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_CS1 0x08
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_ON 0x3F
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_OFF 0x3E
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_DISP_START 0xC0
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_SET_ADD 0x40
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_SET_PAGE 0xB8
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_BUSY 0x80
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define SIMULATOR // DO it
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** typedef unsigned char uint8_t;
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup ( void )
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
  26              		.loc 1 41 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** __asm volatile(
  31              		.loc 1 42 0
  32              		.syntax divided
  33              	@ 42 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" MOV SP,R0\n"
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" BL main\n"				/* call main */
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	"_exit: B .\n"				/* never return */
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	) ;
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
  40              		.loc 1 48 0
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
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void init_app(void) {
  57              		.loc 1 50 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	// Setup output pins for display
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*GPIO_MODER = 0x55555555;
  67              		.loc 1 52 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** //	*GPIO_OTYPER = 0x7777;
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** //	*GPIO_PUPDR = 0xAAAAAAAA;
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** //	*GPIO_ODR_HIGH = 0;
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** //	*GPIO_ODR_LOW = 0;
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** //	*GPIO_IDR_HIGH = 0;
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
  71              		.loc 1 58 0
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
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_250ns(void) {
  93              		.loc 1 60 0
  94              		.cfi_startproc
  95              		@ args = 0, pretend = 0, frame = 0
  96              		@ frame_needed = 1, uses_anonymous_args = 0
  97 0018 80B5     		push	{r7, lr}
  98              		.cfi_def_cfa_offset 8
  99              		.cfi_offset 7, -8
 100              		.cfi_offset 14, -4
 101 001a 00AF     		add	r7, sp, #0
 102              		.cfi_def_cfa_register 7
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 0;
 103              		.loc 1 61 0
 104 001c 0C4B     		ldr	r3, .L7
 105 001e 0022     		movs	r2, #0
 106 0020 1A60     		str	r2, [r3]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 107              		.loc 1 62 0
 108 0022 0C4B     		ldr	r3, .L7+4
 109 0024 3122     		movs	r2, #49
 110 0026 1A60     		str	r2, [r3]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_VAL = 0;
 111              		.loc 1 63 0
 112 0028 0B4B     		ldr	r3, .L7+8
 113 002a 0022     		movs	r2, #0
 114 002c 1A60     		str	r2, [r3]
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 5;
 115              		.loc 1 64 0
 116 002e 084B     		ldr	r3, .L7
 117 0030 0522     		movs	r2, #5
 118 0032 1A60     		str	r2, [r3]
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 119              		.loc 1 65 0
 120 0034 C046     		nop
 121              	.L6:
 122              		.loc 1 65 0 is_stmt 0 discriminator 1
 123 0036 064B     		ldr	r3, .L7
 124 0038 1A68     		ldr	r2, [r3]
 125 003a 8023     		movs	r3, #128
 126 003c 5B02     		lsls	r3, r3, #9
 127 003e 1340     		ands	r3, r2
 128 0040 F9D0     		beq	.L6
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		// Do nothing :S
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 0;
 129              		.loc 1 68 0 is_stmt 1
 130 0042 034B     		ldr	r3, .L7
 131 0044 0022     		movs	r2, #0
 132 0046 1A60     		str	r2, [r3]
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 133              		.loc 1 69 0
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
 148              		.global	delay_mikro
 149              		.syntax unified
 150              		.code	16
 151              		.thumb_func
 152              		.fpu softvfp
 154              	delay_mikro:
 155              	.LFB3:
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_mikro(unsigned int us) {
 156              		.loc 1 71 0
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
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while(us--) {
 169              		.loc 1 72 0
 170 0064 07E0     		b	.L10
 171              	.L11:
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 172              		.loc 1 73 0
 173 0066 FFF7FEFF 		bl	delay_250ns
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 174              		.loc 1 74 0
 175 006a FFF7FEFF 		bl	delay_250ns
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 176              		.loc 1 75 0
 177 006e FFF7FEFF 		bl	delay_250ns
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 178              		.loc 1 76 0
 179 0072 FFF7FEFF 		bl	delay_250ns
 180              	.L10:
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 181              		.loc 1 72 0
 182 0076 7B68     		ldr	r3, [r7, #4]
 183 0078 5A1E     		subs	r2, r3, #1
 184 007a 7A60     		str	r2, [r7, #4]
 185 007c 002B     		cmp	r3, #0
 186 007e F2D1     		bne	.L11
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 187              		.loc 1 78 0
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
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_milli(unsigned int ms) {
 205              		.loc 1 80 0
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
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#ifdef SIMULATOR
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_mikro(ms);
 218              		.loc 1 82 0
 219 0090 7B68     		ldr	r3, [r7, #4]
 220 0092 1800     		movs	r0, r3
 221 0094 FFF7FEFF 		bl	delay_mikro
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#else
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_mikro(1000 * ms);
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#endif
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 222              		.loc 1 86 0
 223 0098 C046     		nop
 224 009a BD46     		mov	sp, r7
 225 009c 02B0     		add	sp, sp, #8
 226              		@ sp needed
 227 009e 80BD     		pop	{r7, pc}
 228              		.cfi_endproc
 229              	.LFE4:
 231              		.align	1
 232              		.global	delay_500ns
 233              		.syntax unified
 234              		.code	16
 235              		.thumb_func
 236              		.fpu softvfp
 238              	delay_500ns:
 239              	.LFB5:
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_500ns(void) {
 240              		.loc 1 88 0
 241              		.cfi_startproc
 242              		@ args = 0, pretend = 0, frame = 0
 243              		@ frame_needed = 1, uses_anonymous_args = 0
 244 00a0 80B5     		push	{r7, lr}
 245              		.cfi_def_cfa_offset 8
 246              		.cfi_offset 7, -8
 247              		.cfi_offset 14, -4
 248 00a2 00AF     		add	r7, sp, #0
 249              		.cfi_def_cfa_register 7
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_250ns();
 250              		.loc 1 89 0
 251 00a4 FFF7FEFF 		bl	delay_250ns
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_250ns();
 252              		.loc 1 90 0
 253 00a8 FFF7FEFF 		bl	delay_250ns
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 254              		.loc 1 91 0
 255 00ac C046     		nop
 256 00ae BD46     		mov	sp, r7
 257              		@ sp needed
 258 00b0 80BD     		pop	{r7, pc}
 259              		.cfi_endproc
 260              	.LFE5:
 262              		.align	1
 263              		.global	graphic_ctrl_bit_set
 264              		.syntax unified
 265              		.code	16
 266              		.thumb_func
 267              		.fpu softvfp
 269              	graphic_ctrl_bit_set:
 270              	.LFB6:
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_ctrl_bit_set(uint8_t x) {
 271              		.loc 1 93 0
 272              		.cfi_startproc
 273              		@ args = 0, pretend = 0, frame = 8
 274              		@ frame_needed = 1, uses_anonymous_args = 0
 275 00b2 80B5     		push	{r7, lr}
 276              		.cfi_def_cfa_offset 8
 277              		.cfi_offset 7, -8
 278              		.cfi_offset 14, -4
 279 00b4 82B0     		sub	sp, sp, #8
 280              		.cfi_def_cfa_offset 16
 281 00b6 00AF     		add	r7, sp, #0
 282              		.cfi_def_cfa_register 7
 283 00b8 0200     		movs	r2, r0
 284 00ba FB1D     		adds	r3, r7, #7
 285 00bc 1A70     		strb	r2, [r3]
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
 286              		.loc 1 94 0
 287 00be 0949     		ldr	r1, .L15
 288 00c0 084B     		ldr	r3, .L15
 289 00c2 1B78     		ldrb	r3, [r3]
 290 00c4 DBB2     		uxtb	r3, r3
 291 00c6 5AB2     		sxtb	r2, r3
 292 00c8 FB1D     		adds	r3, r7, #7
 293 00ca 1B78     		ldrb	r3, [r3]
 294 00cc 5BB2     		sxtb	r3, r3
 295 00ce 0420     		movs	r0, #4
 296 00d0 8343     		bics	r3, r0
 297 00d2 5BB2     		sxtb	r3, r3
 298 00d4 1343     		orrs	r3, r2
 299 00d6 5BB2     		sxtb	r3, r3
 300 00d8 DBB2     		uxtb	r3, r3
 301 00da 0B70     		strb	r3, [r1]
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 302              		.loc 1 95 0
 303 00dc C046     		nop
 304 00de BD46     		mov	sp, r7
 305 00e0 02B0     		add	sp, sp, #8
 306              		@ sp needed
 307 00e2 80BD     		pop	{r7, pc}
 308              	.L16:
 309              		.align	2
 310              	.L15:
 311 00e4 14100240 		.word	1073877012
 312              		.cfi_endproc
 313              	.LFE6:
 315              		.align	1
 316              		.global	graphic_ctrl_bit_clear
 317              		.syntax unified
 318              		.code	16
 319              		.thumb_func
 320              		.fpu softvfp
 322              	graphic_ctrl_bit_clear:
 323              	.LFB7:
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_ctrl_bit_clear(uint8_t x) {
 324              		.loc 1 97 0
 325              		.cfi_startproc
 326              		@ args = 0, pretend = 0, frame = 8
 327              		@ frame_needed = 1, uses_anonymous_args = 0
 328 00e8 80B5     		push	{r7, lr}
 329              		.cfi_def_cfa_offset 8
 330              		.cfi_offset 7, -8
 331              		.cfi_offset 14, -4
 332 00ea 82B0     		sub	sp, sp, #8
 333              		.cfi_def_cfa_offset 16
 334 00ec 00AF     		add	r7, sp, #0
 335              		.cfi_def_cfa_register 7
 336 00ee 0200     		movs	r2, r0
 337 00f0 FB1D     		adds	r3, r7, #7
 338 00f2 1A70     		strb	r2, [r3]
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     *GPIO_ODR_LOW &= ~x;
 339              		.loc 1 98 0
 340 00f4 0849     		ldr	r1, .L18
 341 00f6 084B     		ldr	r3, .L18
 342 00f8 1B78     		ldrb	r3, [r3]
 343 00fa DBB2     		uxtb	r3, r3
 344 00fc 5BB2     		sxtb	r3, r3
 345 00fe FA1D     		adds	r2, r7, #7
 346 0100 1278     		ldrb	r2, [r2]
 347 0102 52B2     		sxtb	r2, r2
 348 0104 D243     		mvns	r2, r2
 349 0106 52B2     		sxtb	r2, r2
 350 0108 1340     		ands	r3, r2
 351 010a 5BB2     		sxtb	r3, r3
 352 010c DBB2     		uxtb	r3, r3
 353 010e 0B70     		strb	r3, [r1]
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 354              		.loc 1 99 0
 355 0110 C046     		nop
 356 0112 BD46     		mov	sp, r7
 357 0114 02B0     		add	sp, sp, #8
 358              		@ sp needed
 359 0116 80BD     		pop	{r7, pc}
 360              	.L19:
 361              		.align	2
 362              	.L18:
 363 0118 14100240 		.word	1073877012
 364              		.cfi_endproc
 365              	.LFE7:
 367              		.align	1
 368              		.global	select_cotroller
 369              		.syntax unified
 370              		.code	16
 371              		.thumb_func
 372              		.fpu softvfp
 374              	select_cotroller:
 375              	.LFB8:
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void select_cotroller(uint8_t controller) {
 376              		.loc 1 101 0
 377              		.cfi_startproc
 378              		@ args = 0, pretend = 0, frame = 8
 379              		@ frame_needed = 1, uses_anonymous_args = 0
 380 011c 80B5     		push	{r7, lr}
 381              		.cfi_def_cfa_offset 8
 382              		.cfi_offset 7, -8
 383              		.cfi_offset 14, -4
 384 011e 82B0     		sub	sp, sp, #8
 385              		.cfi_def_cfa_offset 16
 386 0120 00AF     		add	r7, sp, #0
 387              		.cfi_def_cfa_register 7
 388 0122 0200     		movs	r2, r0
 389 0124 FB1D     		adds	r3, r7, #7
 390 0126 1A70     		strb	r2, [r3]
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	if(controller == 0) {
 391              		.loc 1 102 0
 392 0128 FB1D     		adds	r3, r7, #7
 393 012a 1B78     		ldrb	r3, [r3]
 394 012c 002B     		cmp	r3, #0
 395 012e 06D1     		bne	.L21
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 396              		.loc 1 103 0
 397 0130 0820     		movs	r0, #8
 398 0132 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 399              		.loc 1 104 0
 400 0136 1020     		movs	r0, #16
 401 0138 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	} else if(controller == (B_CS1 | B_CS2)) {
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	} else if(controller == B_CS1) {
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	} else if(controller == B_CS2) {
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 402              		.loc 1 115 0
 403 013c 1FE0     		b	.L25
 404              	.L21:
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	} else if(controller == (B_CS1 | B_CS2)) {
 405              		.loc 1 105 0
 406 013e FB1D     		adds	r3, r7, #7
 407 0140 1B78     		ldrb	r3, [r3]
 408 0142 182B     		cmp	r3, #24
 409 0144 06D1     		bne	.L23
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 410              		.loc 1 106 0
 411 0146 0820     		movs	r0, #8
 412 0148 FFF7FEFF 		bl	graphic_ctrl_bit_set
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	} else if(controller == B_CS1) {
 413              		.loc 1 107 0
 414 014c 1020     		movs	r0, #16
 415 014e FFF7FEFF 		bl	graphic_ctrl_bit_set
 416              		.loc 1 115 0
 417 0152 14E0     		b	.L25
 418              	.L23:
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 419              		.loc 1 108 0
 420 0154 FB1D     		adds	r3, r7, #7
 421 0156 1B78     		ldrb	r3, [r3]
 422 0158 082B     		cmp	r3, #8
 423 015a 06D1     		bne	.L24
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 424              		.loc 1 109 0
 425 015c 0820     		movs	r0, #8
 426 015e FFF7FEFF 		bl	graphic_ctrl_bit_set
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	} else if(controller == B_CS2) {
 427              		.loc 1 110 0
 428 0162 1020     		movs	r0, #16
 429 0164 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 430              		.loc 1 115 0
 431 0168 09E0     		b	.L25
 432              	.L24:
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 433              		.loc 1 111 0
 434 016a FB1D     		adds	r3, r7, #7
 435 016c 1B78     		ldrb	r3, [r3]
 436 016e 102B     		cmp	r3, #16
 437 0170 05D1     		bne	.L25
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 438              		.loc 1 112 0
 439 0172 0820     		movs	r0, #8
 440 0174 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 441              		.loc 1 113 0
 442 0178 1020     		movs	r0, #16
 443 017a FFF7FEFF 		bl	graphic_ctrl_bit_set
 444              	.L25:
 445              		.loc 1 115 0
 446 017e C046     		nop
 447 0180 BD46     		mov	sp, r7
 448 0182 02B0     		add	sp, sp, #8
 449              		@ sp needed
 450 0184 80BD     		pop	{r7, pc}
 451              		.cfi_endproc
 452              	.LFE8:
 454              		.align	1
 455              		.global	graphic_wait_ready
 456              		.syntax unified
 457              		.code	16
 458              		.thumb_func
 459              		.fpu softvfp
 461              	graphic_wait_ready:
 462              	.LFB9:
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_wait_ready() {
 463              		.loc 1 117 0
 464              		.cfi_startproc
 465              		@ args = 0, pretend = 0, frame = 8
 466              		@ frame_needed = 1, uses_anonymous_args = 0
 467 0186 80B5     		push	{r7, lr}
 468              		.cfi_def_cfa_offset 8
 469              		.cfi_offset 7, -8
 470              		.cfi_offset 14, -4
 471 0188 82B0     		sub	sp, sp, #8
 472              		.cfi_def_cfa_offset 16
 473 018a 00AF     		add	r7, sp, #0
 474              		.cfi_def_cfa_register 7
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 475              		.loc 1 118 0
 476 018c 4020     		movs	r0, #64
 477 018e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*GPIO_MODER = 0x00005555;
 478              		.loc 1 119 0
 479 0192 154B     		ldr	r3, .L32
 480 0194 154A     		ldr	r2, .L32+4
 481 0196 1A60     		str	r2, [r3]
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 482              		.loc 1 120 0
 483 0198 0120     		movs	r0, #1
 484 019a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_RW);
 485              		.loc 1 121 0
 486 019e 0220     		movs	r0, #2
 487 01a0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_500ns();
 488              		.loc 1 122 0
 489 01a4 FFF7FEFF 		bl	delay_500ns
 490              	.L29:
 491              	.LBB2:
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while(1) { // Wait for display not to be busy
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_E);
 492              		.loc 1 124 0
 493 01a8 4020     		movs	r0, #64
 494 01aa FFF7FEFF 		bl	graphic_ctrl_bit_set
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_500ns();
 495              		.loc 1 125 0
 496 01ae FFF7FEFF 		bl	delay_500ns
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_clear(B_E);
 497              		.loc 1 126 0
 498 01b2 4020     		movs	r0, #64
 499 01b4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_500ns();		
 500              		.loc 1 127 0
 501 01b8 FFF7FEFF 		bl	delay_500ns
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		unsigned char i = *GPIO_IDR_HIGH;
 502              		.loc 1 128 0
 503 01bc 0C4A     		ldr	r2, .L32+8
 504 01be FB1D     		adds	r3, r7, #7
 505 01c0 1278     		ldrb	r2, [r2]
 506 01c2 1A70     		strb	r2, [r3]
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
 507              		.loc 1 129 0
 508 01c4 0A4B     		ldr	r3, .L32+8
 509 01c6 1B78     		ldrb	r3, [r3]
 510 01c8 DBB2     		uxtb	r3, r3
 511 01ca 5BB2     		sxtb	r3, r3
 512 01cc 002B     		cmp	r3, #0
 513 01ce 00DA     		bge	.L31
 514              	.LBE2:
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_ctrl_bit_set(B_E);
 515              		.loc 1 123 0
 516 01d0 EAE7     		b	.L29
 517              	.L31:
 518              	.LBB3:
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 			break;
 519              		.loc 1 130 0
 520 01d2 C046     		nop
 521              	.LBE3:
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		}
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_E);
 522              		.loc 1 133 0
 523 01d4 4020     		movs	r0, #64
 524 01d6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*GPIO_MODER = 0x55555555;
 525              		.loc 1 134 0
 526 01da 034B     		ldr	r3, .L32
 527 01dc 054A     		ldr	r2, .L32+12
 528 01de 1A60     		str	r2, [r3]
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 529              		.loc 1 135 0
 530 01e0 C046     		nop
 531 01e2 BD46     		mov	sp, r7
 532 01e4 02B0     		add	sp, sp, #8
 533              		@ sp needed
 534 01e6 80BD     		pop	{r7, pc}
 535              	.L33:
 536              		.align	2
 537              	.L32:
 538 01e8 00100240 		.word	1073876992
 539 01ec 55550000 		.word	21845
 540 01f0 11100240 		.word	1073877009
 541 01f4 55555555 		.word	1431655765
 542              		.cfi_endproc
 543              	.LFE9:
 545              		.align	1
 546              		.global	graphic_read
 547              		.syntax unified
 548              		.code	16
 549              		.thumb_func
 550              		.fpu softvfp
 552              	graphic_read:
 553              	.LFB10:
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** unsigned char graphic_read(unsigned char controller) {
 554              		.loc 1 137 0
 555              		.cfi_startproc
 556              		@ args = 0, pretend = 0, frame = 16
 557              		@ frame_needed = 1, uses_anonymous_args = 0
 558 01f8 80B5     		push	{r7, lr}
 559              		.cfi_def_cfa_offset 8
 560              		.cfi_offset 7, -8
 561              		.cfi_offset 14, -4
 562 01fa 84B0     		sub	sp, sp, #16
 563              		.cfi_def_cfa_offset 24
 564 01fc 00AF     		add	r7, sp, #0
 565              		.cfi_def_cfa_register 7
 566 01fe 0200     		movs	r2, r0
 567 0200 FB1D     		adds	r3, r7, #7
 568 0202 1A70     		strb	r2, [r3]
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 569              		.loc 1 138 0
 570 0204 4020     		movs	r0, #64
 571 0206 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*GPIO_MODER = 0x00005555;
 572              		.loc 1 139 0
 573 020a 1B4B     		ldr	r3, .L38
 574 020c 1B4A     		ldr	r2, .L38+4
 575 020e 1A60     		str	r2, [r3]
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_RS | B_RW);
 576              		.loc 1 140 0
 577 0210 0320     		movs	r0, #3
 578 0212 FFF7FEFF 		bl	graphic_ctrl_bit_set
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	select_cotroller(controller);
 579              		.loc 1 141 0
 580 0216 FB1D     		adds	r3, r7, #7
 581 0218 1B78     		ldrb	r3, [r3]
 582 021a 1800     		movs	r0, r3
 583 021c FFF7FEFF 		bl	select_cotroller
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_500ns();
 584              		.loc 1 142 0
 585 0220 FFF7FEFF 		bl	delay_500ns
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_E);
 586              		.loc 1 143 0
 587 0224 4020     		movs	r0, #64
 588 0226 FFF7FEFF 		bl	graphic_ctrl_bit_set
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_500ns();
 589              		.loc 1 144 0
 590 022a FFF7FEFF 		bl	delay_500ns
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	unsigned char RV = *GPIO_IDR_HIGH;
 591              		.loc 1 145 0
 592 022e 144A     		ldr	r2, .L38+8
 593 0230 0F23     		movs	r3, #15
 594 0232 FB18     		adds	r3, r7, r3
 595 0234 1278     		ldrb	r2, [r2]
 596 0236 1A70     		strb	r2, [r3]
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 597              		.loc 1 146 0
 598 0238 4020     		movs	r0, #64
 599 023a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*GPIO_MODER = 0x55555555;
 600              		.loc 1 147 0
 601 023e 0E4B     		ldr	r3, .L38
 602 0240 104A     		ldr	r2, .L38+12
 603 0242 1A60     		str	r2, [r3]
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	if(controller == B_CS1) {
 604              		.loc 1 148 0
 605 0244 FB1D     		adds	r3, r7, #7
 606 0246 1B78     		ldrb	r3, [r3]
 607 0248 082B     		cmp	r3, #8
 608 024a 04D1     		bne	.L35
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		select_cotroller(B_CS1);
 609              		.loc 1 149 0
 610 024c 0820     		movs	r0, #8
 611 024e FFF7FEFF 		bl	select_cotroller
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_wait_ready();
 612              		.loc 1 150 0
 613 0252 FFF7FEFF 		bl	graphic_wait_ready
 614              	.L35:
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	if(controller == B_CS2) {
 615              		.loc 1 152 0
 616 0256 FB1D     		adds	r3, r7, #7
 617 0258 1B78     		ldrb	r3, [r3]
 618 025a 102B     		cmp	r3, #16
 619 025c 04D1     		bne	.L36
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		select_cotroller(B_CS2);
 620              		.loc 1 153 0
 621 025e 1020     		movs	r0, #16
 622 0260 FFF7FEFF 		bl	select_cotroller
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_wait_ready();
 623              		.loc 1 154 0
 624 0264 FFF7FEFF 		bl	graphic_wait_ready
 625              	.L36:
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	return RV;
 626              		.loc 1 156 0
 627 0268 0F23     		movs	r3, #15
 628 026a FB18     		adds	r3, r7, r3
 629 026c 1B78     		ldrb	r3, [r3]
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 630              		.loc 1 157 0
 631 026e 1800     		movs	r0, r3
 632 0270 BD46     		mov	sp, r7
 633 0272 04B0     		add	sp, sp, #16
 634              		@ sp needed
 635 0274 80BD     		pop	{r7, pc}
 636              	.L39:
 637 0276 C046     		.align	2
 638              	.L38:
 639 0278 00100240 		.word	1073876992
 640 027c 55550000 		.word	21845
 641 0280 11100240 		.word	1073877009
 642 0284 55555555 		.word	1431655765
 643              		.cfi_endproc
 644              	.LFE10:
 646              		.align	1
 647              		.global	graphic_write
 648              		.syntax unified
 649              		.code	16
 650              		.thumb_func
 651              		.fpu softvfp
 653              	graphic_write:
 654              	.LFB11:
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write(unsigned char value, unsigned char controller) {
 655              		.loc 1 159 0
 656              		.cfi_startproc
 657              		@ args = 0, pretend = 0, frame = 8
 658              		@ frame_needed = 1, uses_anonymous_args = 0
 659 0288 80B5     		push	{r7, lr}
 660              		.cfi_def_cfa_offset 8
 661              		.cfi_offset 7, -8
 662              		.cfi_offset 14, -4
 663 028a 82B0     		sub	sp, sp, #8
 664              		.cfi_def_cfa_offset 16
 665 028c 00AF     		add	r7, sp, #0
 666              		.cfi_def_cfa_register 7
 667 028e 0200     		movs	r2, r0
 668 0290 FB1D     		adds	r3, r7, #7
 669 0292 1A70     		strb	r2, [r3]
 670 0294 BB1D     		adds	r3, r7, #6
 671 0296 0A1C     		adds	r2, r1, #0
 672 0298 1A70     		strb	r2, [r3]
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*GPIO_ODR_HIGH = value;
 673              		.loc 1 160 0
 674 029a 1A4A     		ldr	r2, .L43
 675 029c FB1D     		adds	r3, r7, #7
 676 029e 1B78     		ldrb	r3, [r3]
 677 02a0 1370     		strb	r3, [r2]
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	select_cotroller(controller);
 678              		.loc 1 161 0
 679 02a2 BB1D     		adds	r3, r7, #6
 680 02a4 1B78     		ldrb	r3, [r3]
 681 02a6 1800     		movs	r0, r3
 682 02a8 FFF7FEFF 		bl	select_cotroller
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_500ns();
 683              		.loc 1 162 0
 684 02ac FFF7FEFF 		bl	delay_500ns
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_E);
 685              		.loc 1 163 0
 686 02b0 4020     		movs	r0, #64
 687 02b2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_500ns();
 688              		.loc 1 164 0
 689 02b6 FFF7FEFF 		bl	delay_500ns
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 690              		.loc 1 165 0
 691 02ba 4020     		movs	r0, #64
 692 02bc FFF7FEFF 		bl	graphic_ctrl_bit_clear
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	//Kanske inte ska vara så här för this statement
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	if(controller & B_CS1) {
 693              		.loc 1 168 0
 694 02c0 BB1D     		adds	r3, r7, #6
 695 02c2 1B78     		ldrb	r3, [r3]
 696 02c4 0822     		movs	r2, #8
 697 02c6 1340     		ands	r3, r2
 698 02c8 04D0     		beq	.L41
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		select_cotroller(B_CS1);
 699              		.loc 1 169 0
 700 02ca 0820     		movs	r0, #8
 701 02cc FFF7FEFF 		bl	select_cotroller
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_wait_ready();
 702              		.loc 1 170 0
 703 02d0 FFF7FEFF 		bl	graphic_wait_ready
 704              	.L41:
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	if(controller & B_CS2) {
 705              		.loc 1 173 0
 706 02d4 BB1D     		adds	r3, r7, #6
 707 02d6 1B78     		ldrb	r3, [r3]
 708 02d8 1022     		movs	r2, #16
 709 02da 1340     		ands	r3, r2
 710 02dc 04D0     		beq	.L42
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		select_cotroller(B_CS2);
 711              		.loc 1 174 0
 712 02de 1020     		movs	r0, #16
 713 02e0 FFF7FEFF 		bl	select_cotroller
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_wait_ready();
 714              		.loc 1 175 0
 715 02e4 FFF7FEFF 		bl	graphic_wait_ready
 716              	.L42:
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*GPIO_ODR_HIGH = 0;
 717              		.loc 1 178 0
 718 02e8 064B     		ldr	r3, .L43
 719 02ea 0022     		movs	r2, #0
 720 02ec 1A70     		strb	r2, [r3]
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_E);
 721              		.loc 1 179 0
 722 02ee 4020     		movs	r0, #64
 723 02f0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	select_cotroller(0);
 724              		.loc 1 180 0
 725 02f4 0020     		movs	r0, #0
 726 02f6 FFF7FEFF 		bl	select_cotroller
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 727              		.loc 1 181 0
 728 02fa C046     		nop
 729 02fc BD46     		mov	sp, r7
 730 02fe 02B0     		add	sp, sp, #8
 731              		@ sp needed
 732 0300 80BD     		pop	{r7, pc}
 733              	.L44:
 734 0302 C046     		.align	2
 735              	.L43:
 736 0304 15100240 		.word	1073877013
 737              		.cfi_endproc
 738              	.LFE11:
 740              		.align	1
 741              		.global	graphic_write_command
 742              		.syntax unified
 743              		.code	16
 744              		.thumb_func
 745              		.fpu softvfp
 747              	graphic_write_command:
 748              	.LFB12:
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_command(unsigned char command, unsigned char controller) {
 749              		.loc 1 183 0
 750              		.cfi_startproc
 751              		@ args = 0, pretend = 0, frame = 8
 752              		@ frame_needed = 1, uses_anonymous_args = 0
 753 0308 80B5     		push	{r7, lr}
 754              		.cfi_def_cfa_offset 8
 755              		.cfi_offset 7, -8
 756              		.cfi_offset 14, -4
 757 030a 82B0     		sub	sp, sp, #8
 758              		.cfi_def_cfa_offset 16
 759 030c 00AF     		add	r7, sp, #0
 760              		.cfi_def_cfa_register 7
 761 030e 0200     		movs	r2, r0
 762 0310 FB1D     		adds	r3, r7, #7
 763 0312 1A70     		strb	r2, [r3]
 764 0314 BB1D     		adds	r3, r7, #6
 765 0316 0A1C     		adds	r2, r1, #0
 766 0318 1A70     		strb	r2, [r3]
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 767              		.loc 1 184 0
 768 031a 4020     		movs	r0, #64
 769 031c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	select_cotroller(controller);
 770              		.loc 1 185 0
 771 0320 BB1D     		adds	r3, r7, #6
 772 0322 1B78     		ldrb	r3, [r3]
 773 0324 1800     		movs	r0, r3
 774 0326 FFF7FEFF 		bl	select_cotroller
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_RS | B_RW);
 775              		.loc 1 186 0
 776 032a 0320     		movs	r0, #3
 777 032c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write(command, controller);
 778              		.loc 1 187 0
 779 0330 BB1D     		adds	r3, r7, #6
 780 0332 1A78     		ldrb	r2, [r3]
 781 0334 FB1D     		adds	r3, r7, #7
 782 0336 1B78     		ldrb	r3, [r3]
 783 0338 1100     		movs	r1, r2
 784 033a 1800     		movs	r0, r3
 785 033c FFF7FEFF 		bl	graphic_write
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 786              		.loc 1 188 0
 787 0340 C046     		nop
 788 0342 BD46     		mov	sp, r7
 789 0344 02B0     		add	sp, sp, #8
 790              		@ sp needed
 791 0346 80BD     		pop	{r7, pc}
 792              		.cfi_endproc
 793              	.LFE12:
 795              		.align	1
 796              		.global	graphic_write_data
 797              		.syntax unified
 798              		.code	16
 799              		.thumb_func
 800              		.fpu softvfp
 802              	graphic_write_data:
 803              	.LFB13:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_data(unsigned char data, unsigned char controller) {
 804              		.loc 1 190 0
 805              		.cfi_startproc
 806              		@ args = 0, pretend = 0, frame = 8
 807              		@ frame_needed = 1, uses_anonymous_args = 0
 808 0348 80B5     		push	{r7, lr}
 809              		.cfi_def_cfa_offset 8
 810              		.cfi_offset 7, -8
 811              		.cfi_offset 14, -4
 812 034a 82B0     		sub	sp, sp, #8
 813              		.cfi_def_cfa_offset 16
 814 034c 00AF     		add	r7, sp, #0
 815              		.cfi_def_cfa_register 7
 816 034e 0200     		movs	r2, r0
 817 0350 FB1D     		adds	r3, r7, #7
 818 0352 1A70     		strb	r2, [r3]
 819 0354 BB1D     		adds	r3, r7, #6
 820 0356 0A1C     		adds	r2, r1, #0
 821 0358 1A70     		strb	r2, [r3]
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 822              		.loc 1 191 0
 823 035a 4020     		movs	r0, #64
 824 035c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	select_cotroller(controller);
 825              		.loc 1 192 0
 826 0360 BB1D     		adds	r3, r7, #6
 827 0362 1B78     		ldrb	r3, [r3]
 828 0364 1800     		movs	r0, r3
 829 0366 FFF7FEFF 		bl	select_cotroller
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_RS);
 830              		.loc 1 193 0
 831 036a 0120     		movs	r0, #1
 832 036c FFF7FEFF 		bl	graphic_ctrl_bit_set
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 833              		.loc 1 194 0
 834 0370 0220     		movs	r0, #2
 835 0372 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write(data, controller);
 836              		.loc 1 195 0
 837 0376 BB1D     		adds	r3, r7, #6
 838 0378 1A78     		ldrb	r2, [r3]
 839 037a FB1D     		adds	r3, r7, #7
 840 037c 1B78     		ldrb	r3, [r3]
 841 037e 1100     		movs	r1, r2
 842 0380 1800     		movs	r0, r3
 843 0382 FFF7FEFF 		bl	graphic_write
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 844              		.loc 1 196 0
 845 0386 C046     		nop
 846 0388 BD46     		mov	sp, r7
 847 038a 02B0     		add	sp, sp, #8
 848              		@ sp needed
 849 038c 80BD     		pop	{r7, pc}
 850              		.cfi_endproc
 851              	.LFE13:
 853              		.align	1
 854              		.global	graphic_read_data
 855              		.syntax unified
 856              		.code	16
 857              		.thumb_func
 858              		.fpu softvfp
 860              	graphic_read_data:
 861              	.LFB14:
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** unsigned char graphic_read_data(unsigned char controller) {
 862              		.loc 1 198 0
 863              		.cfi_startproc
 864              		@ args = 0, pretend = 0, frame = 8
 865              		@ frame_needed = 1, uses_anonymous_args = 0
 866 038e 80B5     		push	{r7, lr}
 867              		.cfi_def_cfa_offset 8
 868              		.cfi_offset 7, -8
 869              		.cfi_offset 14, -4
 870 0390 82B0     		sub	sp, sp, #8
 871              		.cfi_def_cfa_offset 16
 872 0392 00AF     		add	r7, sp, #0
 873              		.cfi_def_cfa_register 7
 874 0394 0200     		movs	r2, r0
 875 0396 FB1D     		adds	r3, r7, #7
 876 0398 1A70     		strb	r2, [r3]
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	(void) graphic_read(controller);
 877              		.loc 1 199 0
 878 039a FB1D     		adds	r3, r7, #7
 879 039c 1B78     		ldrb	r3, [r3]
 880 039e 1800     		movs	r0, r3
 881 03a0 FFF7FEFF 		bl	graphic_read
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	return graphic_read(controller);
 882              		.loc 1 200 0
 883 03a4 FB1D     		adds	r3, r7, #7
 884 03a6 1B78     		ldrb	r3, [r3]
 885 03a8 1800     		movs	r0, r3
 886 03aa FFF7FEFF 		bl	graphic_read
 887 03ae 0300     		movs	r3, r0
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 888              		.loc 1 201 0
 889 03b0 1800     		movs	r0, r3
 890 03b2 BD46     		mov	sp, r7
 891 03b4 02B0     		add	sp, sp, #8
 892              		@ sp needed
 893 03b6 80BD     		pop	{r7, pc}
 894              		.cfi_endproc
 895              	.LFE14:
 897              		.align	1
 898              		.global	graphic_initalize
 899              		.syntax unified
 900              		.code	16
 901              		.thumb_func
 902              		.fpu softvfp
 904              	graphic_initalize:
 905              	.LFB15:
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_initalize(void) {
 906              		.loc 1 203 0
 907              		.cfi_startproc
 908              		@ args = 0, pretend = 0, frame = 0
 909              		@ frame_needed = 1, uses_anonymous_args = 0
 910 03b8 80B5     		push	{r7, lr}
 911              		.cfi_def_cfa_offset 8
 912              		.cfi_offset 7, -8
 913              		.cfi_offset 14, -4
 914 03ba 00AF     		add	r7, sp, #0
 915              		.cfi_def_cfa_register 7
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_E);
 916              		.loc 1 204 0
 917 03bc 4020     		movs	r0, #64
 918 03be FFF7FEFF 		bl	graphic_ctrl_bit_set
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_mikro(10);
 919              		.loc 1 205 0
 920 03c2 0A20     		movs	r0, #10
 921 03c4 FFF7FEFF 		bl	delay_mikro
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 922              		.loc 1 206 0
 923 03c8 7820     		movs	r0, #120
 924 03ca FFF7FEFF 		bl	graphic_ctrl_bit_clear
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	delay_milli(30);
 925              		.loc 1 207 0
 926 03ce 1E20     		movs	r0, #30
 927 03d0 FFF7FEFF 		bl	delay_milli
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_ctrl_bit_set(B_RST);
 928              		.loc 1 208 0
 929 03d4 2020     		movs	r0, #32
 930 03d6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
 931              		.loc 1 209 0
 932 03da 1821     		movs	r1, #24
 933 03dc 3E20     		movs	r0, #62
 934 03de FFF7FEFF 		bl	graphic_write_command
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
 935              		.loc 1 210 0
 936 03e2 1821     		movs	r1, #24
 937 03e4 3F20     		movs	r0, #63
 938 03e6 FFF7FEFF 		bl	graphic_write_command
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
 939              		.loc 1 211 0
 940 03ea 1821     		movs	r1, #24
 941 03ec C020     		movs	r0, #192
 942 03ee FFF7FEFF 		bl	graphic_write_command
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
 943              		.loc 1 212 0
 944 03f2 1821     		movs	r1, #24
 945 03f4 4020     		movs	r0, #64
 946 03f6 FFF7FEFF 		bl	graphic_write_command
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
 947              		.loc 1 213 0
 948 03fa 1821     		movs	r1, #24
 949 03fc B820     		movs	r0, #184
 950 03fe FFF7FEFF 		bl	graphic_write_command
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	select_cotroller(0);
 951              		.loc 1 214 0
 952 0402 0020     		movs	r0, #0
 953 0404 FFF7FEFF 		bl	select_cotroller
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 954              		.loc 1 215 0
 955 0408 C046     		nop
 956 040a BD46     		mov	sp, r7
 957              		@ sp needed
 958 040c 80BD     		pop	{r7, pc}
 959              		.cfi_endproc
 960              	.LFE15:
 962              		.align	1
 963              		.global	graphic_clear_screen
 964              		.syntax unified
 965              		.code	16
 966              		.thumb_func
 967              		.fpu softvfp
 969              	graphic_clear_screen:
 970              	.LFB16:
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_clear_screen(void) {
 971              		.loc 1 217 0
 972              		.cfi_startproc
 973              		@ args = 0, pretend = 0, frame = 8
 974              		@ frame_needed = 1, uses_anonymous_args = 0
 975 040e 80B5     		push	{r7, lr}
 976              		.cfi_def_cfa_offset 8
 977              		.cfi_offset 7, -8
 978              		.cfi_offset 14, -4
 979 0410 82B0     		sub	sp, sp, #8
 980              		.cfi_def_cfa_offset 16
 981 0412 00AF     		add	r7, sp, #0
 982              		.cfi_def_cfa_register 7
 983              	.LBB4:
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	for(int page = 0; page < 7; page++) {
 984              		.loc 1 218 0
 985 0414 0023     		movs	r3, #0
 986 0416 7B60     		str	r3, [r7, #4]
 987 0418 1EE0     		b	.L51
 988              	.L54:
 219:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 989              		.loc 1 219 0
 990 041a 7B68     		ldr	r3, [r7, #4]
 991 041c 5BB2     		sxtb	r3, r3
 992 041e 4822     		movs	r2, #72
 993 0420 5242     		rsbs	r2, r2, #0
 994 0422 1343     		orrs	r3, r2
 995 0424 5BB2     		sxtb	r3, r3
 996 0426 DBB2     		uxtb	r3, r3
 997 0428 1821     		movs	r1, #24
 998 042a 1800     		movs	r0, r3
 999 042c FFF7FEFF 		bl	graphic_write_command
 220:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
 1000              		.loc 1 220 0
 1001 0430 1821     		movs	r1, #24
 1002 0432 4020     		movs	r0, #64
 1003 0434 FFF7FEFF 		bl	graphic_write_command
 1004              	.LBB5:
 221:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		for(int add = 0; add < 63; add++) {
 1005              		.loc 1 221 0
 1006 0438 0023     		movs	r3, #0
 1007 043a 3B60     		str	r3, [r7]
 1008 043c 06E0     		b	.L52
 1009              	.L53:
 222:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 			graphic_write_data(0, B_CS1 | B_CS2);
 1010              		.loc 1 222 0 discriminator 3
 1011 043e 1821     		movs	r1, #24
 1012 0440 0020     		movs	r0, #0
 1013 0442 FFF7FEFF 		bl	graphic_write_data
 221:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		for(int add = 0; add < 63; add++) {
 1014              		.loc 1 221 0 discriminator 3
 1015 0446 3B68     		ldr	r3, [r7]
 1016 0448 0133     		adds	r3, r3, #1
 1017 044a 3B60     		str	r3, [r7]
 1018              	.L52:
 221:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		for(int add = 0; add < 63; add++) {
 1019              		.loc 1 221 0 is_stmt 0 discriminator 1
 1020 044c 3B68     		ldr	r3, [r7]
 1021 044e 3E2B     		cmp	r3, #62
 1022 0450 F5DD     		ble	.L53
 1023              	.LBE5:
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1024              		.loc 1 218 0 is_stmt 1 discriminator 2
 1025 0452 7B68     		ldr	r3, [r7, #4]
 1026 0454 0133     		adds	r3, r3, #1
 1027 0456 7B60     		str	r3, [r7, #4]
 1028              	.L51:
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1029              		.loc 1 218 0 is_stmt 0 discriminator 1
 1030 0458 7B68     		ldr	r3, [r7, #4]
 1031 045a 062B     		cmp	r3, #6
 1032 045c DDDD     		ble	.L54
 1033              	.LBE4:
 223:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		}
 224:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 225:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 1034              		.loc 1 225 0 is_stmt 1
 1035 045e C046     		nop
 1036 0460 BD46     		mov	sp, r7
 1037 0462 02B0     		add	sp, sp, #8
 1038              		@ sp needed
 1039 0464 80BD     		pop	{r7, pc}
 1040              		.cfi_endproc
 1041              	.LFE16:
 1043              		.align	1
 1044              		.global	main
 1045              		.syntax unified
 1046              		.code	16
 1047              		.thumb_func
 1048              		.fpu softvfp
 1050              	main:
 1051              	.LFB17:
 226:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 227:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void main(void) {
 1052              		.loc 1 227 0
 1053              		.cfi_startproc
 1054              		@ args = 0, pretend = 0, frame = 0
 1055              		@ frame_needed = 1, uses_anonymous_args = 0
 1056 0466 80B5     		push	{r7, lr}
 1057              		.cfi_def_cfa_offset 8
 1058              		.cfi_offset 7, -8
 1059              		.cfi_offset 14, -4
 1060 0468 00AF     		add	r7, sp, #0
 1061              		.cfi_def_cfa_register 7
 228:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	init_app();
 1062              		.loc 1 228 0
 1063 046a FFF7FEFF 		bl	init_app
 229:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_initalize();
 1064              		.loc 1 229 0
 1065 046e FFF7FEFF 		bl	graphic_initalize
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****   #ifndef SIMULATOR
 231:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_clear_screen();
 232:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****   #endif
 233:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1066              		.loc 1 233 0
 1067 0472 1821     		movs	r1, #24
 1068 0474 4A20     		movs	r0, #74
 1069 0476 FFF7FEFF 		bl	graphic_write_command
 234:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1070              		.loc 1 234 0
 1071 047a 1821     		movs	r1, #24
 1072 047c B920     		movs	r0, #185
 1073 047e FFF7FEFF 		bl	graphic_write_command
 235:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	graphic_write_data(0xFF, B_CS1 | B_CS2);
 1074              		.loc 1 235 0
 1075 0482 1821     		movs	r1, #24
 1076 0484 FF20     		movs	r0, #255
 1077 0486 FFF7FEFF 		bl	graphic_write_data
 236:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 1078              		.loc 1 236 0
 1079 048a C046     		nop
 1080 048c BD46     		mov	sp, r7
 1081              		@ sp needed
 1082 048e 80BD     		pop	{r7, pc}
 1083              		.cfi_endproc
 1084              	.LFE17:
 1086              	.Letext0:
