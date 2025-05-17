/*
; ARM Floating Point ------------ VFP vs NEON
; Neon & VFP optional extensions to ARM architecture
; Mixed mode instructions -
; Some instructions are VFP only
; Some instructions are mixed
; Some instructions are Neon only
; Raspberyy PI uses mixed - VFPv4 ----
; vnmul - negate & multiply
; vmla, vabs
; vcvt - single to double precision.
*/

    .data
    .balign 4
    pi: .float 3.1415
    
    .text
    .global main
    .func main

    main:
        push {lr}

        ldr r0, =pi
        ldrd r2, [r0]
        vmov.fp32 s0, r2
        vcvt.f64.f32 d1,s2
        pop {lr}
        bx lr