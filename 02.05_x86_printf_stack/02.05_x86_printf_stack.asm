%include "asm_io.inc"

;When entering function need to save the context to stack and pop back after return
;context registers eax, ecx, edx, esi and pop back in reverse order

;example - call c lang printf() - printf("X= %d, Y = %d c= %c\n", x,y,c);
;push args on in reverse order
;string format will be last

;***************ASSEMBLY CODE STARTS HERE***************************

segment .data 
format db "X = %d Y = %d c =%c", 10,0 ;10-newline, 0-terminate string
x dd 10
y dd 20

segment .bss 

segment .text
        global  asm_main
        extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	
        push 'a'
        mov eax, [y]
        push eax
        mov eax, [x]
        push eax
        mov eax, format
        push eax
        call printf
        add esp, 10h

	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
