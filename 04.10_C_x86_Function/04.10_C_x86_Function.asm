%include "asm_io.inc"
; C function pointers ------------
; Points to a function or subroutine
; Allows functionality to be changed at runtime
; Uses - closures, interruot handlers and virtual functions in c++/oop
; Syntax - includes arg types and return type
; C function declaration - char myFun(int x, double b, float c)
; C function pointer - char(*funcpOinter) (int, double, float)
; like different function can be assigned
;
; Functional Pointer in x86 assembly ------------
; if the number is 1 --> then multiply second input by 2
; else multiply second input by 8
;
segment .data 
s1: db "This is function Foo %d", 10, 0
s2: db "This is function Bar %d", 10, 0
segment .bss 

segment .text
        extern printf
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	call read_int
        cmp eax, 1
        jz x 
        jnz y

x:
        mov ebx, foo
        jmp done

y:
        mov ebx, bar
        jmp done
done:
        call read_int
        push eax
        call ebx
        add esp, 4
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

foo:
        push ebp
        mov ebp, esp

        mov eax, [ebp + 8]
        shl eax, 1 ;mul by 2
        push eax
        mov eax, s1
        push eax
        call printf

        mov esp, ebp
        pop ebp
        ret

bar:
        push ebp
        mov ebp, esp

        mov eax, [ebp + 8]
        shl eax, 3 ;mul by 8
        push eax
        mov eax, s2
        push eax
        call printf

        mov esp, ebp
        pop ebp
        ret
