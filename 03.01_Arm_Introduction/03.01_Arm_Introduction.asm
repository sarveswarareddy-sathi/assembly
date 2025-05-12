%include "asm_io.inc"
;***************Arm Architecture***************************
; ARM - Acorn RISC Machine --> ARM - Advanced RISC Machine --> Advanced RISC Machine
; ARM Design ----------
; 1) Uses less transistors
; 2) Creates less heat
; 3) Used on most mobile devices
; 4) 32 bit, 64 bit and Thumb Mode
; ARM Company ---------
; Creates designs for chips
; Sells the designs to manufactueres and fabrication plants

; GNU compiler and GCC to do linking

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