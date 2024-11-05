;by default it will branch to label 'part1'

	j part1 ; part1 or part2 or part3



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
   add a0, a0, a1
   lb t0, [a0]
   beq t0, zero, exitloop
   addi a1, a1, 1
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
    mv   a0, a1	
    li   a7, 2
    ecall







; don't remove these lines
    li   a0, 10      ; given - end of line
    li	 a7, 0       ; given - output
    ecall  	     ; given - output
    jr   ra          ; given

;************************** part 3 ***************************
stringCopy

;Your code goes here replacing the 3 lines given below
    mv   a0, a1	
    li   a7, 2
    ecall



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


