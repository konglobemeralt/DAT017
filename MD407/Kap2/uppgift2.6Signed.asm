@ varför vill de i boken
@ döpa filen till mom5.asm
@ när det är uppg 2.6? smh

start:
	LDR 	R6, =0x55555555 @D som ut
	LDR 	R5, =0x40020C00
	STR	R6, [R5]
@adressen till port Ds ut data register till R5
	LDR 	R5, =0x40020C14
@adressen till port Es in dataregister till R6
	LDR	R6, =0x40021010

main:
	LDR 	R3, =0
	LDRSB	R0, [R6, R3] @read PE0-E7
	LDR	R3, =1
	LDRSB	R1, [R6, R3] @read PE8-E15
	ADD	R0, R0, R1
	STRH	R0, [R5]
	B 	main
