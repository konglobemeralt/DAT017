start:
	LDR	R1, ='s'
	LDR	R2, ='c'
	LDRH	R0, [R1]
	STRB	R0, [R2]
		