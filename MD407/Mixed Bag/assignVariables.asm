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