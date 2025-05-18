/*
; ARM SIMD process data -------------
; Vector Pairwise maximum, Vector Pairwise minimum.
; VPop{cond}.datatype Dd, Dn, Dm
; cond - max/min
; vmax.u8 d2, d1, d0 - compares & results 8-bit data
; vadd.i8 d2, d1, d0 - like a 8-bit wise
; vmla - multiply and add scalar - vmla.i16 d2, d1, d0[3]
; like d3[0] is scalar at array d0 and then multiply with scalar and vector add with d2
; and d2 is out.
; 
; vector bitwise exclusive OR - VEOR 
; veor d2, d1, d0  
; veor d3, d1, d2
;
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
