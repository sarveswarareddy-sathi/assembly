%include "asm_io.inc"

;Points to a location in memory RAM
;Load using either : mov - copies address, lea - does calculation but does not load memory
;mov eax, text; load address
;mov eax, [text]; load data at text location
;mov eax, text; load the address
;add eax, 2; add 2 (offset)
; mov al, [eax]; load data from eax into al
; load effective address lea eax, [text]; load address which is equivalent to mov eax, [text]; same as above

;***************ARRAYS***************************
; A region of contiguous memory
; to use them, we need - case address, offset and size of the element. like mov eax, [array1 + eax]
; or imul eax, 4 --> mov eax, [array1 + eax]
; defining arrays ------>
; segment .data
; array1 dd 1,2,3,4,5
; array2 dw 1,2,3,3,5
; array3 db 1,2,3,3,5

; segment .bss
; array4 resd 5
; array5 resw 5
; array6 resb 5

;in c - either on stack or using maloc but in assemnly cant.

;terminolgy -
;byte 1
;word 2
;dword 4

;***************STRINGS***************************
; Are arrays of characters
; Each element is a byte
; values are defined in by the ascii
; terminated by 0 or NULL byte or hex 0x0
; strlen, puchar print one char

;***************PROBLEM***************************
; Read a list of numbers and add all numbers together --> print the sum


segment .data 
sformat db "%d %d %d", 0
pformat db "SUM = %d", 10, 0
%define one [ebp+8]
%define two [ebp+0ch]
%define three [ebp+10h]

segment .bss 
array resd 3

segment .text
        global  asm_main
        extern scanf
        extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, array
        push eax
        add eax, 4
        push eax
        add eax, 4
        push eax
        push sformat
        call scanf
        add esp, 10h
        
        mov eax, [array]
        push eax
        mov eax, [array+4]
        push eax
        mov eax, [array+8]
        push eax

        call maxsum
        add esp, 0ch
        
        push eax
        push pformat
        call printf
        add esp, 8


	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

maxsum:
        enter 0, 4
        push ebx;save register
        push ecx
        push edx

        mov eax, one
        mov ebx, two
        mov ecx, three

        add eax, ebx
        add eax, ecx

        pop ebx;restore register
        pop ecx
        pop edx
        leave
        ret
