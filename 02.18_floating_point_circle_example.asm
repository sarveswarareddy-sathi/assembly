%include "asm_io.inc"

;Write a program to calculate the following
;Area of a circle & circumference of a circle

;***************Creating a C-Function calling Convention***************************
;call - Jumps to function addr by setting EIP and pushes return address of next instr onto the stack.
;RET - returns the addr of next instr and jumps by setting EIP.


;***************Creating a Custom Function calling Convention***************************
;EBP & ESP - setting & restore using prolog and epilog
;push ebp to stack
;update ebp to function esp
;perform funciton

;point esp to ebp which top of stack frees the funciton
;pop the ebp restore
;pop prev context register by ret

;***************PROLOG SETUP***************************
; Top of the stack --> old ebp  <-- current ebp pointing
;                      ret address
;                      para1 value
;                      para2 value
;summary - 1st para = mov eax, [ebp+8]
;        - 2nd para = mov eax, [ebp+0Ch]

;***************LINKING PRINTF WITH FORMAT***************************
; push value to stack
; followed by push fomat to stack

;***************READING THE INPUT VALUE FROM SYSTEM***************************
; call read_int
; push eax 

;***************LOCAL VARIABLES IN FUNCTION***************************
; local var allocation sub esp x*4
; local variables use EBP registers
; 1st local var = ebp - 4
; 2nd local var = ebp - 8
; sub esp, 0Ch
; mov DWORD [ebp-4], 0
; mov DWORD [ebp-8], 1
; mov DWORD [ebp-0Ch], 2
; add esp, 0CH

;***************LEAVE and ENTER for PROLOG/EPILOG***************************
; Doing the prolog and epilogue are tediuos - enter & leave instructions bridge that gap.
; Enter 0,0 --> enter a function and create a stack frame. the 1st operand specifies the size of the dynamic storage in the stack frame.
; enter   0,0               ; setup routine
; leave  

segment .data 
;declare variables & constants
pi dq 3.141592653
x dd 0
area dq 0
cir dq 0
two dd 2
;declare scanf 
sformat db "%d", 0
pformat db "The area as %f the circumference is %f", 10, 0
segment .bss 

segment .text
        global  asm_main
        extern scanf
        extern printf
asm_main:
        enter   0,0               ; setup routine - enters stack frame
        pusha                     ; save all general purpose registers
	;***************CODE STARTS HERE***************************
	push x 
        push sformat
        call scanf
        add esp, 8

        fld qword [pi]
        fimul dword [x]
        fimul dword [x]

        fstp qword [area]

        fldpi
        fimul dword [two]
        fimul dword [x]

        fstp qword [cir]

        ;print
        mov eax, [cir+4];load 4 bytes
        push eax
        mov eax, [cir];load another 4 bytes
        push eax

        ;print
        mov eax, [area+4];load 4 bytes
        push eax
        mov eax, [area];load another 4 bytes
        push eax

        push pformat
        call printf
        add esp, 14h

	;***************CODE ENDS HERE*****************************
        popa                      ; restore all general purpose registers
        mov     eax, 0            ; return back to C, set the return value 0 for caller typically for main
        leave                     
        ret
