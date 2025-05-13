%include "asm_io.inc"
;BYTE: 1 byte (8 bits)
;WORD: 2 bytes (16 bits)
;DWORD: 4 bytes (32 bits)
;QWORD: 8 bytes (64 bits)
; variables in function - acceisble only in functions
; local variables use EBP registers
; 1st local var = ebp - 4
; 2nd local var = ebp - 8
; local var allocation sub esp x*4

;***************sample program***************************
; load a local variable and increment
; mov eax, [ebp-4]
; inc eax
; mov [ebp-4], eax

;***************sample program***************************
; sub esp, 0Ch
; mov DWORD [ebp-4], 0
; mov DWORD [ebp-8], 1
; mov DWORD [ebp-0Ch], 2
; add esp, 0CH

;***************Implement C program***************************
; #include <stdlib.h>
; #include <stdio.h>
; int foo(int n) {
;       int sum = 0;
;       for (int i = 0; i <=n; i++) {
;               sum += i;
;       }
;       return sum;
;}
;int main() {
;       int y;
;       scanf("%d", &y);
;       int x = foo(y);
;       printf("The value is %d", x);
;}


segment .data 
sformat db "%d", 0
pformat db "The sum is %d", 10, 0

segment .bss 

segment .text
        global  asm_main
        extern printf
        extern scanf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	;read value from user
        sub esp, 4; give space for scanf
        lea eax, [esp] ;load addr of var
        push eax
        push sformat
        call scanf
        add esp,8

        ;copy from stack to local variable and load foo
        mov eax, [esp]
        push eax
        call foo
        add esp, 4 ;correct the stack

        push eax
        push pformat
        call printf
        add esp, 8



        add esp, 4 ;deallocate locl space

	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

foo:
        ;prolog
        push ebp
        mov ebp, esp
        sub esp, 8 ;allocate two lc=ocal var

        ;save registers
        push ecx
        push edx

        mov DWORD [ebp-4], 0 ;sum
        mov dword [ebp-8], 0 ;i

check:
        ;check i < n
        mov ecx, [ebp+8] ;para 1
        mov edx, [ebp-8]; 
        cmp edx, ecx
        jg done

        mov eax, [ebp-4]; sum += i
        add eax, edx
        mov [ebp-4], eax

        mov edx, [ebp-8]
        inc edx
        mov [ebp-8], edx
        jmp check

done:
        mov eax, [ebp-4]; return sum


        ;restore registers
        pop edx
        pop ecx
        add esp, 8

        ;epilog
        mov esp, ebp
        pop ebp
        ret
