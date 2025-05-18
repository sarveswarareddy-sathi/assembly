%include "asm_io.inc"
;write a program that reads in the time and prints out
struct myTime
        .tv_sec         resd 1
        .tvnsec         resd 1
endstruc

format db "The time is %ld seconds and %ld nanoseconds", 10, 0

segment .data 

segment .bss 

segment .text
        extern printf
        extern clock_gettime
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
        ; push few things to easy debug
	push 0xAABBCCDD
        push 0x0
        push 0x0
        ;set ebp
        mov ebp, esp
        ;load eax
        lea eax, [ebp]
        push eax
        push 0
        call clock_gettime

        mov eax, [ebp + myTime.tv_nsec]
        push eax
        mov eax, [ebp + myTime.tv_sec]
        push eax
        mov eax, format
        push eax
        call printf
        add esp, 0Ch
        add esp, 14h
        
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret