%include "asm_io.inc"

;2) using pushad/popad - push all registers

segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, 1
        mov ebx, 2
        mov ecx, 4
        mov edx, 8
        mov esi, 16
        mov edi, 32
        mov ebp, 64
here:   pushad
        mov eax, 128
        mov ebx, 128
        mov ecx, 128
        mov edx, 128
        mov esi, 128
        mov edi, 128
        mov ebp, 128
        
        popad
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
