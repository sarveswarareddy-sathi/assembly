/*
; ARM Conditional Execution ----------
; Allows an instruction to be executed only when a condition is met
; Flags set - comapre or test, --> add, mul,...
; IT Block
;
; In CPSR register
; adds - "s" means SET respective flags iike f result is zero then set flag 'Z'
; 
; condiitonal instructions - SAVES PIPELINE FLUSHING - demo with example
; have conditional that can be optionally added.
; specify which flags - using conditions, only instructions with correct flags execute
; Run faster than branches - branch takes 3 cycles to flush pipeline
; 
*/

    .syntax unified
    .data
    .balign 4
    a: .asciz "=10 -> 20, >10 -> 100, < 100  -> 0 \n Enter a number :"
    .text
    .global main
    .func main
    main:
        push {lr}
        ldr r0, =a 
        bl printf
        bl read_int
        bl bar 
        bl print_int
        pop {lr}

        .align 4
        bar:
            push {lr}
            cmp r0, #10
            moveeq r0, #20
            movlt r0, #0
            movgt r0, #100
            pop {pc} 
