%include "asm_io.inc"
; 64-bit Assembly -----------------
; 64 bit reference that number of bits used for memory address
; Allows us to access 2^^64-1 bytes of ram - 16 exabytes
; 32 bit allows 2^^32-1 - 32 giga bytes
; registers are adjusted - larger sizes, more registers
; stack operations are adjusted
;
; multiple cpu's pre processor - shared cache
; operating system - selects cores for processes to run on
; cache, stack, registers have to be saved/restored
; R prefix - RAX, RBX, RCX,....
; R8-15, RIP - allows memory relative addressing
; 
; deprecated instructions - pushad, popad, asm_io.inc not works
;
; fastcall() - for newer operating systems - uses registers for the first 4-6 arguments
; Linux - first six integer or pointer arguments are passed in registers RDI, RSI, RDX, RCX, R8, R9. rest goes on the stack.
;
; printf is in stdio.h, some new versions of gcc using - use position independent code - PIC and create a position independent excutable PIE
;
; compile cmds - 
; nasm -f elf64 .asm -o .o
segment .data 
        text db "testing %016LX", 10, 0
        myQword dq 0xFEEDBEEFBEEFFEED
segment .bss 

segment .text
        extern printf
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov rsi, [myQword]
        mov rdi, text
        mov rax, 0
        call printf WRT ..plt ;position independent code - position linking table. WRT means w.r.t plt
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
