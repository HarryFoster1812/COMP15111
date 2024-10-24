	j main

op1_msg		defb	"Operand 1:  \0"
op2_msg		defb	"Operand 2:  \0"
new_line 	defb	"\n\0"
result_msg 	defb	"Result of Operation: \0"
operator_msg 	defb	"Please select your operation (+,-, e): \0"

op1	defb 0
op2 	defb 0
res	defb 0

	align
main
	li x3, 9
	li x4, '-'
	li x5, 'e'
	li x6, '+'
mainloop
	la x10, op1_msg 
	li x17, 2
	ecall   ; print("Operand 1: ")
	
loop1
	li x17, 1
	ecall
	subi x1, x10, '0'	
	bgtu x1, x3, loop1
	
	li x17, 0
	ecall  ; print character in x10


	la x10, new_line
	li x17, 2
	ecall

	la x10, op2_msg
	li x17, 2
	ecall 		; print("Operand 2: ")

loop2
	li x17, 1
	ecall
	
	subi x2, x10, '0'	
	bgtu x2, x3, loop2
	
	li x17, 0
	ecall  ; print character in x10
	
	la x10, new_line
	li x17, 2
	ecall
	
execute
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
	; print new line
	la x10, new_line
	li x17, 2
	ecall
	
	li x4, '-'
	beq x3, x4, subnum	
	
	li x4, 'e'
	beq x3, x5, endprogram
	
	li x4, '+'
	bne x3, x6, main
	
	la x10, result_msg
	li x17, 2
	ecall  ; print("Result of operation: ")
	
	
	;if add
	add x1, x1, x2  ; res = op1 + op2


printnum
	bgt x1, x3, greaterthanten 

	mv x10, x1
	li x17, 3
	j printsingle
	
greaterthanten
	subi x1, x1, 10;  since single digits will always be between 10 and 20
	li x10, '1'
	li x17, 0
	ecall
	mv x10, x1
	li x17, 3
	
printsingle
	ecall ; print
	
	la x10, new_line
	li x17, 2
	ecall
	
	j mainloop
	
endprogram	
	li x17, 5
	ecall 		; stop!	

subnum
	;if sub
	sub x1, x1, x2
	
	bgez x1, printnum
	neg x1, x1
	li x10, 45
	li x17, 0
	ecall
	j printnum
