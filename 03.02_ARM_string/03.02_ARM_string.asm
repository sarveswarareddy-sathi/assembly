    .data
    .balign 4                  @ 4-byte alignment
message:
    .asciz "Test this String output!\n"

    .text
    .global main
    .global print_int
    .global print_string
    .type main, %function

main:
    stmfd sp!, {lr}            @ push lr

    ldr r0, =message
    bl print_string

    mov r0, #3
    mov r1, #4
    add r0, r0, r1
    bl print_int

    ldmfd sp!, {lr}            @ pop lr
    bx lr
