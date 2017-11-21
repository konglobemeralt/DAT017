   1              		.arch armv6
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
  25              		.file 1 "/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c"
   1:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** /*
   2:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****  * 	startup.c
   3:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****  *
   4:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****  */
   5:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_D 0x40020C00
   6:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
   7:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
   8:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
   9:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
  10:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
  11:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
  12:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
  13:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
  14:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
  15:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  16:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
  17:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** void startup ( void ) {
  26              		.loc 1 17 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  18:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** __asm volatile(
  31              		.loc 1 18 0
  32              		.syntax divided
  33              	@ 18 "/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  19:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  20:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 	" MOV SP,R0\n"
  21:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 	" BL main\n"				/* call main */
  22:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 	"_exit: B .\n"				/* never return */
  23:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 	) ;
  24:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** }
  40              		.loc 1 24 0
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
  25:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
  26:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** void app_init(void)
  27:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** {    
  57              		.loc 1 27 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  28:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     //Define high bits as out and low as input.
  29:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     
  30:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     *GPIO_MODER = 0x55005555;
  67              		.loc 1 30 0
  68 0004 094B     		ldr	r3, .L3
  69 0006 0A4A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  31:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     //set all bits as push pull
  32:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     *GPIO_OTYPER &= 0x0000FFFF;   
  71              		.loc 1 32 0
  72 000a 0A4B     		ldr	r3, .L3+8
  73 000c 094A     		ldr	r2, .L3+8
  74 000e 1288     		ldrh	r2, [r2]
  75 0010 92B2     		uxth	r2, r2
  76 0012 1A80     		strh	r2, [r3]
  33:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     *GPIO_OTYPER |= 0x00000000;   
  77              		.loc 1 33 0
  78 0014 074B     		ldr	r3, .L3+8
  79 0016 074A     		ldr	r2, .L3+8
  80 0018 1288     		ldrh	r2, [r2]
  81 001a 92B2     		uxth	r2, r2
  82 001c 1A80     		strh	r2, [r3]
  34:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     //
  35:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     //PORT_PUPDR = 0xzz55zzzz;   
  36:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     *GPIO_PUPDR = 0x00550000;   
  83              		.loc 1 36 0
  84 001e 064B     		ldr	r3, .L3+12
  85 0020 AA22     		movs	r2, #170
  86 0022 D203     		lsls	r2, r2, #15
  87 0024 1A60     		str	r2, [r3]
  37:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** }
  88              		.loc 1 37 0
  89 0026 C046     		nop
  90 0028 BD46     		mov	sp, r7
  91              		@ sp needed
  92 002a 80BD     		pop	{r7, pc}
  93              	.L4:
  94              		.align	2
  95              	.L3:
  96 002c 000C0240 		.word	1073875968
  97 0030 55550055 		.word	1426085205
  98 0034 040C0240 		.word	1073875972
  99 0038 0C0C0240 		.word	1073875980
 100              		.cfi_endproc
 101              	.LFE1:
 103              		.align	1
 104              		.global	kbdActivate
 105              		.syntax unified
 106              		.code	16
 107              		.thumb_func
 108              		.fpu softvfp
 110              	kbdActivate:
 111              	.LFB2:
  38:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
  39:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** void kbdActivate(unsigned int row){
 112              		.loc 1 39 0
 113              		.cfi_startproc
 114              		@ args = 0, pretend = 0, frame = 8
 115              		@ frame_needed = 1, uses_anonymous_args = 0
 116 003c 80B5     		push	{r7, lr}
 117              		.cfi_def_cfa_offset 8
 118              		.cfi_offset 7, -8
 119              		.cfi_offset 14, -4
 120 003e 82B0     		sub	sp, sp, #8
 121              		.cfi_def_cfa_offset 16
 122 0040 00AF     		add	r7, sp, #0
 123              		.cfi_def_cfa_register 7
 124 0042 7860     		str	r0, [r7, #4]
  40:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     switch(row)
 125              		.loc 1 40 0
 126 0044 7B68     		ldr	r3, [r7, #4]
 127 0046 042B     		cmp	r3, #4
 128 0048 19D8     		bhi	.L13
 129 004a 7B68     		ldr	r3, [r7, #4]
 130 004c 9A00     		lsls	r2, r3, #2
 131 004e 0E4B     		ldr	r3, .L14
 132 0050 D318     		adds	r3, r2, r3
 133 0052 1B68     		ldr	r3, [r3]
 134 0054 9F46     		mov	pc, r3
 135              		.section	.rodata
 136              		.align	2
 137              	.L8:
 138 0000 76000000 		.word	.L7
 139 0004 56000000 		.word	.L9
 140 0008 5E000000 		.word	.L10
 141 000c 66000000 		.word	.L11
 142 0010 6E000000 		.word	.L12
 143              		.text
 144              	.L9:
  41:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         {
  42:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             //activate row N or deactivate with 0 
  43:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             case 1: *GPIO_ODR_HIGH = 0x10; break;
 145              		.loc 1 43 0
 146 0056 0D4B     		ldr	r3, .L14+4
 147 0058 1022     		movs	r2, #16
 148 005a 1A70     		strb	r2, [r3]
 149 005c 0FE0     		b	.L6
 150              	.L10:
  44:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             case 2: *GPIO_ODR_HIGH = 0x20; break;
 151              		.loc 1 44 0
 152 005e 0B4B     		ldr	r3, .L14+4
 153 0060 2022     		movs	r2, #32
 154 0062 1A70     		strb	r2, [r3]
 155 0064 0BE0     		b	.L6
 156              	.L11:
  45:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             case 3: *GPIO_ODR_HIGH = 0x40; break;
 157              		.loc 1 45 0
 158 0066 094B     		ldr	r3, .L14+4
 159 0068 4022     		movs	r2, #64
 160 006a 1A70     		strb	r2, [r3]
 161 006c 07E0     		b	.L6
 162              	.L12:
  46:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             case 4: *GPIO_ODR_HIGH = 0x80; break;
 163              		.loc 1 46 0
 164 006e 074B     		ldr	r3, .L14+4
 165 0070 8022     		movs	r2, #128
 166 0072 1A70     		strb	r2, [r3]
 167 0074 03E0     		b	.L6
 168              	.L7:
  47:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             case 0: *GPIO_ODR_HIGH = 0x00; break;
 169              		.loc 1 47 0
 170 0076 054B     		ldr	r3, .L14+4
 171 0078 0022     		movs	r2, #0
 172 007a 1A70     		strb	r2, [r3]
 173 007c C046     		nop
 174              	.L6:
 175              	.L13:
  48:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         }
  49:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     
  50:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     }
 176              		.loc 1 50 0
 177 007e C046     		nop
 178 0080 BD46     		mov	sp, r7
 179 0082 02B0     		add	sp, sp, #8
 180              		@ sp needed
 181 0084 80BD     		pop	{r7, pc}
 182              	.L15:
 183 0086 C046     		.align	2
 184              	.L14:
 185 0088 00000000 		.word	.L8
 186 008c 150C0240 		.word	1073875989
 187              		.cfi_endproc
 188              	.LFE2:
 190              		.align	1
 191              		.global	kdbGetCol
 192              		.syntax unified
 193              		.code	16
 194              		.thumb_func
 195              		.fpu softvfp
 197              	kdbGetCol:
 198              	.LFB3:
  51:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     
  52:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** int kdbGetCol(void){
 199              		.loc 1 52 0
 200              		.cfi_startproc
 201              		@ args = 0, pretend = 0, frame = 8
 202              		@ frame_needed = 1, uses_anonymous_args = 0
 203 0090 80B5     		push	{r7, lr}
 204              		.cfi_def_cfa_offset 8
 205              		.cfi_offset 7, -8
 206              		.cfi_offset 14, -4
 207 0092 82B0     		sub	sp, sp, #8
 208              		.cfi_def_cfa_offset 16
 209 0094 00AF     		add	r7, sp, #0
 210              		.cfi_def_cfa_register 7
  53:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         unsigned char idr;
  54:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         idr = *GPIO_IDR_HIGH;
 211              		.loc 1 54 0
 212 0096 124A     		ldr	r2, .L22
 213 0098 FB1D     		adds	r3, r7, #7
 214 009a 1278     		ldrb	r2, [r2]
 215 009c 1A70     		strb	r2, [r3]
  55:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         
  56:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(idr & 0x8) return 4;
 216              		.loc 1 56 0
 217 009e FB1D     		adds	r3, r7, #7
 218 00a0 1B78     		ldrb	r3, [r3]
 219 00a2 0822     		movs	r2, #8
 220 00a4 1340     		ands	r3, r2
 221 00a6 01D0     		beq	.L17
 222              		.loc 1 56 0 is_stmt 0 discriminator 1
 223 00a8 0423     		movs	r3, #4
 224 00aa 15E0     		b	.L18
 225              	.L17:
  57:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(idr & 0x4) return 3;
 226              		.loc 1 57 0 is_stmt 1
 227 00ac FB1D     		adds	r3, r7, #7
 228 00ae 1B78     		ldrb	r3, [r3]
 229 00b0 0422     		movs	r2, #4
 230 00b2 1340     		ands	r3, r2
 231 00b4 01D0     		beq	.L19
 232              		.loc 1 57 0 is_stmt 0 discriminator 1
 233 00b6 0323     		movs	r3, #3
 234 00b8 0EE0     		b	.L18
 235              	.L19:
  58:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(idr & 0x2) return 2;
 236              		.loc 1 58 0 is_stmt 1
 237 00ba FB1D     		adds	r3, r7, #7
 238 00bc 1B78     		ldrb	r3, [r3]
 239 00be 0222     		movs	r2, #2
 240 00c0 1340     		ands	r3, r2
 241 00c2 01D0     		beq	.L20
 242              		.loc 1 58 0 is_stmt 0 discriminator 1
 243 00c4 0223     		movs	r3, #2
 244 00c6 07E0     		b	.L18
 245              	.L20:
  59:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(idr & 0x1) return 1;
 246              		.loc 1 59 0 is_stmt 1
 247 00c8 FB1D     		adds	r3, r7, #7
 248 00ca 1B78     		ldrb	r3, [r3]
 249 00cc 0122     		movs	r2, #1
 250 00ce 1340     		ands	r3, r2
 251 00d0 01D0     		beq	.L21
 252              		.loc 1 59 0 is_stmt 0 discriminator 1
 253 00d2 0123     		movs	r3, #1
 254 00d4 00E0     		b	.L18
 255              	.L21:
  60:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         return 0;
 256              		.loc 1 60 0 is_stmt 1
 257 00d6 0023     		movs	r3, #0
 258              	.L18:
  61:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     }
 259              		.loc 1 61 0
 260 00d8 1800     		movs	r0, r3
 261 00da BD46     		mov	sp, r7
 262 00dc 02B0     		add	sp, sp, #8
 263              		@ sp needed
 264 00de 80BD     		pop	{r7, pc}
 265              	.L23:
 266              		.align	2
 267              	.L22:
 268 00e0 110C0240 		.word	1073875985
 269              		.cfi_endproc
 270              	.LFE3:
 272              		.align	1
 273              		.global	outSeg7
 274              		.syntax unified
 275              		.code	16
 276              		.thumb_func
 277              		.fpu softvfp
 279              	outSeg7:
 280              	.LFB4:
  62:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     
  63:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** void outSeg7(unsigned char in)
  64:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     {
 281              		.loc 1 64 0
 282              		.cfi_startproc
 283              		@ args = 0, pretend = 0, frame = 8
 284              		@ frame_needed = 1, uses_anonymous_args = 0
 285 00e4 80B5     		push	{r7, lr}
 286              		.cfi_def_cfa_offset 8
 287              		.cfi_offset 7, -8
 288              		.cfi_offset 14, -4
 289 00e6 82B0     		sub	sp, sp, #8
 290              		.cfi_def_cfa_offset 16
 291 00e8 00AF     		add	r7, sp, #0
 292              		.cfi_def_cfa_register 7
 293 00ea 0200     		movs	r2, r0
 294 00ec FB1D     		adds	r3, r7, #7
 295 00ee 1A70     		strb	r2, [r3]
  65:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         
  66:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x0) *GPIO_ODR_LOW = 0x3F;
 296              		.loc 1 66 0
 297 00f0 FB1D     		adds	r3, r7, #7
 298 00f2 1B78     		ldrb	r3, [r3]
 299 00f4 002B     		cmp	r3, #0
 300 00f6 02D1     		bne	.L25
 301              		.loc 1 66 0 is_stmt 0 discriminator 1
 302 00f8 374B     		ldr	r3, .L42
 303 00fa 3F22     		movs	r2, #63
 304 00fc 1A70     		strb	r2, [r3]
 305              	.L25:
  67:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x1) *GPIO_ODR_LOW = 0x06;
 306              		.loc 1 67 0 is_stmt 1
 307 00fe FB1D     		adds	r3, r7, #7
 308 0100 1B78     		ldrb	r3, [r3]
 309 0102 012B     		cmp	r3, #1
 310 0104 02D1     		bne	.L26
 311              		.loc 1 67 0 is_stmt 0 discriminator 1
 312 0106 344B     		ldr	r3, .L42
 313 0108 0622     		movs	r2, #6
 314 010a 1A70     		strb	r2, [r3]
 315              	.L26:
  68:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x2) *GPIO_ODR_LOW = 0x5B;
 316              		.loc 1 68 0 is_stmt 1
 317 010c FB1D     		adds	r3, r7, #7
 318 010e 1B78     		ldrb	r3, [r3]
 319 0110 022B     		cmp	r3, #2
 320 0112 02D1     		bne	.L27
 321              		.loc 1 68 0 is_stmt 0 discriminator 1
 322 0114 304B     		ldr	r3, .L42
 323 0116 5B22     		movs	r2, #91
 324 0118 1A70     		strb	r2, [r3]
 325              	.L27:
  69:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x3) *GPIO_ODR_LOW = 0x4F;
 326              		.loc 1 69 0 is_stmt 1
 327 011a FB1D     		adds	r3, r7, #7
 328 011c 1B78     		ldrb	r3, [r3]
 329 011e 032B     		cmp	r3, #3
 330 0120 02D1     		bne	.L28
 331              		.loc 1 69 0 is_stmt 0 discriminator 1
 332 0122 2D4B     		ldr	r3, .L42
 333 0124 4F22     		movs	r2, #79
 334 0126 1A70     		strb	r2, [r3]
 335              	.L28:
  70:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x4) *GPIO_ODR_LOW = 0x66;
 336              		.loc 1 70 0 is_stmt 1
 337 0128 FB1D     		adds	r3, r7, #7
 338 012a 1B78     		ldrb	r3, [r3]
 339 012c 042B     		cmp	r3, #4
 340 012e 02D1     		bne	.L29
 341              		.loc 1 70 0 is_stmt 0 discriminator 1
 342 0130 294B     		ldr	r3, .L42
 343 0132 6622     		movs	r2, #102
 344 0134 1A70     		strb	r2, [r3]
 345              	.L29:
  71:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x5) *GPIO_ODR_LOW = 0x6D;
 346              		.loc 1 71 0 is_stmt 1
 347 0136 FB1D     		adds	r3, r7, #7
 348 0138 1B78     		ldrb	r3, [r3]
 349 013a 052B     		cmp	r3, #5
 350 013c 02D1     		bne	.L30
 351              		.loc 1 71 0 is_stmt 0 discriminator 1
 352 013e 264B     		ldr	r3, .L42
 353 0140 6D22     		movs	r2, #109
 354 0142 1A70     		strb	r2, [r3]
 355              	.L30:
  72:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x6) *GPIO_ODR_LOW = 0x7D;
 356              		.loc 1 72 0 is_stmt 1
 357 0144 FB1D     		adds	r3, r7, #7
 358 0146 1B78     		ldrb	r3, [r3]
 359 0148 062B     		cmp	r3, #6
 360 014a 02D1     		bne	.L31
 361              		.loc 1 72 0 is_stmt 0 discriminator 1
 362 014c 224B     		ldr	r3, .L42
 363 014e 7D22     		movs	r2, #125
 364 0150 1A70     		strb	r2, [r3]
 365              	.L31:
  73:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x7) *GPIO_ODR_LOW = 0x07;
 366              		.loc 1 73 0 is_stmt 1
 367 0152 FB1D     		adds	r3, r7, #7
 368 0154 1B78     		ldrb	r3, [r3]
 369 0156 072B     		cmp	r3, #7
 370 0158 02D1     		bne	.L32
 371              		.loc 1 73 0 is_stmt 0 discriminator 1
 372 015a 1F4B     		ldr	r3, .L42
 373 015c 0722     		movs	r2, #7
 374 015e 1A70     		strb	r2, [r3]
 375              	.L32:
  74:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x8) *GPIO_ODR_LOW = 0x7F;
 376              		.loc 1 74 0 is_stmt 1
 377 0160 FB1D     		adds	r3, r7, #7
 378 0162 1B78     		ldrb	r3, [r3]
 379 0164 082B     		cmp	r3, #8
 380 0166 02D1     		bne	.L33
 381              		.loc 1 74 0 is_stmt 0 discriminator 1
 382 0168 1B4B     		ldr	r3, .L42
 383 016a 7F22     		movs	r2, #127
 384 016c 1A70     		strb	r2, [r3]
 385              	.L33:
  75:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0x9) *GPIO_ODR_LOW = 0x67;
 386              		.loc 1 75 0 is_stmt 1
 387 016e FB1D     		adds	r3, r7, #7
 388 0170 1B78     		ldrb	r3, [r3]
 389 0172 092B     		cmp	r3, #9
 390 0174 02D1     		bne	.L34
 391              		.loc 1 75 0 is_stmt 0 discriminator 1
 392 0176 184B     		ldr	r3, .L42
 393 0178 6722     		movs	r2, #103
 394 017a 1A70     		strb	r2, [r3]
 395              	.L34:
  76:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0xA) *GPIO_ODR_LOW = 0x77;
 396              		.loc 1 76 0 is_stmt 1
 397 017c FB1D     		adds	r3, r7, #7
 398 017e 1B78     		ldrb	r3, [r3]
 399 0180 0A2B     		cmp	r3, #10
 400 0182 02D1     		bne	.L35
 401              		.loc 1 76 0 is_stmt 0 discriminator 1
 402 0184 144B     		ldr	r3, .L42
 403 0186 7722     		movs	r2, #119
 404 0188 1A70     		strb	r2, [r3]
 405              	.L35:
  77:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0xB) *GPIO_ODR_LOW = 0x7F;
 406              		.loc 1 77 0 is_stmt 1
 407 018a FB1D     		adds	r3, r7, #7
 408 018c 1B78     		ldrb	r3, [r3]
 409 018e 0B2B     		cmp	r3, #11
 410 0190 02D1     		bne	.L36
 411              		.loc 1 77 0 is_stmt 0 discriminator 1
 412 0192 114B     		ldr	r3, .L42
 413 0194 7F22     		movs	r2, #127
 414 0196 1A70     		strb	r2, [r3]
 415              	.L36:
  78:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0xC) *GPIO_ODR_LOW = 0xFF;
 416              		.loc 1 78 0 is_stmt 1
 417 0198 FB1D     		adds	r3, r7, #7
 418 019a 1B78     		ldrb	r3, [r3]
 419 019c 0C2B     		cmp	r3, #12
 420 019e 02D1     		bne	.L37
 421              		.loc 1 78 0 is_stmt 0 discriminator 1
 422 01a0 0D4B     		ldr	r3, .L42
 423 01a2 FF22     		movs	r2, #255
 424 01a4 1A70     		strb	r2, [r3]
 425              	.L37:
  79:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0xD) *GPIO_ODR_LOW = 0xBF;
 426              		.loc 1 79 0 is_stmt 1
 427 01a6 FB1D     		adds	r3, r7, #7
 428 01a8 1B78     		ldrb	r3, [r3]
 429 01aa 0D2B     		cmp	r3, #13
 430 01ac 02D1     		bne	.L38
 431              		.loc 1 79 0 is_stmt 0 discriminator 1
 432 01ae 0A4B     		ldr	r3, .L42
 433 01b0 BF22     		movs	r2, #191
 434 01b2 1A70     		strb	r2, [r3]
 435              	.L38:
  80:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0xE) *GPIO_ODR_LOW = 0x79;
 436              		.loc 1 80 0 is_stmt 1
 437 01b4 FB1D     		adds	r3, r7, #7
 438 01b6 1B78     		ldrb	r3, [r3]
 439 01b8 0E2B     		cmp	r3, #14
 440 01ba 02D1     		bne	.L39
 441              		.loc 1 80 0 is_stmt 0 discriminator 1
 442 01bc 064B     		ldr	r3, .L42
 443 01be 7922     		movs	r2, #121
 444 01c0 1A70     		strb	r2, [r3]
 445              	.L39:
  81:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         if(in == 0xF) *GPIO_ODR_LOW = 0x71;
 446              		.loc 1 81 0 is_stmt 1
 447 01c2 FB1D     		adds	r3, r7, #7
 448 01c4 1B78     		ldrb	r3, [r3]
 449 01c6 0F2B     		cmp	r3, #15
 450 01c8 02D1     		bne	.L41
 451              		.loc 1 81 0 is_stmt 0 discriminator 1
 452 01ca 034B     		ldr	r3, .L42
 453 01cc 7122     		movs	r2, #113
 454 01ce 1A70     		strb	r2, [r3]
 455              	.L41:
  82:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         
  83:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     }
 456              		.loc 1 83 0 is_stmt 1
 457 01d0 C046     		nop
 458 01d2 BD46     		mov	sp, r7
 459 01d4 02B0     		add	sp, sp, #8
 460              		@ sp needed
 461 01d6 80BD     		pop	{r7, pc}
 462              	.L43:
 463              		.align	2
 464              	.L42:
 465 01d8 140C0240 		.word	1073875988
 466              		.cfi_endproc
 467              	.LFE4:
 469              		.section	.rodata
 470              		.align	2
 471              	.LC0:
 472 0014 01       		.byte	1
 473 0015 02       		.byte	2
 474 0016 03       		.byte	3
 475 0017 0A       		.byte	10
 476 0018 04       		.byte	4
 477 0019 05       		.byte	5
 478 001a 06       		.byte	6
 479 001b 0B       		.byte	11
 480 001c 07       		.byte	7
 481 001d 08       		.byte	8
 482 001e 09       		.byte	9
 483 001f 0C       		.byte	12
 484 0020 0E       		.byte	14
 485 0021 00       		.byte	0
 486 0022 0F       		.byte	15
 487 0023 0D       		.byte	13
 488              		.text
 489              		.align	1
 490              		.global	keyb
 491              		.syntax unified
 492              		.code	16
 493              		.thumb_func
 494              		.fpu softvfp
 496              	keyb:
 497              	.LFB5:
  84:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
  85:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** unsigned char keyb(void){
 498              		.loc 1 85 0
 499              		.cfi_startproc
 500              		@ args = 0, pretend = 0, frame = 24
 501              		@ frame_needed = 1, uses_anonymous_args = 0
 502 01dc 90B5     		push	{r4, r7, lr}
 503              		.cfi_def_cfa_offset 12
 504              		.cfi_offset 4, -12
 505              		.cfi_offset 7, -8
 506              		.cfi_offset 14, -4
 507 01de 87B0     		sub	sp, sp, #28
 508              		.cfi_def_cfa_offset 40
 509 01e0 00AF     		add	r7, sp, #0
 510              		.cfi_def_cfa_register 7
  86:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         unsigned char key[] = {1, 2, 3, 0xA, 4, 5, 6, 0xB, 7, 8, 9, 0xC, 0xE, 0, 0xF, 0xD};
 511              		.loc 1 86 0
 512 01e2 3B00     		movs	r3, r7
 513 01e4 164A     		ldr	r2, .L50
 514 01e6 13CA     		ldmia	r2!, {r0, r1, r4}
 515 01e8 13C3     		stmia	r3!, {r0, r1, r4}
 516 01ea 1268     		ldr	r2, [r2]
 517 01ec 1A60     		str	r2, [r3]
  87:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         int row, col;
  88:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         for(row = 1; row <= 4; row++)
 518              		.loc 1 88 0
 519 01ee 0123     		movs	r3, #1
 520 01f0 7B61     		str	r3, [r7, #20]
 521 01f2 19E0     		b	.L45
 522              	.L48:
  89:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             {
  90:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             kbdActivate(row);
 523              		.loc 1 90 0
 524 01f4 7B69     		ldr	r3, [r7, #20]
 525 01f6 1800     		movs	r0, r3
 526 01f8 FFF7FEFF 		bl	kbdActivate
  91:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             if(col = kdbGetCol())
 527              		.loc 1 91 0
 528 01fc FFF7FEFF 		bl	kdbGetCol
 529 0200 0300     		movs	r3, r0
 530 0202 3B61     		str	r3, [r7, #16]
 531 0204 3B69     		ldr	r3, [r7, #16]
 532 0206 002B     		cmp	r3, #0
 533 0208 0BD0     		beq	.L46
  92:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****                 {
  93:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****                 kbdActivate(0);
 534              		.loc 1 93 0
 535 020a 0020     		movs	r0, #0
 536 020c FFF7FEFF 		bl	kbdActivate
  94:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****                 return key[4*(row-1) + (col-1)];
 537              		.loc 1 94 0
 538 0210 7B69     		ldr	r3, [r7, #20]
 539 0212 013B     		subs	r3, r3, #1
 540 0214 9A00     		lsls	r2, r3, #2
 541 0216 3B69     		ldr	r3, [r7, #16]
 542 0218 013B     		subs	r3, r3, #1
 543 021a D318     		adds	r3, r2, r3
 544 021c 3A00     		movs	r2, r7
 545 021e D35C     		ldrb	r3, [r2, r3]
 546 0220 09E0     		b	.L49
 547              	.L46:
  88:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             {
 548              		.loc 1 88 0 discriminator 2
 549 0222 7B69     		ldr	r3, [r7, #20]
 550 0224 0133     		adds	r3, r3, #1
 551 0226 7B61     		str	r3, [r7, #20]
 552              	.L45:
  88:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             {
 553              		.loc 1 88 0 is_stmt 0 discriminator 1
 554 0228 7B69     		ldr	r3, [r7, #20]
 555 022a 042B     		cmp	r3, #4
 556 022c E2DD     		ble	.L48
  95:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****                 }
  96:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****             }
  97:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         kbdActivate(0);
 557              		.loc 1 97 0 is_stmt 1
 558 022e 0020     		movs	r0, #0
 559 0230 FFF7FEFF 		bl	kbdActivate
  98:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         return 0xFF;
 560              		.loc 1 98 0
 561 0234 FF23     		movs	r3, #255
 562              	.L49:
  99:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** }
 563              		.loc 1 99 0 discriminator 1
 564 0236 1800     		movs	r0, r3
 565 0238 BD46     		mov	sp, r7
 566 023a 07B0     		add	sp, sp, #28
 567              		@ sp needed
 568 023c 90BD     		pop	{r4, r7, pc}
 569              	.L51:
 570 023e C046     		.align	2
 571              	.L50:
 572 0240 14000000 		.word	.LC0
 573              		.cfi_endproc
 574              	.LFE5:
 576              		.align	1
 577              		.global	main
 578              		.syntax unified
 579              		.code	16
 580              		.thumb_func
 581              		.fpu softvfp
 583              	main:
 584              	.LFB6:
 100:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
 101:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** 
 102:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** void main(void)
 103:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c **** {
 585              		.loc 1 103 0
 586              		.cfi_startproc
 587              		@ args = 0, pretend = 0, frame = 0
 588              		@ frame_needed = 1, uses_anonymous_args = 0
 589 0244 80B5     		push	{r7, lr}
 590              		.cfi_def_cfa_offset 8
 591              		.cfi_offset 7, -8
 592              		.cfi_offset 14, -4
 593 0246 00AF     		add	r7, sp, #0
 594              		.cfi_def_cfa_register 7
 104:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     app_init();
 595              		.loc 1 104 0
 596 0248 FFF7FEFF 		bl	app_init
 597              	.L53:
 105:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     
 106:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****     while(1){
 107:/Users/konglobemeralt/Documents/gitz/DAT017/Hemuppgifter/keypad/startup.c ****         outSeg7(keyb());
 598              		.loc 1 107 0 discriminator 1
 599 024c FFF7FEFF 		bl	keyb
 600 0250 0300     		movs	r3, r0
 601 0252 1800     		movs	r0, r3
 602 0254 FFF7FEFF 		bl	outSeg7
 603 0258 F8E7     		b	.L53
 604              		.cfi_endproc
 605              	.LFE6:
 607              	.Letext0:
