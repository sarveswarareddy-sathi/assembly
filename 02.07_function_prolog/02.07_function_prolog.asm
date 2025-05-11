%include "asm_io.inc"

; setup entering function - saves EBP register
; ebp - const point of reference

; ESP traverse over stack
; EBP is contanst reference with offset can help traverse
;example - setup prolog and epilog

segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 0BEEFBEEFh
        push 0cafecafeh
        call function
        add esp, 8
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

function:
        ;prolog
        push ebp
        mov ebp,esp
        mov eax,0
        ;epilog - restore esp
        mov esp, ebp
        pop ebp
        ret ;jumps to the address of the next instruction
