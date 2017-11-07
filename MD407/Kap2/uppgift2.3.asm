start:
	LDR	R1, =c
	LDRB	R0, =0x5
	STRB	R0, [R1]
	LDR	R1, =s
	LDRH	R0, =0x00
	STRH	R0, [R1]
	LDR	R1, =i
	LDR	R0, =0xF0
	STR	R0, [R1]
	.ALIGN
i:	.WORD	0x01
s:	.HWORD	0x3E0
c:	.BYTE	0x01


	LDR	R1,=s
	LDR	R2,=c
	LDRH	R0, [R1]
	STRB	R0, [R2]
