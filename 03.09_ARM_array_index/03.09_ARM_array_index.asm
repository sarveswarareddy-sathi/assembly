/*
;  ARM Array --------------
; Pre-Indexe - offset is add before access
; Post-index - offset is add after access

; ldr r0, [r2, #8]!      ---- pre-index
; ldr r0, [r2], #8       ---- post-index
; ldr r0, [r2, #8] - r0 = *(r2+8), r2 = r2   -- r2 not updated

*/
    .data
    .balign 4
    Array: .skip 13*4 //reserve/skip number of bytes

    .balign 4
    message : .asciz "Test this String output!\n"
    //defining array
    array:  .word 1
            .word 2
            .word 3
            .word 4
            .word 5
    .text
        .global main
        .func main

    main:
        push {lr}

        ldr r0, =array
        add r0, #4
        mov r2, #12
        str r2, [r0]

        pop {lr}
        bx lr