.global _start
_start:
    MOV R0,#10
    LSL R0,#1
    LSR R0,#1
    MOV R1,R0,LSL #1;stores shifts in r1, r0 remains the same

    ROR R0,#1
    ;n ROLs can be done by 32-n RORs

    MOV R7,#1
    SWI 0