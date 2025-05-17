/*
; ARM Vector Processor -----------
; Vector Floating Point (VFP) - it is co-processor for Floating Point Operations
; It is NEON architecture which uses different large registers

; scalar vs vector ------
; Floating point status and control registers (FPSCR)
; Vector Sizes : sx - 32 bits, dx - 64 bits & qx - 128 bits
; Scalar registers - s0-s7, d0-d3;
; Vector registers - s8-s31, d4-d31, q0-q15;
; wrap around if stride and length bits set - older versions of ARM
; 'q' is combinaiton of scalar
;
; Debugging - GDB vectors
; info float - shows fpscr & shows s0-s31
; info vector - d0-d31, q0-q15
; print $s0, print $d0, print $q0
;
; ARM NEON - SIMD ------------ ARM NEON PROCESSOR -------------
; like they extended VFP to more generic co-processor accelerator which includes integers and floating point
; Parallel procesing - cortex A-8
; 64 or 128-bit SIMD operations
; can be used for GPS or MP3 decoding
; 
; NEON instructions ------
; VABS, VADD, VCEQ - compare , VDUP - copy to all lanes, VLDn - load single n-element structure to one lane
; VMAX, VMIN, VMOV, VMUL
;
; VLDR{cond}.datatype Dd, =const
; VLDR{cond}.datatype Sd, =const
; dd or sd - extension register to be loaded like 64 or 32 bits
; Vop{cond}.datatype, Qd, #imm for MOV
;
; MOV operations
; vec move S register - "mov r9, #0xFF" --> vmov s3, r9
; vec move Q register - vmov.u32 q0, #0
; vec load - 
; ldr r0, =label
; ldrd r2, [r0] - fills r2 and r3
; vmov.i32 s4, r2 - saves r2 and r3 to s4
;
; VMOVL - vector move long - takes each element in a doubleword vector, sign or zero extends them to twice their original length
; and places the results in a quadword vector.
; VMOVN - vector move and narrow - copies least significant half of each element of a quad word vector into the 
; corresponding elements of a doubleword vector.
; VQMOVN - vector saturating move and narrow - 
; VQMOVUN - vector saturating move and narrow, singed operand with unsigned result.
;
; Neon Instructions Vector Move Long ------------
; VMOVL{cond}.datatype Qd, Dm
; V{Q}MOVN{cond}.datatype Dd, Qm
; VQMOVUN{cond}.datatype Dd, Qm
; Q - specifies saturation
; must be - s8, s16, s32 for VMOVL
; must be - u8, u16, u62 for VMOVL
; must be - i16, i32, i64 for VMOVN
; must be - s16, s32, s64 for VQMOVN 
;
; ARM vector NEON Problem ----------
; Read 2 integers and multiply using NEON --> print result
;
*/

    .data
    .balign 4
    input: .asciz "%d"
    output: .asciz "The value is %d\n"
    a: .int 123
    b: .int 9
    c: .int 3

    .text
        .global main
        .global printf
        .global scanf
        .func main

    main:
        push {fp, lr} //save frame pointer
        //prolog
        add fp, sp, #4 //set up new frame pointer
        sub sp, sp, #8 //allocate stack space

        sub r1, fp, #8 //read first number
        ldr r0, =input
        bl scanf

        ldr r0, [fp, #-8]
        ldr r1, =a 
        str r0, [r1]

        ldr r0, =a 
        ldrd r2, [r0]
        vmov.i32 so, r2 //set d0 with 0
        vldr.i32 s1, =0


        sub r1, fp, #8//read 2nd number
        ldr r0, =input
        bl scanf

        ldr r0, [fp, #-8]
        ldr r1, =b
        str r0, [r1]

        ldr r0, =b 
        ldrd r2, [r0]
        vmov.i32 s2, r2 //set d1 with b
        vldr.i32 s3, #0

        vmuli.i32 d2, d1, d0 //multiply

        ldr r0, =c 
        vstr d2, [r0]
        
        ldr r0, =c 
        ldr r1, [r0]
        ldr r0, =output
        bl printf

        //fix the stack
        sub sp, fp, #4

        pop {fp, lr}
        bx lr


