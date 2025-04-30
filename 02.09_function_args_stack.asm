%include "asm_io.inc"

;Allow parameters to be passed to function
;Setup using an ebp based stack
;Restore using epilogue

;***************PROLOG SETUP***************************
; Top of the stack --> old ebp  <-- current ebp pointing
;                      ret address
;                      para1 value
;                      para2 value

;summary - 1st para = mov eax, [ebp+8]
;        - 2nd para = mov eax, [ebp+0Ch]


;***************EXAMPLE***************************
; Read 1/2 Integers
; Print them using printf and hex

segment .data 
format db "0x%08X", 10
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
        call printHex
        add esp, 4 ;pushed one argument - restore
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

printHex:
        ;prolog
        push ebp
        mov ebp, esp

        mov eax, [ebp+8]
        push eax
        mov eax, format
        push eax
        call printf
        add esp, 8

        ;epilog
        mov ebp, esp
        pop ebp
        ret

