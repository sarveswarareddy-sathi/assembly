all: 03.04_ARM_branch_if_while_shift 
 
03.04_ARM_branch_if_while_shift: 03.04_ARM_branch_if_while_shift.o lib.o
	gcc -o $@ $+
 
03.04_ARM_branch_if_while_shift.o : 03.04_ARM_branch_if_while_shift.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.04_ARM_branch_if_while_shift *.o

