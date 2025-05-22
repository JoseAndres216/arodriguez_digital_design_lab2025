.global _start
_start:

    LDR R0, =array		@ array
    MOV R1, #2			@ y
    MOV R2, #0			@ i

loop:
    CMP R2, #10
    BGE end

    MOV R3, R2
    LSL R3, R3, #2
    ADD R4, R0, R3
    LDR R5, [R4]

    CMP R5, R1
    BLT less_case

    MUL R6, R5, R1
    STR R6, [R4]
    B next

less_case:
    ADD R6, R5, R1
    STR R6, [R4]

next:
    ADD R2, R2, #1
    B loop

end:
    B end

.data
array:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10