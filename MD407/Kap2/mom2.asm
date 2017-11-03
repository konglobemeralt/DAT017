@
@	mom2.asm
@

@ initiate port D as outport
start:	LDR 	R0, =0x55555555
	LDR 	R1, =0x40020C00
	STR 	R0, [R1]

@ adress to port D out data register to R1
	LDR 	R1, =0x40020C14
@ adress to port E in data register to R2
	LDR	R2, =0x40021010

main:	LDRB	R0, [R2]
	STRB	R0, [R1]
	B	main

