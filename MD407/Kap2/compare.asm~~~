tart:	LDR	R0,=0x55555555
	LDR	R1,=0x40020C00
	STR	R0,[R1]
	LDR	R5,=0x40020C14
	LDR	R6,=0x40021010
	LDR	R7,=0
main:	LDRSB	R0,[R6,R7]
	ADD	R1,R6,#0x01
	LDRSB	R1,[R1,R7]
	CMP	R0,R1
	BGT	main_1 @Om Input1>Input2 hoppa till main_1
	MOV	R0,#0x00
	B	main_2
main_1:	MOV	R0,#0xFF
main_2: STRB	R0,[R5]
	B	main
