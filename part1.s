	j main

op1_msg	defb	"Operand 1:  \0"
op2_msg	defb	"Operand 2:  \0"

op1	defb 0
op2 	defb 0
res	defb 0

	align
main
	la x10, op1_msg 
	li x17, 2
	ecall		; print("Operand 1: ")
	
	; while True:
	;   read character into x10
	;   break if x10 is a decimal digit
	;
	; store in op1 the number corresponding to the character x10
	; print character in x10
	; print '\n' (change line)
	
	la x10, op2_msg
	li x17, 2
	ecall 		; print("Operand 2: ")

	; while True:
	;   read character into x10
	;   break if x10 is a decimal digit
	;
	; store in op2 the number corresponding to the character x10
	; print character in x10
	; print '\n' (change line)
	
	; res = op1 + op2
	; print("Result of Addition: ")
	; print(res) on the same line as the previous print
	; print '\n' (change line)
    
	li x17, 5
	ecall 		; stop!
	
