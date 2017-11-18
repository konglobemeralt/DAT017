@ 1.3.1. Utgå från att följande deklarationer är gjorda på global nivå. 
@ int a,b,c; 
@ Visa en kodsekvens, i ARM assemblerspråk, som evaluerar följande uttrycks värde till register R0. 
@ a) -b; 
@ b) ~b; 
@ c) a * -b; 
@ d) a * (b+c); 
@ e) a * b + c;

a)
	LDR	R0, b
	NEG	R0, R0

b)
	LDR	R0, b
	MVN	R0, R0

c)	
	LDR	R0, b
	LDR	R1, a
	
	NEG	R0, R0
	MUL	R0, R0, R1
d)
	LDR	R0, a
	LDR	R1, b
	LDR	R2, c
	
	ADD	R1, R1, R2
	MUL	R0, R0, R1


@	1.3.5. Utgå från att följande deklarationer är gjorda på global nivå. 
@	int a,b,c; 
@	Visa en kodsekvens, i ARM assemblerspråk, som evaluerar följande uttrycks värde till register R0. 
@	a)	a & 4; 
@	b)	a & b; 
@	c)	~(a&8); 
@	d)	~a&8;

a)	
	LDR 	R1, a
	MOV 	R2, #4
	AND	R0, R1, R2

b)
	LDR	R1, a
	LDR	R2, b
	AND	R0, R1, R2

c)	
	LDR	R1, a
	MOV	R2, #8
	AND	R0, R1, R2
	MVN	R0, R0

d)	
	LDR	R1, a
	MVN	R1, R1
	MOV	R2, #8
	AND	R0, R1, R2
		
