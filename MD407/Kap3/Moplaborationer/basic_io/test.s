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
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** void startup ( void )
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 	" MOV SP,R0\n"
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 	) ;
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB1:
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** void app_init(void)
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** {
  57              		.loc 1 18 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****     *((unsigned long*) 0x40020C00) = 0x00005555;
  67              		.loc 1 19 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** }
  71              		.loc 1 20 0
  72 000a C046     		nop
  73 000c BD46     		mov	sp, r7
  74              		@ sp needed
  75 000e 80BD     		pop	{r7, pc}
  76              	.L4:
  77              		.align	2
  78              	.L3:
  79 0010 000C0240 		.word	1073875968
  80 0014 55550000 		.word	21845
  81              		.cfi_endproc
  82              	.LFE1:
  84              		.align	1
  85              		.global	main
  86              		.syntax unified
  87              		.code	16
  88              		.thumb_func
  89              		.fpu softvfp
  91              	main:
  92              	.LFB2:
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** 
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** void main(void)
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c **** {
  93              		.loc 1 23 0
  94              		.cfi_startproc
  95              		@ args = 0, pretend = 0, frame = 8
  96              		@ frame_needed = 1, uses_anonymous_args = 0
  97 0018 80B5     		push	{r7, lr}
  98              		.cfi_def_cfa_offset 8
  99              		.cfi_offset 7, -8
 100              		.cfi_offset 14, -4
 101 001a 82B0     		sub	sp, sp, #8
 102              		.cfi_def_cfa_offset 16
 103 001c 00AF     		add	r7, sp, #0
 104              		.cfi_def_cfa_register 7
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****     unsigned char c;
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****     app_init();
 105              		.loc 1 25 0
 106 001e FFF7FEFF 		bl	app_init
 107              	.L6:
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****     while(1){
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****             c = (unsigned char) * ((unsigned short *) 0x40021010);
 108              		.loc 1 27 0 discriminator 1
 109 0022 044B     		ldr	r3, .L7
 110 0024 1A88     		ldrh	r2, [r3]
 111 0026 FB1D     		adds	r3, r7, #7
 112 0028 1A70     		strb	r2, [r3]
  28:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****             * ((unsigned char *) 0x40020C14) = c;
 113              		.loc 1 28 0 discriminator 1
 114 002a 034A     		ldr	r2, .L7+4
 115 002c FB1D     		adds	r3, r7, #7
 116 002e 1B78     		ldrb	r3, [r3]
 117 0030 1370     		strb	r3, [r2]
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap3/Moplaborationer/basic_io/startup.c ****             * ((unsigned char *) 0x40020C14) = c;
 118              		.loc 1 27 0 discriminator 1
 119 0032 F6E7     		b	.L6
 120              	.L8:
 121              		.align	2
 122              	.L7:
 123 0034 10100240 		.word	1073877008
 124 0038 140C0240 		.word	1073875988
 125              		.cfi_endproc
 126              	.LFE2:
 128              	.Letext0:
