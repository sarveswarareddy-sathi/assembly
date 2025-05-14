    .data

    .text
    .global main
    .func main

    main:
        push {lr}
        bl read_int
        mov r1, #0 //sum
        mov r2, #1 //counter

    loop:
        cmp r0, r2
        blt done 
        add r1, r1, r2
        add r2, r2, #1
        b loop

    done:
        mov r0, r1
        bl print_int
        pop {lr}
        bx lr
