%include "asm_io.inc"
; Memory Allocation - malloc() in stdlib.h
; Dynamic memory allocation - malloc() - allocate mem, relloc() - makes size large & calloc() - clear by setting 0
; Give back to the heap - free()
;
; Memory layout diagram -------
; heap and stack use free memory
; When they collide - stack overflow and out of memory
; For Heap - no need to pre-declare the memory
;
; malloc() from C to assembly - push value of size needed and call malloc() - also make sure any even byte boundary calculation
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
