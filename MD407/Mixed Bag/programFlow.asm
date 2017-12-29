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


