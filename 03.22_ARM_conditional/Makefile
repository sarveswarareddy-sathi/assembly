all: 03.22_ARM_conditional 
 
03.22_ARM_conditional: 03.22_ARM_conditional.o lib.o
	gcc -o $@ $+
 
03.22_ARM_conditional.o : 03.22_ARM_conditional.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.22_ARM_conditional *.o

