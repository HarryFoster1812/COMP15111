	j main

op1_msg		defb	"Operand 1:  \0"
op2_msg		defb	"\nOperand 2:  \0"
new_line 	defb	"\n\0"
result_msg 	defb	"\nResult of Operation: \0"
operator_msg 	defb	"\nPlease select your operation (+,-, e): \0"

op1	defb 0
op2 	defb 0
res	defb 0

	align
main
	li x4, 9
	li x5, '-'
	li x6, 'e'
	li x7, '+'
mainloop
	la x10, op1_msg 
	li x17, 2
	ecall   ; print("Operand 1: ")
	
loop1
	li x17, 1
	ecall
	subi x1, x10, '0'	
	bgtu x1, x4, loop1
	
	li x17, 0
	ecall  ; print character in x10

	la x10, op2_msg
	li x17, 2
	ecall 		; print("Operand 2: ")

loop2
	li x17, 1
	ecall
	
	subi x2, x10, '0'	
	bgtu x2, x4, loop2
	
	li x17, 0
	ecall  ; print character in x10
	
	;print the operation msg
	la x10, operator_msg
	li x17, 2
	ecall  
	
	; get the operation 
	li x17, 1
	ecall
	
	mv x3, x10
	; print entered value
	li x17, 0
	ecall
	
	la x10, result_msg
	li x17, 2
	ecall  ; print("Result of operation: ")
	
	beq x3, x5, subnum	
	beq x3, x7, addnum
	bne x3, x6, mainloop

endprogram	
	li x17, 5
	ecall 		; stop!	
		
	
subnum
	sub x2, x0, x2 ; a-b = -b + a

addnum
	add x1, x1, x2
	
	mv x10, x1
	li x17, 3
	ecall ; print
	
	la x10, new_line
	li x17, 2
	ecall
	
	j mainloop
	

