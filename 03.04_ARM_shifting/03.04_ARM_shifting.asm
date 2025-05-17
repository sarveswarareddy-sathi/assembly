
/*
; ARM Shifting ------------
; logical shift left - LSL Rd, Rm, Rs
; logical shift right - LSL Rd, Rm, Rs
; arithmetic shift left keep sign - ASR Rd, Rm, #sh
; rotate right - ROR Rd, Rm, Rs

; Example -----------
; Logical Shift Left - shift bits to the left, filling with zeros on the right
; LSL R1, R2, #2 ; R1 = R2 << 2 (mul r2 by 4)
; Logical Shift Right - shift bits to the right, filling with zeros on the left
; LSR R1, R2, #2 ; R1 = R2 >> 2 (div r2 by 4)

; Arithmetic shift right - shift bits to the right, repserving bits on left as sign bit
; ROR R1, R2, #4 ; Rotates  bits to the right, wrapping around the bits that fall off

; Barrel Shifter
; Allows shifting of bits in another operation
; ARM - shifts and rotations
; mul/div by power of two
; rotate bits
; floating point arithemtic units


; mov r1, r0, LSL #1
; mov r1, r0, LSL #2
; mov r1, r0, LSL r9
; add r1, r0, r2 LSL #3

 */
 //Loop and Shift - read a number from user and print powers of '2' from '0' to N-1
    .data
    .balign 4
    format: .asciz "2 ^ %d = %d\n"

    .text
    .global main
    .func main

    main:
        push {lr}
        bl read_int
        mov r9, #1
        mov r8, r0
        mov r7, #0

    top:
        cmp r7, r8
        bge done
        mov r0, r9, LSL r7

        mov r2, r0
        mov r1, r7
        ldr r0, =format
        bl printf
        add r7, r7, #1
        b top

        pop {lr}
        bx lr
