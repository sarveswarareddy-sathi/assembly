/*
; Create min/max using IT blocks
*/

    .data
    .balign 4
    a: .asciz "Enter 3 Numbers:"
    b: .asciz "The max is %d\n"

    .text
    .global main
    .func main
    main:
        push {lr}
        ldr r0, =a
        bl printf
        bl read_int
        mov r7, r0
        bl read_int
        mov r8, r0
        bl read_int
        mov r9, r0
        blx max
        mov r1, r0
        ldr r0, =b 
        bl printf

        pop {lr}
        bx lr

    .endfunc
    .align 2
    .thumb_func
    max:
        push {lr}
        cmp r7, r8 //compare r7 to r8
        ITE GT
        movgt r0, r7 //r7 is bigger
        movle r0, r8 //r8 is bigger
        cmp r0,r9
        IT LE 
        movle r0, r9 //r9 is bigger
        pop {pc}
