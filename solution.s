	lw x10, cnt
	lw x12, alpha
	
	beq x10, x0, end
	li x5, 1
loop
	mul x5, x5, x12
	sw x5, res, x6
	subi x10, x10, 1
	bne x10, x0, loop

	li x17, 5
	ecall
	
alpha	defw	2
cnt	defw	10
res	defw	1
