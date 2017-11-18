@
@	mom7.asm
@

start:
@init port D och E som utportar
	LDR	R6, =0X55555555
	LDR	R5, =0X40020C00
	STR	R6, [R5]
	LDR	R5, =0X40021000
	STR	R6, [R5]

@Adressen till port Ds ut data register till R5
	LDR 	R5, =0X40020C14
@Adressen till port Es ut data register till R6
	LDR	R6, =0X40021014

main:
@ R0 = R0 << R1
@ write register value before shift to bargraph
	LSR	R2, R0, #16
	STRH	R2, [R5]
	STRH	R0, [R6]
@ Do the shift
	LSL	R0, R1
@ Write register after shift to bargraph
	LSR	R2, R0, #16
	STRH	R2, [R5]
	STRH	R0, [R6]
	B	main
