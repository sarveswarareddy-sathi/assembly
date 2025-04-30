%include "asm_io.inc"

; program that prints out the multiplication tables, numbers 1-10
; read the number of numbers to print

segment .data 
format db "The number is %d", 10
segment .bss 

segment .text
        global  asm_main
        extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	call read_int
        push eax
        call printnum
        pop eax
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

printnum:
        push ebp
        mov ebp, esp

        mov ebx, 1 ;count index
        mov eax, 1 ; multiple to print
        mov edx, 0 ; number to add

init:
        inc edx
        mov ecx, [ebp+8]
        mov eax, edx
        mov edx, eax
top:
        ; save registers
        push eax
        push ebx
        push ecx
        push edx


        push eax
        push format
        call printf
        add esp, 8

        ; restore registers
        pop edx
        pop ecx
        pop ebx
        pop eax

        add eax, edx
        loop top

        inc ebx
        cmp ebx, 10
        call print_nl

        jnz init



done:
        mov ebp, esp
        pop ebp
        ret
