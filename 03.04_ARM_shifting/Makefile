all: 03.04_ARM_shifting 
 
03.04_ARM_shifting: 03.04_ARM_shifting.o lib.o
	gcc -o $@ $+
 
03.04_ARM_shifting.o : 03.04_ARM_shifting.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.04_ARM_shifting *.o

