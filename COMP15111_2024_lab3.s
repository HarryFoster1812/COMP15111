;by default it will branch to label 'part1'

	j part3 ; part1 or part2 or part3



buffer	defs 100,0


is		defb	" >> is \0"
        
strsize		defb	"The length of string >> \0 "
        

s1	defb "seven\0"
s2	defb "six\0"
s3	defb "five\0"
s4	defb "four\0"
s5	defb "three\0"
s6	defb "two\0"
s7	defb "one\0"
s8	defb "COMP15111 \0"
s9	defb "Fundamentals of Computer Architecture\0"

    align


printstring
    ; assumes a0 (x10) has the address of the msg	
    li   a7, 2		   
    ecall
    jr   ra		



;************************** part 1 **************************
stringLength	

;a1 must contain the length of the string. 
;by default a1 contains integer value zero, you need to write a 
;piece of assembly code to calculate the length of the string pointed by a0
;your code goes here  
    and  a1, a1, zero   ;len = 0
                        ;while string[len:]:
                        ;   len =len+ 1
movePointer
   lb t0, [a0]
   beq t0, zero, exitloop
   addi a1, a1, 1
   addi a0, a0, 1
   j movePointer
  
  
exitloop
;a1 must contain the length of the string
; don't remove these lines
    mv   a0, a1
    li   a7, 3	
    ecall
    li   a0, 10
    li	 a7, 0 
    ecall  		
    jr   ra	



;************************** part 2 **************************
printstringReverse

;Your code goes here replacing the 3 lines given below
mv t2, a0 ; end pointer
mv t1, a0 ; front pointer
subi t1, t1, 1 ; we want one before the front pointer
moveToEnd
    lb t0, [t2]
    beq t0, zero, end
    addi t2, t2, 1
    j moveToEnd
 
end

li   a7, 0; type of print

moveToFront
    lb t0, [t2]
    subi t2, t2, 1
    mv  a0, t0	; input
    ecall
    bne t2, t1, moveToFront



; don't remove these lines
    li   a0, 10      ; given - end of line
    li	 a7, 0       ; given - output
    ecall  	     ; given - output
    jr   ra          ; given

;************************** part 3 ***************************
stringCopy

;Your code goes here replacing the 3 lines given below
    
    ; a0 - string 1
    ; a1 - string 2
    ; a2 - buffer
    li t1, 0 
moveStringPointer
    lb t0, [a0] ; get char in the address
    beq t0, zero, moveSecondStringPointer
    sb t0, [a2]
    addi a0, a0, 1
    addi a2, a2, 1
    j moveStringPointer


moveSecondStringPointer
    lb t0, [a1] ; get char in the address
    beq t0, zero, endConcat
    sb t0, [a2]
    addi a1, a1, 1
    addi a2, a2, 1
    j moveSecondStringPointer

endConcat
    sb t0, [a2]
; don't remove this line
    jr   ra          ; given



;*********************** the various parts ********************
part1
    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s1
    ecall		   
    la   a0, is   
    ecall
    la   a0, s1
    jal stringLength
  

    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s2
    ecall		   
    la   a0, is   
    ecall
    la   a0, s2
    jal stringLength
  
    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s3
    ecall		   
    la   a0, is   
    ecall
    la   a0, s3
    jal stringLength
  
    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s4
    ecall		   
    la   a0, is   
    ecall
    la   a0, s4
    jal stringLength
  
    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s5
    ecall		   
    la   a0, is   
    ecall
    la   a0, s5
    jal stringLength

    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s6
    ecall		   
    la   a0, is   
    ecall
    la   a0, s6
    jal stringLength

    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s7
    ecall		   
    la   a0, is   
    ecall
    la   a0, s7
    jal stringLength

    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s8
    ecall		   
    la   a0, is   
    ecall
    la   a0, s8
    jal stringLength

    la   a0, strsize   
    li   a7, 2	
    ecall
    la   a0, s9
    ecall		   
    la   a0, is   
    ecall
    la   a0, s9
    jal  stringLength
    
    li   a7, 5
    ecall


part2	
    la   a0, s1
    jal  printstringReverse
    la   a0, s2
    jal  printstringReverse
    la   a0, s3
    jal  printstringReverse
    la   a0, s4
    jal  printstringReverse
    la   a0, s5
    jal  printstringReverse
    la   a0, s6
    jal  printstringReverse
    la   a0, s7
    jal  printstringReverse
    la   a0, s8
    jal  printstringReverse
    la   a0, s9
    jal  printstringReverse
    li   a7, 5
    ecall


part3	
    la   a0, s8
    la   a1, s9
    la   a2, buffer
    jal  stringCopy
    la   a0, buffer
    jal  printstring
  
    li   a7, 5
    ecall


