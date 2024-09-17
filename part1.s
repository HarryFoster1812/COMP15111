	lw x10, cnt
	lw x11, unit
	lw x12, alpha
	lw x13, val0
	
	beq x10, x13, end
	mv x5, x11
loop
	mul x5, x5, x12
	sw x5, res, x6
	sub x10, x10, x11
	beq x10, x13, end
	jal x0, loop
end
	li x17, 5
	ecall
	
val0	defw	0
unit	defw	1
alpha	defw	2
cnt	defw	10
res	defw	1
