.global _start
_start:
	MOV R0,#0b1010
	MOV R1,#10
	MOV R2,#0xa
	MOV R2,R0

    MOV R7,#1
    SWI 0