.global _start
_start:
	LDR R0,=my_list

    ;load first element to R1
    LDR R1,[R0]

    ;load second element to R1
    ;does not change R0
    LDR R1,[R0,#4]

    ;load second element to R1
    ;increases R0 to R0+4 before accessing
    ;the value
    LDR R1,[R0,#4]!

    ;load second element to R1
    ;value is first loaded into R1
    ;R0 is then increased by 4
    ;post-increment
    LDR R1,[R0],#4

    MOV R7,#1
    SWI 0

.data
my_list:
    .word 10,11,-9,12,3,2