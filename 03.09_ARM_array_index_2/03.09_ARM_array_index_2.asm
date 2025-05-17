/*
; ARM Problem ----------
; Create 2 strings
; Copy data from 1 String to the other - Use writeback

*/

    .data
    .balign 4
    message1: .asciz "This is a test strinf!\n"
    message2: .asciz "Nothing to see here, just a bunch of characters"
    
    .text
    .global main
    .func main

    main:
        push {lr}

        ldr r1, =message1
        ldr r5, =message2

        mov r2, #0

    top:
        ldrb r0, [r1], #1
        strb r0, [r5], #1
        cmp r0, r2
        beq done
        b top

    done:
        ldr r0, =message2
        bl print_string

        pop {lr}
        bx lr