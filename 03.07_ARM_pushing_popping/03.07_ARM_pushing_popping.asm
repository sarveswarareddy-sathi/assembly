/*
; ARM Push and Pop ----------
; Allow us to save the registers onto the stack - Pointed to by sp
; Calling functions can destroy registers
; Save the ones you need
; What to SAVE? - depends on application binary interface
; r0-r3 for args, r4-r8 calle saved registers, r9 - may be saved, r10-r11 callee saved, r12-r15 - special
;
; push {r1, r3, r5, lr} - saves those, likewise pop restores. {r1-5, lr}
; 
; Converted code for 1 register --- -4 means stack moves top
; Push code - push {lr} --> str lr, [sp, #-4]!
; Pop code - pop {lr} --> ldr lr, [sp], #4
 */
.data
.balign 4
message: .asciz "Test this String output!\n"

.text
.global main
.global print_int
.func main
main:
    push {lr}
    ldr r0, =message
    bl print_string
    mov r0, #3      /* r0 ← 3 */
    mov r1, #4      /* r1 ← 4 */
    add r0, r0, r1  /* r0 ← r0 + r1 */
    bl print_int
    pop {lr}
    bx lr
