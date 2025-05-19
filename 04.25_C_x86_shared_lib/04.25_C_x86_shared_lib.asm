%include "asm_io.inc"
; shared library & building it
; creating a shared library -----------------
; 1) create using flags to gcc : -fPIC, -shared
; 2) create main with :
;       -I --> header search path
;       -L --> directory to search for shared code
;       -la --> library to add (liba.so)
; -la means it assume -l means lib and 'a' lib name like liba.so
; 
; Makefile --------------------
; all:shared
; shared: liba.so
;       gcc -I. -L. main.c -la -o main.out
; lib.so: liba.o io.o
;       gcc -fPIC -shared -o liba.so io.o lib.o
; lib.o:shared.asm
;       nasm -f elf64 shared.asm -o liba.o
; io.o: io.asm
;       nasm -f elf64 io.asm -o io.o
; clean:
;       rm main.out liba.so *.o
; SHARED.ASM looks like below -------------- with export declarations for plt

;%include "io.inc"
;segment .data
;global hello2:data hello2.end-hello2
;hello2: dq 0FEEDBEEFBEEFFEEDh
;.end:
;segment .bss
;global hello:data 4 ;give the type and size
;hello: resd 1
;.end:
;segment .text
        ;global asm_main:function
;asm_main:
        ;enter 0,0
        ;mov rax, hello wrt ..sym
        ;mov DWORD [rax], 0BEEFFADEh
        ;MOV RAX, HELLO2 wrt ..sym
        ;mov BYTE [rax+6], 0h 
        ;mov eax , 0
        ;leave
        ;ret

; write code and method in assembly --> use c method calls to setup wrtieble and executable memory
; copy assembly bytes to memory
; use a function pointer to execute memory in buffer
