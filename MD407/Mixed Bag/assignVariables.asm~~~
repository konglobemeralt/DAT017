@	
@	Assign the following:
@
@	char c; 
@ 	short s; 
@	int i;
@
	.global c, s, i
c:	.space	1
	.align	1	@Allowed anywhere
s:	.space	2
	.align	2	@Allowed divisible by two	
i:	.space	4
	.align	4	@Allowed divisible by four

@
@	static unsigned char cu,
@	static unsigned short su,
@	static unsigned int iu,
@
 	.global cu, su, iu
cu:	.space	1
	.align	1	@Allowed anywhere
su:	.space	2
	.align	2	@Allowed divisible by two	
iu:	.space	4
	.align	4	@Allowed divisible by four


@	unsigned char	c = 'A'; 
@	unsigned short	s = 0x1234; 
@	unsigned int	i = 0x89ABCDEF;

	.global cb, sb, ib
cb:	.BYTE	'A'
	.align	1

sb:	.HWORD	0x1234
	.ALIGN	2

ib:	.WORD	0x89ABCDEF
	.align	4


@ 1.1.4. Utgå från följande deklarationer på global nivå: 
@ char	c1,c2,c3; 
@ visa hur följande tilldelningssatser kan kodas i ARM-v6 assemblerspråk: 
@ c1 = -18; 
@ c2 = c3;

	
	LDR	R3, =c1
	LDR	R2, =-18
	STRB	R2, [R3]

	LDR	R3, =c3
	LDRB	R3, [R3]
	LDR	R2, =c2
	STRB	R3, [R2]


@1.1.5. Utgå från följande deklarationer på global nivå: 
@short s1,s2,s3; 
@visa hur följande tilldelningssatser kan kodas i ARM-v6 assemblerspråk: 
@s1 = 0x3344; 
@s2 = s3;
	.GLOBAL s1, s2, s3
	LDR	R1, =s1
	LDR	R2, =0x3344
	STRH	R2, [R1]

	LDR	R3, =s3
	LDRH	R3, [R3]
	LDR	R2, =s2
	STRH	R3, [R2]
	
	
