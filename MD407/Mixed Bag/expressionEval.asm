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