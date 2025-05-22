.global _start
_start:

    MOV R5, #0
    LDR R6, =inputs
    MOV R7, #0

loop:
    CMP R7, #5
    BEQ fin

    LDR R1, [R6, R7, LSL #2]
    LDR R0, =0x1000
    STR R1, [R0]

    LDR R1, [R0]

    LDR R2, =0xE048
    CMP R1, R2
    BEQ up

    LDR R2, =0xE050
    CMP R1, R2
    BEQ down

    B siguiente

up:
    ADD R5, R5, #1
    B siguiente

down:
    SUB R5, R5, #1

siguiente:
    ADD R7, R7, #1
    B loop

fin:
    B fin

.data
inputs:
    .word 0xE048
    .word 0xE050
    .word 0xE048
    .word 0x1234
    .word 0xE048