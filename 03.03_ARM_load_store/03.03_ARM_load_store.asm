
/*
;ARM LD & ST
; x86 - MOV can deal both memory and register
; ARM - ld/st deals memory - LDR load register & STR store register
; Types
; op{type}{cond} Rt, [Rn, {, #offset}]  - immediate offset
; op{type}{cond} Rt, [Rn, #offset]! - pre-indexed
; op{type}{cond} rt, [rn], #offset - post-indexed
; opD{cond} Rt, Rt2, [Rn {, #offset}] ; immediate offset, doubleworld
; opD{cond} Rt, Rt2, [Rn, #offset]!  ; pre-indexed, doubleword
; opD{cond} Rt, Rt2, [Rn], #offset ; post-indexed, doubleword

; Type means B - byte zero extended, SB - signed byte sign extend, H - half word zero extend, SH - signed half word sign extend
; Rt,rt2 for single and double word loads
; Rn - register for mem address
; Offset - For array

; Example Syntax --------------
; LDR R0, [R1, #offset] //Load word from memory at address R1 + 4 into R0
; LDR R0, [R1, #4]! ; Add 4 to R1, then load from the new address into R0 - pre indexed
; LDR R0, [R1], #4 ; Load from R1 into R0, then add 4 to R1 - post indexed
; LDRD R4, R5, [R6, #8] ; Load two registers (R4 and R5) from R6 + 8
*/
    .data
    .balign 4
    x : .word 35

    .text
    .global main
    .global print_int
    .func main

main:
    push {lr}
    ldr r1, =x /*  from mem to reg */
    ldr r1, [r1]
    mov r2, #7
    add r0, r1, r2
    bl print_int
    pop {lr}
    bx lr