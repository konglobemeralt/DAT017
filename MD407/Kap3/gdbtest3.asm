@@ gdbtest3.asm@
start:   LDR R0, =0x40023830 LDR R1, =0x18 STR R1, [R0]
 LDR R0,=0x55555555 LDR R1,=0x40020C00 @ config port D STR R0,[R1]
 LDR R1,=0x40020C14 @ outport GPIO D LDR R2,=0x40021010 @ inport GPIO E
main: LDR  R0,[R2] STR R0,[R1] B main
