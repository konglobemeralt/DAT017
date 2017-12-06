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
  15              		.global	counter
  16              		.bss
  17              		.align	2
  20              	counter:
  21 0000 00000000 		.space	4
  22              		.section	.start_section,"ax",%progbits
  23              		.align	1
  24              		.global	startup
  25              		.syntax unified
  26              		.code	16
  27              		.thumb_func
  28              		.fpu softvfp
  30              	startup:
  31              	.LFB0:
  32              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** #include "registers.h"
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** volatile unsigned int counter = 0;
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** void startup ( void )
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** {
  33              		.loc 1 12 0
  34              		.cfi_startproc
  35              		@ Naked Function: prologue and epilogue provided by programmer.
  36              		@ args = 0, pretend = 0, frame = 0
  37              		@ frame_needed = 1, uses_anonymous_args = 0
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** asm volatile(
  38              		.loc 1 13 0
  39              		.syntax divided
  40              	@ 13 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c" 1
  41 0000 0248     		 LDR R0,=0x2001C000
  42 0002 8546     	 MOV SP,R0
  43 0004 FFF7FEFF 	 BL main
  44 0008 FEE7     	.L1: B .L1
  45              	
  46              	@ 0 "" 2
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	" MOV SP,R0\n"
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	" BL main\n"				/* call main */
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	".L1: B .L1\n"				/* never return */
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	) ;
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** }
  47              		.loc 1 19 0
  48              		.thumb
  49              		.syntax unified
  50 000a C046     		nop
  51              		.cfi_endproc
  52              	.LFE0:
  54              		.text
  55              		.align	1
  56              		.global	interruptHandler
  57              		.syntax unified
  58              		.code	16
  59              		.thumb_func
  60              		.fpu softvfp
  62              	interruptHandler:
  63              	.LFB1:
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** void interruptHandler(){
  64              		.loc 1 21 0
  65              		.cfi_startproc
  66              		@ args = 0, pretend = 0, frame = 0
  67              		@ frame_needed = 1, uses_anonymous_args = 0
  68 0000 80B5     		push	{r7, lr}
  69              		.cfi_def_cfa_offset 8
  70              		.cfi_offset 7, -8
  71              		.cfi_offset 14, -4
  72 0002 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****         counter ++;
  74              		.loc 1 22 0
  75 0004 064B     		ldr	r3, .L3
  76 0006 1B68     		ldr	r3, [r3]
  77 0008 5A1C     		adds	r2, r3, #1
  78 000a 054B     		ldr	r3, .L3
  79 000c 1A60     		str	r2, [r3]
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****         *EXTI_PR |= 0x00000004; 
  80              		.loc 1 23 0
  81 000e 054B     		ldr	r3, .L3+4
  82 0010 044A     		ldr	r2, .L3+4
  83 0012 1268     		ldr	r2, [r2]
  84 0014 0421     		movs	r1, #4
  85 0016 0A43     		orrs	r2, r1
  86 0018 1A60     		str	r2, [r3]
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****     }
  87              		.loc 1 24 0
  88 001a C046     		nop
  89 001c BD46     		mov	sp, r7
  90              		@ sp needed
  91 001e 80BD     		pop	{r7, pc}
  92              	.L4:
  93              		.align	2
  94              	.L3:
  95 0020 00000000 		.word	counter
  96 0024 143C0140 		.word	1073822740
  97              		.cfi_endproc
  98              	.LFE1:
 100              		.align	1
 101              		.global	application_init
 102              		.syntax unified
 103              		.code	16
 104              		.thumb_func
 105              		.fpu softvfp
 107              	application_init:
 108              	.LFB2:
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****     
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** void application_init(){
 109              		.loc 1 26 0
 110              		.cfi_startproc
 111              		@ args = 0, pretend = 0, frame = 0
 112              		@ frame_needed = 1, uses_anonymous_args = 0
 113 0028 80B5     		push	{r7, lr}
 114              		.cfi_def_cfa_offset 8
 115              		.cfi_offset 7, -8
 116              		.cfi_offset 14, -4
 117 002a 00AF     		add	r7, sp, #0
 118              		.cfi_def_cfa_register 7
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****     // Setup hex display
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*GPIO_D_MODER &= 0xFFFF0000;
 119              		.loc 1 28 0
 120 002c 1A4B     		ldr	r3, .L6
 121 002e 1A4A     		ldr	r2, .L6
 122 0030 1268     		ldr	r2, [r2]
 123 0032 120C     		lsrs	r2, r2, #16
 124 0034 1204     		lsls	r2, r2, #16
 125 0036 1A60     		str	r2, [r3]
  29:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*GPIO_D_MODER |= 0x00005555;
 126              		.loc 1 29 0
 127 0038 174B     		ldr	r3, .L6
 128 003a 174A     		ldr	r2, .L6
 129 003c 1268     		ldr	r2, [r2]
 130 003e 1749     		ldr	r1, .L6+4
 131 0040 0A43     		orrs	r2, r1
 132 0042 1A60     		str	r2, [r3]
  30:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	
  31:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	// Setup E as input
  32:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*GPIO_E_MODER = 0;
 133              		.loc 1 32 0
 134 0044 164B     		ldr	r3, .L6+8
 135 0046 0022     		movs	r2, #0
 136 0048 1A60     		str	r2, [r3]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	
  34:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	// Setup PE3 to EXTICR1
  35:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*SYSCFG_EXTICR1 &= 0xFFFF0FFF; 
 137              		.loc 1 35 0
 138 004a 164B     		ldr	r3, .L6+12
 139 004c 154A     		ldr	r2, .L6+12
 140 004e 1268     		ldr	r2, [r2]
 141 0050 1549     		ldr	r1, .L6+16
 142 0052 0A40     		ands	r2, r1
 143 0054 1A60     		str	r2, [r3]
  36:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*SYSCFG_EXTICR1 |= 0x00004000; 
 144              		.loc 1 36 0
 145 0056 134B     		ldr	r3, .L6+12
 146 0058 124A     		ldr	r2, .L6+12
 147 005a 1268     		ldr	r2, [r2]
 148 005c 8021     		movs	r1, #128
 149 005e C901     		lsls	r1, r1, #7
 150 0060 0A43     		orrs	r2, r1
 151 0062 1A60     		str	r2, [r3]
  37:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	
  38:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	// Setup EXTI for PE3
  39:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*EXTI_IMR |= 0x08;
 152              		.loc 1 39 0
 153 0064 114B     		ldr	r3, .L6+20
 154 0066 114A     		ldr	r2, .L6+20
 155 0068 1268     		ldr	r2, [r2]
 156 006a 0821     		movs	r1, #8
 157 006c 0A43     		orrs	r2, r1
 158 006e 1A60     		str	r2, [r3]
  40:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*EXTI_FTSR |= 0x08;
 159              		.loc 1 40 0
 160 0070 0F4B     		ldr	r3, .L6+24
 161 0072 0F4A     		ldr	r2, .L6+24
 162 0074 1268     		ldr	r2, [r2]
 163 0076 0821     		movs	r1, #8
 164 0078 0A43     		orrs	r2, r1
 165 007a 1A60     		str	r2, [r3]
  41:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	
  42:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	// Setup EXTI3 interrupt function
  43:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*((void (**)(void)) 0x2001C064) = interruptHandler;
 166              		.loc 1 43 0
 167 007c 0D4B     		ldr	r3, .L6+28
 168 007e 0E4A     		ldr	r2, .L6+32
 169 0080 1A60     		str	r2, [r3]
  44:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	
  45:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	// Enable EXTI3 in NVIC
  46:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 170              		.loc 1 46 0
 171 0082 0E4B     		ldr	r3, .L6+36
 172 0084 0D4A     		ldr	r2, .L6+36
 173 0086 1268     		ldr	r2, [r2]
 174 0088 8021     		movs	r1, #128
 175 008a 8900     		lsls	r1, r1, #2
 176 008c 0A43     		orrs	r2, r1
 177 008e 1A60     		str	r2, [r3]
  47:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****     }
 178              		.loc 1 47 0
 179 0090 C046     		nop
 180 0092 BD46     		mov	sp, r7
 181              		@ sp needed
 182 0094 80BD     		pop	{r7, pc}
 183              	.L7:
 184 0096 C046     		.align	2
 185              	.L6:
 186 0098 000C0240 		.word	1073875968
 187 009c 55550000 		.word	21845
 188 00a0 00100240 		.word	1073876992
 189 00a4 08380140 		.word	1073821704
 190 00a8 FF0FFFFF 		.word	-61441
 191 00ac 003C0140 		.word	1073822720
 192 00b0 0C3C0140 		.word	1073822732
 193 00b4 64C00120 		.word	536985700
 194 00b8 00000000 		.word	interruptHandler
 195 00bc 00E100E0 		.word	-536813312
 196              		.cfi_endproc
 197              	.LFE2:
 199              		.align	1
 200              		.global	main
 201              		.syntax unified
 202              		.code	16
 203              		.thumb_func
 204              		.fpu softvfp
 206              	main:
 207              	.LFB3:
  48:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****     
  49:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** void main(void){
 208              		.loc 1 49 0
 209              		.cfi_startproc
 210              		@ args = 0, pretend = 0, frame = 0
 211              		@ frame_needed = 1, uses_anonymous_args = 0
 212 00c0 80B5     		push	{r7, lr}
 213              		.cfi_def_cfa_offset 8
 214              		.cfi_offset 7, -8
 215              		.cfi_offset 14, -4
 216 00c2 00AF     		add	r7, sp, #0
 217              		.cfi_def_cfa_register 7
  50:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c ****     application_init();
 218              		.loc 1 50 0
 219 00c4 FFF7FEFF 		bl	application_init
 220              	.L9:
  51:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 	while(1) {
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 		*GPIO_D_ODR_LOW = counter;
 221              		.loc 1 52 0 discriminator 1
 222 00c8 064A     		ldr	r2, .L10
 223 00ca 074B     		ldr	r3, .L10+4
 224 00cc 1B68     		ldr	r3, [r3]
 225 00ce DBB2     		uxtb	r3, r3
 226 00d0 1370     		strb	r3, [r2]
  53:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 		*GPIO_D_ODR_LOW = counter + 1;
 227              		.loc 1 53 0 discriminator 1
 228 00d2 044A     		ldr	r2, .L10
 229 00d4 044B     		ldr	r3, .L10+4
 230 00d6 1B68     		ldr	r3, [r3]
 231 00d8 DBB2     		uxtb	r3, r3
 232 00da 0133     		adds	r3, r3, #1
 233 00dc DBB2     		uxtb	r3, r3
 234 00de 1370     		strb	r3, [r2]
  52:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/6_4/startup.c **** 		*GPIO_D_ODR_LOW = counter + 1;
 235              		.loc 1 52 0 discriminator 1
 236 00e0 F2E7     		b	.L9
 237              	.L11:
 238 00e2 C046     		.align	2
 239              	.L10:
 240 00e4 140C0240 		.word	1073875988
 241 00e8 00000000 		.word	counter
 242              		.cfi_endproc
 243              	.LFE3:
 245              	.Letext0:
