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
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** // AciiiDisplay values
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_E 6
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_SELECT 4
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RW 1
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RS 0
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_RST   32
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_CS2   16
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define B_CS1   8
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_ON  0x3F
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_OFF 0x3E
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_SET_ADD 0x40
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_SET_PAGE 0xB8
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_DISP_START 0xC0
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define LCD_BUSY 0x80
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define PAGE 8
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** #define ADD 63
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** typedef unsigned char uint8_t;
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void startup ( void )
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
  26              		.loc 1 46 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** asm volatile(
  31              		.loc 1 47 0
  32              		.syntax divided
  33              	@ 47 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" MOV SP,R0\n"
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	" BL main\n"				/* call main */
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	".L1: B .L1\n"				/* never return */
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	) ;
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
  40              		.loc 1 53 0
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
  54:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  55:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  56:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_250ns(void) {
  57              		.loc 1 56 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  57:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 0;
  67              		.loc 1 57 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  58:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  71              		.loc 1 58 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 3122     		movs	r2, #49
  74 000e 1A60     		str	r2, [r3]
  59:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_VAL = 0;
  75              		.loc 1 59 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  60:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 5;
  79              		.loc 1 60 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  61:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
  83              		.loc 1 61 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 61 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  62:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		// ??????
  63:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
  64:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	*STK_CTRL = 0;
  93              		.loc 1 64 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  65:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
  97              		.loc 1 65 0
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
  66:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  67:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay500ns(){
 120              		.loc 1 67 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  68:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     //Delay 500ns in the most efficient way:
  69:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay_250ns();
 130              		.loc 1 69 0
 131 0048 FFF7FEFF 		bl	delay_250ns
  70:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay_250ns();
 132              		.loc 1 70 0
 133 004c FFF7FEFF 		bl	delay_250ns
  71:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         //Continue executing code efficently/.
  72:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 134              		.loc 1 72 0
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
  73:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  74:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_ctrl_bit_set(uint8_t x){
 151              		.loc 1 74 0
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
  75:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
 166              		.loc 1 75 0
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
  76:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 182              		.loc 1 76 0
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
  77:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
  78:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_ctrl_bit_clear(uint8_t x){
 204              		.loc 1 78 0
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
  79:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_ODR_LOW &= ~x;
 219              		.loc 1 79 0
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
  80:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 234              		.loc 1 80 0
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
  81:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
  82:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void select_controller(uint8_t controller){
 256              		.loc 1 82 0
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
  83:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == 0){
 271              		.loc 1 83 0
 272 00cc FB1D     		adds	r3, r7, #7
 273 00ce 1B78     		ldrb	r3, [r3]
 274 00d0 002B     		cmp	r3, #0
 275 00d2 06D1     		bne	.L14
  84:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS1);
 276              		.loc 1 84 0
 277 00d4 0820     		movs	r0, #8
 278 00d6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  85:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS2);
 279              		.loc 1 85 0
 280 00da 1020     		movs	r0, #16
 281 00dc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 282 00e0 05E0     		b	.L15
 283              	.L14:
  86:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
  87:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         else if(B_CS1 | B_CS2){
  88:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS1);
 284              		.loc 1 88 0
 285 00e2 0820     		movs	r0, #8
 286 00e4 FFF7FEFF 		bl	graphics_ctrl_bit_set
  89:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS2);
 287              		.loc 1 89 0
 288 00e8 1020     		movs	r0, #16
 289 00ea FFF7FEFF 		bl	graphics_ctrl_bit_set
 290              	.L15:
  90:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
  91:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS1){
 291              		.loc 1 91 0
 292 00ee FB1D     		adds	r3, r7, #7
 293 00f0 1B78     		ldrb	r3, [r3]
 294 00f2 082B     		cmp	r3, #8
 295 00f4 05D1     		bne	.L16
  92:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS1);
 296              		.loc 1 92 0
 297 00f6 0820     		movs	r0, #8
 298 00f8 FFF7FEFF 		bl	graphics_ctrl_bit_set
  93:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS2);
 299              		.loc 1 93 0
 300 00fc 1020     		movs	r0, #16
 301 00fe FFF7FEFF 		bl	graphics_ctrl_bit_clear
 302              	.L16:
  94:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
  95:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS2){
 303              		.loc 1 95 0
 304 0102 FB1D     		adds	r3, r7, #7
 305 0104 1B78     		ldrb	r3, [r3]
 306 0106 102B     		cmp	r3, #16
 307 0108 05D1     		bne	.L18
  96:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_clear(B_CS1);
 308              		.loc 1 96 0
 309 010a 0820     		movs	r0, #8
 310 010c FFF7FEFF 		bl	graphics_ctrl_bit_clear
  97:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphics_ctrl_bit_set(B_CS2);
 311              		.loc 1 97 0
 312 0110 1020     		movs	r0, #16
 313 0112 FFF7FEFF 		bl	graphics_ctrl_bit_set
 314              	.L18:
  98:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
  99:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 315              		.loc 1 99 0
 316 0116 C046     		nop
 317 0118 BD46     		mov	sp, r7
 318 011a 02B0     		add	sp, sp, #8
 319              		@ sp needed
 320 011c 80BD     		pop	{r7, pc}
 321              		.cfi_endproc
 322              	.LFE5:
 324              		.align	1
 325              		.global	graphic_wait_ready
 326              		.syntax unified
 327              		.code	16
 328              		.thumb_func
 329              		.fpu softvfp
 331              	graphic_wait_ready:
 332              	.LFB6:
 100:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_wait_ready(void){
 333              		.loc 1 101 0
 334              		.cfi_startproc
 335              		@ args = 0, pretend = 0, frame = 8
 336              		@ frame_needed = 1, uses_anonymous_args = 0
 337 011e 80B5     		push	{r7, lr}
 338              		.cfi_def_cfa_offset 8
 339              		.cfi_offset 7, -8
 340              		.cfi_offset 14, -4
 341 0120 82B0     		sub	sp, sp, #8
 342              		.cfi_def_cfa_offset 16
 343 0122 00AF     		add	r7, sp, #0
 344              		.cfi_def_cfa_register 7
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphics_ctrl_bit_clear(B_E);
 345              		.loc 1 102 0
 346 0124 0620     		movs	r0, #6
 347 0126 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     *GPIO_MODER = 0x00005555;
 348              		.loc 1 103 0
 349 012a 154B     		ldr	r3, .L25
 350 012c 154A     		ldr	r2, .L25+4
 351 012e 1A60     		str	r2, [r3]
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphics_ctrl_bit_clear(B_RS);
 352              		.loc 1 104 0
 353 0130 0020     		movs	r0, #0
 354 0132 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphics_ctrl_bit_set(B_RW);
 355              		.loc 1 105 0
 356 0136 0120     		movs	r0, #1
 357 0138 FFF7FEFF 		bl	graphics_ctrl_bit_set
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     delay500ns();
 358              		.loc 1 106 0
 359 013c FFF7FEFF 		bl	delay500ns
 360              	.L22:
 361              	.LBB2:
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     while(1){
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 362              		.loc 1 109 0
 363 0140 0620     		movs	r0, #6
 364 0142 FFF7FEFF 		bl	graphics_ctrl_bit_set
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 365              		.loc 1 110 0
 366 0146 FFF7FEFF 		bl	delay500ns
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         char rv = *GPIO_ODR_HIGH;
 367              		.loc 1 111 0
 368 014a 0F4A     		ldr	r2, .L25+8
 369 014c FB1D     		adds	r3, r7, #7
 370 014e 1278     		ldrb	r2, [r2]
 371 0150 1A70     		strb	r2, [r3]
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 372              		.loc 1 112 0
 373 0152 0620     		movs	r0, #6
 374 0154 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 375              		.loc 1 113 0
 376 0158 FFF7FEFF 		bl	delay500ns
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if((rv&LCD_BUSY) == 0){
 377              		.loc 1 114 0
 378 015c FB1D     		adds	r3, r7, #7
 379 015e 1B78     		ldrb	r3, [r3]
 380 0160 5BB2     		sxtb	r3, r3
 381 0162 002B     		cmp	r3, #0
 382 0164 00DA     		bge	.L24
 383              	.LBE2:
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 384              		.loc 1 108 0
 385 0166 EBE7     		b	.L22
 386              	.L24:
 387              	.LBB3:
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             break;
 388              		.loc 1 115 0
 389 0168 C046     		nop
 390              	.LBE3:
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     *GPIO_MODER=0x55555555;
 391              		.loc 1 119 0
 392 016a 054B     		ldr	r3, .L25
 393 016c 074A     		ldr	r2, .L25+12
 394 016e 1A60     		str	r2, [r3]
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphics_ctrl_bit_set(B_E);
 395              		.loc 1 120 0
 396 0170 0620     		movs	r0, #6
 397 0172 FFF7FEFF 		bl	graphics_ctrl_bit_set
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 398              		.loc 1 121 0
 399 0176 C046     		nop
 400 0178 BD46     		mov	sp, r7
 401 017a 02B0     		add	sp, sp, #8
 402              		@ sp needed
 403 017c 80BD     		pop	{r7, pc}
 404              	.L26:
 405 017e C046     		.align	2
 406              	.L25:
 407 0180 00100240 		.word	1073876992
 408 0184 55550000 		.word	21845
 409 0188 15100240 		.word	1073877013
 410 018c 55555555 		.word	1431655765
 411              		.cfi_endproc
 412              	.LFE6:
 414              		.align	1
 415              		.global	graphic_read
 416              		.syntax unified
 417              		.code	16
 418              		.thumb_func
 419              		.fpu softvfp
 421              	graphic_read:
 422              	.LFB7:
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** char graphic_read(uint8_t controller){
 423              		.loc 1 122 0
 424              		.cfi_startproc
 425              		@ args = 0, pretend = 0, frame = 16
 426              		@ frame_needed = 1, uses_anonymous_args = 0
 427 0190 80B5     		push	{r7, lr}
 428              		.cfi_def_cfa_offset 8
 429              		.cfi_offset 7, -8
 430              		.cfi_offset 14, -4
 431 0192 84B0     		sub	sp, sp, #16
 432              		.cfi_def_cfa_offset 24
 433 0194 00AF     		add	r7, sp, #0
 434              		.cfi_def_cfa_register 7
 435 0196 0200     		movs	r2, r0
 436 0198 FB1D     		adds	r3, r7, #7
 437 019a 1A70     		strb	r2, [r3]
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 438              		.loc 1 123 0
 439 019c 0620     		movs	r0, #6
 440 019e FFF7FEFF 		bl	graphics_ctrl_bit_clear
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x00005555;
 441              		.loc 1 124 0
 442 01a2 1C4B     		ldr	r3, .L31
 443 01a4 1C4A     		ldr	r2, .L31+4
 444 01a6 1A60     		str	r2, [r3]
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 445              		.loc 1 125 0
 446 01a8 0020     		movs	r0, #0
 447 01aa FFF7FEFF 		bl	graphics_ctrl_bit_set
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RW);
 448              		.loc 1 126 0
 449 01ae 0120     		movs	r0, #1
 450 01b0 FFF7FEFF 		bl	graphics_ctrl_bit_set
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 451              		.loc 1 127 0
 452 01b4 FB1D     		adds	r3, r7, #7
 453 01b6 1B78     		ldrb	r3, [r3]
 454 01b8 1800     		movs	r0, r3
 455 01ba FFF7FEFF 		bl	select_controller
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 456              		.loc 1 128 0
 457 01be FFF7FEFF 		bl	delay500ns
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 458              		.loc 1 129 0
 459 01c2 0620     		movs	r0, #6
 460 01c4 FFF7FEFF 		bl	graphics_ctrl_bit_set
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 461              		.loc 1 130 0
 462 01c8 FFF7FEFF 		bl	delay500ns
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         char RV = *GPIO_IDR_HIGH;
 463              		.loc 1 131 0
 464 01cc 134A     		ldr	r2, .L31+8
 465 01ce 0F23     		movs	r3, #15
 466 01d0 FB18     		adds	r3, r7, r3
 467 01d2 1278     		ldrb	r2, [r2]
 468 01d4 1A70     		strb	r2, [r3]
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 469              		.loc 1 132 0
 470 01d6 0620     		movs	r0, #6
 471 01d8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 472              		.loc 1 133 0
 473 01dc 0D4B     		ldr	r3, .L31
 474 01de 104A     		ldr	r2, .L31+12
 475 01e0 1A60     		str	r2, [r3]
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS1){
 476              		.loc 1 134 0
 477 01e2 FB1D     		adds	r3, r7, #7
 478 01e4 1B78     		ldrb	r3, [r3]
 479 01e6 082B     		cmp	r3, #8
 480 01e8 04D1     		bne	.L28
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 481              		.loc 1 135 0
 482 01ea 0820     		movs	r0, #8
 483 01ec FFF7FEFF 		bl	select_controller
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 484              		.loc 1 136 0
 485 01f0 FFF7FEFF 		bl	graphic_wait_ready
 486              	.L28:
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS2){
 487              		.loc 1 139 0
 488 01f4 FB1D     		adds	r3, r7, #7
 489 01f6 1B78     		ldrb	r3, [r3]
 490 01f8 102B     		cmp	r3, #16
 491 01fa 04D1     		bne	.L29
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 492              		.loc 1 140 0
 493 01fc 1020     		movs	r0, #16
 494 01fe FFF7FEFF 		bl	select_controller
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 495              		.loc 1 141 0
 496 0202 FFF7FEFF 		bl	graphic_wait_ready
 497              	.L29:
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return RV;
 498              		.loc 1 144 0
 499 0206 0F23     		movs	r3, #15
 500 0208 FB18     		adds	r3, r7, r3
 501 020a 1B78     		ldrb	r3, [r3]
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 502              		.loc 1 146 0
 503 020c 1800     		movs	r0, r3
 504 020e BD46     		mov	sp, r7
 505 0210 04B0     		add	sp, sp, #16
 506              		@ sp needed
 507 0212 80BD     		pop	{r7, pc}
 508              	.L32:
 509              		.align	2
 510              	.L31:
 511 0214 00100240 		.word	1073876992
 512 0218 55550000 		.word	21845
 513 021c 11100240 		.word	1073877009
 514 0220 55555555 		.word	1431655765
 515              		.cfi_endproc
 516              	.LFE7:
 518              		.align	1
 519              		.global	graphic_write
 520              		.syntax unified
 521              		.code	16
 522              		.thumb_func
 523              		.fpu softvfp
 525              	graphic_write:
 526              	.LFB8:
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 527              		.loc 1 148 0
 528              		.cfi_startproc
 529              		@ args = 0, pretend = 0, frame = 8
 530              		@ frame_needed = 1, uses_anonymous_args = 0
 531 0224 80B5     		push	{r7, lr}
 532              		.cfi_def_cfa_offset 8
 533              		.cfi_offset 7, -8
 534              		.cfi_offset 14, -4
 535 0226 82B0     		sub	sp, sp, #8
 536              		.cfi_def_cfa_offset 16
 537 0228 00AF     		add	r7, sp, #0
 538              		.cfi_def_cfa_register 7
 539 022a 0200     		movs	r2, r0
 540 022c FB1D     		adds	r3, r7, #7
 541 022e 1A70     		strb	r2, [r3]
 542 0230 BB1D     		adds	r3, r7, #6
 543 0232 0A1C     		adds	r2, r1, #0
 544 0234 1A70     		strb	r2, [r3]
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_IDR_HIGH = value;
 545              		.loc 1 149 0
 546 0236 1A4A     		ldr	r2, .L36
 547 0238 FB1D     		adds	r3, r7, #7
 548 023a 1B78     		ldrb	r3, [r3]
 549 023c 1370     		strb	r3, [r2]
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 550              		.loc 1 150 0
 551 023e BB1D     		adds	r3, r7, #6
 552 0240 1B78     		ldrb	r3, [r3]
 553 0242 1800     		movs	r0, r3
 554 0244 FFF7FEFF 		bl	select_controller
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 555              		.loc 1 151 0
 556 0248 FFF7FEFF 		bl	delay500ns
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 557              		.loc 1 152 0
 558 024c 0620     		movs	r0, #6
 559 024e FFF7FEFF 		bl	graphics_ctrl_bit_set
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 560              		.loc 1 153 0
 561 0252 FFF7FEFF 		bl	delay500ns
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 562              		.loc 1 154 0
 563 0256 0620     		movs	r0, #6
 564 0258 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller & B_CS1){
 565              		.loc 1 156 0
 566 025c BB1D     		adds	r3, r7, #6
 567 025e 1B78     		ldrb	r3, [r3]
 568 0260 0822     		movs	r2, #8
 569 0262 1340     		ands	r3, r2
 570 0264 04D0     		beq	.L34
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 571              		.loc 1 157 0
 572 0266 0820     		movs	r0, #8
 573 0268 FFF7FEFF 		bl	select_controller
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 574              		.loc 1 158 0
 575 026c FFF7FEFF 		bl	graphic_wait_ready
 576              	.L34:
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller & B_CS2){
 577              		.loc 1 161 0
 578 0270 BB1D     		adds	r3, r7, #6
 579 0272 1B78     		ldrb	r3, [r3]
 580 0274 1022     		movs	r2, #16
 581 0276 1340     		ands	r3, r2
 582 0278 04D0     		beq	.L35
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 583              		.loc 1 162 0
 584 027a 1020     		movs	r0, #16
 585 027c FFF7FEFF 		bl	select_controller
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();     
 586              		.loc 1 163 0
 587 0280 FFF7FEFF 		bl	graphic_wait_ready
 588              	.L35:
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_IDR_HIGH = 0;
 589              		.loc 1 166 0
 590 0284 064B     		ldr	r3, .L36
 591 0286 0022     		movs	r2, #0
 592 0288 1A70     		strb	r2, [r3]
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 593              		.loc 1 167 0
 594 028a 0620     		movs	r0, #6
 595 028c FFF7FEFF 		bl	graphics_ctrl_bit_set
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(0);
 596              		.loc 1 168 0
 597 0290 0020     		movs	r0, #0
 598 0292 FFF7FEFF 		bl	select_controller
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 599              		.loc 1 169 0
 600 0296 C046     		nop
 601 0298 BD46     		mov	sp, r7
 602 029a 02B0     		add	sp, sp, #8
 603              		@ sp needed
 604 029c 80BD     		pop	{r7, pc}
 605              	.L37:
 606 029e C046     		.align	2
 607              	.L36:
 608 02a0 11100240 		.word	1073877009
 609              		.cfi_endproc
 610              	.LFE8:
 612              		.align	1
 613              		.global	graphic_write_command
 614              		.syntax unified
 615              		.code	16
 616              		.thumb_func
 617              		.fpu softvfp
 619              	graphic_write_command:
 620              	.LFB9:
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 621              		.loc 1 171 0
 622              		.cfi_startproc
 623              		@ args = 0, pretend = 0, frame = 8
 624              		@ frame_needed = 1, uses_anonymous_args = 0
 625 02a4 80B5     		push	{r7, lr}
 626              		.cfi_def_cfa_offset 8
 627              		.cfi_offset 7, -8
 628              		.cfi_offset 14, -4
 629 02a6 82B0     		sub	sp, sp, #8
 630              		.cfi_def_cfa_offset 16
 631 02a8 00AF     		add	r7, sp, #0
 632              		.cfi_def_cfa_register 7
 633 02aa 0200     		movs	r2, r0
 634 02ac FB1D     		adds	r3, r7, #7
 635 02ae 1A70     		strb	r2, [r3]
 636 02b0 BB1D     		adds	r3, r7, #6
 637 02b2 0A1C     		adds	r2, r1, #0
 638 02b4 1A70     		strb	r2, [r3]
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 639              		.loc 1 172 0
 640 02b6 0620     		movs	r0, #6
 641 02b8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 642              		.loc 1 173 0
 643 02bc BB1D     		adds	r3, r7, #6
 644 02be 1B78     		ldrb	r3, [r3]
 645 02c0 1800     		movs	r0, r3
 646 02c2 FFF7FEFF 		bl	select_controller
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RS);
 647              		.loc 1 174 0
 648 02c6 0020     		movs	r0, #0
 649 02c8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 650              		.loc 1 175 0
 651 02cc 0120     		movs	r0, #1
 652 02ce FFF7FEFF 		bl	graphics_ctrl_bit_clear
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(command, controller);
 653              		.loc 1 176 0
 654 02d2 BB1D     		adds	r3, r7, #6
 655 02d4 1A78     		ldrb	r2, [r3]
 656 02d6 FB1D     		adds	r3, r7, #7
 657 02d8 1B78     		ldrb	r3, [r3]
 658 02da 1100     		movs	r1, r2
 659 02dc 1800     		movs	r0, r3
 660 02de FFF7FEFF 		bl	graphic_write
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 661              		.loc 1 177 0
 662 02e2 C046     		nop
 663 02e4 BD46     		mov	sp, r7
 664 02e6 02B0     		add	sp, sp, #8
 665              		@ sp needed
 666 02e8 80BD     		pop	{r7, pc}
 667              		.cfi_endproc
 668              	.LFE9:
 670              		.align	1
 671              		.global	graphic_write_data
 672              		.syntax unified
 673              		.code	16
 674              		.thumb_func
 675              		.fpu softvfp
 677              	graphic_write_data:
 678              	.LFB10:
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 679              		.loc 1 179 0
 680              		.cfi_startproc
 681              		@ args = 0, pretend = 0, frame = 8
 682              		@ frame_needed = 1, uses_anonymous_args = 0
 683 02ea 80B5     		push	{r7, lr}
 684              		.cfi_def_cfa_offset 8
 685              		.cfi_offset 7, -8
 686              		.cfi_offset 14, -4
 687 02ec 82B0     		sub	sp, sp, #8
 688              		.cfi_def_cfa_offset 16
 689 02ee 00AF     		add	r7, sp, #0
 690              		.cfi_def_cfa_register 7
 691 02f0 0200     		movs	r2, r0
 692 02f2 FB1D     		adds	r3, r7, #7
 693 02f4 1A70     		strb	r2, [r3]
 694 02f6 BB1D     		adds	r3, r7, #6
 695 02f8 0A1C     		adds	r2, r1, #0
 696 02fa 1A70     		strb	r2, [r3]
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 697              		.loc 1 180 0
 698 02fc 0620     		movs	r0, #6
 699 02fe FFF7FEFF 		bl	graphics_ctrl_bit_clear
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 700              		.loc 1 181 0
 701 0302 BB1D     		adds	r3, r7, #6
 702 0304 1B78     		ldrb	r3, [r3]
 703 0306 1800     		movs	r0, r3
 704 0308 FFF7FEFF 		bl	select_controller
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 705              		.loc 1 182 0
 706 030c 0020     		movs	r0, #0
 707 030e FFF7FEFF 		bl	graphics_ctrl_bit_set
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 708              		.loc 1 183 0
 709 0312 0120     		movs	r0, #1
 710 0314 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(data, controller);
 711              		.loc 1 184 0
 712 0318 BB1D     		adds	r3, r7, #6
 713 031a 1A78     		ldrb	r2, [r3]
 714 031c FB1D     		adds	r3, r7, #7
 715 031e 1B78     		ldrb	r3, [r3]
 716 0320 1100     		movs	r1, r2
 717 0322 1800     		movs	r0, r3
 718 0324 FFF7FEFF 		bl	graphic_write
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 719              		.loc 1 185 0
 720 0328 C046     		nop
 721 032a BD46     		mov	sp, r7
 722 032c 02B0     		add	sp, sp, #8
 723              		@ sp needed
 724 032e 80BD     		pop	{r7, pc}
 725              		.cfi_endproc
 726              	.LFE10:
 728              		.align	1
 729              		.global	graphics_read_data
 730              		.syntax unified
 731              		.code	16
 732              		.thumb_func
 733              		.fpu softvfp
 735              	graphics_read_data:
 736              	.LFB11:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_read_data(uint8_t controller){
 737              		.loc 1 187 0
 738              		.cfi_startproc
 739              		@ args = 0, pretend = 0, frame = 8
 740              		@ frame_needed = 1, uses_anonymous_args = 0
 741 0330 80B5     		push	{r7, lr}
 742              		.cfi_def_cfa_offset 8
 743              		.cfi_offset 7, -8
 744              		.cfi_offset 14, -4
 745 0332 82B0     		sub	sp, sp, #8
 746              		.cfi_def_cfa_offset 16
 747 0334 00AF     		add	r7, sp, #0
 748              		.cfi_def_cfa_register 7
 749 0336 0200     		movs	r2, r0
 750 0338 FB1D     		adds	r3, r7, #7
 751 033a 1A70     		strb	r2, [r3]
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         (void) graphic_read(controller);
 752              		.loc 1 188 0
 753 033c FB1D     		adds	r3, r7, #7
 754 033e 1B78     		ldrb	r3, [r3]
 755 0340 1800     		movs	r0, r3
 756 0342 FFF7FEFF 		bl	graphic_read
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return graphic_read(controller);
 757              		.loc 1 189 0
 758 0346 FB1D     		adds	r3, r7, #7
 759 0348 1B78     		ldrb	r3, [r3]
 760 034a 1800     		movs	r0, r3
 761 034c FFF7FEFF 		bl	graphic_read
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 762              		.loc 1 190 0
 763 0350 BD46     		mov	sp, r7
 764 0352 02B0     		add	sp, sp, #8
 765              		@ sp needed
 766 0354 80BD     		pop	{r7, pc}
 767              		.cfi_endproc
 768              	.LFE11:
 770              		.align	1
 771              		.global	delay_micro
 772              		.syntax unified
 773              		.code	16
 774              		.thumb_func
 775              		.fpu softvfp
 777              	delay_micro:
 778              	.LFB12:
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_micro(unsigned int us) {
 779              		.loc 1 192 0
 780              		.cfi_startproc
 781              		@ args = 0, pretend = 0, frame = 8
 782              		@ frame_needed = 1, uses_anonymous_args = 0
 783 0356 80B5     		push	{r7, lr}
 784              		.cfi_def_cfa_offset 8
 785              		.cfi_offset 7, -8
 786              		.cfi_offset 14, -4
 787 0358 82B0     		sub	sp, sp, #8
 788              		.cfi_def_cfa_offset 16
 789 035a 00AF     		add	r7, sp, #0
 790              		.cfi_def_cfa_register 7
 791 035c 7860     		str	r0, [r7, #4]
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while(us--) {
 792              		.loc 1 193 0
 793 035e 07E0     		b	.L43
 794              	.L44:
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 795              		.loc 1 194 0
 796 0360 FFF7FEFF 		bl	delay_250ns
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 797              		.loc 1 195 0
 798 0364 FFF7FEFF 		bl	delay_250ns
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 799              		.loc 1 196 0
 800 0368 FFF7FEFF 		bl	delay_250ns
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 801              		.loc 1 197 0
 802 036c FFF7FEFF 		bl	delay_250ns
 803              	.L43:
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 804              		.loc 1 193 0
 805 0370 7B68     		ldr	r3, [r7, #4]
 806 0372 5A1E     		subs	r2, r3, #1
 807 0374 7A60     		str	r2, [r7, #4]
 808 0376 002B     		cmp	r3, #0
 809 0378 F2D1     		bne	.L44
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 810              		.loc 1 199 0
 811 037a C046     		nop
 812 037c BD46     		mov	sp, r7
 813 037e 02B0     		add	sp, sp, #8
 814              		@ sp needed
 815 0380 80BD     		pop	{r7, pc}
 816              		.cfi_endproc
 817              	.LFE12:
 819              		.align	1
 820              		.global	delay_milli
 821              		.syntax unified
 822              		.code	16
 823              		.thumb_func
 824              		.fpu softvfp
 826              	delay_milli:
 827              	.LFB13:
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_milli(unsigned int ms) {
 828              		.loc 1 201 0
 829              		.cfi_startproc
 830              		@ args = 0, pretend = 0, frame = 8
 831              		@ frame_needed = 1, uses_anonymous_args = 0
 832 0382 80B5     		push	{r7, lr}
 833              		.cfi_def_cfa_offset 8
 834              		.cfi_offset 7, -8
 835              		.cfi_offset 14, -4
 836 0384 82B0     		sub	sp, sp, #8
 837              		.cfi_def_cfa_offset 16
 838 0386 00AF     		add	r7, sp, #0
 839              		.cfi_def_cfa_register 7
 840 0388 7860     		str	r0, [r7, #4]
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#ifdef SIMULATOR
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(ms);
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#else
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(1000 * ms);
 841              		.loc 1 205 0
 842 038a 7B68     		ldr	r3, [r7, #4]
 843 038c FA22     		movs	r2, #250
 844 038e 9200     		lsls	r2, r2, #2
 845 0390 5343     		muls	r3, r2
 846 0392 1800     		movs	r0, r3
 847 0394 FFF7FEFF 		bl	delay_micro
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#endif
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 848              		.loc 1 207 0
 849 0398 C046     		nop
 850 039a BD46     		mov	sp, r7
 851 039c 02B0     		add	sp, sp, #8
 852              		@ sp needed
 853 039e 80BD     		pop	{r7, pc}
 854              		.cfi_endproc
 855              	.LFE13:
 857              		.align	1
 858              		.global	init_app
 859              		.syntax unified
 860              		.code	16
 861              		.thumb_func
 862              		.fpu softvfp
 864              	init_app:
 865              	.LFB14:
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void init_app(void){
 866              		.loc 1 209 0
 867              		.cfi_startproc
 868              		@ args = 0, pretend = 0, frame = 0
 869              		@ frame_needed = 1, uses_anonymous_args = 0
 870 03a0 80B5     		push	{r7, lr}
 871              		.cfi_def_cfa_offset 8
 872              		.cfi_offset 7, -8
 873              		.cfi_offset 14, -4
 874 03a2 00AF     		add	r7, sp, #0
 875              		.cfi_def_cfa_register 7
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 876              		.loc 1 210 0
 877 03a4 024B     		ldr	r3, .L47
 878 03a6 034A     		ldr	r2, .L47+4
 879 03a8 1A60     		str	r2, [r3]
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 880              		.loc 1 211 0
 881 03aa C046     		nop
 882 03ac BD46     		mov	sp, r7
 883              		@ sp needed
 884 03ae 80BD     		pop	{r7, pc}
 885              	.L48:
 886              		.align	2
 887              	.L47:
 888 03b0 00100240 		.word	1073876992
 889 03b4 55555555 		.word	1431655765
 890              		.cfi_endproc
 891              	.LFE14:
 893              		.align	1
 894              		.global	graphic_initialize
 895              		.syntax unified
 896              		.code	16
 897              		.thumb_func
 898              		.fpu softvfp
 900              	graphic_initialize:
 901              	.LFB15:
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_initialize(void){
 902              		.loc 1 213 0
 903              		.cfi_startproc
 904              		@ args = 0, pretend = 0, frame = 0
 905              		@ frame_needed = 1, uses_anonymous_args = 0
 906 03b8 80B5     		push	{r7, lr}
 907              		.cfi_def_cfa_offset 8
 908              		.cfi_offset 7, -8
 909              		.cfi_offset 14, -4
 910 03ba 00AF     		add	r7, sp, #0
 911              		.cfi_def_cfa_register 7
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_set(B_E);
 912              		.loc 1 214 0
 913 03bc 0620     		movs	r0, #6
 914 03be FFF7FEFF 		bl	graphics_ctrl_bit_set
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_micro(10);
 915              		.loc 1 215 0
 916 03c2 0A20     		movs	r0, #10
 917 03c4 FFF7FEFF 		bl	delay_micro
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS1);
 918              		.loc 1 216 0
 919 03c8 0820     		movs	r0, #8
 920 03ca FFF7FEFF 		bl	graphics_ctrl_bit_clear
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS2);
 921              		.loc 1 217 0
 922 03ce 1020     		movs	r0, #16
 923 03d0 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_RST);
 924              		.loc 1 218 0
 925 03d4 2020     		movs	r0, #32
 926 03d6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 219:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_E);
 927              		.loc 1 219 0
 928 03da 0620     		movs	r0, #6
 929 03dc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 220:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_micro(30);
 930              		.loc 1 220 0
 931 03e0 1E20     		movs	r0, #30
 932 03e2 FFF7FEFF 		bl	delay_micro
 221:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 933              		.loc 1 221 0
 934 03e6 1821     		movs	r1, #24
 935 03e8 3E20     		movs	r0, #62
 936 03ea FFF7FEFF 		bl	graphic_write_command
 222:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_ON, B_CS1|B_CS2);
 937              		.loc 1 222 0
 938 03ee 1821     		movs	r1, #24
 939 03f0 3F20     		movs	r0, #63
 940 03f2 FFF7FEFF 		bl	graphic_write_command
 223:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 941              		.loc 1 223 0
 942 03f6 1821     		movs	r1, #24
 943 03f8 C020     		movs	r0, #192
 944 03fa FFF7FEFF 		bl	graphic_write_command
 224:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 945              		.loc 1 224 0
 946 03fe 1821     		movs	r1, #24
 947 0400 4020     		movs	r0, #64
 948 0402 FFF7FEFF 		bl	graphic_write_command
 225:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 949              		.loc 1 225 0
 950 0406 1821     		movs	r1, #24
 951 0408 B820     		movs	r0, #184
 952 040a FFF7FEFF 		bl	graphic_write_command
 226:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      select_controller(0);
 953              		.loc 1 226 0
 954 040e 0020     		movs	r0, #0
 955 0410 FFF7FEFF 		bl	select_controller
 227:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 956              		.loc 1 227 0
 957 0414 C046     		nop
 958 0416 BD46     		mov	sp, r7
 959              		@ sp needed
 960 0418 80BD     		pop	{r7, pc}
 961              		.cfi_endproc
 962              	.LFE15:
 964              		.align	1
 965              		.global	graphics_clear_screen
 966              		.syntax unified
 967              		.code	16
 968              		.thumb_func
 969              		.fpu softvfp
 971              	graphics_clear_screen:
 972              	.LFB16:
 228:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 229:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_clear_screen(void){
 973              		.loc 1 229 0
 974              		.cfi_startproc
 975              		@ args = 0, pretend = 0, frame = 8
 976              		@ frame_needed = 1, uses_anonymous_args = 0
 977 041a 80B5     		push	{r7, lr}
 978              		.cfi_def_cfa_offset 8
 979              		.cfi_offset 7, -8
 980              		.cfi_offset 14, -4
 981 041c 82B0     		sub	sp, sp, #8
 982              		.cfi_def_cfa_offset 16
 983 041e 00AF     		add	r7, sp, #0
 984              		.cfi_def_cfa_register 7
 985              	.LBB4:
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int page = 0; page < PAGE; page++){
 986              		.loc 1 230 0
 987 0420 0023     		movs	r3, #0
 988 0422 7B60     		str	r3, [r7, #4]
 989 0424 1EE0     		b	.L51
 990              	.L54:
 231:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 991              		.loc 1 231 0
 992 0426 7B68     		ldr	r3, [r7, #4]
 993 0428 5BB2     		sxtb	r3, r3
 994 042a 4822     		movs	r2, #72
 995 042c 5242     		rsbs	r2, r2, #0
 996 042e 1343     		orrs	r3, r2
 997 0430 5BB2     		sxtb	r3, r3
 998 0432 DBB2     		uxtb	r3, r3
 999 0434 1821     		movs	r1, #24
 1000 0436 1800     		movs	r0, r3
 1001 0438 FFF7FEFF 		bl	graphic_write_command
 232:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1002              		.loc 1 232 0
 1003 043c 1821     		movs	r1, #24
 1004 043e 4020     		movs	r0, #64
 1005 0440 FFF7FEFF 		bl	graphic_write_command
 1006              	.LBB5:
 233:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1007              		.loc 1 233 0
 1008 0444 0023     		movs	r3, #0
 1009 0446 3B60     		str	r3, [r7]
 1010 0448 06E0     		b	.L52
 1011              	.L53:
 234:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_write_data(0, B_CS1|B_CS2);
 1012              		.loc 1 234 0 discriminator 3
 1013 044a 1821     		movs	r1, #24
 1014 044c 0020     		movs	r0, #0
 1015 044e FFF7FEFF 		bl	graphic_write_data
 233:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1016              		.loc 1 233 0 discriminator 3
 1017 0452 3B68     		ldr	r3, [r7]
 1018 0454 0133     		adds	r3, r3, #1
 1019 0456 3B60     		str	r3, [r7]
 1020              	.L52:
 233:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1021              		.loc 1 233 0 is_stmt 0 discriminator 1
 1022 0458 3B68     		ldr	r3, [r7]
 1023 045a 3E2B     		cmp	r3, #62
 1024 045c F5DD     		ble	.L53
 1025              	.LBE5:
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1026              		.loc 1 230 0 is_stmt 1 discriminator 2
 1027 045e 7B68     		ldr	r3, [r7, #4]
 1028 0460 0133     		adds	r3, r3, #1
 1029 0462 7B60     		str	r3, [r7, #4]
 1030              	.L51:
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1031              		.loc 1 230 0 is_stmt 0 discriminator 1
 1032 0464 7B68     		ldr	r3, [r7, #4]
 1033 0466 072B     		cmp	r3, #7
 1034 0468 DDDD     		ble	.L54
 1035              	.LBE4:
 235:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 236:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 237:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 238:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 1036              		.loc 1 238 0 is_stmt 1
 1037 046a C046     		nop
 1038 046c BD46     		mov	sp, r7
 1039 046e 02B0     		add	sp, sp, #8
 1040              		@ sp needed
 1041 0470 80BD     		pop	{r7, pc}
 1042              		.cfi_endproc
 1043              	.LFE16:
 1045              		.align	1
 1046              		.global	main
 1047              		.syntax unified
 1048              		.code	16
 1049              		.thumb_func
 1050              		.fpu softvfp
 1052              	main:
 1053              	.LFB17:
 239:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 240:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void main(void)
 241:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
 1054              		.loc 1 241 0
 1055              		.cfi_startproc
 1056              		@ args = 0, pretend = 0, frame = 0
 1057              		@ frame_needed = 1, uses_anonymous_args = 0
 1058 0472 80B5     		push	{r7, lr}
 1059              		.cfi_def_cfa_offset 8
 1060              		.cfi_offset 7, -8
 1061              		.cfi_offset 14, -4
 1062 0474 00AF     		add	r7, sp, #0
 1063              		.cfi_def_cfa_register 7
 242:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     init_app();
 1064              		.loc 1 242 0
 1065 0476 FFF7FEFF 		bl	init_app
 243:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_initialize();
 1066              		.loc 1 243 0
 1067 047a FFF7FEFF 		bl	graphic_initialize
 244:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #ifndef SIMULATOR
 245:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_clear_screen();
 1068              		.loc 1 245 0
 1069 047e FFF7FEFF 		bl	graphics_clear_screen
 246:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #endif
 247:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1070              		.loc 1 247 0
 1071 0482 1821     		movs	r1, #24
 1072 0484 4A20     		movs	r0, #74
 1073 0486 FFF7FEFF 		bl	graphic_write_command
 248:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1074              		.loc 1 248 0
 1075 048a 1821     		movs	r1, #24
 1076 048c B920     		movs	r0, #185
 1077 048e FFF7FEFF 		bl	graphic_write_command
 249:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_data(0xFF, B_CS1 | B_CS2);
 1078              		.loc 1 249 0
 1079 0492 1821     		movs	r1, #24
 1080 0494 FF20     		movs	r0, #255
 1081 0496 FFF7FEFF 		bl	graphic_write_data
 250:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }    
 1082              		.loc 1 250 0
 1083 049a C046     		nop
 1084 049c BD46     		mov	sp, r7
 1085              		@ sp needed
 1086 049e 80BD     		pop	{r7, pc}
 1087              		.cfi_endproc
 1088              	.LFE17:
 1090              	.Letext0:
