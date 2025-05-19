%include "asm_io.inc"
; Interrupts ---------
; Events that signal to the CPU that something occured - device ready and timer
; Types of interrupts - hardware, software & exception
;
; Kernel Interrupt Handling --------
; kernel handle interrupt - ISR/interrupt handler --> cpu looks up routine to execute disables interrupts, run the code and re-enable inteerupt
; priveleged x86 instructions - STI - set interupt flag which enable the interrupt
; CTI - clear interrupt flag - disables interrupts
;
; SYSTEM CALLS --------
; provides a way to interact with the OPERATING SYSTEM kernel
; request for a service to be performed. privileged instructions. privileged access to data structures.
; access shared resources - network, disk and usb drives
; example - file management & process management
;
; OS and INstructions ---------------
; interrupts are provided for both 32 bit and 64 bit architectures - linux uses int 80h to make system call
; syscall instruction added in 64-bit architectures - not supported on 32 bit x86 code
; int 80h linux parameters - eax,ebx,ecx,.....
; syscall linux parameters
; Int 80h numbers - Numbers defined by OS - /usr/include/asm/unistd_32.h 
; write function in 'c' - ssize_t write(int fd, const void *buf, size_t nbytes);
;
;
; WRITE INTERRUPT -----------------------------
segment .data 
hello: db "Hello", 10, 0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
        mov eax, 4 ;int system call number 4 == write interrupt
        mov ebx, 1 ;std out
        mov ecx, hello ;string pointer
        mov edx, 6 ;number of characters
        int 80h
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


; using syscall - compile : nasm -f elf64 syscall.asm -o syscall.o
; %include "asm_io.inc"
; segment .data
; hello: db "Hello", 10, 0
; segment .bss 
; segment .text
; global  asm_main
; asm_main:
;        enter   0,0               ; setup routine
;        mov qword rax, 1 ;syscall number 1 ==write
;        mov qword rdi, 1 ;  std out
;        mov qword rsi, hello ;string pointer
;        mov  qword rdx, 6
;        syscall
;        mov eax, 0
;        leave
;        ret
