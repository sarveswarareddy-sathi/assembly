/*
; Read N from user and print power's of two ------------------
 */

    .data
    .balign 4
    format: .asciz "2 ^ %d = %d\n"

    .text
    .global main
    .func main

    main:
        push {lr}
        bl read_int 
        mov r1, #1 //const to shift
        mov r2, #0 //counter is r2

    top:
        cmp r2, r0
        bge done
        mov r3, r1, LSL r2 //shift by r2

        bl print
        add r2, r2, #1
        b top

    done:
        pop {lr}
        bx lr

    print:
        push {r0-r1, lr}
        mov r2, r3
        mov r1, r2
        ldr r0, =format
        bl printf
        pop {r0-r3, lr}
        bx lr

