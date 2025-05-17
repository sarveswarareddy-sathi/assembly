
/*
; ARM Multi ld/str -------
;
; op{addr_mode}{cond}Rn{!},reglist{^}
; OP - ldm & stm
; addr_mode - IA increment after, DA, IB, DB
; Rn - base register
; Reglist - List or register
; Cond - Conditional execution
;
;
; ldm r0, {r1-r2}
; stm r0, {r2,r5}
; ldmia r0! , {r1-r9}  ---//load increment after
;
*/

    .data
    .balign 4

    array:
        .word 0xFFAABBCC
        .word 0xBBCCDDEE
        .word 0xCAFECAFE
        .word 0xBEEEBEEE
        .word 0xBADECAFE

    .text
        .global main
        .func main
    
    main:
        push {ldr}
        mov r7, #0xFFAA
        mov r8, #0xAABB
        adr r0, array_adr

        ldr r0, [r0]

        ldm r0,{r1-r5} //load r0 array to r1 to r5
        eor r1, r1, r7
        and r2, r2, r8

        stm r0, {r1-r5}

        pop {ldr}
        bx ldr

    array_adr: .word array
