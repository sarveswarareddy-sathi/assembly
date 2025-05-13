%include "asm_io.inc"

;Floating Point Comparison
;Additional Math Instructions
;fcomp instr uses compare floating numbers with using fp stack and memory locations.

;***************ASSEMBLY CODE***************************
;FCOM src : compares src and ST0 --> also sets some flags c0 to c3 on FPU. need to copy to CPU if using jmp instr
;FCOMP src : compares src and ST0 and pops stack
;FCOMPP : compares ST0 and ST1 and pop stack twice
;FICOM src : compares ST0 and src int
;FICOMP src : Compares ST0 and src (int) and then pop stack
;FIST : compares ST0 and 0
;FSTSW dest : compare ST0 and src (int) store coprocessor status to dest - mem or ax reg
;cpu <-> fpu
;SAHF : store AH to the FLAGS register
;LAHF : loads AH with flags register
;cpu <-> fpu - modern pentium II
;FCOMI src : compare ST0 and src (must be on FPU)
;FCOMIP src : Compare ST0 and SRC (must be on fpu) and pop stack
;FCHS - change sign of ST0
;FABS - square root of ST0
;FSQRT - Square root of ST0
;FSCALE - Exponent ST0 = ST0 x 2^(ST1)
;FCOS - cosine
;FSIN - sine
;FTAN - tan

;***************NOTE***************************
; Avoid comparing for equality

;***************PROGRAM***************************
;Comparison gone wrong
; int main() {
;       float x;
;       scanf("%f", &x);
;       if (x == 100.1)
;               printf("Good %lf\n", x);
;       else
;               printf("Bad %lf\n", x);

; read a number
; print the number
; comapre to specific val
; do if statements

segment .data 
sformat db "%lf",0
ok db "Result ok",10,0
bad db "Result bad",10,0
y db 1.234
x dq 99.9
pformat db "----%f----",10,0
segment .bss 

segment .text
        global  asm_main
        extern scanf
        extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push x 
        push sformat
        call scanf
        add esp, 8

        mov eax, [x+4]
        push eax
        mov eax, [x]
        push eax
        push pformat
        call printf
        add esp, 0ch

        fld qword [x];st1
        fld qword [y];dt0
        FCOMIP st0,st1;it pops one
        fstp;pop 2nd value too
        ja equal
        jmp notabove

equal:
        mov eax, ok
        call print_string
        jmp done
notabove:
        mov eax, bad
        call print_string
        jmp done
	;***************CODE ENDS HERE*****************************
 done:       popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
