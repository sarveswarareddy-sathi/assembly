/*
; ARM Loading Registers -------- relative to program counters
; Load & Store - Can only load a byte and then do some shifting of it - for 32-bit case need multiple loads.
; Limits the values that can be loaded
; ARMv6T2 and later, MOV can load any 16-bit number, giving a range of 0x0-0xFFFF
; Use a offset from the PC to store memory address and constants.

; main:
;   ldr r0, =0x11223344
;   bx lr
;
; ldr r0, [pc, #-0] ; pc is pointing address with offset
; bx lr
; .word 0x11223344
;
; IDA PRO - professional disassembler
; Debugging Tools - gef, gdb, STrace - SYSTEM CALLS AND SIGNALS
; GEF - virtual memory map - vmmap, libraries loaded - xfiles, process memory map - info proc map
; diass main
 */

    .data
    .balign 4
    a: .hword 1// 16 bits
    b: .hword 2
    c: .word 4//32 bits
    d: .word 8

    .text
    .global main
    .func main

    main:
        ldr r0, =a ; disaasembly ldr r0, [pc, #36]
        mov r1, #7
        ldr r0, =a 
        mov r1, #8
        ldr r0, =b 
        mov r1, #9
        ldr r0, =c 
        mov r1, #10
        ldr r0,=d 
        mov r1, #11
        bx lr
    ; disaasembly 109c: .word 0x0002102c

