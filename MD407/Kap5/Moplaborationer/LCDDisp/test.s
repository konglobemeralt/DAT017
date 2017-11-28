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
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // Timer setup
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK 0xE000E010
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // Port E setup
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_E 0x40021000
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // Control for display
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_E 0x40
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_SELECT 0x04
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RW 0x02
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RS 0x01
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RST 0x20
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_CS2 0x10
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_CS1 0x08
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_ON 0x3F
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_OFF 0x3E
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_DISP_START 0xC0
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_SET_ADD 0x40
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_SET_PAGE 0xB8
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_BUSY 0x80
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define PAGE 8
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define ADD 63
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define SIMULATOR
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** typedef unsigned char uint8_t;
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup ( void )
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
  26              		.loc 1 48 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** asm volatile(
  31              		.loc 1 49 0
  32              		.syntax divided
  33              	@ 49 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" MOV SP,R0\n"
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" BL main\n"				/* call main */
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	".L1: B .L1\n"				/* never return */
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	) ;
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
  40              		.loc 1 55 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	delay_250ns
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	delay_250ns:
  56              	.LFB1:
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_250ns(void) {
  57              		.loc 1 58 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 0;
  67              		.loc 1 59 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  71              		.loc 1 60 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 3122     		movs	r2, #49
  74 000e 1A60     		str	r2, [r3]
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_VAL = 0;
  75              		.loc 1 61 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 5;
  79              		.loc 1 62 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
  83              		.loc 1 63 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 63 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		// ??????
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 0;
  93              		.loc 1 66 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
  97              		.loc 1 67 0
  98 0030 C046     		nop
  99 0032 BD46     		mov	sp, r7
 100              		@ sp needed
 101 0034 80BD     		pop	{r7, pc}
 102              	.L5:
 103 0036 C046     		.align	2
 104              	.L4:
 105 0038 10E000E0 		.word	-536813552
 106 003c 14E000E0 		.word	-536813548
 107 0040 18E000E0 		.word	-536813544
 108              		.cfi_endproc
 109              	.LFE1:
 111              		.align	1
 112              		.global	delay500ns
 113              		.syntax unified
 114              		.code	16
 115              		.thumb_func
 116              		.fpu softvfp
 118              	delay500ns:
 119              	.LFB2:
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay500ns(){
 120              		.loc 1 69 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     //Delay 500ns in the most efficient way:
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay_250ns();
 130              		.loc 1 71 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay_250ns();
 132              		.loc 1 72 0
 133 004c FFF7FEFF 		bl	delay_250ns
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         //Continue executing code efficently/.
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 134              		.loc 1 74 0
 135 0050 C046     		nop
 136 0052 BD46     		mov	sp, r7
 137              		@ sp needed
 138 0054 80BD     		pop	{r7, pc}
 139              		.cfi_endproc
 140              	.LFE2:
 142              		.align	1
 143              		.global	graphics_ctrl_bit_set
 144              		.syntax unified
 145              		.code	16
 146              		.thumb_func
 147              		.fpu softvfp
 149              	graphics_ctrl_bit_set:
 150              	.LFB3:
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_ctrl_bit_set(uint8_t x){
 151              		.loc 1 76 0
 152              		.cfi_startproc
 153              		@ args = 0, pretend = 0, frame = 8
 154              		@ frame_needed = 1, uses_anonymous_args = 0
 155 0056 80B5     		push	{r7, lr}
 156              		.cfi_def_cfa_offset 8
 157              		.cfi_offset 7, -8
 158              		.cfi_offset 14, -4
 159 0058 82B0     		sub	sp, sp, #8
 160              		.cfi_def_cfa_offset 16
 161 005a 00AF     		add	r7, sp, #0
 162              		.cfi_def_cfa_register 7
 163 005c 0200     		movs	r2, r0
 164 005e FB1D     		adds	r3, r7, #7
 165 0060 1A70     		strb	r2, [r3]
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
 166              		.loc 1 77 0
 167 0062 0949     		ldr	r1, .L8
 168 0064 084B     		ldr	r3, .L8
 169 0066 1B78     		ldrb	r3, [r3]
 170 0068 DBB2     		uxtb	r3, r3
 171 006a 5AB2     		sxtb	r2, r3
 172 006c FB1D     		adds	r3, r7, #7
 173 006e 1B78     		ldrb	r3, [r3]
 174 0070 5BB2     		sxtb	r3, r3
 175 0072 0420     		movs	r0, #4
 176 0074 8343     		bics	r3, r0
 177 0076 5BB2     		sxtb	r3, r3
 178 0078 1343     		orrs	r3, r2
 179 007a 5BB2     		sxtb	r3, r3
 180 007c DBB2     		uxtb	r3, r3
 181 007e 0B70     		strb	r3, [r1]
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 182              		.loc 1 78 0
 183 0080 C046     		nop
 184 0082 BD46     		mov	sp, r7
 185 0084 02B0     		add	sp, sp, #8
 186              		@ sp needed
 187 0086 80BD     		pop	{r7, pc}
 188              	.L9:
 189              		.align	2
 190              	.L8:
 191 0088 14100240 		.word	1073877012
 192              		.cfi_endproc
 193              	.LFE3:
 195              		.align	1
 196              		.global	graphics_ctrl_bit_clear
 197              		.syntax unified
 198              		.code	16
 199              		.thumb_func
 200              		.fpu softvfp
 202              	graphics_ctrl_bit_clear:
 203              	.LFB4:
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_ctrl_bit_clear(uint8_t x){
 204              		.loc 1 80 0
 205              		.cfi_startproc
 206              		@ args = 0, pretend = 0, frame = 8
 207              		@ frame_needed = 1, uses_anonymous_args = 0
 208 008c 80B5     		push	{r7, lr}
 209              		.cfi_def_cfa_offset 8
 210              		.cfi_offset 7, -8
 211              		.cfi_offset 14, -4
 212 008e 82B0     		sub	sp, sp, #8
 213              		.cfi_def_cfa_offset 16
 214 0090 00AF     		add	r7, sp, #0
 215              		.cfi_def_cfa_register 7
 216 0092 0200     		movs	r2, r0
 217 0094 FB1D     		adds	r3, r7, #7
 218 0096 1A70     		strb	r2, [r3]
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_ODR_LOW &= ~x;
 219              		.loc 1 81 0
 220 0098 0849     		ldr	r1, .L11
 221 009a 084B     		ldr	r3, .L11
 222 009c 1B78     		ldrb	r3, [r3]
 223 009e DBB2     		uxtb	r3, r3
 224 00a0 5BB2     		sxtb	r3, r3
 225 00a2 FA1D     		adds	r2, r7, #7
 226 00a4 1278     		ldrb	r2, [r2]
 227 00a6 52B2     		sxtb	r2, r2
 228 00a8 D243     		mvns	r2, r2
 229 00aa 52B2     		sxtb	r2, r2
 230 00ac 1340     		ands	r3, r2
 231 00ae 5BB2     		sxtb	r3, r3
 232 00b0 DBB2     		uxtb	r3, r3
 233 00b2 0B70     		strb	r3, [r1]
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 234              		.loc 1 82 0
 235 00b4 C046     		nop
 236 00b6 BD46     		mov	sp, r7
 237 00b8 02B0     		add	sp, sp, #8
 238              		@ sp needed
 239 00ba 80BD     		pop	{r7, pc}
 240              	.L12:
 241              		.align	2
 242              	.L11:
 243 00bc 14100240 		.word	1073877012
 244              		.cfi_endproc
 245              	.LFE4:
 247              		.align	1
 248              		.global	select_controller
 249              		.syntax unified
 250              		.code	16
 251              		.thumb_func
 252              		.fpu softvfp
 254              	select_controller:
 255              	.LFB5:
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void select_controller(uint8_t controller){
 256              		.loc 1 84 0
 257              		.cfi_startproc
 258              		@ args = 0, pretend = 0, frame = 8
 259              		@ frame_needed = 1, uses_anonymous_args = 0
 260 00c0 80B5     		push	{r7, lr}
 261              		.cfi_def_cfa_offset 8
 262              		.cfi_offset 7, -8
 263              		.cfi_offset 14, -4
 264 00c2 82B0     		sub	sp, sp, #8
 265              		.cfi_def_cfa_offset 16
 266 00c4 00AF     		add	r7, sp, #0
 267              		.cfi_def_cfa_register 7
 268 00c6 0200     		movs	r2, r0
 269 00c8 FB1D     		adds	r3, r7, #7
 270 00ca 1A70     		strb	r2, [r3]
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     if(controller == 0) {
 271              		.loc 1 85 0
 272 00cc FB1D     		adds	r3, r7, #7
 273 00ce 1B78     		ldrb	r3, [r3]
 274 00d0 002B     		cmp	r3, #0
 275 00d2 06D1     		bne	.L14
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS1);
 276              		.loc 1 86 0
 277 00d4 0820     		movs	r0, #8
 278 00d6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS2);
 279              		.loc 1 87 0
 280 00da 1020     		movs	r0, #16
 281 00dc FFF7FEFF 		bl	graphics_ctrl_bit_clear
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         } else if(controller == (B_CS1 | B_CS2)) {
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS1);
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS2);
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         } else if(controller == B_CS1) {
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS1);
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS2);
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         } else if(controller == B_CS2) {
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS1);
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS2);
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 282              		.loc 1 98 0
 283 00e0 1FE0     		b	.L18
 284              	.L14:
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         } else if(controller == (B_CS1 | B_CS2)) {
 285              		.loc 1 88 0
 286 00e2 FB1D     		adds	r3, r7, #7
 287 00e4 1B78     		ldrb	r3, [r3]
 288 00e6 182B     		cmp	r3, #24
 289 00e8 06D1     		bne	.L16
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS2);
 290              		.loc 1 89 0
 291 00ea 0820     		movs	r0, #8
 292 00ec FFF7FEFF 		bl	graphics_ctrl_bit_set
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         } else if(controller == B_CS1) {
 293              		.loc 1 90 0
 294 00f0 1020     		movs	r0, #16
 295 00f2 FFF7FEFF 		bl	graphics_ctrl_bit_set
 296              		.loc 1 98 0
 297 00f6 14E0     		b	.L18
 298              	.L16:
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS1);
 299              		.loc 1 91 0
 300 00f8 FB1D     		adds	r3, r7, #7
 301 00fa 1B78     		ldrb	r3, [r3]
 302 00fc 082B     		cmp	r3, #8
 303 00fe 06D1     		bne	.L17
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS2);
 304              		.loc 1 92 0
 305 0100 0820     		movs	r0, #8
 306 0102 FFF7FEFF 		bl	graphics_ctrl_bit_set
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         } else if(controller == B_CS2) {
 307              		.loc 1 93 0
 308 0106 1020     		movs	r0, #16
 309 0108 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 310              		.loc 1 98 0
 311 010c 09E0     		b	.L18
 312              	.L17:
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS1);
 313              		.loc 1 94 0
 314 010e FB1D     		adds	r3, r7, #7
 315 0110 1B78     		ldrb	r3, [r3]
 316 0112 102B     		cmp	r3, #16
 317 0114 05D1     		bne	.L18
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS2);
 318              		.loc 1 95 0
 319 0116 0820     		movs	r0, #8
 320 0118 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 321              		.loc 1 96 0
 322 011c 1020     		movs	r0, #16
 323 011e FFF7FEFF 		bl	graphics_ctrl_bit_set
 324              	.L18:
 325              		.loc 1 98 0
 326 0122 C046     		nop
 327 0124 BD46     		mov	sp, r7
 328 0126 02B0     		add	sp, sp, #8
 329              		@ sp needed
 330 0128 80BD     		pop	{r7, pc}
 331              		.cfi_endproc
 332              	.LFE5:
 334              		.align	1
 335              		.global	graphic_wait_ready
 336              		.syntax unified
 337              		.code	16
 338              		.thumb_func
 339              		.fpu softvfp
 341              	graphic_wait_ready:
 342              	.LFB6:
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_wait_ready(){
 343              		.loc 1 100 0
 344              		.cfi_startproc
 345              		@ args = 0, pretend = 0, frame = 8
 346              		@ frame_needed = 1, uses_anonymous_args = 0
 347 012a 80B5     		push	{r7, lr}
 348              		.cfi_def_cfa_offset 8
 349              		.cfi_offset 7, -8
 350              		.cfi_offset 14, -4
 351 012c 82B0     		sub	sp, sp, #8
 352              		.cfi_def_cfa_offset 16
 353 012e 00AF     		add	r7, sp, #0
 354              		.cfi_def_cfa_register 7
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 355              		.loc 1 101 0
 356 0130 4020     		movs	r0, #64
 357 0132 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x00005555;
 358              		.loc 1 102 0
 359 0136 154B     		ldr	r3, .L25
 360 0138 154A     		ldr	r2, .L25+4
 361 013a 1A60     		str	r2, [r3]
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RS);
 362              		.loc 1 103 0
 363 013c 0120     		movs	r0, #1
 364 013e FFF7FEFF 		bl	graphics_ctrl_bit_clear
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RW);
 365              		.loc 1 104 0
 366 0142 0220     		movs	r0, #2
 367 0144 FFF7FEFF 		bl	graphics_ctrl_bit_set
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 368              		.loc 1 105 0
 369 0148 FFF7FEFF 		bl	delay500ns
 370              	.L22:
 371              	.LBB2:
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         while(1) { // Wait for display not to be busy
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_E);
 372              		.loc 1 108 0
 373 014c 4020     		movs	r0, #64
 374 014e FFF7FEFF 		bl	graphics_ctrl_bit_set
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             delay500ns();
 375              		.loc 1 109 0
 376 0152 FFF7FEFF 		bl	delay500ns
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_E);
 377              		.loc 1 110 0
 378 0156 4020     		movs	r0, #64
 379 0158 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             delay500ns();		
 380              		.loc 1 111 0
 381 015c FFF7FEFF 		bl	delay500ns
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             unsigned char i = *GPIO_IDR_HIGH;
 382              		.loc 1 112 0
 383 0160 0C4A     		ldr	r2, .L25+8
 384 0162 FB1D     		adds	r3, r7, #7
 385 0164 1278     		ldrb	r2, [r2]
 386 0166 1A70     		strb	r2, [r3]
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                 if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
 387              		.loc 1 113 0
 388 0168 0A4B     		ldr	r3, .L25+8
 389 016a 1B78     		ldrb	r3, [r3]
 390 016c DBB2     		uxtb	r3, r3
 391 016e 5BB2     		sxtb	r3, r3
 392 0170 002B     		cmp	r3, #0
 393 0172 00DA     		bge	.L24
 394              	.LBE2:
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_E);
 395              		.loc 1 107 0
 396 0174 EAE7     		b	.L22
 397              	.L24:
 398              	.LBB3:
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                     break;
 399              		.loc 1 114 0
 400 0176 C046     		nop
 401              	.LBE3:
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                 }
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 402              		.loc 1 117 0
 403 0178 4020     		movs	r0, #64
 404 017a FFF7FEFF 		bl	graphics_ctrl_bit_set
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 405              		.loc 1 118 0
 406 017e 034B     		ldr	r3, .L25
 407 0180 054A     		ldr	r2, .L25+12
 408 0182 1A60     		str	r2, [r3]
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 409              		.loc 1 120 0
 410 0184 C046     		nop
 411 0186 BD46     		mov	sp, r7
 412 0188 02B0     		add	sp, sp, #8
 413              		@ sp needed
 414 018a 80BD     		pop	{r7, pc}
 415              	.L26:
 416              		.align	2
 417              	.L25:
 418 018c 00100240 		.word	1073876992
 419 0190 55550000 		.word	21845
 420 0194 11100240 		.word	1073877009
 421 0198 55555555 		.word	1431655765
 422              		.cfi_endproc
 423              	.LFE6:
 425              		.align	1
 426              		.global	graphic_read
 427              		.syntax unified
 428              		.code	16
 429              		.thumb_func
 430              		.fpu softvfp
 432              	graphic_read:
 433              	.LFB7:
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** uint8_t graphic_read(uint8_t controller){
 434              		.loc 1 122 0
 435              		.cfi_startproc
 436              		@ args = 0, pretend = 0, frame = 16
 437              		@ frame_needed = 1, uses_anonymous_args = 0
 438 019c 80B5     		push	{r7, lr}
 439              		.cfi_def_cfa_offset 8
 440              		.cfi_offset 7, -8
 441              		.cfi_offset 14, -4
 442 019e 84B0     		sub	sp, sp, #16
 443              		.cfi_def_cfa_offset 24
 444 01a0 00AF     		add	r7, sp, #0
 445              		.cfi_def_cfa_register 7
 446 01a2 0200     		movs	r2, r0
 447 01a4 FB1D     		adds	r3, r7, #7
 448 01a6 1A70     		strb	r2, [r3]
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 449              		.loc 1 123 0
 450 01a8 4020     		movs	r0, #64
 451 01aa FFF7FEFF 		bl	graphics_ctrl_bit_clear
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x00005555;
 452              		.loc 1 124 0
 453 01ae 1C4B     		ldr	r3, .L31
 454 01b0 1C4A     		ldr	r2, .L31+4
 455 01b2 1A60     		str	r2, [r3]
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 456              		.loc 1 125 0
 457 01b4 0120     		movs	r0, #1
 458 01b6 FFF7FEFF 		bl	graphics_ctrl_bit_set
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RW);
 459              		.loc 1 126 0
 460 01ba 0220     		movs	r0, #2
 461 01bc FFF7FEFF 		bl	graphics_ctrl_bit_set
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 462              		.loc 1 127 0
 463 01c0 FB1D     		adds	r3, r7, #7
 464 01c2 1B78     		ldrb	r3, [r3]
 465 01c4 1800     		movs	r0, r3
 466 01c6 FFF7FEFF 		bl	select_controller
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 467              		.loc 1 128 0
 468 01ca FFF7FEFF 		bl	delay500ns
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 469              		.loc 1 129 0
 470 01ce 4020     		movs	r0, #64
 471 01d0 FFF7FEFF 		bl	graphics_ctrl_bit_set
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 472              		.loc 1 130 0
 473 01d4 FFF7FEFF 		bl	delay500ns
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         uint8_t RV = *GPIO_IDR_HIGH;
 474              		.loc 1 131 0
 475 01d8 134A     		ldr	r2, .L31+8
 476 01da 0F23     		movs	r3, #15
 477 01dc FB18     		adds	r3, r7, r3
 478 01de 1278     		ldrb	r2, [r2]
 479 01e0 1A70     		strb	r2, [r3]
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 480              		.loc 1 132 0
 481 01e2 4020     		movs	r0, #64
 482 01e4 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 483              		.loc 1 133 0
 484 01e8 0D4B     		ldr	r3, .L31
 485 01ea 104A     		ldr	r2, .L31+12
 486 01ec 1A60     		str	r2, [r3]
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS1){
 487              		.loc 1 134 0
 488 01ee FB1D     		adds	r3, r7, #7
 489 01f0 1B78     		ldrb	r3, [r3]
 490 01f2 082B     		cmp	r3, #8
 491 01f4 04D1     		bne	.L28
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 492              		.loc 1 135 0
 493 01f6 0820     		movs	r0, #8
 494 01f8 FFF7FEFF 		bl	select_controller
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 495              		.loc 1 136 0
 496 01fc FFF7FEFF 		bl	graphic_wait_ready
 497              	.L28:
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS2){
 498              		.loc 1 139 0
 499 0200 FB1D     		adds	r3, r7, #7
 500 0202 1B78     		ldrb	r3, [r3]
 501 0204 102B     		cmp	r3, #16
 502 0206 04D1     		bne	.L29
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 503              		.loc 1 140 0
 504 0208 1020     		movs	r0, #16
 505 020a FFF7FEFF 		bl	select_controller
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 506              		.loc 1 141 0
 507 020e FFF7FEFF 		bl	graphic_wait_ready
 508              	.L29:
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return RV;
 509              		.loc 1 144 0
 510 0212 0F23     		movs	r3, #15
 511 0214 FB18     		adds	r3, r7, r3
 512 0216 1B78     		ldrb	r3, [r3]
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 513              		.loc 1 146 0
 514 0218 1800     		movs	r0, r3
 515 021a BD46     		mov	sp, r7
 516 021c 04B0     		add	sp, sp, #16
 517              		@ sp needed
 518 021e 80BD     		pop	{r7, pc}
 519              	.L32:
 520              		.align	2
 521              	.L31:
 522 0220 00100240 		.word	1073876992
 523 0224 55550000 		.word	21845
 524 0228 11100240 		.word	1073877009
 525 022c 55555555 		.word	1431655765
 526              		.cfi_endproc
 527              	.LFE7:
 529              		.align	1
 530              		.global	graphic_write
 531              		.syntax unified
 532              		.code	16
 533              		.thumb_func
 534              		.fpu softvfp
 536              	graphic_write:
 537              	.LFB8:
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 538              		.loc 1 148 0
 539              		.cfi_startproc
 540              		@ args = 0, pretend = 0, frame = 8
 541              		@ frame_needed = 1, uses_anonymous_args = 0
 542 0230 80B5     		push	{r7, lr}
 543              		.cfi_def_cfa_offset 8
 544              		.cfi_offset 7, -8
 545              		.cfi_offset 14, -4
 546 0232 82B0     		sub	sp, sp, #8
 547              		.cfi_def_cfa_offset 16
 548 0234 00AF     		add	r7, sp, #0
 549              		.cfi_def_cfa_register 7
 550 0236 0200     		movs	r2, r0
 551 0238 FB1D     		adds	r3, r7, #7
 552 023a 1A70     		strb	r2, [r3]
 553 023c BB1D     		adds	r3, r7, #6
 554 023e 0A1C     		adds	r2, r1, #0
 555 0240 1A70     		strb	r2, [r3]
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_ODR_HIGH = value;
 556              		.loc 1 149 0
 557 0242 1A4A     		ldr	r2, .L36
 558 0244 FB1D     		adds	r3, r7, #7
 559 0246 1B78     		ldrb	r3, [r3]
 560 0248 1370     		strb	r3, [r2]
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 561              		.loc 1 150 0
 562 024a BB1D     		adds	r3, r7, #6
 563 024c 1B78     		ldrb	r3, [r3]
 564 024e 1800     		movs	r0, r3
 565 0250 FFF7FEFF 		bl	select_controller
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 566              		.loc 1 151 0
 567 0254 FFF7FEFF 		bl	delay500ns
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 568              		.loc 1 152 0
 569 0258 4020     		movs	r0, #64
 570 025a FFF7FEFF 		bl	graphics_ctrl_bit_set
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 571              		.loc 1 153 0
 572 025e FFF7FEFF 		bl	delay500ns
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 573              		.loc 1 154 0
 574 0262 4020     		movs	r0, #64
 575 0264 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller & B_CS1){
 576              		.loc 1 156 0
 577 0268 BB1D     		adds	r3, r7, #6
 578 026a 1B78     		ldrb	r3, [r3]
 579 026c 0822     		movs	r2, #8
 580 026e 1340     		ands	r3, r2
 581 0270 04D0     		beq	.L34
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 582              		.loc 1 157 0
 583 0272 0820     		movs	r0, #8
 584 0274 FFF7FEFF 		bl	select_controller
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 585              		.loc 1 158 0
 586 0278 FFF7FEFF 		bl	graphic_wait_ready
 587              	.L34:
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller & B_CS2){
 588              		.loc 1 161 0
 589 027c BB1D     		adds	r3, r7, #6
 590 027e 1B78     		ldrb	r3, [r3]
 591 0280 1022     		movs	r2, #16
 592 0282 1340     		ands	r3, r2
 593 0284 04D0     		beq	.L35
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 594              		.loc 1 162 0
 595 0286 1020     		movs	r0, #16
 596 0288 FFF7FEFF 		bl	select_controller
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();     
 597              		.loc 1 163 0
 598 028c FFF7FEFF 		bl	graphic_wait_ready
 599              	.L35:
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_ODR_HIGH = 0;
 600              		.loc 1 166 0
 601 0290 064B     		ldr	r3, .L36
 602 0292 0022     		movs	r2, #0
 603 0294 1A70     		strb	r2, [r3]
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 604              		.loc 1 167 0
 605 0296 4020     		movs	r0, #64
 606 0298 FFF7FEFF 		bl	graphics_ctrl_bit_set
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(0);
 607              		.loc 1 168 0
 608 029c 0020     		movs	r0, #0
 609 029e FFF7FEFF 		bl	select_controller
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 610              		.loc 1 169 0
 611 02a2 C046     		nop
 612 02a4 BD46     		mov	sp, r7
 613 02a6 02B0     		add	sp, sp, #8
 614              		@ sp needed
 615 02a8 80BD     		pop	{r7, pc}
 616              	.L37:
 617 02aa C046     		.align	2
 618              	.L36:
 619 02ac 15100240 		.word	1073877013
 620              		.cfi_endproc
 621              	.LFE8:
 623              		.align	1
 624              		.global	graphic_write_command
 625              		.syntax unified
 626              		.code	16
 627              		.thumb_func
 628              		.fpu softvfp
 630              	graphic_write_command:
 631              	.LFB9:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 632              		.loc 1 171 0
 633              		.cfi_startproc
 634              		@ args = 0, pretend = 0, frame = 8
 635              		@ frame_needed = 1, uses_anonymous_args = 0
 636 02b0 80B5     		push	{r7, lr}
 637              		.cfi_def_cfa_offset 8
 638              		.cfi_offset 7, -8
 639              		.cfi_offset 14, -4
 640 02b2 82B0     		sub	sp, sp, #8
 641              		.cfi_def_cfa_offset 16
 642 02b4 00AF     		add	r7, sp, #0
 643              		.cfi_def_cfa_register 7
 644 02b6 0200     		movs	r2, r0
 645 02b8 FB1D     		adds	r3, r7, #7
 646 02ba 1A70     		strb	r2, [r3]
 647 02bc BB1D     		adds	r3, r7, #6
 648 02be 0A1C     		adds	r2, r1, #0
 649 02c0 1A70     		strb	r2, [r3]
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 650              		.loc 1 172 0
 651 02c2 4020     		movs	r0, #64
 652 02c4 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 653              		.loc 1 173 0
 654 02c8 BB1D     		adds	r3, r7, #6
 655 02ca 1B78     		ldrb	r3, [r3]
 656 02cc 1800     		movs	r0, r3
 657 02ce FFF7FEFF 		bl	select_controller
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RS);
 658              		.loc 1 174 0
 659 02d2 0120     		movs	r0, #1
 660 02d4 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 661              		.loc 1 175 0
 662 02d8 0220     		movs	r0, #2
 663 02da FFF7FEFF 		bl	graphics_ctrl_bit_clear
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(command, controller);
 664              		.loc 1 176 0
 665 02de BB1D     		adds	r3, r7, #6
 666 02e0 1A78     		ldrb	r2, [r3]
 667 02e2 FB1D     		adds	r3, r7, #7
 668 02e4 1B78     		ldrb	r3, [r3]
 669 02e6 1100     		movs	r1, r2
 670 02e8 1800     		movs	r0, r3
 671 02ea FFF7FEFF 		bl	graphic_write
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 672              		.loc 1 177 0
 673 02ee C046     		nop
 674 02f0 BD46     		mov	sp, r7
 675 02f2 02B0     		add	sp, sp, #8
 676              		@ sp needed
 677 02f4 80BD     		pop	{r7, pc}
 678              		.cfi_endproc
 679              	.LFE9:
 681              		.align	1
 682              		.global	graphic_write_data
 683              		.syntax unified
 684              		.code	16
 685              		.thumb_func
 686              		.fpu softvfp
 688              	graphic_write_data:
 689              	.LFB10:
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 690              		.loc 1 179 0
 691              		.cfi_startproc
 692              		@ args = 0, pretend = 0, frame = 8
 693              		@ frame_needed = 1, uses_anonymous_args = 0
 694 02f6 80B5     		push	{r7, lr}
 695              		.cfi_def_cfa_offset 8
 696              		.cfi_offset 7, -8
 697              		.cfi_offset 14, -4
 698 02f8 82B0     		sub	sp, sp, #8
 699              		.cfi_def_cfa_offset 16
 700 02fa 00AF     		add	r7, sp, #0
 701              		.cfi_def_cfa_register 7
 702 02fc 0200     		movs	r2, r0
 703 02fe FB1D     		adds	r3, r7, #7
 704 0300 1A70     		strb	r2, [r3]
 705 0302 BB1D     		adds	r3, r7, #6
 706 0304 0A1C     		adds	r2, r1, #0
 707 0306 1A70     		strb	r2, [r3]
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 708              		.loc 1 180 0
 709 0308 4020     		movs	r0, #64
 710 030a FFF7FEFF 		bl	graphics_ctrl_bit_clear
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 711              		.loc 1 181 0
 712 030e BB1D     		adds	r3, r7, #6
 713 0310 1B78     		ldrb	r3, [r3]
 714 0312 1800     		movs	r0, r3
 715 0314 FFF7FEFF 		bl	select_controller
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 716              		.loc 1 182 0
 717 0318 0120     		movs	r0, #1
 718 031a FFF7FEFF 		bl	graphics_ctrl_bit_set
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 719              		.loc 1 183 0
 720 031e 0220     		movs	r0, #2
 721 0320 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(data, controller);
 722              		.loc 1 184 0
 723 0324 BB1D     		adds	r3, r7, #6
 724 0326 1A78     		ldrb	r2, [r3]
 725 0328 FB1D     		adds	r3, r7, #7
 726 032a 1B78     		ldrb	r3, [r3]
 727 032c 1100     		movs	r1, r2
 728 032e 1800     		movs	r0, r3
 729 0330 FFF7FEFF 		bl	graphic_write
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 730              		.loc 1 185 0
 731 0334 C046     		nop
 732 0336 BD46     		mov	sp, r7
 733 0338 02B0     		add	sp, sp, #8
 734              		@ sp needed
 735 033a 80BD     		pop	{r7, pc}
 736              		.cfi_endproc
 737              	.LFE10:
 739              		.align	1
 740              		.global	graphics_read_data
 741              		.syntax unified
 742              		.code	16
 743              		.thumb_func
 744              		.fpu softvfp
 746              	graphics_read_data:
 747              	.LFB11:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** uint8_t graphics_read_data(uint8_t controller){
 748              		.loc 1 187 0
 749              		.cfi_startproc
 750              		@ args = 0, pretend = 0, frame = 8
 751              		@ frame_needed = 1, uses_anonymous_args = 0
 752 033c 80B5     		push	{r7, lr}
 753              		.cfi_def_cfa_offset 8
 754              		.cfi_offset 7, -8
 755              		.cfi_offset 14, -4
 756 033e 82B0     		sub	sp, sp, #8
 757              		.cfi_def_cfa_offset 16
 758 0340 00AF     		add	r7, sp, #0
 759              		.cfi_def_cfa_register 7
 760 0342 0200     		movs	r2, r0
 761 0344 FB1D     		adds	r3, r7, #7
 762 0346 1A70     		strb	r2, [r3]
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         (void) graphic_read(controller);
 763              		.loc 1 188 0
 764 0348 FB1D     		adds	r3, r7, #7
 765 034a 1B78     		ldrb	r3, [r3]
 766 034c 1800     		movs	r0, r3
 767 034e FFF7FEFF 		bl	graphic_read
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return graphic_read(controller);
 768              		.loc 1 189 0
 769 0352 FB1D     		adds	r3, r7, #7
 770 0354 1B78     		ldrb	r3, [r3]
 771 0356 1800     		movs	r0, r3
 772 0358 FFF7FEFF 		bl	graphic_read
 773 035c 0300     		movs	r3, r0
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 774              		.loc 1 190 0
 775 035e 1800     		movs	r0, r3
 776 0360 BD46     		mov	sp, r7
 777 0362 02B0     		add	sp, sp, #8
 778              		@ sp needed
 779 0364 80BD     		pop	{r7, pc}
 780              		.cfi_endproc
 781              	.LFE11:
 783              		.align	1
 784              		.global	delay_micro
 785              		.syntax unified
 786              		.code	16
 787              		.thumb_func
 788              		.fpu softvfp
 790              	delay_micro:
 791              	.LFB12:
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_micro(unsigned int us) {
 792              		.loc 1 192 0
 793              		.cfi_startproc
 794              		@ args = 0, pretend = 0, frame = 8
 795              		@ frame_needed = 1, uses_anonymous_args = 0
 796 0366 80B5     		push	{r7, lr}
 797              		.cfi_def_cfa_offset 8
 798              		.cfi_offset 7, -8
 799              		.cfi_offset 14, -4
 800 0368 82B0     		sub	sp, sp, #8
 801              		.cfi_def_cfa_offset 16
 802 036a 00AF     		add	r7, sp, #0
 803              		.cfi_def_cfa_register 7
 804 036c 7860     		str	r0, [r7, #4]
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while(us--) {
 805              		.loc 1 193 0
 806 036e 07E0     		b	.L43
 807              	.L44:
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 808              		.loc 1 194 0
 809 0370 FFF7FEFF 		bl	delay_250ns
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 810              		.loc 1 195 0
 811 0374 FFF7FEFF 		bl	delay_250ns
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 812              		.loc 1 196 0
 813 0378 FFF7FEFF 		bl	delay_250ns
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 814              		.loc 1 197 0
 815 037c FFF7FEFF 		bl	delay_250ns
 816              	.L43:
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 817              		.loc 1 193 0
 818 0380 7B68     		ldr	r3, [r7, #4]
 819 0382 5A1E     		subs	r2, r3, #1
 820 0384 7A60     		str	r2, [r7, #4]
 821 0386 002B     		cmp	r3, #0
 822 0388 F2D1     		bne	.L44
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 823              		.loc 1 199 0
 824 038a C046     		nop
 825 038c BD46     		mov	sp, r7
 826 038e 02B0     		add	sp, sp, #8
 827              		@ sp needed
 828 0390 80BD     		pop	{r7, pc}
 829              		.cfi_endproc
 830              	.LFE12:
 832              		.align	1
 833              		.global	delay_milli
 834              		.syntax unified
 835              		.code	16
 836              		.thumb_func
 837              		.fpu softvfp
 839              	delay_milli:
 840              	.LFB13:
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_milli(unsigned int ms) {
 841              		.loc 1 201 0
 842              		.cfi_startproc
 843              		@ args = 0, pretend = 0, frame = 8
 844              		@ frame_needed = 1, uses_anonymous_args = 0
 845 0392 80B5     		push	{r7, lr}
 846              		.cfi_def_cfa_offset 8
 847              		.cfi_offset 7, -8
 848              		.cfi_offset 14, -4
 849 0394 82B0     		sub	sp, sp, #8
 850              		.cfi_def_cfa_offset 16
 851 0396 00AF     		add	r7, sp, #0
 852              		.cfi_def_cfa_register 7
 853 0398 7860     		str	r0, [r7, #4]
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#ifdef SIMULATOR
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(ms);
 854              		.loc 1 203 0
 855 039a 7B68     		ldr	r3, [r7, #4]
 856 039c 1800     		movs	r0, r3
 857 039e FFF7FEFF 		bl	delay_micro
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#else
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(1000 * ms);
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#endif
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 858              		.loc 1 207 0
 859 03a2 C046     		nop
 860 03a4 BD46     		mov	sp, r7
 861 03a6 02B0     		add	sp, sp, #8
 862              		@ sp needed
 863 03a8 80BD     		pop	{r7, pc}
 864              		.cfi_endproc
 865              	.LFE13:
 867              		.align	1
 868              		.global	init_app
 869              		.syntax unified
 870              		.code	16
 871              		.thumb_func
 872              		.fpu softvfp
 874              	init_app:
 875              	.LFB14:
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void init_app(void){
 876              		.loc 1 209 0
 877              		.cfi_startproc
 878              		@ args = 0, pretend = 0, frame = 0
 879              		@ frame_needed = 1, uses_anonymous_args = 0
 880 03aa 80B5     		push	{r7, lr}
 881              		.cfi_def_cfa_offset 8
 882              		.cfi_offset 7, -8
 883              		.cfi_offset 14, -4
 884 03ac 00AF     		add	r7, sp, #0
 885              		.cfi_def_cfa_register 7
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 886              		.loc 1 210 0
 887 03ae 034B     		ldr	r3, .L47
 888 03b0 034A     		ldr	r2, .L47+4
 889 03b2 1A60     		str	r2, [r3]
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 890              		.loc 1 212 0
 891 03b4 C046     		nop
 892 03b6 BD46     		mov	sp, r7
 893              		@ sp needed
 894 03b8 80BD     		pop	{r7, pc}
 895              	.L48:
 896 03ba C046     		.align	2
 897              	.L47:
 898 03bc 00100240 		.word	1073876992
 899 03c0 55555555 		.word	1431655765
 900              		.cfi_endproc
 901              	.LFE14:
 903              		.align	1
 904              		.global	graphic_initialize
 905              		.syntax unified
 906              		.code	16
 907              		.thumb_func
 908              		.fpu softvfp
 910              	graphic_initialize:
 911              	.LFB15:
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_initialize(void){
 912              		.loc 1 214 0
 913              		.cfi_startproc
 914              		@ args = 0, pretend = 0, frame = 0
 915              		@ frame_needed = 1, uses_anonymous_args = 0
 916 03c4 80B5     		push	{r7, lr}
 917              		.cfi_def_cfa_offset 8
 918              		.cfi_offset 7, -8
 919              		.cfi_offset 14, -4
 920 03c6 00AF     		add	r7, sp, #0
 921              		.cfi_def_cfa_register 7
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_set(B_E);
 922              		.loc 1 215 0
 923 03c8 4020     		movs	r0, #64
 924 03ca FFF7FEFF 		bl	graphics_ctrl_bit_set
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_micro(10);
 925              		.loc 1 216 0
 926 03ce 0A20     		movs	r0, #10
 927 03d0 FFF7FEFF 		bl	delay_micro
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS1);
 928              		.loc 1 217 0
 929 03d4 0820     		movs	r0, #8
 930 03d6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS2);
 931              		.loc 1 218 0
 932 03da 1020     		movs	r0, #16
 933 03dc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 219:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_RST);
 934              		.loc 1 219 0
 935 03e0 2020     		movs	r0, #32
 936 03e2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 220:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_E);
 937              		.loc 1 220 0
 938 03e6 4020     		movs	r0, #64
 939 03e8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 221:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_milli(30);
 940              		.loc 1 221 0
 941 03ec 1E20     		movs	r0, #30
 942 03ee FFF7FEFF 		bl	delay_milli
 222:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_set(B_RST);
 943              		.loc 1 222 0
 944 03f2 2020     		movs	r0, #32
 945 03f4 FFF7FEFF 		bl	graphics_ctrl_bit_set
 223:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 946              		.loc 1 223 0
 947 03f8 1821     		movs	r1, #24
 948 03fa 3E20     		movs	r0, #62
 949 03fc FFF7FEFF 		bl	graphic_write_command
 224:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_ON, B_CS1|B_CS2);
 950              		.loc 1 224 0
 951 0400 1821     		movs	r1, #24
 952 0402 3F20     		movs	r0, #63
 953 0404 FFF7FEFF 		bl	graphic_write_command
 225:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 954              		.loc 1 225 0
 955 0408 1821     		movs	r1, #24
 956 040a C020     		movs	r0, #192
 957 040c FFF7FEFF 		bl	graphic_write_command
 226:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 958              		.loc 1 226 0
 959 0410 1821     		movs	r1, #24
 960 0412 4020     		movs	r0, #64
 961 0414 FFF7FEFF 		bl	graphic_write_command
 227:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 962              		.loc 1 227 0
 963 0418 1821     		movs	r1, #24
 964 041a B820     		movs	r0, #184
 965 041c FFF7FEFF 		bl	graphic_write_command
 228:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      select_controller(0);
 966              		.loc 1 228 0
 967 0420 0020     		movs	r0, #0
 968 0422 FFF7FEFF 		bl	select_controller
 229:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 969              		.loc 1 229 0
 970 0426 C046     		nop
 971 0428 BD46     		mov	sp, r7
 972              		@ sp needed
 973 042a 80BD     		pop	{r7, pc}
 974              		.cfi_endproc
 975              	.LFE15:
 977              		.align	1
 978              		.global	graphics_clear_screen
 979              		.syntax unified
 980              		.code	16
 981              		.thumb_func
 982              		.fpu softvfp
 984              	graphics_clear_screen:
 985              	.LFB16:
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 231:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_clear_screen(void){
 986              		.loc 1 231 0
 987              		.cfi_startproc
 988              		@ args = 0, pretend = 0, frame = 8
 989              		@ frame_needed = 1, uses_anonymous_args = 0
 990 042c 80B5     		push	{r7, lr}
 991              		.cfi_def_cfa_offset 8
 992              		.cfi_offset 7, -8
 993              		.cfi_offset 14, -4
 994 042e 82B0     		sub	sp, sp, #8
 995              		.cfi_def_cfa_offset 16
 996 0430 00AF     		add	r7, sp, #0
 997              		.cfi_def_cfa_register 7
 998              	.LBB4:
 232:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int page = 0; page < PAGE; page++){
 999              		.loc 1 232 0
 1000 0432 0023     		movs	r3, #0
 1001 0434 7B60     		str	r3, [r7, #4]
 1002 0436 1EE0     		b	.L51
 1003              	.L54:
 233:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1004              		.loc 1 233 0
 1005 0438 7B68     		ldr	r3, [r7, #4]
 1006 043a 5BB2     		sxtb	r3, r3
 1007 043c 4822     		movs	r2, #72
 1008 043e 5242     		rsbs	r2, r2, #0
 1009 0440 1343     		orrs	r3, r2
 1010 0442 5BB2     		sxtb	r3, r3
 1011 0444 DBB2     		uxtb	r3, r3
 1012 0446 1821     		movs	r1, #24
 1013 0448 1800     		movs	r0, r3
 1014 044a FFF7FEFF 		bl	graphic_write_command
 234:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1015              		.loc 1 234 0
 1016 044e 1821     		movs	r1, #24
 1017 0450 4020     		movs	r0, #64
 1018 0452 FFF7FEFF 		bl	graphic_write_command
 1019              	.LBB5:
 235:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1020              		.loc 1 235 0
 1021 0456 0023     		movs	r3, #0
 1022 0458 3B60     		str	r3, [r7]
 1023 045a 06E0     		b	.L52
 1024              	.L53:
 236:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_write_data(0, B_CS1|B_CS2);
 1025              		.loc 1 236 0 discriminator 3
 1026 045c 1821     		movs	r1, #24
 1027 045e 0020     		movs	r0, #0
 1028 0460 FFF7FEFF 		bl	graphic_write_data
 235:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1029              		.loc 1 235 0 discriminator 3
 1030 0464 3B68     		ldr	r3, [r7]
 1031 0466 0133     		adds	r3, r3, #1
 1032 0468 3B60     		str	r3, [r7]
 1033              	.L52:
 235:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1034              		.loc 1 235 0 is_stmt 0 discriminator 1
 1035 046a 3B68     		ldr	r3, [r7]
 1036 046c 3E2B     		cmp	r3, #62
 1037 046e F5DD     		ble	.L53
 1038              	.LBE5:
 232:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1039              		.loc 1 232 0 is_stmt 1 discriminator 2
 1040 0470 7B68     		ldr	r3, [r7, #4]
 1041 0472 0133     		adds	r3, r3, #1
 1042 0474 7B60     		str	r3, [r7, #4]
 1043              	.L51:
 232:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1044              		.loc 1 232 0 is_stmt 0 discriminator 1
 1045 0476 7B68     		ldr	r3, [r7, #4]
 1046 0478 072B     		cmp	r3, #7
 1047 047a DDDD     		ble	.L54
 1048              	.LBE4:
 237:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 238:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 239:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 240:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 1049              		.loc 1 240 0 is_stmt 1
 1050 047c C046     		nop
 1051 047e BD46     		mov	sp, r7
 1052 0480 02B0     		add	sp, sp, #8
 1053              		@ sp needed
 1054 0482 80BD     		pop	{r7, pc}
 1055              		.cfi_endproc
 1056              	.LFE16:
 1058              		.align	1
 1059              		.global	main
 1060              		.syntax unified
 1061              		.code	16
 1062              		.thumb_func
 1063              		.fpu softvfp
 1065              	main:
 1066              	.LFB17:
 241:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 242:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void main(void)
 243:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
 1067              		.loc 1 243 0
 1068              		.cfi_startproc
 1069              		@ args = 0, pretend = 0, frame = 0
 1070              		@ frame_needed = 1, uses_anonymous_args = 0
 1071 0484 80B5     		push	{r7, lr}
 1072              		.cfi_def_cfa_offset 8
 1073              		.cfi_offset 7, -8
 1074              		.cfi_offset 14, -4
 1075 0486 00AF     		add	r7, sp, #0
 1076              		.cfi_def_cfa_register 7
 244:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     init_app();
 1077              		.loc 1 244 0
 1078 0488 FFF7FEFF 		bl	init_app
 245:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_initialize();
 1079              		.loc 1 245 0
 1080 048c FFF7FEFF 		bl	graphic_initialize
 246:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #ifndef SIMULATOR
 247:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_clear_screen();
 248:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #endif
 249:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 250:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1081              		.loc 1 250 0
 1082 0490 1821     		movs	r1, #24
 1083 0492 4A20     		movs	r0, #74
 1084 0494 FFF7FEFF 		bl	graphic_write_command
 251:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1085              		.loc 1 251 0
 1086 0498 1821     		movs	r1, #24
 1087 049a B920     		movs	r0, #185
 1088 049c FFF7FEFF 		bl	graphic_write_command
 252:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_data(0xFF, B_CS1 | B_CS2);
 1089              		.loc 1 252 0
 1090 04a0 1821     		movs	r1, #24
 1091 04a2 FF20     		movs	r0, #255
 1092 04a4 FFF7FEFF 		bl	graphic_write_data
 253:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }    
 1093              		.loc 1 253 0
 1094 04a8 C046     		nop
 1095 04aa BD46     		mov	sp, r7
 1096              		@ sp needed
 1097 04ac 80BD     		pop	{r7, pc}
 1098              		.cfi_endproc
 1099              	.LFE17:
 1101              	.Letext0:
