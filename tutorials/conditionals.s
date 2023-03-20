.global _start
_start:
    MOV R0,#1
    MOV R1,#2

    CMP R0,R1
    ;performs R0-R1
    ;CPSR is set based on the result
    ;negative flag is set to 1 if R0>R1

    ;branch if R0 > R1
    BGT greater_branch
    BAL default

    ;other branches:
    ;BGE, BLT, BLE, BEQ, BNE

greater:
    MOV R2,#1

default:
    MOV R2,#2

    MOV R7,#1
    SWI 0