start:
	.ALIGN
i:	.WORD	0x01
s:	.HWORD	0x01
c:	.BYTE	0x80


	LDR	R1, =c
	LDR	R2, =s
	LDR	R3, =0
	LDRSB	R0, [R1, R3]
	STRH	R0, [R2]

