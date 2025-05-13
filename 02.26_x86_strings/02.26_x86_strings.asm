%include "asm_io.inc"

;***************Length of String***************************
;strlen from gcc std lib

;***************Scan String Instructions***************************
; CLD - clear direction flag, increment index registers. index registers means ESI & EDI
; STD - set direction flag, decrement index registers
; ESI - source register
; EDI - destination register
; LODSB - al = [ESI], INCREMENT ESI
; LODSW - ax = [ESI], INCREMENT ESI by 2
; LODSD - eax = [ESI], INCREMET ESI by 4
; STOSB - [EDI] = al, INCREMENT EDI
; STOSW - [EDI] = ax, INCREMENT EDI by 2
; STOSD - [EDI] = eax, INCREMENT EDI by 4
; MOVSB - [EDI] = [ESI], copy byte, increment ESI & EDI by 1
; MOVSW - [EDI] = [ESI], copy word, increment ESI and EDI by 2
; MOVSD - [EDI] = [ESI], copy dword, increment ESI and EDI by 4
; SCASB - compare al with [EDI] byte. Set flags
; SCASW - compare ax with [EDI] word. Set flags
; SCASD - compare eax with [EDI] word. Set flags
; CMPSB - compare [ESI] and [EDI] byte. Set flags
; CMPSW - Compare [ESI] and [EDI] word. Set flags
; CMPSB - compare [ESI] and [ EDI] dword. Set flags
; Repeat cmds
; REP - Terminate when ecx is 0
; REPE/REPZ - Terminate when ecx is 0 or ZF = 0
; REPNE/REPNZ - Terminate when ecx is 0 or ZF = 1

;***************Problem 1 : FINDING String Length***************************
;***************Problem 2 : Read a String --> Convert all letters to uppercase --> print***************************
; Setting bit 6 to 0 will be upper case

segment .data 
sformat db "%s", 0
segment .bss 
a resb 100
b resb 100
segment .text
        global  asm_main
        extern scanf
        extern strlen
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push a
        push sformat
        call scanf
        add esp, 8

        ;Finding Length of the string
        push a 
        call strlen
        add esp, 4

        mov ecx, eax
        mov edi, b 
        mov esi, a 
upper:
        lodsb;copy into al
        and al, 0DFh
        stosb
        loop upper

        mov eax, b 
        call print_string
        call print_nl

	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret 