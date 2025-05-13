
/* *************Arm Architecture***************************

; ARM - Acorn RISC Machine --> ARM - Advanced RISC Machine --> Advanced RISC Machine

; ARM Design ----------
; 1) Uses less transistors
; 2) Creates less heat
; 3) Used on most mobile devices
; 4) 32 bit, 64 bit and Thumb Mode

; ARM Company ---------
; Creates designs for chips
; Sells the designs to manufactueres and fabrication plants
; GNU Assembly syntax
; GNU compiler and GCC to do linking

; ARM Returning from function -------
; ARM uses special register to return from functions quickly called LINK REGISTER (LR)
; Special instructions to jump and set the link - bl lr
; To return from the function - bx lr
; Exchange the link register with PC 

; ARM System Modes -----------
; System Modes - Fast Interrrupt mode for data transfer or channel process, Interrupt (IRQ) - general-purpose interrupt handling, Supervisor mode for OS , Abort mode - after data or instruction prefetch abort
; System mode - user mode for OS - can only enter from another privileged mode by modifying the mode bit of the CURRENT PROGRAM STATUS REGISTER CPSR
; Undefined mode
; system mode and user mode are unprivileged mode. 

; Register 16 - R0 is accumulator, R13 is stack pointer, R14 is Link Register, R15 is PC 
; CPSR - holds info about processo mode, flags like ove, carry, zero & -ve, Interrupt queue and fast interuppt queue.

; ARM Operating States -----------
; ARM - 32-bit & word aligned ARM instructions are executed in this state.
; THUMB - 16-bit halfword aligned thumb instructions are executed in this state. PC uses 1-bit to select b/w alternate halfwords
; Program Counter - register R15 holds PC; ARM - bit 0, 1 in r15 neglected and in THUMB - bit 0 neglected
; Whereas, x86 instructions is variable length like PUSH has one byte whereas MOV might have 7/8 bytes. In ARM, everything is same bit width 32 or 16 INSTRUCTIONS.

; ARM BANKED REGISTERS -----------
; Banked different physical registers and preserved across different OPERATING MODES. Example - FIQ mode has 7 banked register r8-r14 which are different from general pupose/user mode registers.
; In ARM state, many FIQ handlers do not have to save any registers.
; USER, IRQ, Supervisor, Abort, undefined - each have two banked registers mapped to r13 and r14, allowing private SP and LR for each mode.
; System mode SHARES the same registers as USER MODE


; BX - branch and exchange instruction set - branches to address contained in link register like a RETURNING from function
; BL - points to funciton
*/

.global main 
main:
        mov r0, #7
        bx lr