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
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup
   1:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** void startup ( void )
   8:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  10:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 	" MOV SP,R0\n"
  12:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 	) ;
  15:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	usage_fault_handler
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	usage_fault_handler:
  56              	.LFB1:
  16:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** void usage_fault_handler( int num ){
  57              		.loc 1 17 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 8
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 82B0     		sub	sp, sp, #8
  66              		.cfi_def_cfa_offset 16
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 7860     		str	r0, [r7, #4]
  70              	.L3:
  18:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****         while(1);
  71              		.loc 1 18 0 discriminator 1
  72 0008 FEE7     		b	.L3
  73              		.cfi_endproc
  74              	.LFE1:
  76              		.align	1
  77              		.global	main
  78              		.syntax unified
  79              		.code	16
  80              		.thumb_func
  81              		.fpu softvfp
  83              	main:
  84              	.LFB2:
  19:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** }
  20:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** 
  21:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** void main(void)
  22:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c **** {
  85              		.loc 1 22 0
  86              		.cfi_startproc
  87              		@ args = 0, pretend = 0, frame = 8
  88              		@ frame_needed = 1, uses_anonymous_args = 0
  89 000a 80B5     		push	{r7, lr}
  90              		.cfi_def_cfa_offset 8
  91              		.cfi_offset 7, -8
  92              		.cfi_offset 14, -4
  93 000c 82B0     		sub	sp, sp, #8
  94              		.cfi_def_cfa_offset 16
  95 000e 00AF     		add	r7, sp, #0
  96              		.cfi_def_cfa_register 7
  23:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****     int *ip, i;
  24:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****     *((void(**)(void)) 0x2001C018) = usage_fault_handler;
  97              		.loc 1 24 0
  98 0010 044B     		ldr	r3, .L6
  99 0012 054A     		ldr	r2, .L6+4
 100 0014 1A60     		str	r2, [r3]
 101              	.L5:
  25:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****     while(1){
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****         ip = (int *) 0x20001001;
 102              		.loc 1 26 0 discriminator 1
 103 0016 054B     		ldr	r3, .L6+8
 104 0018 7B60     		str	r3, [r7, #4]
  27:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****         i = *ip;
 105              		.loc 1 27 0 discriminator 1
 106 001a 7B68     		ldr	r3, [r7, #4]
 107 001c 1B68     		ldr	r3, [r3]
 108 001e 3B60     		str	r3, [r7]
  26:/Users/konglobemeralt/Documents/gitz/DAT017/MD407/Kap5/Moplaborationer/UsageFault/startup.c ****         i = *ip;
 109              		.loc 1 26 0 discriminator 1
 110 0020 F9E7     		b	.L5
 111              	.L7:
 112 0022 C046     		.align	2
 113              	.L6:
 114 0024 18C00120 		.word	536985624
 115 0028 00000000 		.word	usage_fault_handler
 116 002c 01100020 		.word	536875009
 117              		.cfi_endproc
 118              	.LFE2:
 120              	.Letext0:
