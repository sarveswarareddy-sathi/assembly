%include "asm_io.inc"
; Strings in C in assembly - how on the stack, in the data/bss section & on the heap
; C strings - C allws string to allocated several different ways
; Examples - within a function, static & using malloc
; printable characters use lowest 7 bits
; NuLL terminator
;
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
