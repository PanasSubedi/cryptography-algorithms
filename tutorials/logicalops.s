.global _start
_start:
    MOV R0,#0xff
    MOV R1,#22
    
    AND R2,R0,R1
    ORR R2,R0,R1
    EOR R2,R0,R1
    
    MVN R0,R0
    AND R0,R0,#0x000000ff;resets the left bits to 0

    ANDS R2,R0,R1;sets flags, but isn't normally used
    ;similar flag setting operators for almost all operators

    MOV R7,#1
    SWI 0