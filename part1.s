	j main

op1_msg	defb	"Operand 1:  \0"
op2_msg	defb	"Operand 2:  \0"
new_line defb	"\n\0"

op1	defb 0
op2 	defb 0
res	defb 0



	align
main
li x2, '0'
li x3, '9'
li x4, 1
	la x10, op1_msg 
	li x17, 2
	ecall		; print("Operand 1: ")
	
loop
	li x17, 1
	ecall
	mv x1, x10
	blt x1, x2, loop
	bgt x1, x3, loop
	subi x1, x1, 30
	beqz x4, storeop
	 
	sw x1, op1, x5

printten
	li x17, 0
	ecall

printnewline
	la x10, new_line
	li x17, 2
	ecall
	beqz x4, execute
	li x5, 1
	beq x4, x5, endprogram
	
	
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
	mv x4, x0
	jal loop
	; while True:
	;   read character into x10
	;   break if x10 is a decimal digit
	;
	
storeop
	sw x1, op2, x5	
	j printten
	; store in op2 the number corresponding to the character x10
	; print character in x10
	; print '\n' (change line)

execute

	lw x1, op1 ; get op1
	lw x2, op2; get op2
	add x1, x1, x2
	; store result
	
	result_msg	defb	"Result of Addition: \0"
	la x10, result_msg
	li x17, 2
	ecall
	li x4, 1
	; res = op1 + op2
	; print("Result of Addition: ")
	; print(res) on the same line as the previous print
	
	j printnewline
	; print '\n' (change line)

endprogram
	li x17, 5
	ecall 		; stop!
	
