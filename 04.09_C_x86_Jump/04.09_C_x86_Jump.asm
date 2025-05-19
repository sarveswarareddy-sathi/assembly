%include "asm_io.inc"
; Switch states in C to x86 Jump Tables 
; Switch statement in C allows a programmer to easily choose a block of code to execite
; Inputs are discrete cases - char, int but not float/doubles
; Provides a default case
; compiler determines when to build Jump table based on # of cases, how close are the cases together and are there breaks after each case.
; Jump Table - an array of pointers to prgram code and selection of a pointer is calculated using math
; COMPARE AND JUMP TO THAT BRANCH - ASSEMBLY OF SWITCH 
; MATH - if consective - it will have small mathemtical operation
;
; Define data in the code section
; Write a program to calculate a schedule based on day of month
; Day % 3 = 0 --> person A
; Day % 3 = 1 --> person B
; Day % 3 = 2 --> person C
segment .data 
text: db "Enter the day of the month:", 0
p1: db "person A", 10, 0
p2: db "person B", 10, 0
p3: db "person C", 10, 0
other: db "None", 10, 0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, text
        call print_string
        call read_int

        mov ecx, 3
        mov edx, 0
        div ecx ;eax/ecx

        mov ecx, edx ;copy edx to ecx - modulous
        cmp ecx, 3
        jge defaulter

        ;offset - table
        mov ebx, table
        mov eax, 4
        mul ecx
        add ebx, eax
        jmp [ebx]

        table:;define label names
                dd x 
                dd y 
                dd z
        x: 
                mov eax, p1
                jmp done
        y:
                mov eax, p2
                jmp done
        z:
                mov eax, p3
                jmp done

        defaulter:
                mov eax, other
        done:
                call print_string
                call print_nl
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
