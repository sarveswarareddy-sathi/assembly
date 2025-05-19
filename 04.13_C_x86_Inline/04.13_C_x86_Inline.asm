%include "asm_io.inc"
; GNU compiler collection GCC - uses AT&T syntax for x86/x64 code
; Inline variable situation --------
; variables can be passed in via symbolic names.
; %0, %1,.....%n
; If there are 2 output and 3 inputs . first outputs followed by inputs.
; constraints - ensure variables are the correct type. r --> register, m --> memory
; modifiers - =, +
; volatile - compiler wont change the asm insertions.
;
; Inline example -----
; capture the time using time stamp counter - rdtsc assembly command, edx:eax for result
; save to a qword
; print the result

segment .data 
a: dq 0
format: db "Time %llu", 10, 0

segment .bss 

segment .text
        extern printf
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	rdtsc
        mov ebx, a 
        mov [ebx], eax
        add ebx, 4
        mov [ebx], edx

        mov eax, [a+4]
        push eax
        mov eax, [a]
        push eax
        mov eax, format
        push eax
        call printf
        add esp, 12
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
