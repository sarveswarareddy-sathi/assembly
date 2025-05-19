%include "asm_io.inc"
; Standard Types - Integers, Long, Shorts, Bytes ---> How they manifest in assembly?
; standard int library - uint16_t in stdlib.h
; Integers - DWORD size --> int & unsigned
; while assigning one variable to another --> movzx/movsx
; lowest/smallest byte is zero extended
;
; SHORT - keyword WORD
;
; Long - 4-8 byte data types - 32-bit on 32bit C, 64-bit one 64bit c
; long long - 64-bits on both guarantee
; Usually DONE by two DWORD copies
;
; 64-bit uses QWORD for 64-bit
;
; char --> BYTE char/int8/uint8
;char and int8_t treated same
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
