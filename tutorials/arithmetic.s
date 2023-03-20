.global _start
_start:
	MOV R0,#10
    MOV R1,#12

    ADD R2,R0,R1
    MUL R2,R0,R1

    ;first 4 bits of CPSR refer to
    ;Negative, Zero, Carry, Overflow
    SUB R2,R0,R1;does not set CPSR
    SUBS R2,R0,R1;sets CPSR first bit to 1

    MOV R0,#0xffffffff
    MOV R1,#1
    ADD R2,R0,R1;does not set CPSR
    ADDS R2,R0,R1;sets CPSR third bit to 1
    ADC R2,R0,R1;R2=R0+R1+carry

    MOV R7,#1
    SWI 0