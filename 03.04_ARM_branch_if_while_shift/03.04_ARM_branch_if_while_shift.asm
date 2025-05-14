/*
; ARM Branch Instruction
; Branch - b addr
; Branch with link register  - bl address - saves address of next to link register
; Branch and exchange LR & PC - bx lr

; Conditional Branches
; EQ when Z is 1. viceversa NE
; GE in 2's complement w.r.t V & N. and Z
; GT, LT, LE
; MI minus when N = 1
; PL when N is 0
; VS overflow set when V = 1
; VC oveflow clear when V = 0
; HI higher when C is enabled and Z = 0 
; lower LS when c=0 and z=1
; cs/hs clear set or higher or same when c is enabled c = 1
; cc/ lo carry clear and lower when c is disabled c = 0
 */

    .data
    .balign 4
    a : .asciz "Not Seven\n"
    b : .asciz "Seven !!\n"
    
    .text
    .global main
    .func main

    main:
        push {lr}
        bl read_int
        mov r1, #7
        cmp r1, r0
        beq seven 
        b notseven 

    seven:
        ldr r0, =b 
        bl print_string
        b end 

    notseven:
        ldr r0, =a
        bl print_string
        b end

    end:
        pop {lr}
        bx lr 

