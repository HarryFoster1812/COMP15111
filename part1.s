	j main

op1_msg	defb	"Operand 1:  \0"
op2_msg	defb	"Operand 2:  \0"
new_line defb	"\n\0"
result_msg defb	"Result of Addition: \0"

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
	ecall   ; print("Operand 1: ")
	
loop
	li x17, 1
	ecall
	mv x1, x10
	
	blt x1, x2, loop
	bgt x1, x3, loop
	
	li x17, 0
	ecall  ; print character in x10
	sub x1, x1, x2
	beqz x4, storeop

	sb x1, op1, x6	; store in op1 the number corresponding to the character x10


printnewline
	la x10, new_line
	li x17, 2
	ecall
	beqz x4, execute

	la x10, op2_msg
	li x17, 2
	ecall 		; print("Operand 2: ")
	mv x4, x0
	j loop

	
storeop
	sb x1, op2, x5	; store in op2 the number corresponding to the character x10
	j printnewline  ; print '\n' (change line)

	
	
	
execute

	lb x1, op1 ; get op1
	lb x2, op2; get op2
	add x1, x1, x2  ; res = op1 + op2
	sb x1, res, x5; store result
	
	la x10, result_msg
	li x17, 2
	ecall  ; print("Result of Addition: ")
	
	li x4, 10
	bgt x1, x4, greaterthanten 
	addi x1, x1, '0'; print(res) on the same line as the previous print
	mv x10, x1
	li x17, 0
	j endprogram
	
greaterthanten
	subi x1, x1, 10;  since single digits will always be between 10 and 20
	li x10, '1'
	li x17, 0
	ecall
	addi x1, x1, '0'
	mv x10, x1
	
endprogram
	ecall ; print
	la x10, new_line
	li x17, 2
	ecall
	
	li x17, 5
	ecall 		; stop!
	
