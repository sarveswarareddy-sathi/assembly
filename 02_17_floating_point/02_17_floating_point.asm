%include "asm_io.inc"
;sign bit, exponent and mantissa - IEEE 754 Standard
;FLoating POint has special stack in floating-point unit
;Has ST0-7 fp stack registers - in x86 machine - each is 80-bits
;ST0 always points to the top of the stack - LIFO
;Floating Points OPerations
; FLD source - load to the top of stack
; FILD source - load interger as float to top of the stack
; FLD1 - load constant 1
; FLD0 - Load constant 0
; FST dest - store to destination - dest can be regular stack too - copy
; FSTP dest - store to the destination and pop off the stack
; FIST dest - store to an integer destination - copy
; FISTP dest - store to an int destination with pop off the stack
; FADD src - STO += SRC
; FADDP dest; FSUB src; FSUBP dest; FMUL src; FMULP dest; FDIV src; 

;***************LOad and Store Back***************************
segment .data 
a dq 1.99
b dq 0.0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
        ;***************CODE STARTS HERE***************************
        fld qword [a]
        fstp qword [b]
        ;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret