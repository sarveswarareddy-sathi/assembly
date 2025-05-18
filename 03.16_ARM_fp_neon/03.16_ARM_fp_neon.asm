/*
; ARM Neon Floating-Point -------------
; Read the readius from user and calculate the area using neon instructions - print too
;

*/
    .data
    .balign 4
    format: .asciz "Enter the radius:"
    formatA: .asciz "%f"
    formatB: .asciz "The area is %f\n"
    pi: .double 3.14159265359

    .text
    .global main
    .global printf
    .global scanf
    .func main

    main:
        push {fp, lr}

        //prolog 
        ldr fp, sp, #4
        sub sp, sp, #24

        ldr r0, #format
        bl printf

        sub r1, fp, #8
        ldr r0, =formatA
        bl scanf

        //copy result
        vldr s15, [fp, #-8]
        vcvt.f64.f32 d7, s15

        vmul.f64 d7, d7, d7

        ldr r0, =pi
        ldrd r2, [r0] //r2 and r3
        vmov.f64 d8, r2,r3

        vmul.f64 d7, d7, d8

        vmov r2, r3, d7
        ldr r0, =formatB
        bl printf

        pop {fp,lr}
        bx lr

