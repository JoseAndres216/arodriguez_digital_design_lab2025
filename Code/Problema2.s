.global _start
_start:

    MOV R0, #1      @ r
    MOV R1, #8      @ x

loop:
    CMP R1, #1
    BLT end

    MUL R0, R0, R1
    SUB R1, R1, #1
    B loop

end:
    B end