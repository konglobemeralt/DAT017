LDR	R0, a 	@ R0 = a
LDR	R1, b	@ R1 = b
CMP	R0, R1	@ (a-b) -> APSR
BGT	If_do
B 	If_end

If_do:
	LDR	R1, =c   @ R1 = &c
	STR	R0, [R1] @ c = R0
If_end:
	...

///////////////////

@ unsigned int a, b, c;
@ if (a > b)
@	c = a;
@ else
@	c = b;

LDR	R0, a 	@ R0 = a
LDR	R1, b 	@ R1 = b
LDR	R2, =c	@ R2 = &c
CMP	R0, R1	@ (a-b) -> APSR
BHI	If_do
