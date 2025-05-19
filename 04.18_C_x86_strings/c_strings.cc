#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static char y = 'a';
static char z[] = "Dr.chandu"; //puts these global in data section
static char buffer[100];  //in BSS
int main() {
    char a[100] = "hello";//give size - stored on stack
    char b[] = "Hello there class!";//allow size to be calculated - compiler calculates its size
    //string using malloc()
    char *y = (char *) malloc(100);//stored in heap
}
/*
HEAP ASSEMBLY EXAMPLE --------------------------------------------------------------
section .data
    size dd 100   ; Allocate 100 bytes

section .bss
    ptr resq 1    ; Reserve space for a pointer

section .text
    global _start
    extern malloc
    extern free

_start:
    ; Call malloc(size)
    mov edi, [size]   ; Pass size as argument
    call malloc       ; Call malloc
    mov [ptr], rax    ; Store allocated address in ptr

    ; Use allocated memory (example: store a value)
    mov rbx, [ptr]    ; Load allocated address
    mov byte [rbx], 42 ; Store value 42 at allocated memory

    ; Free allocated memory
    mov rdi, [ptr]    ; Pass allocated address to free
    call free

    ; Exit program
    mov eax, 60       ; syscall: exit
    xor edi, edi      ; status: 0
    syscall

    */
