.data
.balign 4
printHex: .asciz "%08X\n"
.balign 4
printd : .asciz "%d\n" 
.balign 4
scand : .asciz "%d" 
.balign 4
stringd: .asciz "%s"
.balign 4
stringRegs: .asciz "Dump #%08X\nR0=%08X  R1=%08X  R2=%08X  R3=%08X  R4=%08X  R5=%08X  R6=%08X\nR7=%08X  R8=%08X  R9=%08X R10=%08X R11=%08X R12=%08X\nSP=%08X LR=%08X\n"
.text
.global print_int
print_int:
	push {fp,lr}
	mov r1, r0
	ldr r0, =printd
	bl printf
	pop {fp,pc}
.global read_int
read_int:
	push {fp,lr}
	sub sp, sp, #4
	mov r1, sp
	ldr r0, =scand
	bl scanf
	ldr r0, [sp]
	add sp, sp, #4
	pop {fp,pc}
.global print_hex
print_hex:
	push {fp,lr}
	mov r1, r0
	ldr r0, =printHex
	bl printf
	pop {fp,pc}
.global print_string
print_string:
	push {r0,r1,fp,lr}
	mov r1, r0
	ldr r0, =stringd
	bl printf	
	pop {r0,r1,fp, pc}
/*^^^^^^^^^^^^^^^^DUMP_REGS^^^^^^^^^^^^^^^^*/
.global dump_regs
.macro dump_regs, val
	push {lr}
	push {r1}
	push {r1}
	mov r1, #\val
	str r1, [sp,#4]
	pop {r1}
	push {lr}	
	bl dump_regs_sub
	add sp, sp, #4
	pop {lr}
.endm
.global dump_regs_sub
dump_regs_sub:
	push {lr}
	push {r0-r12}
	ldr r3, [sp, #4] 	
	ldr r2, [sp, #0] 
	ldr r1, [sp, #60]
	/*lr*/	
	ldr r0, [sp, #64]
	push {r0}
	/*sp*/
	mov r0, sp
	add r0, #64
	push {r0}
	push {r12}
	push {r11}
	push {r10}
	push {r9}
	push {r8}
	push {r7}
	push {r6}
	push {r5}
	push {r4}
	ldr r0, [sp, #56]
	push {r0} /*r3*/
	ldr r0, [sp, #56]
	push {r0} /*r2*/
	ldr r0, =stringRegs
	bl printf
	add sp, #52
	pop {r0-r12}
	pop {lr}
	bx lr

	
	
