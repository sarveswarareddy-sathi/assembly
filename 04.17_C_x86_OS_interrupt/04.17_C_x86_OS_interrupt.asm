%include "asm_io.inc"
; write a system calls using int 80
; fork() and wait()
;use the fork system call to create 2 processes
; child sleeps for a time
; parent waits for child to exit
; each prints right before it finishes
;
; FORK --> creates 2 processes --> parent ID = child PIP, child ID =0
; WAITS -- wait process to finsih
segment .data 
c: db "child done", 10, 0
p: db "parent done", 10, 0
format: db "Child PID %d", 10, 0
segment .bss 

segment .text
        external printf
        external sleep
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
        mov eax, 2
        int 80h
        cmp eax, 0
        jnz parent
        jz child
        
child:
        push 3 ;for 3 sec sleep
        call sleep
        add esp, 4
        mov eax, c 
        call print_string
        jmp done
parent: 
        push eax ;pid
        mov eax, format
        push eax
        call printf
        add esp, 4
        pop ebx ;PID to wait
        sub esp, 8 ;stack space
        mov ecx, esp ;copy to esp
        mov edx, 0
        mov eax, 7
        int 80h
        add esp, 8

        mov eax, p 
        call print_string
        jmp done


done:
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
