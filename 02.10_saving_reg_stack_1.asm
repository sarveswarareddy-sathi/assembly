%include "asm_io.inc"

;When you modify context registers or flags in a function - You should save the registers
;Push modifed ones or Push all or Push flags.
;1) using function : push in any order but pop in reverse order and exit function
;2) using pushad/popad - push all registers
;3) save flags - save the flags with double word. pushfd/popfd

;***************EXAMPLE : Changing registers within the functions***************************
;save them and restore them


segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 7
        push 3
        dump_regs 1
        call mod
        add esp, 8
        dump_regs 2
        call print_int
        call print_nl
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

mod:
        push ebp
        mov ebp, esp

        push ecx
        push edx

        mov ecx, [ebp+8] ;3
        mov eax, [ebp+0Ch] ;7
        mov edx, 0
        div ecx
        mov eax, edx

        pop edx
        pop ecx

        ;epilog
        mov ebp, esp
        pop ebp
        ret
