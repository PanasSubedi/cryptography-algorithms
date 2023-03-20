.global _start

_start:
    MOV R0,#2
    MOV R1,#4
    CMP R0,R1

    ADDLT R2,R2,#1 ;add if previous CMP is less than
    MOVGE R2,#5;move if previous CMP is greater than and equal