        lw x10, cnt
    
        beq x10, x0, end
        li x5, 1
        sll x5, x5, x10
end
        sw x5, res, x6
        ecall
    
cnt     defw    10
res     defw    1
