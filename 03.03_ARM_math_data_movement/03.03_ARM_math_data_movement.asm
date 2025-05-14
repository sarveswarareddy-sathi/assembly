; ARM Math Operations ------------
; format of math cmd
; 1) op{s}{cond}{Rd}, Rn, OP2
; 2) op{cond}{Rd},Rn, #imm12     --- Thum-2 ADD and SUB only
; ADD, ADC - add with carry, SUB, RSB - reverse subtract, SBC & RSC

; ARM Moving Data
; Move data into registers prefix with #
; MOV r1, r0
; MOV r9, #32
; MVN r1, #2   -- move invert and copy operand to dest


    .data
    .balign 4

    .text
    .global main
    .global print_int
    .func main

main:
    push {lr}
    mov r0, #103
    mov r1, #44
    add r0, r0, r1
    bl print_int
    
    pop {lr}
    bx lr