/*
; ARM Thumb IT conditional Execution ---------
; Thumb-2 does not have the bits for standalone conditional instructions
; IT Blocks - available for both thumb-2 and arm
;
; If Then - ALLOWS upto 4 instructions to be conditionally executed
; ARM thumb-2 mode
; 
; ITTE EQ
;
; ITxyz FLAG - xyz cna be T or E
; T - must match condition
; E - must be opposite of condition
; FLAG - one of the conditional suffix

*/

    .syntax unified
    .data
    .balign 4
    a: .asciz "10->0, != 10 -> 100\n Enter a number :"
    .text
    .global main
    .func main
    main:
        push {lr}
        ldr r0, =a 
        bl printf
        bl read_int
        bl bar 
        bl print_int
        pop {lr}

        .align 4
        bar:
            push {lr}
            cmp r0, #10
            ITTE EQ
            moveq r0, #1
            subeq r0, #1
            movne r0, #100
            pop {lr} 