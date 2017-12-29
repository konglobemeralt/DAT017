	LDR	R3, a
	LDR	R2, b
	CMP	R3, R2
	BCS	.L2
	LDR	R3, c
	LDR	R2, d	
	CMP	R3, R2
	BGE 	L2

.L1:
.l2:

//////////////////////

.while_continue:
	LDR	R3, a
	TST	R3, R3
	BMI	.while_break
	LDR	R2, b
	CMP	R3, R2 @a-b
	BGE	.L1
	LDR	R1, =c
	ADD	R2, R2, #1
	STR	R2, [R1]

.L1:
	SUBS	R3
	B	.while_continue

.while_break


//////////////////////

	LDR	R0, x
	LDR	R1, y
	BL	mini
	LDR	R1, =x
	STR	R0, [R1]

//////////////////////

	LDR	R0, =x
	LDRB	R0, [R0]
	SXTB	R0, R0
	LDR	R1, =y
	LDRB	R1, [R1]
	SXTB	R1, R1
	BL	minc
	LDR	R1, =x
	STRB	R0, [R1]

