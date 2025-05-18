/*
; ARM SIMD Encryption Example ---------
; Read a string & key from user and encrypt the data.
*/

    .data
    .balign 4
    format: .asciz "%s"
    format2: .asciz "%x"
    format3: .asciz "%s"

    .bss
    array: .space 64

    .text
    .global main
    .global scanf
    .global printf

    .func main
    main:
        push {fp, lr}
        add fp, sp, #4
        sub sp, sp, #200

        sub r1, fp, #180
        ldr r0, =format
        bl scanf

        sub r0, fp, #180
        bl strlen
        ldr r9, r0

        mov r8, #0
top:    cmp r8, r9
        beq doneReading
        sub r1, fp, #100
        add r1, r8
        ldr r0, =format2
        bl scanf

        add r8, r8, #1
        b top

doneReading:
        sub r0, fp, #180
        vdlr.64 d0, [r0]
        sub r1, fp, #100
        vldr.64 d1, [r1]

        veor d2, d1, d0
        ldr r1, =array
        vstr d2,[r1]
        mov r3, #0
        str r3, [r1, #8]

        ldr r1, =array
        ldr r0, =format3
        bl printf

        pop {fp,lr}
        bx lr



