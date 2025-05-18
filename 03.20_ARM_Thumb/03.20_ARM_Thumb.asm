/*
; ARM THUMB mode ---------------
; thumb - 16 bits wide instruction vs ARM - 32 bits wide.
; thumb code is more compact
; thumb-2 is full instruction enconding
; 
; Changing AMR to Thumb Mode ----------
; BLX - branch with link and exhange
; BX - branch and exchange
; Exchange the instruction set - if the addr is odd then switch to thumb
; Thumb-2 mode is variable instructions - 2 or 4 byte enconding
;
; ARM Thumb instructions -------
; One syntax for both ARM and thumb-2 mode - unified assembler language - UAL
; Howwever, if multiple encodings for same instructions - .w for force wide 32 bit instruction
; .n for force a naarow 16 bit instruction
; low registers and high register characterization.
; 
; ARM example - thumb -----------------------------------
; Create a program to print a tree of *'s'
; Write a function to print a certain number of *'s'
;
;
*/

    .data
    .balign 4
    star: .asciz "*"
    under: .asciz "_"
    nl: .asciz "\n"

    .text
    .global main
    .func main

    main:
        push {lr}
        bl read_int
        blx tri
        pop {lr}
        bx lr

    .balign 2
    .thumb_func
    tri:
        push {r7, lr}
        mov r7, sp
        sub sp, #20
        mov r6, #0 //r6 goes up
        // r0 goes down to 0
    t1:
        cmp r0, #0
        beq d1
        push {r0}
        ldr r5, =star
        bl starfun

        ldr r0, =n1
        bl printf
        pop {r0}
        sub r0, #1
        add r6, #1
        b t1
    d1:
        mov sp, r7
        pop {r7,pc}

    .balign 2
    .thumb_func
    starfun:
        push {r7, lr}
        mov r7, sp
        sub sp, #20
        mov r4, r0
        mov r3, #0
    t2:
        cmp r3, r4
        beq d2
        mov r0, r5
        push {r3, r4}
        blx printf
        pop {r3, r4}
        add r3, #1
        b t2
    d2: 
        mov sp, r7
        pop {r7,lr}
        bx lr
