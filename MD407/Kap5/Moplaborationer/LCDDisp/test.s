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
 113:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 114:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 379              		.loc 1 114 0
 380 0160 044B     		ldr	r3, .L22
 381 0162 074A     		ldr	r2, .L22+12
 382 0164 1A60     		str	r2, [r3]
 115:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 383              		.loc 1 115 0
 384 0166 0620     		movs	r0, #6
 385 0168 FFF7FEFF 		bl	graphics_ctrl_bit_set
 116:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 117:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 386              		.loc 1 117 0
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
 118:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** uint8_t graphic_read(uint8_t controller){
 410              		.loc 1 118 0
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
 119:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 425              		.loc 1 119 0
 426 0190 0620     		movs	r0, #6
 427 0192 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 120:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x00005555;
 428              		.loc 1 120 0
 429 0196 1C4B     		ldr	r3, .L28
 430 0198 1C4A     		ldr	r2, .L28+4
 431 019a 1A60     		str	r2, [r3]
 121:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 432              		.loc 1 121 0
 433 019c 0020     		movs	r0, #0
 434 019e FFF7FEFF 		bl	graphics_ctrl_bit_set
 122:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RW);
 435              		.loc 1 122 0
 436 01a2 0120     		movs	r0, #1
 437 01a4 FFF7FEFF 		bl	graphics_ctrl_bit_set
 123:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 438              		.loc 1 123 0
 439 01a8 FB1D     		adds	r3, r7, #7
 440 01aa 1B78     		ldrb	r3, [r3]
 441 01ac 1800     		movs	r0, r3
 442 01ae FFF7FEFF 		bl	select_controller
 124:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 443              		.loc 1 124 0
 444 01b2 FFF7FEFF 		bl	delay500ns
 125:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 445              		.loc 1 125 0
 446 01b6 0620     		movs	r0, #6
 447 01b8 FFF7FEFF 		bl	graphics_ctrl_bit_set
 126:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 448              		.loc 1 126 0
 449 01bc FFF7FEFF 		bl	delay500ns
 127:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         char RV = *GPIO_IDR_HIGH;
 450              		.loc 1 127 0
 451 01c0 134A     		ldr	r2, .L28+8
 452 01c2 0F23     		movs	r3, #15
 453 01c4 FB18     		adds	r3, r7, r3
 454 01c6 1278     		ldrb	r2, [r2]
 455 01c8 1A70     		strb	r2, [r3]
 128:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 456              		.loc 1 128 0
 457 01ca 0620     		movs	r0, #6
 458 01cc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 129:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 459              		.loc 1 129 0
 460 01d0 0D4B     		ldr	r3, .L28
 461 01d2 104A     		ldr	r2, .L28+12
 462 01d4 1A60     		str	r2, [r3]
 130:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS1){
 463              		.loc 1 130 0
 464 01d6 FB1D     		adds	r3, r7, #7
 465 01d8 1B78     		ldrb	r3, [r3]
 466 01da 082B     		cmp	r3, #8
 467 01dc 04D1     		bne	.L25
 131:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 468              		.loc 1 131 0
 469 01de 0820     		movs	r0, #8
 470 01e0 FFF7FEFF 		bl	select_controller
 132:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 471              		.loc 1 132 0
 472 01e4 FFF7FEFF 		bl	graphic_wait_ready
 473              	.L25:
 133:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 134:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             
 135:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if(controller == B_CS2){
 474              		.loc 1 135 0
 475 01e8 FB1D     		adds	r3, r7, #7
 476 01ea 1B78     		ldrb	r3, [r3]
 477 01ec 102B     		cmp	r3, #16
 478 01ee 04D1     		bne	.L26
 136:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 479              		.loc 1 136 0
 480 01f0 1020     		movs	r0, #16
 481 01f2 FFF7FEFF 		bl	select_controller
 137:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 482              		.loc 1 137 0
 483 01f6 FFF7FEFF 		bl	graphic_wait_ready
 484              	.L26:
 138:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 139:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 140:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return RV;
 485              		.loc 1 140 0
 486 01fa 0F23     		movs	r3, #15
 487 01fc FB18     		adds	r3, r7, r3
 488 01fe 1B78     		ldrb	r3, [r3]
 141:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 142:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 489              		.loc 1 142 0
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
 143:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 144:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write(uint8_t value, uint8_t controller){
 514              		.loc 1 144 0
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
 145:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_IDR_HIGH = value;
 532              		.loc 1 145 0
 533 022a 1A4A     		ldr	r2, .L33
 534 022c FB1D     		adds	r3, r7, #7
 535 022e 1B78     		ldrb	r3, [r3]
 536 0230 1370     		strb	r3, [r2]
 146:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 537              		.loc 1 146 0
 538 0232 BB1D     		adds	r3, r7, #6
 539 0234 1B78     		ldrb	r3, [r3]
 540 0236 1800     		movs	r0, r3
 541 0238 FFF7FEFF 		bl	select_controller
 147:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 542              		.loc 1 147 0
 543 023c FFF7FEFF 		bl	delay500ns
 148:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 544              		.loc 1 148 0
 545 0240 0620     		movs	r0, #6
 546 0242 FFF7FEFF 		bl	graphics_ctrl_bit_set
 149:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         delay500ns();
 547              		.loc 1 149 0
 548 0246 FFF7FEFF 		bl	delay500ns
 150:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 549              		.loc 1 150 0
 550 024a 0620     		movs	r0, #6
 551 024c FFF7FEFF 		bl	graphics_ctrl_bit_clear
 151:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 152:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if((controller & B_CS1)==B_CS1){
 552              		.loc 1 152 0
 553 0250 BB1D     		adds	r3, r7, #6
 554 0252 1B78     		ldrb	r3, [r3]
 555 0254 0822     		movs	r2, #8
 556 0256 1340     		ands	r3, r2
 557 0258 04D0     		beq	.L31
 153:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS1);
 558              		.loc 1 153 0
 559 025a 0820     		movs	r0, #8
 560 025c FFF7FEFF 		bl	select_controller
 154:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();
 561              		.loc 1 154 0
 562 0260 FFF7FEFF 		bl	graphic_wait_ready
 563              	.L31:
 155:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 156:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 157:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         if((controller & B_CS2)==B_CS2){
 564              		.loc 1 157 0
 565 0264 BB1D     		adds	r3, r7, #6
 566 0266 1B78     		ldrb	r3, [r3]
 567 0268 1022     		movs	r2, #16
 568 026a 1340     		ands	r3, r2
 569 026c 04D0     		beq	.L32
 158:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             select_controller(B_CS2);
 570              		.loc 1 158 0
 571 026e 1020     		movs	r0, #16
 572 0270 FFF7FEFF 		bl	select_controller
 159:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_wait_ready();     
 573              		.loc 1 159 0
 574 0274 FFF7FEFF 		bl	graphic_wait_ready
 575              	.L32:
 160:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 161:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 162:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_IDR_HIGH = 0;
 576              		.loc 1 162 0
 577 0278 064B     		ldr	r3, .L33
 578 027a 0022     		movs	r2, #0
 579 027c 1A70     		strb	r2, [r3]
 163:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_E);
 580              		.loc 1 163 0
 581 027e 0620     		movs	r0, #6
 582 0280 FFF7FEFF 		bl	graphics_ctrl_bit_set
 164:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(0);
 583              		.loc 1 164 0
 584 0284 0020     		movs	r0, #0
 585 0286 FFF7FEFF 		bl	select_controller
 165:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 586              		.loc 1 165 0
 587 028a C046     		nop
 588 028c BD46     		mov	sp, r7
 589 028e 02B0     		add	sp, sp, #8
 590              		@ sp needed
 591 0290 80BD     		pop	{r7, pc}
 592              	.L34:
 593 0292 C046     		.align	2
 594              	.L33:
 595 0294 11100240 		.word	1073877009
 596              		.cfi_endproc
 597              	.LFE8:
 599              		.align	1
 600              		.global	graphic_write_command
 601              		.syntax unified
 602              		.code	16
 603              		.thumb_func
 604              		.fpu softvfp
 606              	graphic_write_command:
 607              	.LFB9:
 166:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 167:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 608              		.loc 1 167 0
 609              		.cfi_startproc
 610              		@ args = 0, pretend = 0, frame = 8
 611              		@ frame_needed = 1, uses_anonymous_args = 0
 612 0298 80B5     		push	{r7, lr}
 613              		.cfi_def_cfa_offset 8
 614              		.cfi_offset 7, -8
 615              		.cfi_offset 14, -4
 616 029a 82B0     		sub	sp, sp, #8
 617              		.cfi_def_cfa_offset 16
 618 029c 00AF     		add	r7, sp, #0
 619              		.cfi_def_cfa_register 7
 620 029e 0200     		movs	r2, r0
 621 02a0 FB1D     		adds	r3, r7, #7
 622 02a2 1A70     		strb	r2, [r3]
 623 02a4 BB1D     		adds	r3, r7, #6
 624 02a6 0A1C     		adds	r2, r1, #0
 625 02a8 1A70     		strb	r2, [r3]
 168:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 626              		.loc 1 168 0
 627 02aa 0620     		movs	r0, #6
 628 02ac FFF7FEFF 		bl	graphics_ctrl_bit_clear
 169:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 629              		.loc 1 169 0
 630 02b0 BB1D     		adds	r3, r7, #6
 631 02b2 1B78     		ldrb	r3, [r3]
 632 02b4 1800     		movs	r0, r3
 633 02b6 FFF7FEFF 		bl	select_controller
 170:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RS);
 634              		.loc 1 170 0
 635 02ba 0020     		movs	r0, #0
 636 02bc FFF7FEFF 		bl	graphics_ctrl_bit_clear
 171:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 637              		.loc 1 171 0
 638 02c0 0120     		movs	r0, #1
 639 02c2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 172:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(command, controller);
 640              		.loc 1 172 0
 641 02c6 BB1D     		adds	r3, r7, #6
 642 02c8 1A78     		ldrb	r2, [r3]
 643 02ca FB1D     		adds	r3, r7, #7
 644 02cc 1B78     		ldrb	r3, [r3]
 645 02ce 1100     		movs	r1, r2
 646 02d0 1800     		movs	r0, r3
 647 02d2 FFF7FEFF 		bl	graphic_write
 173:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 648              		.loc 1 173 0
 649 02d6 C046     		nop
 650 02d8 BD46     		mov	sp, r7
 651 02da 02B0     		add	sp, sp, #8
 652              		@ sp needed
 653 02dc 80BD     		pop	{r7, pc}
 654              		.cfi_endproc
 655              	.LFE9:
 657              		.align	1
 658              		.global	graphic_write_data
 659              		.syntax unified
 660              		.code	16
 661              		.thumb_func
 662              		.fpu softvfp
 664              	graphic_write_data:
 665              	.LFB10:
 174:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 175:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 666              		.loc 1 175 0
 667              		.cfi_startproc
 668              		@ args = 0, pretend = 0, frame = 8
 669              		@ frame_needed = 1, uses_anonymous_args = 0
 670 02de 80B5     		push	{r7, lr}
 671              		.cfi_def_cfa_offset 8
 672              		.cfi_offset 7, -8
 673              		.cfi_offset 14, -4
 674 02e0 82B0     		sub	sp, sp, #8
 675              		.cfi_def_cfa_offset 16
 676 02e2 00AF     		add	r7, sp, #0
 677              		.cfi_def_cfa_register 7
 678 02e4 0200     		movs	r2, r0
 679 02e6 FB1D     		adds	r3, r7, #7
 680 02e8 1A70     		strb	r2, [r3]
 681 02ea BB1D     		adds	r3, r7, #6
 682 02ec 0A1C     		adds	r2, r1, #0
 683 02ee 1A70     		strb	r2, [r3]
 176:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_E);
 684              		.loc 1 176 0
 685 02f0 0620     		movs	r0, #6
 686 02f2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 177:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         select_controller(controller);
 687              		.loc 1 177 0
 688 02f6 BB1D     		adds	r3, r7, #6
 689 02f8 1B78     		ldrb	r3, [r3]
 690 02fa 1800     		movs	r0, r3
 691 02fc FFF7FEFF 		bl	select_controller
 178:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_set(B_RS);
 692              		.loc 1 178 0
 693 0300 0020     		movs	r0, #0
 694 0302 FFF7FEFF 		bl	graphics_ctrl_bit_set
 179:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_ctrl_bit_clear(B_RW);
 695              		.loc 1 179 0
 696 0306 0120     		movs	r0, #1
 697 0308 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 180:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write(data, controller);
 698              		.loc 1 180 0
 699 030c BB1D     		adds	r3, r7, #6
 700 030e 1A78     		ldrb	r2, [r3]
 701 0310 FB1D     		adds	r3, r7, #7
 702 0312 1B78     		ldrb	r3, [r3]
 703 0314 1100     		movs	r1, r2
 704 0316 1800     		movs	r0, r3
 705 0318 FFF7FEFF 		bl	graphic_write
 181:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 706              		.loc 1 181 0
 707 031c C046     		nop
 708 031e BD46     		mov	sp, r7
 709 0320 02B0     		add	sp, sp, #8
 710              		@ sp needed
 711 0322 80BD     		pop	{r7, pc}
 712              		.cfi_endproc
 713              	.LFE10:
 715              		.align	1
 716              		.global	graphics_read_data
 717              		.syntax unified
 718              		.code	16
 719              		.thumb_func
 720              		.fpu softvfp
 722              	graphics_read_data:
 723              	.LFB11:
 182:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 183:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** uint8_t graphics_read_data(uint8_t controller){
 724              		.loc 1 183 0
 725              		.cfi_startproc
 726              		@ args = 0, pretend = 0, frame = 8
 727              		@ frame_needed = 1, uses_anonymous_args = 0
 728 0324 80B5     		push	{r7, lr}
 729              		.cfi_def_cfa_offset 8
 730              		.cfi_offset 7, -8
 731              		.cfi_offset 14, -4
 732 0326 82B0     		sub	sp, sp, #8
 733              		.cfi_def_cfa_offset 16
 734 0328 00AF     		add	r7, sp, #0
 735              		.cfi_def_cfa_register 7
 736 032a 0200     		movs	r2, r0
 737 032c FB1D     		adds	r3, r7, #7
 738 032e 1A70     		strb	r2, [r3]
 184:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         (void) graphic_read(controller);
 739              		.loc 1 184 0
 740 0330 FB1D     		adds	r3, r7, #7
 741 0332 1B78     		ldrb	r3, [r3]
 742 0334 1800     		movs	r0, r3
 743 0336 FFF7FEFF 		bl	graphic_read
 185:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         return graphic_read(controller);
 744              		.loc 1 185 0
 745 033a FB1D     		adds	r3, r7, #7
 746 033c 1B78     		ldrb	r3, [r3]
 747 033e 1800     		movs	r0, r3
 748 0340 FFF7FEFF 		bl	graphic_read
 749 0344 0300     		movs	r3, r0
 186:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 750              		.loc 1 186 0
 751 0346 1800     		movs	r0, r3
 752 0348 BD46     		mov	sp, r7
 753 034a 02B0     		add	sp, sp, #8
 754              		@ sp needed
 755 034c 80BD     		pop	{r7, pc}
 756              		.cfi_endproc
 757              	.LFE11:
 759              		.align	1
 760              		.global	delay_micro
 761              		.syntax unified
 762              		.code	16
 763              		.thumb_func
 764              		.fpu softvfp
 766              	delay_micro:
 767              	.LFB12:
 187:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 188:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_micro(unsigned int us) {
 768              		.loc 1 188 0
 769              		.cfi_startproc
 770              		@ args = 0, pretend = 0, frame = 8
 771              		@ frame_needed = 1, uses_anonymous_args = 0
 772 034e 80B5     		push	{r7, lr}
 773              		.cfi_def_cfa_offset 8
 774              		.cfi_offset 7, -8
 775              		.cfi_offset 14, -4
 776 0350 82B0     		sub	sp, sp, #8
 777              		.cfi_def_cfa_offset 16
 778 0352 00AF     		add	r7, sp, #0
 779              		.cfi_def_cfa_register 7
 780 0354 7860     		str	r0, [r7, #4]
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	while(us--) {
 781              		.loc 1 189 0
 782 0356 07E0     		b	.L40
 783              	.L41:
 190:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 784              		.loc 1 190 0
 785 0358 FFF7FEFF 		bl	delay_250ns
 191:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 786              		.loc 1 191 0
 787 035c FFF7FEFF 		bl	delay_250ns
 192:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 788              		.loc 1 192 0
 789 0360 FFF7FEFF 		bl	delay_250ns
 193:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 790              		.loc 1 193 0
 791 0364 FFF7FEFF 		bl	delay_250ns
 792              	.L40:
 189:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_250ns();
 793              		.loc 1 189 0
 794 0368 7B68     		ldr	r3, [r7, #4]
 795 036a 5A1E     		subs	r2, r3, #1
 796 036c 7A60     		str	r2, [r7, #4]
 797 036e 002B     		cmp	r3, #0
 798 0370 F2D1     		bne	.L41
 194:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	}
 195:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 799              		.loc 1 195 0
 800 0372 C046     		nop
 801 0374 BD46     		mov	sp, r7
 802 0376 02B0     		add	sp, sp, #8
 803              		@ sp needed
 804 0378 80BD     		pop	{r7, pc}
 805              		.cfi_endproc
 806              	.LFE12:
 808              		.align	1
 809              		.global	delay_milli
 810              		.syntax unified
 811              		.code	16
 812              		.thumb_func
 813              		.fpu softvfp
 815              	delay_milli:
 816              	.LFB13:
 196:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 197:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void delay_milli(unsigned int ms) {
 817              		.loc 1 197 0
 818              		.cfi_startproc
 819              		@ args = 0, pretend = 0, frame = 8
 820              		@ frame_needed = 1, uses_anonymous_args = 0
 821 037a 80B5     		push	{r7, lr}
 822              		.cfi_def_cfa_offset 8
 823              		.cfi_offset 7, -8
 824              		.cfi_offset 14, -4
 825 037c 82B0     		sub	sp, sp, #8
 826              		.cfi_def_cfa_offset 16
 827 037e 00AF     		add	r7, sp, #0
 828              		.cfi_def_cfa_register 7
 829 0380 7860     		str	r0, [r7, #4]
 198:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#ifdef SIMULATOR
 199:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(ms);
 200:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#else
 201:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 		delay_micro(1000 * ms);
 830              		.loc 1 201 0
 831 0382 7B68     		ldr	r3, [r7, #4]
 832 0384 FA22     		movs	r2, #250
 833 0386 9200     		lsls	r2, r2, #2
 834 0388 5343     		muls	r3, r2
 835 038a 1800     		movs	r0, r3
 836 038c FFF7FEFF 		bl	delay_micro
 202:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 	#endif
 203:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }
 837              		.loc 1 203 0
 838 0390 C046     		nop
 839 0392 BD46     		mov	sp, r7
 840 0394 02B0     		add	sp, sp, #8
 841              		@ sp needed
 842 0396 80BD     		pop	{r7, pc}
 843              		.cfi_endproc
 844              	.LFE13:
 846              		.align	1
 847              		.global	init_app
 848              		.syntax unified
 849              		.code	16
 850              		.thumb_func
 851              		.fpu softvfp
 853              	init_app:
 854              	.LFB14:
 204:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 205:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void init_app(void){
 855              		.loc 1 205 0
 856              		.cfi_startproc
 857              		@ args = 0, pretend = 0, frame = 0
 858              		@ frame_needed = 1, uses_anonymous_args = 0
 859 0398 80B5     		push	{r7, lr}
 860              		.cfi_def_cfa_offset 8
 861              		.cfi_offset 7, -8
 862              		.cfi_offset 14, -4
 863 039a 00AF     		add	r7, sp, #0
 864              		.cfi_def_cfa_register 7
 206:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         *GPIO_MODER = 0x55555555;
 865              		.loc 1 206 0
 866 039c 024B     		ldr	r3, .L44
 867 039e 034A     		ldr	r2, .L44+4
 868 03a0 1A60     		str	r2, [r3]
 207:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         
 208:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 869              		.loc 1 208 0
 870 03a2 C046     		nop
 871 03a4 BD46     		mov	sp, r7
 872              		@ sp needed
 873 03a6 80BD     		pop	{r7, pc}
 874              	.L45:
 875              		.align	2
 876              	.L44:
 877 03a8 00100240 		.word	1073876992
 878 03ac 55555555 		.word	1431655765
 879              		.cfi_endproc
 880              	.LFE14:
 882              		.align	1
 883              		.global	graphic_initialize
 884              		.syntax unified
 885              		.code	16
 886              		.thumb_func
 887              		.fpu softvfp
 889              	graphic_initialize:
 890              	.LFB15:
 209:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 210:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphic_initialize(void){
 891              		.loc 1 210 0
 892              		.cfi_startproc
 893              		@ args = 0, pretend = 0, frame = 0
 894              		@ frame_needed = 1, uses_anonymous_args = 0
 895 03b0 80B5     		push	{r7, lr}
 896              		.cfi_def_cfa_offset 8
 897              		.cfi_offset 7, -8
 898              		.cfi_offset 14, -4
 899 03b2 00AF     		add	r7, sp, #0
 900              		.cfi_def_cfa_register 7
 211:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_set(B_E);
 901              		.loc 1 211 0
 902 03b4 0620     		movs	r0, #6
 903 03b6 FFF7FEFF 		bl	graphics_ctrl_bit_set
 212:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_micro(10);
 904              		.loc 1 212 0
 905 03ba 0A20     		movs	r0, #10
 906 03bc FFF7FEFF 		bl	delay_micro
 213:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS1);
 907              		.loc 1 213 0
 908 03c0 0820     		movs	r0, #8
 909 03c2 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 214:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_CS2);
 910              		.loc 1 214 0
 911 03c6 1020     		movs	r0, #16
 912 03c8 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 215:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_RST);
 913              		.loc 1 215 0
 914 03cc 2020     		movs	r0, #32
 915 03ce FFF7FEFF 		bl	graphics_ctrl_bit_clear
 216:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphics_ctrl_bit_clear(B_E);
 916              		.loc 1 216 0
 917 03d2 0620     		movs	r0, #6
 918 03d4 FFF7FEFF 		bl	graphics_ctrl_bit_clear
 217:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      delay_micro(30);
 919              		.loc 1 217 0
 920 03d8 1E20     		movs	r0, #30
 921 03da FFF7FEFF 		bl	delay_micro
 218:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 922              		.loc 1 218 0
 923 03de 1821     		movs	r1, #24
 924 03e0 3E20     		movs	r0, #62
 925 03e2 FFF7FEFF 		bl	graphic_write_command
 219:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_ON, B_CS1|B_CS2);
 926              		.loc 1 219 0
 927 03e6 1821     		movs	r1, #24
 928 03e8 3F20     		movs	r0, #63
 929 03ea FFF7FEFF 		bl	graphic_write_command
 220:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 930              		.loc 1 220 0
 931 03ee 1821     		movs	r1, #24
 932 03f0 C020     		movs	r0, #192
 933 03f2 FFF7FEFF 		bl	graphic_write_command
 221:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 934              		.loc 1 221 0
 935 03f6 1821     		movs	r1, #24
 936 03f8 4020     		movs	r0, #64
 937 03fa FFF7FEFF 		bl	graphic_write_command
 222:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 938              		.loc 1 222 0
 939 03fe 1821     		movs	r1, #24
 940 0400 B820     		movs	r0, #184
 941 0402 FFF7FEFF 		bl	graphic_write_command
 223:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****      select_controller(0);
 942              		.loc 1 223 0
 943 0406 0020     		movs	r0, #0
 944 0408 FFF7FEFF 		bl	select_controller
 224:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 945              		.loc 1 224 0
 946 040c C046     		nop
 947 040e BD46     		mov	sp, r7
 948              		@ sp needed
 949 0410 80BD     		pop	{r7, pc}
 950              		.cfi_endproc
 951              	.LFE15:
 953              		.align	1
 954              		.global	graphics_clear_screen
 955              		.syntax unified
 956              		.code	16
 957              		.thumb_func
 958              		.fpu softvfp
 960              	graphics_clear_screen:
 961              	.LFB16:
 225:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 226:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void graphics_clear_screen(void){
 962              		.loc 1 226 0
 963              		.cfi_startproc
 964              		@ args = 0, pretend = 0, frame = 8
 965              		@ frame_needed = 1, uses_anonymous_args = 0
 966 0412 80B5     		push	{r7, lr}
 967              		.cfi_def_cfa_offset 8
 968              		.cfi_offset 7, -8
 969              		.cfi_offset 14, -4
 970 0414 82B0     		sub	sp, sp, #8
 971              		.cfi_def_cfa_offset 16
 972 0416 00AF     		add	r7, sp, #0
 973              		.cfi_def_cfa_register 7
 974              	.LBB2:
 227:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     for(int page = 0; page < PAGE; page++){
 975              		.loc 1 227 0
 976 0418 0023     		movs	r3, #0
 977 041a 7B60     		str	r3, [r7, #4]
 978 041c 1EE0     		b	.L48
 979              	.L51:
 228:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 980              		.loc 1 228 0
 981 041e 7B68     		ldr	r3, [r7, #4]
 982 0420 5BB2     		sxtb	r3, r3
 983 0422 4822     		movs	r2, #72
 984 0424 5242     		rsbs	r2, r2, #0
 985 0426 1343     		orrs	r3, r2
 986 0428 5BB2     		sxtb	r3, r3
 987 042a DBB2     		uxtb	r3, r3
 988 042c 1821     		movs	r1, #24
 989 042e 1800     		movs	r0, r3
 990 0430 FFF7FEFF 		bl	graphic_write_command
 229:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 991              		.loc 1 229 0
 992 0434 1821     		movs	r1, #24
 993 0436 4020     		movs	r0, #64
 994 0438 FFF7FEFF 		bl	graphic_write_command
 995              	.LBB3:
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 996              		.loc 1 230 0
 997 043c 0023     		movs	r3, #0
 998 043e 3B60     		str	r3, [r7]
 999 0440 06E0     		b	.L49
 1000              	.L50:
 231:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             graphic_write_data(0, B_CS1|B_CS2);
 1001              		.loc 1 231 0 discriminator 3
 1002 0442 1821     		movs	r1, #24
 1003 0444 0020     		movs	r0, #0
 1004 0446 FFF7FEFF 		bl	graphic_write_data
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1005              		.loc 1 230 0 discriminator 3
 1006 044a 3B68     		ldr	r3, [r7]
 1007 044c 0133     		adds	r3, r3, #1
 1008 044e 3B60     		str	r3, [r7]
 1009              	.L49:
 230:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         for(int add = 0; add < ADD; add++){
 1010              		.loc 1 230 0 is_stmt 0 discriminator 1
 1011 0450 3B68     		ldr	r3, [r7]
 1012 0452 3E2B     		cmp	r3, #62
 1013 0454 F5DD     		ble	.L50
 1014              	.LBE3:
 227:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1015              		.loc 1 227 0 is_stmt 1 discriminator 2
 1016 0456 7B68     		ldr	r3, [r7, #4]
 1017 0458 0133     		adds	r3, r3, #1
 1018 045a 7B60     		str	r3, [r7, #4]
 1019              	.L48:
 227:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
 1020              		.loc 1 227 0 is_stmt 0 discriminator 1
 1021 045c 7B68     		ldr	r3, [r7, #4]
 1022 045e 072B     		cmp	r3, #7
 1023 0460 DDDD     		ble	.L51
 1024              	.LBE2:
 232:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****             }
 233:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         }
 234:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     
 235:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     }
 1025              		.loc 1 235 0 is_stmt 1
 1026 0462 C046     		nop
 1027 0464 BD46     		mov	sp, r7
 1028 0466 02B0     		add	sp, sp, #8
 1029              		@ sp needed
 1030 0468 80BD     		pop	{r7, pc}
 1031              		.cfi_endproc
 1032              	.LFE16:
 1034              		.align	1
 1035              		.global	main
 1036              		.syntax unified
 1037              		.code	16
 1038              		.thumb_func
 1039              		.fpu softvfp
 1041              	main:
 1042              	.LFB17:
 236:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 237:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** void main(void)
 238:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** {
 1043              		.loc 1 238 0
 1044              		.cfi_startproc
 1045              		@ args = 0, pretend = 0, frame = 0
 1046              		@ frame_needed = 1, uses_anonymous_args = 0
 1047 046a 80B5     		push	{r7, lr}
 1048              		.cfi_def_cfa_offset 8
 1049              		.cfi_offset 7, -8
 1050              		.cfi_offset 14, -4
 1051 046c 00AF     		add	r7, sp, #0
 1052              		.cfi_def_cfa_register 7
 239:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     init_app();
 1053              		.loc 1 239 0
 1054 046e FFF7FEFF 		bl	init_app
 240:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_initialize();
 1055              		.loc 1 240 0
 1056 0472 FFF7FEFF 		bl	graphic_initialize
 241:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #ifdef SIMULATOR
 242:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****         graphics_clear_screen();
 243:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     #endif
 244:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** 
 245:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1057              		.loc 1 245 0
 1058 0476 1821     		movs	r1, #24
 1059 0478 4A20     		movs	r0, #74
 1060 047a FFF7FEFF 		bl	graphic_write_command
 246:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1061              		.loc 1 246 0
 1062 047e 1821     		movs	r1, #24
 1063 0480 B920     		movs	r0, #185
 1064 0482 FFF7FEFF 		bl	graphic_write_command
 247:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c ****     graphic_write_data(0xFF, B_CS1 | B_CS2);
 1065              		.loc 1 247 0
 1066 0486 1821     		movs	r1, #24
 1067 0488 FF20     		movs	r0, #255
 1068 048a FFF7FEFF 		bl	graphic_write_data
 248:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/LCDDisp/startup.c **** }    
 1069              		.loc 1 248 0
 1070 048e C046     		nop
 1071 0490 BD46     		mov	sp, r7
 1072              		@ sp needed
 1073 0492 80BD     		pop	{r7, pc}
 1074              		.cfi_endproc
 1075              	.LFE17:
 1077              	.Letext0:
