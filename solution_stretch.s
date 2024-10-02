        lw x10, cnt
    
        beq x10, x0, end
        li x5, 1
        li x11, 2

loop
        mul x5, x5, x11
        subi x10, x10, 1
        bne x10, x0, loop

end
        sw x5, res, x6
        ecall
    
cnt     defw    10
res     defw    1
