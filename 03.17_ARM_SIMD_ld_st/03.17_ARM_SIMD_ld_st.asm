/*
; ARM SIMD loads and stores -------------
; Multiple data is loaded. To load images, movies and encryption.
; In X86 - MME, SSE,SSE2; In ARM - SIMD
; In ARM - VLD & VST - loads and stores data - allows for different interleave patterns
; VLDR{cond}{.64} Dd, [Rn{, #offset}]
; VLDR{cond}{.64} Dd, label
; label is PC-relative expression. Must be aligned on a word boundary within +-1KB of current instruction.
; 
; ARM Interleave ---------
; vld1.8 {d1}, [r0] - no interleave
; vld2.8 {d0,d2,d4}, [r0] - one skip & interleave
; '8' means - to interave data with 8 byte different
;
; vstr.64 d0, [r1]
; vstr1.8 - to denote interleave
; 
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
