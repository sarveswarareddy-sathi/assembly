%include "asm_io.inc"
; Using Assembly and C together - USING nasm generated obj file and use in GCC c-language
; GCC & NASM ------------
; Nasm - generate an object file (.o)
; Nasm code - global functionName
; GCC - can take as input object files to create an output file
; Last file has the main method
; Function declaration - type functionName (type1 arg1,..., typen argn);
;
; Problem ---------
; write a string length function
; create the function in an assembly file - int lenstring(char *c, int max);
; Use the function in a C file
;
segment .data 

segment .bss 

segment .text
        global  lenstring
lenstring:
        enter   0,0               ; setup routine

        push edi
        push ecx

        mov eax, 0
        mov edi, [ebp + 8]
        mov ecx, [ebp + 0Ch]
        cld
        repne scansb

        mov ecx, [ebp + 8]
        mov eax, edi
        sub eax, ecx
        dec eax

        push edi
        push ecx
        leave                     
        ret
