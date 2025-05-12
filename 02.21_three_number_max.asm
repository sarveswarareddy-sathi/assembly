%include "asm_io.inc"

;***************PROGRAM***************************
;Three Number max
;Calculate the max of three numbers
;Read 3 numbers in via scanf and an array
;Return in eax the max of three
;Use local variables

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

        ;do comparison
        cmp eax, ebx
        ja a1; eax is bigger take the jump
        mov max, ebx
        jmp parttwo

a1:
        mov max, eax
        jmp parttwo
parttwo:
        mov eax, max
        cmp eax, ecx
        ja b1
        mov max, ecx
        jmp done
b1:
        mov max, eax
        jmp done

done:
        mov eax, max
end:
        pop ebx;restore register
        pop ecx
        pop edx
        leave
        ret
