@ mom6.asm

start:
	LDR	R6, =0x55555555
	LDR	R5, =0x40020C00
	STR	R6, [R5]
@ Adressen till port D utregister till R5
	LDR	R5, =0x40020C14
@ Adressen till port E inregister till R6
	LDR	R6, =0x40021010

main:
	LDRB	R0, [R6]
	LDRB	R1, [R6, #1]
	AND	R0, R0, R1
	STRB	R0, [R5]
	B	main
