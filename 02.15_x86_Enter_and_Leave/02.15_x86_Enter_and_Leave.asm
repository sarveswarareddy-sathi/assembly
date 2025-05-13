%include "asm_io.inc"
; Enter and Leave
; Useful Macros
	;***************MACROS FOR PROLOG***************************
		
; Doing the prolog and epilogue are tediuos - enter & leave instructions bridge that gap.
; Enter 0,0 --> enter a function and create a stack frame. the 1st operand specifies the size of the dynamic storage in the stack frame.
; the 2nd operand gives the lexical nesting level 0 to 31 of the procedure
; does following :
; push ebp
; mov ebp, esp

	;***************MACRO FOR EPILOG***************************
; Leave
		
	;***************OTHER USEFUL MACROS - CALC OFFSET***************************

; %stacksize flat; we are using enter and leave
; args to a funciton - %arg x:dword, y:word, z:byte --> calculates the offsets for you
; macros for local variables - 
; %push mycontent
; %assign %$localsize 0
; %local old_ax:word, old_dx:word
; enter %$localsize, 0
; ret
; %pop

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
