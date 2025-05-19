%include "asm_io.inc"
; Static linking and dynamic linking - GOT & PLT
;
; static linking - provides all code within a binary
; uses more space
; no reuse when mutiple programs using it
;
; dynamic linkng - shared at runtime. address space layout randomisation (aslr)
; provides different address for lib. making hacking/attack more difficult
; linux - .so, windows - .dll
;
; absolute code - loaded at a specific address. linker/loader would re-map code. new addresses
; vs
; PIC - code does not reference abolsute address
;
; Global Offset Table (GOT) 
; a tables of addresses that point to dynamic addresses - addresses of variables or functions
; initially contains address of dynamic linker
; updated by the dynamic linker to get actual offset
; uses updated address after first resolution
; mov rax, qword ptr [rip + var@GOTPCREL]  ; Load address of 'var' from GOT
; mov rbx, [rax]  ; Access the actual value stored at 'var'
;
; Prociedure linkage table plt - provides mech to resolve dynamic memory addresses
; allows code to be PIC and PIE
; linux dynamic loader - ld.so
; determines the path look for libraries - looks in usr/lib 
; absolute path via LD_LIBRARY_PATH

; GOT ACTS AS CACHE OF PLT

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
