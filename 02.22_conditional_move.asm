%include "asm_io.inc"
;Pipelines - allow multiple instruction to be in the stages of processing. usullaly 20 to 30 stages in modern processors
;pipeline vs branching - causes processor to flish the pipeline
;Order Execution - speculate about which branch is taken and change the order of execution
;       speculative execution - eager and predictive variants
;       eager - do both branches where as predict branch most often taken using branch predictor
; in-order & out-of-order execuiotn
;Conditional Execution - ability to execute instr based on flags. compare and then move data. reduces branching.
;       CONDITIONAL MOVE - checks state of the flags. moves only if the condition flag is set
;       CMOVcc dest, src
;       CMOVA dest, src : move if above
;       CMOVGE dest, src : move if greater than or equal to
;       CMOVL dest, src : move if less than
;       cmp, cmova, cmovbe, cmp, cmovbe

;*************** PROGRAM ***************************
;Convert our 3 number max program to use conditional execution


segment .data 
%define one [ebp+8]
%define two [ebp+0ch]
%define three [ebp+10h]
%define max [ebp-4]
sformat db "%d %d %d", 0
max_string db "MAX =",10

segment .bss 
arr resd 3; reserve three dwords
segment .text
        global  asm_main
        extern scanf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, arr;get base addr
        push eax
        add eax, 4;add 4 to the addr
        push eax
        add eax, 4;add 8 to the addr
        push eax
        push sformat
        call scanf
        add esp, 10h

        mov eax, max_string
        call print_string

        mov eax, [arr]
        push eax
        mov eax, [arr+4]
        push eax
        mov eax, [arr+8]
        push eax
        call maxthree
        add esp, 0ch
        
        call print_int
        call print_nl


	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

maxthree:
        enter 0, 4
        push ebx;save register
        push ecx
        push edx

        mov eax, one
        mov ebx, two
        mov ecx, three

        ;do comparison*****************************
        cmp eax, ebx
        cmova edx, eax; eax is bigger
        cmovbe edx, ebx
        cmp edx, ecx
        cmovbe edx, ecx

        mov eax, edx

        pop ebx;restore register
        pop ecx
        pop edx
        leave
        ret
