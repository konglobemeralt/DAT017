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
 101:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_wait_ready(){
 333              		.loc 1 101 0
 334              		.cfi_startproc
 335              		@ args = 0, pretend = 0, frame = 0
 336              		@ frame_needed = 1, uses_anonymous_args = 0
 337 011e 80B5     		push	{r7, lr}
 338              		.cfi_def_cfa_offset 8
 339              		.cfi_offset 7, -8
 340              		.cfi_offset 14, -4
 341 0120 00AF     		add	r7, sp, #0
 342              		.cfi_def_cfa_register 7
 102:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 343              		.loc 1 102 0
 344 0122 0620     		movs	r0, #6
 345 0124 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 103:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x00005555;
 346              		.loc 1 103 0
 347 0128 124B     		ldr	r3, .L22
 348 012a 134A     		ldr	r2, .L22+4
 349 012c 1A60     		str	r2, [r3]
 104:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RS);
 350              		.loc 1 104 0
 351 012e 0020     		movs	r0, #0
 352 0130 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 105:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RW);
 353              		.loc 1 105 0
 354 0134 0120     		movs	r0, #1
 355 0136 FFF7FEFF 		bl	graphics_ctrl_bit_set
 106:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 356              		.loc 1 106 0
 357 013a FFF7FEFF 		bl	delay500ns
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         while(*GPIO_IDR_HIGH & 0x80){ //Check if LCD busy
 358              		.loc 1 107 0
 359 013e 09E0     		b	.L20
 360              	.L21:
 108:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                 graphics_ctrl_bit_set(B_E);
 361              		.loc 1 108 0
 362 0140 0620     		movs	r0, #6
 363 0142 FFF7FEFF 		bl	graphics_ctrl_bit_set
 109:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                 delay500ns();
 364              		.loc 1 109 0
 365 0146 FFF7FEFF 		bl	delay500ns
 110:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                 graphics_ctrl_bit_clear(B_E);
 366              		.loc 1 110 0
 367 014a 0620     		movs	r0, #6
 368 014c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 111:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                 delay500ns();
 369              		.loc 1 111 0
 370 0150 FFF7FEFF 		bl	delay500ns
 371              	.L20:
 107:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****                 graphics_ctrl_bit_set(B_E);
 372              		.loc 1 107 0
 373 0154 094B     		ldr	r3, .L22+8
 374 0156 1B78     		ldrb	r3, [r3]
 375 0158 DBB2     		uxtb	r3, r3
 376 015a 5BB2     		sxtb	r3, r3
 377 015c 002B     		cmp	r3, #0
 378 015e EFDB     		blt	.L21
 112:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 379              		.loc 1 113 0
 380 0160 0620     		movs	r0, #6
 381 0162 FFF7FEFF 		bl	graphics_ctrl_bit_set
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 382              		.loc 1 114 0
 383 0166 034B     		ldr	r3, .L22
 384 0168 054A     		ldr	r2, .L22+12
 385 016a 1A60     		str	r2, [r3]
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 386              		.loc 1 116 0
 387 016c C046     		nop
 388 016e BD46     		mov	sp, r7
 389              		@ sp needed
 390 0170 80BD     		pop	{r7, pc}
 391              	.L23:
 392 0172 C046     		.align	2
 393              	.L22:
 394 0174 00100240 		.word	1073876992
 395 0178 55550000 		.word	21845
 396 017c 11100240 		.word	1073877009
 397 0180 55555555 		.word	1431655765
 398              		.cfi_endproc
 399              	.LFE6:
 401              		.align	1
 402              		.global	graphic_read
 403              		.syntax unified
 404              		.code	16
 405              		.thumb_func
 406              		.fpu softvfp
 408              	graphic_read:
 409              	.LFB7:
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** char graphic_read(uint8_t controller){
 410              		.loc 1 117 0
 411              		.cfi_startproc
 412              		@ args = 0, pretend = 0, frame = 16
 413              		@ frame_needed = 1, uses_anonymous_args = 0
 414 0184 80B5     		push	{r7, lr}
 415              		.cfi_def_cfa_offset 8
 416              		.cfi_offset 7, -8
 417              		.cfi_offset 14, -4
 418 0186 84B0     		sub	sp, sp, #16
 419              		.cfi_def_cfa_offset 24
 420 0188 00AF     		add	r7, sp, #0
 421              		.cfi_def_cfa_register 7
 422 018a 0200     		movs	r2, r0
 423 018c FB1D     		adds	r3, r7, #7
 424 018e 1A70     		strb	r2, [r3]
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 425              		.loc 1 118 0
 426 0190 0620     		movs	r0, #6
 427 0192 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x00005555;
 428              		.loc 1 119 0
 429 0196 1C4B     		ldr	r3, .L28
 430 0198 1C4A     		ldr	r2, .L28+4
 431 019a 1A60     		str	r2, [r3]
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 432              		.loc 1 120 0
 433 019c 0020     		movs	r0, #0
 434 019e FFF7FEFF 		bl	graphics_ctrl_bit_set
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RW);
 435              		.loc 1 121 0
 436 01a2 0120     		movs	r0, #1
 437 01a4 FFF7FEFF 		bl	graphics_ctrl_bit_set
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 438              		.loc 1 122 0
 439 01a8 FB1D     		adds	r3, r7, #7
 440 01aa 1B78     		ldrb	r3, [r3]
 441 01ac 1800     		movs	r0, r3
 442 01ae FFF7FEFF 		bl	select_controller
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 443              		.loc 1 123 0
 444 01b2 FFF7FEFF 		bl	delay500ns
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 445              		.loc 1 124 0
 446 01b6 0620     		movs	r0, #6
 447 01b8 FFF7FEFF 		bl	graphics_ctrl_bit_set
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 448              		.loc 1 125 0
 449 01bc FFF7FEFF 		bl	delay500ns
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         char RV = *GPIO_IDR_HIGH;
 450              		.loc 1 126 0
 451 01c0 134A     		ldr	r2, .L28+8
 452 01c2 0F23     		movs	r3, #15
 453 01c4 FB18     		adds	r3, r7, r3
 454 01c6 1278     		ldrb	r2, [r2]
 455 01c8 1A70     		strb	r2, [r3]
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 456              		.loc 1 127 0
 457 01ca 0620     		movs	r0, #6
 458 01cc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 459              		.loc 1 128 0
 460 01d0 0D4B     		ldr	r3, .L28
 461 01d2 104A     		ldr	r2, .L28+12
 462 01d4 1A60     		str	r2, [r3]
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS1){
 463              		.loc 1 129 0
 464 01d6 FB1D     		adds	r3, r7, #7
 465 01d8 1B78     		ldrb	r3, [r3]
 466 01da 082B     		cmp	r3, #8
 467 01dc 04D1     		bne	.L25
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 468              		.loc 1 130 0
 469 01de 0820     		movs	r0, #8
 470 01e0 FFF7FEFF 		bl	select_controller
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 471              		.loc 1 131 0
 472 01e4 FFF7FEFF 		bl	graphic_wait_ready
 473              	.L25:
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS2){
 474              		.loc 1 134 0
 475 01e8 FB1D     		adds	r3, r7, #7
 476 01ea 1B78     		ldrb	r3, [r3]
 477 01ec 102B     		cmp	r3, #16
 478 01ee 04D1     		bne	.L26
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 479              		.loc 1 135 0
 480 01f0 1020     		movs	r0, #16
 481 01f2 FFF7FEFF 		bl	select_controller
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 482              		.loc 1 136 0
 483 01f6 FFF7FEFF 		bl	graphic_wait_ready
 484              	.L26:
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return RV;
 485              		.loc 1 139 0
 486 01fa 0F23     		movs	r3, #15
 487 01fc FB18     		adds	r3, r7, r3
 488 01fe 1B78     		ldrb	r3, [r3]
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 489              		.loc 1 141 0
 490 0200 1800     		movs	r0, r3
 491 0202 BD46     		mov	sp, r7
 492 0204 04B0     		add	sp, sp, #16
 493              		@ sp needed
 494 0206 80BD     		pop	{r7, pc}
 495              	.L29:
 496              		.align	2
 497              	.L28:
 498 0208 00100240 		.word	1073876992
 499 020c 55550000 		.word	21845
 500 0210 11100240 		.word	1073877009
 501 0214 55555555 		.word	1431655765
 502              		.cfi_endproc
 503              	.LFE7:
 505              		.align	1
 506              		.global	graphic_write
 507              		.syntax unified
 508              		.code	16
 509              		.thumb_func
 510              		.fpu softvfp
 512              	graphic_write:
 513              	.LFB8:
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 514              		.loc 1 143 0
 515              		.cfi_startproc
 516              		@ args = 0, pretend = 0, frame = 8
 517              		@ frame_needed = 1, uses_anonymous_args = 0
 518 0218 80B5     		push	{r7, lr}
 519              		.cfi_def_cfa_offset 8
 520              		.cfi_offset 7, -8
 521              		.cfi_offset 14, -4
 522 021a 82B0     		sub	sp, sp, #8
 523              		.cfi_def_cfa_offset 16
 524 021c 00AF     		add	r7, sp, #0
 525              		.cfi_def_cfa_register 7
 526 021e 0200     		movs	r2, r0
 527 0220 FB1D     		adds	r3, r7, #7
 528 0222 1A70     		strb	r2, [r3]
 529 0224 BB1D     		adds	r3, r7, #6
 530 0226 0A1C     		adds	r2, r1, #0
 531 0228 1A70     		strb	r2, [r3]
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_IDR_HIGH = value;
 532              		.loc 1 144 0
 533 022a 154A     		ldr	r2, .L31
 534 022c FB1D     		adds	r3, r7, #7
 535 022e 1B78     		ldrb	r3, [r3]
 536 0230 1370     		strb	r3, [r2]
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 537              		.loc 1 145 0
 538 0232 BB1D     		adds	r3, r7, #6
 539 0234 1B78     		ldrb	r3, [r3]
 540 0236 1800     		movs	r0, r3
 541 0238 FFF7FEFF 		bl	select_controller
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 542              		.loc 1 146 0
 543 023c FFF7FEFF 		bl	delay500ns
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 544              		.loc 1 147 0
 545 0240 0620     		movs	r0, #6
 546 0242 FFF7FEFF 		bl	graphics_ctrl_bit_set
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 547              		.loc 1 148 0
 548 0246 FFF7FEFF 		bl	delay500ns
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 549              		.loc 1 149 0
 550 024a 0620     		movs	r0, #6
 551 024c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller | B_CS1){
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 552              		.loc 1 152 0
 553 0250 0820     		movs	r0, #8
 554 0252 FFF7FEFF 		bl	select_controller
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 555              		.loc 1 153 0
 556 0256 FFF7FEFF 		bl	graphic_wait_ready
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller | B_CS2){
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 557              		.loc 1 157 0
 558 025a 1020     		movs	r0, #16
 559 025c FFF7FEFF 		bl	select_controller
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();     
 560              		.loc 1 158 0
 561 0260 FFF7FEFF 		bl	graphic_wait_ready
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_IDR_HIGH = 0;
 562              		.loc 1 161 0
 563 0264 064B     		ldr	r3, .L31
 564 0266 0022     		movs	r2, #0
 565 0268 1A70     		strb	r2, [r3]
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 566              		.loc 1 162 0
 567 026a 0620     		movs	r0, #6
 568 026c FFF7FEFF 		bl	graphics_ctrl_bit_set
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(0);
 569              		.loc 1 163 0
 570 0270 0020     		movs	r0, #0
 571 0272 FFF7FEFF 		bl	select_controller
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 572              		.loc 1 164 0
 573 0276 C046     		nop
 574 0278 BD46     		mov	sp, r7
 575 027a 02B0     		add	sp, sp, #8
 576              		@ sp needed
 577 027c 80BD     		pop	{r7, pc}
 578              	.L32:
 579 027e C046     		.align	2
 580              	.L31:
 581 0280 11100240 		.word	1073877009
 582              		.cfi_endproc
 583              	.LFE8:
 585              		.align	1
 586              		.global	graphic_write_command
 587              		.syntax unified
 588              		.code	16
 589              		.thumb_func
 590              		.fpu softvfp
 592              	graphic_write_command:
 593              	.LFB9:
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 594              		.loc 1 166 0
 595              		.cfi_startproc
 596              		@ args = 0, pretend = 0, frame = 8
 597              		@ frame_needed = 1, uses_anonymous_args = 0
 598 0284 80B5     		push	{r7, lr}
 599              		.cfi_def_cfa_offset 8
 600              		.cfi_offset 7, -8
 601              		.cfi_offset 14, -4
 602 0286 82B0     		sub	sp, sp, #8
 603              		.cfi_def_cfa_offset 16
 604 0288 00AF     		add	r7, sp, #0
 605              		.cfi_def_cfa_register 7
 606 028a 0200     		movs	r2, r0
 607 028c FB1D     		adds	r3, r7, #7
 608 028e 1A70     		strb	r2, [r3]
 609 0290 BB1D     		adds	r3, r7, #6
 610 0292 0A1C     		adds	r2, r1, #0
 611 0294 1A70     		strb	r2, [r3]
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 612              		.loc 1 167 0
 613 0296 0620     		movs	r0, #6
 614 0298 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 615              		.loc 1 168 0
 616 029c BB1D     		adds	r3, r7, #6
 617 029e 1B78     		ldrb	r3, [r3]
 618 02a0 1800     		movs	r0, r3
 619 02a2 FFF7FEFF 		bl	select_controller
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RS);
 620              		.loc 1 169 0
 621 02a6 0020     		movs	r0, #0
 622 02a8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 623              		.loc 1 170 0
 624 02ac 0120     		movs	r0, #1
 625 02ae FFF7FEFF 		bl	graphics_ctrl_bit_clear
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(command, controller);
 626              		.loc 1 171 0
 627 02b2 BB1D     		adds	r3, r7, #6
 628 02b4 1A78     		ldrb	r2, [r3]
 629 02b6 FB1D     		adds	r3, r7, #7
 630 02b8 1B78     		ldrb	r3, [r3]
 631 02ba 1100     		movs	r1, r2
 632 02bc 1800     		movs	r0, r3
 633 02be FFF7FEFF 		bl	graphic_write
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 634              		.loc 1 172 0
 635 02c2 C046     		nop
 636 02c4 BD46     		mov	sp, r7
 637 02c6 02B0     		add	sp, sp, #8
 638              		@ sp needed
 639 02c8 80BD     		pop	{r7, pc}
 640              		.cfi_endproc
 641              	.LFE9:
 643              		.align	1
 644              		.global	graphic_write_data
 645              		.syntax unified
 646              		.code	16
 647              		.thumb_func
 648              		.fpu softvfp
 650              	graphic_write_data:
 651              	.LFB10:
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 652              		.loc 1 174 0
 653              		.cfi_startproc
 654              		@ args = 0, pretend = 0, frame = 8
 655              		@ frame_needed = 1, uses_anonymous_args = 0
 656 02ca 80B5     		push	{r7, lr}
 657              		.cfi_def_cfa_offset 8
 658              		.cfi_offset 7, -8
 659              		.cfi_offset 14, -4
 660 02cc 82B0     		sub	sp, sp, #8
 661              		.cfi_def_cfa_offset 16
 662 02ce 00AF     		add	r7, sp, #0
 663              		.cfi_def_cfa_register 7
 664 02d0 0200     		movs	r2, r0
 665 02d2 FB1D     		adds	r3, r7, #7
 666 02d4 1A70     		strb	r2, [r3]
 667 02d6 BB1D     		adds	r3, r7, #6
 668 02d8 0A1C     		adds	r2, r1, #0
 669 02da 1A70     		strb	r2, [r3]
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 670              		.loc 1 175 0
 671 02dc 0620     		movs	r0, #6
 672 02de FFF7FEFF 		bl	graphics_ctrl_bit_clear
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 673              		.loc 1 176 0
 674 02e2 BB1D     		adds	r3, r7, #6
 675 02e4 1B78     		ldrb	r3, [r3]
 676 02e6 1800     		movs	r0, r3
 677 02e8 FFF7FEFF 		bl	select_controller
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 678              		.loc 1 177 0
 679 02ec 0020     		movs	r0, #0
 680 02ee FFF7FEFF 		bl	graphics_ctrl_bit_set
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 681              		.loc 1 178 0
 682 02f2 0120     		movs	r0, #1
 683 02f4 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(data, controller);
 684              		.loc 1 179 0
 685 02f8 BB1D     		adds	r3, r7, #6
 686 02fa 1A78     		ldrb	r2, [r3]
 687 02fc FB1D     		adds	r3, r7, #7
 688 02fe 1B78     		ldrb	r3, [r3]
 689 0300 1100     		movs	r1, r2
 690 0302 1800     		movs	r0, r3
 691 0304 FFF7FEFF 		bl	graphic_write
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 692              		.loc 1 180 0
 693 0308 C046     		nop
 694 030a BD46     		mov	sp, r7
 695 030c 02B0     		add	sp, sp, #8
 696              		@ sp needed
 697 030e 80BD     		pop	{r7, pc}
 698              		.cfi_endproc
 699              	.LFE10:
 701              		.align	1
 702              		.global	graphics_read_data
 703              		.syntax unified
 704              		.code	16
 705              		.thumb_func
 706              		.fpu softvfp
 708              	graphics_read_data:
 709              	.LFB11:
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_read_data(uint8_t controller){
 710              		.loc 1 182 0
 711              		.cfi_startproc
 712              		@ args = 0, pretend = 0, frame = 8
 713              		@ frame_needed = 1, uses_anonymous_args = 0
 714 0310 80B5     		push	{r7, lr}
 715              		.cfi_def_cfa_offset 8
 716              		.cfi_offset 7, -8
 717              		.cfi_offset 14, -4
 718 0312 82B0     		sub	sp, sp, #8
 719              		.cfi_def_cfa_offset 16
 720 0314 00AF     		add	r7, sp, #0
 721              		.cfi_def_cfa_register 7
 722 0316 0200     		movs	r2, r0
 723 0318 FB1D     		adds	r3, r7, #7
 724 031a 1A70     		strb	r2, [r3]
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         (void) graphic_read(controller);
 725              		.loc 1 183 0
 726 031c FB1D     		adds	r3, r7, #7
 727 031e 1B78     		ldrb	r3, [r3]
 728 0320 1800     		movs	r0, r3
 729 0322 FFF7FEFF 		bl	graphic_read
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return graphic_read(controller);
 730              		.loc 1 184 0
 731 0326 FB1D     		adds	r3, r7, #7
 732 0328 1B78     		ldrb	r3, [r3]
 733 032a 1800     		movs	r0, r3
 734 032c FFF7FEFF 		bl	graphic_read
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 735              		.loc 1 185 0
 736 0330 BD46     		mov	sp, r7
 737 0332 02B0     		add	sp, sp, #8
 738              		@ sp needed
 739 0334 80BD     		pop	{r7, pc}
 740              		.cfi_endproc
 741              	.LFE11:
 743              		.align	1
 744              		.global	delay_micro
 745              		.syntax unified
 746              		.code	16
 747              		.thumb_func
 748              		.fpu softvfp
 750              	delay_micro:
 751              	.LFB12:
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_micro(unsigned int us) {
 752              		.loc 1 187 0
 753              		.cfi_startproc
 754              		@ args = 0, pretend = 0, frame = 8
 755              		@ frame_needed = 1, uses_anonymous_args = 0
 756 0336 80B5     		push	{r7, lr}
 757              		.cfi_def_cfa_offset 8
 758              		.cfi_offset 7, -8
 759              		.cfi_offset 14, -4
 760 0338 82B0     		sub	sp, sp, #8
 761              		.cfi_def_cfa_offset 16
 762 033a 00AF     		add	r7, sp, #0
 763              		.cfi_def_cfa_register 7
 764 033c 7860     		str	r0, [r7, #4]
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while(us--) {
 765              		.loc 1 188 0
 766 033e 07E0     		b	.L38
 767              	.L39:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 768              		.loc 1 189 0
 769 0340 FFF7FEFF 		bl	delay_250ns
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 770              		.loc 1 190 0
 771 0344 FFF7FEFF 		bl	delay_250ns
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 772              		.loc 1 191 0
 773 0348 FFF7FEFF 		bl	delay_250ns
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 774              		.loc 1 192 0
 775 034c FFF7FEFF 		bl	delay_250ns
 776              	.L38:
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 777              		.loc 1 188 0
 778 0350 7B68     		ldr	r3, [r7, #4]
 779 0352 5A1E     		subs	r2, r3, #1
 780 0354 7A60     		str	r2, [r7, #4]
 781 0356 002B     		cmp	r3, #0
 782 0358 F2D1     		bne	.L39
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 783              		.loc 1 194 0
 784 035a C046     		nop
 785 035c BD46     		mov	sp, r7
 786 035e 02B0     		add	sp, sp, #8
 787              		@ sp needed
 788 0360 80BD     		pop	{r7, pc}
 789              		.cfi_endproc
 790              	.LFE12:
 792              		.align	1
 793              		.global	delay_milli
 794              		.syntax unified
 795              		.code	16
 796              		.thumb_func
 797              		.fpu softvfp
 799              	delay_milli:
 800              	.LFB13:
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_milli(unsigned int ms) {
 801              		.loc 1 196 0
 802              		.cfi_startproc
 803              		@ args = 0, pretend = 0, frame = 8
 804              		@ frame_needed = 1, uses_anonymous_args = 0
 805 0362 80B5     		push	{r7, lr}
 806              		.cfi_def_cfa_offset 8
 807              		.cfi_offset 7, -8
 808              		.cfi_offset 14, -4
 809 0364 82B0     		sub	sp, sp, #8
 810              		.cfi_def_cfa_offset 16
 811 0366 00AF     		add	r7, sp, #0
 812              		.cfi_def_cfa_register 7
 813 0368 7860     		str	r0, [r7, #4]
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#ifdef SIMULATOR
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(ms);
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#else
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(1000 * ms);
 814              		.loc 1 200 0
 815 036a 7B68     		ldr	r3, [r7, #4]
 816 036c FA22     		movs	r2, #250
 817 036e 9200     		lsls	r2, r2, #2
 818 0370 5343     		muls	r3, r2
 819 0372 1800     		movs	r0, r3
 820 0374 FFF7FEFF 		bl	delay_micro
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#endif
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 821              		.loc 1 202 0
 822 0378 C046     		nop
 823 037a BD46     		mov	sp, r7
 824 037c 02B0     		add	sp, sp, #8
 825              		@ sp needed
 826 037e 80BD     		pop	{r7, pc}
 827              		.cfi_endproc
 828              	.LFE13:
 830              		.align	1
 831              		.global	init_app
 832              		.syntax unified
 833              		.code	16
 834              		.thumb_func
 835              		.fpu softvfp
 837              	init_app:
 838              	.LFB14:
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void init_app(void){
 839              		.loc 1 204 0
 840              		.cfi_startproc
 841              		@ args = 0, pretend = 0, frame = 0
 842              		@ frame_needed = 1, uses_anonymous_args = 0
 843 0380 80B5     		push	{r7, lr}
 844              		.cfi_def_cfa_offset 8
 845              		.cfi_offset 7, -8
 846              		.cfi_offset 14, -4
 847 0382 00AF     		add	r7, sp, #0
 848              		.cfi_def_cfa_register 7
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 849              		.loc 1 206 0
 850 0384 C046     		nop
 851 0386 BD46     		mov	sp, r7
 852              		@ sp needed
 853 0388 80BD     		pop	{r7, pc}
 854              		.cfi_endproc
 855              	.LFE14:
 857              		.align	1
 858              		.global	graphic_initialize
 859              		.syntax unified
 860              		.code	16
 861              		.thumb_func
 862              		.fpu softvfp
 864              	graphic_initialize:
 865              	.LFB15:
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_initialize(void){
 866              		.loc 1 208 0
 867              		.cfi_startproc
 868              		@ args = 0, pretend = 0, frame = 0
 869              		@ frame_needed = 1, uses_anonymous_args = 0
 870 038a 80B5     		push	{r7, lr}
 871              		.cfi_def_cfa_offset 8
 872              		.cfi_offset 7, -8
 873              		.cfi_offset 14, -4
 874 038c 00AF     		add	r7, sp, #0
 875              		.cfi_def_cfa_register 7
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_set(B_E);
 876              		.loc 1 209 0
 877 038e 0620     		movs	r0, #6
 878 0390 FFF7FEFF 		bl	graphics_ctrl_bit_set
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_micro(10);
 879              		.loc 1 210 0
 880 0394 0A20     		movs	r0, #10
 881 0396 FFF7FEFF 		bl	delay_micro
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS1);
 882              		.loc 1 211 0
 883 039a 0820     		movs	r0, #8
 884 039c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS2);
 885              		.loc 1 212 0
 886 03a0 1020     		movs	r0, #16
 887 03a2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_RST);
 888              		.loc 1 213 0
 889 03a6 2020     		movs	r0, #32
 890 03a8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_E);
 891              		.loc 1 214 0
 892 03ac 0620     		movs	r0, #6
 893 03ae FFF7FEFF 		bl	graphics_ctrl_bit_clear
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_micro(30);
 894              		.loc 1 215 0
 895 03b2 1E20     		movs	r0, #30
 896 03b4 FFF7FEFF 		bl	delay_micro
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 897              		.loc 1 216 0
 898 03b8 1821     		movs	r1, #24
 899 03ba 3E20     		movs	r0, #62
 900 03bc FFF7FEFF 		bl	graphic_write_command
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_ON, B_CS1|B_CS2);
 901              		.loc 1 217 0
 902 03c0 1821     		movs	r1, #24
 903 03c2 3F20     		movs	r0, #63
 904 03c4 FFF7FEFF 		bl	graphic_write_command
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 905              		.loc 1 218 0
 906 03c8 1821     		movs	r1, #24
 907 03ca C020     		movs	r0, #192
 908 03cc FFF7FEFF 		bl	graphic_write_command
 219:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 909              		.loc 1 219 0
 910 03d0 1821     		movs	r1, #24
 911 03d2 4020     		movs	r0, #64
 912 03d4 FFF7FEFF 		bl	graphic_write_command
 220:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 913              		.loc 1 220 0
 914 03d8 1821     		movs	r1, #24
 915 03da B820     		movs	r0, #184
 916 03dc FFF7FEFF 		bl	graphic_write_command
 221:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      select_controller(0);
 917              		.loc 1 221 0
 918 03e0 0020     		movs	r0, #0
 919 03e2 FFF7FEFF 		bl	select_controller
 222:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 920              		.loc 1 222 0
 921 03e6 C046     		nop
 922 03e8 BD46     		mov	sp, r7
 923              		@ sp needed
 924 03ea 80BD     		pop	{r7, pc}
 925              		.cfi_endproc
 926              	.LFE15:
 928              		.align	1
 929              		.global	graphics_clear_screen
 930              		.syntax unified
 931              		.code	16
 932              		.thumb_func
 933              		.fpu softvfp
 935              	graphics_clear_screen:
 936              	.LFB16:
 223:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 224:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_clear_screen(void){
 937              		.loc 1 224 0
 938              		.cfi_startproc
 939              		@ args = 0, pretend = 0, frame = 8
 940              		@ frame_needed = 1, uses_anonymous_args = 0
 941 03ec 80B5     		push	{r7, lr}
 942              		.cfi_def_cfa_offset 8
 943              		.cfi_offset 7, -8
 944              		.cfi_offset 14, -4
 945 03ee 82B0     		sub	sp, sp, #8
 946              		.cfi_def_cfa_offset 16
 947 03f0 00AF     		add	r7, sp, #0
 948              		.cfi_def_cfa_register 7
 949              	.LBB2:
 225:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int page = 0; page < PAGE; page++){
 950              		.loc 1 225 0
 951 03f2 0023     		movs	r3, #0
 952 03f4 7B60     		str	r3, [r7, #4]
 953 03f6 1EE0     		b	.L44
 954              	.L47:
 226:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 955              		.loc 1 226 0
 956 03f8 7B68     		ldr	r3, [r7, #4]
 957 03fa 5BB2     		sxtb	r3, r3
 958 03fc 4822     		movs	r2, #72
 959 03fe 5242     		rsbs	r2, r2, #0
 960 0400 1343     		orrs	r3, r2
 961 0402 5BB2     		sxtb	r3, r3
 962 0404 DBB2     		uxtb	r3, r3
 963 0406 1821     		movs	r1, #24
 964 0408 1800     		movs	r0, r3
 965 040a FFF7FEFF 		bl	graphic_write_command
 227:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 966              		.loc 1 227 0
 967 040e 1821     		movs	r1, #24
 968 0410 4020     		movs	r0, #64
 969 0412 FFF7FEFF 		bl	graphic_write_command
 970              	.LBB3:
 228:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 971              		.loc 1 228 0
 972 0416 0023     		movs	r3, #0
 973 0418 3B60     		str	r3, [r7]
 974 041a 06E0     		b	.L45
 975              	.L46:
 229:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_write_data(0, B_CS1|B_CS2);
 976              		.loc 1 229 0 discriminator 3
 977 041c 1821     		movs	r1, #24
 978 041e 0020     		movs	r0, #0
 979 0420 FFF7FEFF 		bl	graphic_write_data
 228:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 980              		.loc 1 228 0 discriminator 3
 981 0424 3B68     		ldr	r3, [r7]
 982 0426 0133     		adds	r3, r3, #1
 983 0428 3B60     		str	r3, [r7]
 984              	.L45:
 228:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 985              		.loc 1 228 0 is_stmt 0 discriminator 1
 986 042a 3B68     		ldr	r3, [r7]
 987 042c 3E2B     		cmp	r3, #62
 988 042e F5DD     		ble	.L46
 989              	.LBE3:
 225:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 990              		.loc 1 225 0 is_stmt 1 discriminator 2
 991 0430 7B68     		ldr	r3, [r7, #4]
 992 0432 0133     		adds	r3, r3, #1
 993 0434 7B60     		str	r3, [r7, #4]
 994              	.L44:
 225:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 995              		.loc 1 225 0 is_stmt 0 discriminator 1
 996 0436 7B68     		ldr	r3, [r7, #4]
 997 0438 072B     		cmp	r3, #7
 998 043a DDDD     		ble	.L47
 999              	.LBE2:
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 231:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 232:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 233:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 1000              		.loc 1 233 0 is_stmt 1
 1001 043c C046     		nop
 1002 043e BD46     		mov	sp, r7
 1003 0440 02B0     		add	sp, sp, #8
 1004              		@ sp needed
 1005 0442 80BD     		pop	{r7, pc}
 1006              		.cfi_endproc
 1007              	.LFE16:
 1009              		.align	1
 1010              		.global	main
 1011              		.syntax unified
 1012              		.code	16
 1013              		.thumb_func
 1014              		.fpu softvfp
 1016              	main:
 1017              	.LFB17:
 234:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 235:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void main(void)
 236:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
 1018              		.loc 1 236 0
 1019              		.cfi_startproc
 1020              		@ args = 0, pretend = 0, frame = 0
 1021              		@ frame_needed = 1, uses_anonymous_args = 0
 1022 0444 80B5     		push	{r7, lr}
 1023              		.cfi_def_cfa_offset 8
 1024              		.cfi_offset 7, -8
 1025              		.cfi_offset 14, -4
 1026 0446 00AF     		add	r7, sp, #0
 1027              		.cfi_def_cfa_register 7
 237:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     init_app();
 1028              		.loc 1 237 0
 1029 0448 FFF7FEFF 		bl	init_app
 238:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_initialize();
 1030              		.loc 1 238 0
 1031 044c FFF7FEFF 		bl	graphic_initialize
 239:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #ifndef SIMULATOR
 240:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_clear_screen();
 1032              		.loc 1 240 0
 1033 0450 FFF7FEFF 		bl	graphics_clear_screen
 241:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #endif
 242:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1034              		.loc 1 242 0
 1035 0454 1821     		movs	r1, #24
 1036 0456 4A20     		movs	r0, #74
 1037 0458 FFF7FEFF 		bl	graphic_write_command
 243:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1038              		.loc 1 243 0
 1039 045c 1821     		movs	r1, #24
 1040 045e B920     		movs	r0, #185
 1041 0460 FFF7FEFF 		bl	graphic_write_command
 244:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_data(0xFF, B_CS1 | B_CS2);
 1042              		.loc 1 244 0
 1043 0464 1821     		movs	r1, #24
 1044 0466 FF20     		movs	r0, #255
 1045 0468 FFF7FEFF 		bl	graphic_write_data
 245:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }    
 1046              		.loc 1 245 0
 1047 046c C046     		nop
 1048 046e BD46     		mov	sp, r7
 1049              		@ sp needed
 1050 0470 80BD     		pop	{r7, pc}
 1051              		.cfi_endproc
 1052              	.LFE17:
 1054              	.Letext0:
