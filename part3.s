; COMP15111 lab 4 - Template file

print_char	equ	0		; Define names to aid readability
stop		equ	5
print_str	equ	2
print_no	equ	3

cLF		equ	10		; Line-feed character


		la	sp, stack_base	; set sp pointing to the end of our stack
		j	main

stack		defs	100		; this chunk of memory is for the stack
stack_base					; This label is 'just after' the stack space


wasborn		defb	"This person was born on ",0
was			defb	"This person was ",0
on			defb	" on ",0
is			defb	"This person is ",0
today		defb	" today!",0
willbe		defb	"This person will be ",0
		align

pDay		defw	13		;  pDay = 23    //or whatever is today's date
pMonth		defw	11		;  pMonth = 11  //or whatever is this month
pYear		defw  	2024	        ;  pYear = 2024 //or whatever is this year



sYear           defw	2000


; def printAgeHistory (bDay, bMonth, bYear)

; local variables 
;  s0 = year
;  s1 = age
;  t0
;  t1
;  t2
;  t3
;  t4

printAgeHistory	


;for part 1
; move the arguments according to the following
; t0 = bDay
; t2 = bYear
; t1 = bMonth

lw t0, 0[sp]
lw t1, 4[sp]
lw t2, 8[sp]

; since the caller doesnt need any of the registers and the nested callee only overwrites the return point only the ra needs to be stored 
addi sp, sp, -12
sw ra, 0[sp]
sw s1, 4[sp]
sw s0, 8[sp]

addi	s0, t2, 1
;   age = 1;
		li	s1, 1

; print("This person was born on " + str(bDay) + "/" + str(bMonth) + "/" + str(bYear))
		la	a0, wasborn
		li	a7, print_str
		ecall
		
		addi sp, sp, -12
		sw t0, 0[sp]
		sw t1, 4[sp]
		sw t2, 8[sp]
		
		jal printTheDate
		
		li	a0, cLF
		li	a7, print_char
		ecall

; this code does: while year < pYear //{
loop1		lw	a0, pYear
; for part 4, should be changed to:
; while year < pYear or
;				(year == pYear and bMonth < pMonth) or
;				(year == pYear and bMonth == pMonth and bDay < pDay):
		bgeu	s0, a0, end1		; Years are unsigned



;  print("This person was " + str(age) + " on " + str(bDay) + "/" + str(bMonth) + "/" + str(year))
		la	a0, was
		li	a7, print_str
		ecall
		mv	a0, s1
		li	a7, print_no
		ecall
		la	a0, on
		li	a7, print_str
		ecall
		
		addi sp, sp, -12
		sw t0, 0[sp]
		sw t1, 4[sp]
		sw s0, 8[sp]
		
		jal printTheDate
		
		li	a0, cLF
		li	a7, print_char
		ecall

		; year = year + 1
		addi	s0, s0, 1
        	addi	t3, s0, 1
        	addi	t4, t3, 1
		; age = age + 1
		addi	s1, s1, 1
		; //}
		j	loop1

end1
; this code does: if (bMonth == pMonth):
; for part 4, should be changed to:
; if (bMonth == pMonth and bDay == pDay):

		lw	a0, pMonth
		bne	t1, a0, else1

; print("This person is " + str(age) + " today!")
		la	a0, is
		li	a7, print_str
		ecall
		mv	a0, s1
		li	a7, print_no
		ecall
		la	a0, today
		li	a7, print_str
		ecall
		li	a0, cLF
		li	a7, print_char
		ecall

; else
		j	end2
else1
; print("This person will be " + str(age) + " on " + str(bDay) + "/" + str(bMonth) + "/" + str(year))
		la	a0, willbe
		li	a7, print_str
		ecall
		mv	a0, s1
		li	a7, print_no
		ecall
		la	a0, on
		li	a7, print_str
		ecall
		
		addi sp, sp, -12
		sw t0, 0[sp]
		sw t1, 4[sp]
		sw s0, 8[sp]
		
		jal printTheDate
		
		li	a0, cLF
		li	a7, print_char
		ecall

; }// end of printAgeHistory
end2	
		lw ra, 0[sp]
		lw s1, 4[sp]
		lw s0, 8[sp]
		addi sp, sp, 24
		jr	ra



printTheDate
; parameters that are passed are
; day
; month
; year

    lw	a0, 0[sp]
    li	a7, print_no
    ecall

    li	a0, '/'
    li	a7, print_char
    ecall

    lw	a0, 4[sp]
    li	a7, print_no
    ecall

    li	a0, '/'
    li	a7, print_char
    ecall

    lw	a0, 8[sp]
    li	a7, print_no
    ecall
    
    addi sp, sp, 12

    jr	ra



another		defb	"Another person",10,0
		align




; def main():
main
 
; printAgeHistory(pDay, pMonth, 2000)

; for part1
; pass the arguments to the method
; these are stored in pDay, pMonth and sYear
lw t0, pDay
lw t1, pMonth
lw t2, sYear

addi sp, sp,-12
sw t2, 8[sp]
sw t1, 4[sp]
sw t0, 0[sp]

		jal	printAgeHistory



; print("Another person");
		la	a0, another
		li	a7, print_str
		ecall

; printAgeHistory(23, 11, 2000)

; for part1
; passsubi the arguments to the method
; here use 23 as day, 11 as month and 2000 as year
li t0, 23
li t1, 11
lw t2, sYear

addi sp, sp,-12
sw t2, 8[sp]
sw t1, 4[sp]
sw t0, 0[sp]

		jal	printAgeHistory

		li	a7, stop
		ecall
; // end of main

