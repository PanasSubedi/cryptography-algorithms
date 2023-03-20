.global _start
_start:
	MOV R0,#0b100//size
	MOV R1,#0b1110//initial value and LFSR state
	MOV R2,#0b1001//XOR value
	
	MOV R3,#2//
	MOV R4,#1//
	
	MOV R5,#1//holds maximum possible non-repeating bit size
	MOV R6,#0//power counter
	
	MOV R10,#0//for comparison
	
loop_until_max_size:
	MUL R5,R5,R3
	ADD R6,R6,R4
	
	CMP R6,R0
BLT loop_until_max_size
	SUB R5,R5,#0b1
	
	//cleanup and new values
	MOV R6,#0//counter
	MOV R3,#0//single bit output
	MOV R4,#0//whole keystream output
	MOV R7,#0//new left value bits
	MOV R8,#0//new left value
	MOV R9,#0//placeholder
	
loop_until_max_possible_bit_stream_generated:
	AND R3,R1,#1//current key in the keystream
	LSL R4,#1
	EOR R4,R4,R3//currently generated keystream
	
	
	AND R7,R1,R2
	MOV R8,#0
	loop_until_r7_is_0:
		AND R9,R7,#1
		EOR R8,R8,R9
		LSR R7,#1
		CMP R7,R10
	BNE loop_until_r7_is_0
	
	//cleanup
	MOV R7,#0
	MOV R9,#0
	
	
	SUB R9,R0,#1
	LSL R8,R9
	
	LSR R1,#1
	EOR R1,R1,R8
	
	ADD R6,R6,#1
	CMP R6,R5
BLT loop_until_max_possible_bit_stream_generated
	
    MOV R0,#0
    MOV R1,#0
    MOV R2,#0
    MOV R3,#0
    MOV R4,#0
    MOV R5,#0
    MOV R6,#0
    MOV R8,#0
    MOV R9,#0
    MOV R10,#0
    
	MOV R7,#1
	SWI 0