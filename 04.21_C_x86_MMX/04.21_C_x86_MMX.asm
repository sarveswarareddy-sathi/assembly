%include "asm_io.inc"
; SSE, MMX, AES-NI extension ---------
;
; intel added multimedia instructions. MMX defines 8 registers 0-7 ---- 1997
; 64-bits wide on 32 bit processors
; can be packed into 8,16, or 32 bits
; Used the x87 floating point registers
; cant mix mmx and floating point operations
;
; SSE - streaming simd extensions - 1999
; SSE1 - 128-BIT - xmm0-7 - can be packed into 4 integers int each
; amd added xmm8-xmm15 - duplicated by intel x64
; sse2 2001 - allowed mmx instuctions to use xmm registers
; all mmx code could be converetd to sse and xmm
;
; sse3,4 - 
; 2004 - allows xmm to operate on data with in same register - add all the numbers together with 1 operation
; 2006 - added string and text funcitons --> added math ops - sums on abs diff and dot prod
;
; mibrary support - 
;
; AES-NI ---------------
; SPECIFIC instructions that implement the AES encryption standard
;
; AES algorithm ------
; 1) key expansion --> key determines the number of rounds --> 128 bit 10 rounds, 192 bit 12 rounds, 256 bit 14 rounds
; 2) encryption --> add the round jey, substitute byte, shift rows and mix coloums repeat number of rounds-1
; do a final round - subdititute bytes, shift rows and add round key
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
