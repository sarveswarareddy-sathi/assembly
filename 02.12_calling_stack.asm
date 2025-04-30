%include "asm_io.inc"

; Calling convention - assumption about how caller & caller work
; 32-bit calling conventions - cdecl call, std call, this call, 32 bit fast call
; 64-bit conventions - fast call
; caller - the function that calls another function and callee - funciton being called

;***************1. Cdecl (C Declaration) - most c/c++ programs***************************
; C calling convention
; The caller of the function cleans up the stack
; Faster than STD call
; Parameters are pushed onto the stack in right-to-left order
; pop ebp
; ret
; *******program example*******
; push para2
; push para1
; call function
; add esp, 8; caller cleans stack ( 2 params * 4 bytes each)

;***************2. STD Call i windows api***************************
;The function (callee) cleans up the stack
;Easier to use (except for var args)
;Registers EAX, ECX, and EDX are caller-saved, and the rest are callee-saved
;Default for C & C++ program on microsoft win 32 API
; ret 12 ;subtract 12 from stack
; arguments pushed right-to-left
; callee cleans up the stack.
;Slightly faster than cdecl
; *******program example*******
; push para2
; push para1
; call function
; No stack cleanup needed-the function does it

;***************3. This Call - Used for C++ object methods***************************
; Used in object oriented programming C++ for class member functions
; ECX points to the this variables. Used for object attributes
; If you see ECX being used as a pointer (wihtout initialization) - probably c++ code
; Passes the this pointer in ECX, keeping object-related data accessible
; Other parameters go on the stack
; *******program example*******
; mov ecx, obj_pointer ;'this' pointer
; push param1
; push param2
; call function
; ret 4


;***************4. fast call - speed***************************
; first two arguments are passed in registers - ECX, EDX reducing stack
; Remaining arguments are pushed on the stack
; *******program example*******
; mov ecx, param1
; mov edx, param2
; push param3
; call function

;***************5. 64-bit conventions***************************
; first four args go into registers (RCX, RDX, R8, R9)
; remaining args goes to stack
; stack is aligned to 16bytes for efficiency
; registers for para passing via rcx, rdx, r8,r9 for windows and rdi, rsi, rdx, rcx, r8,r9 for linux, floating args use xmm0-7 sse registers
; additional args pushed on stack
; return values go into rax for int and xmm0 for fp
; also maintains register spill space in stack 32B if incase needed to store these values temporarily.
; caller responsible for allocating shadow space
;sub rsp, 32     ; Allocate shadow space (needed before function call)
;mov rcx, param1 ; First param in RCX
;mov rdx, param2 ; Second param in RDX
;call my_function
;add rsp, 32     ; Restore stack after function call

; volatile and non-volatile registers - registers are categorized based on whether their values must be preserved across function calls
; volatile registers caller-saved - These can be overwritten by the callee. The caller must save them if needed after the function call.
; In Windows/Linux x64: General-purpose: RAX, RCX, RDX, R8, R9, R10, R11; Floating-point: XMM0–XMM5
; Non-volatile registers (callee-saved) - These must be preserved by the callee before modifying them. If the function uses them, it must save & restore them before returning.
; General-purpose: RBX, RBP, RDI, RSI, R12–R15; Floating-point: XMM6–XMM15
; non-volatile example
;push rbx    ; Preserve nonvolatile register
;push rbp    ; Preserve base pointer
;mov rbp, rsp
;sub rsp, 16 ; Allocate local space

; Function execution

;mov rsp, rbp  ; Restore stack
;pop rbp       ; Restore preserved register
;pop rbx       ; Restore preserved register
;ret

segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
