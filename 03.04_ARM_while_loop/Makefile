all: 03.04_ARM_while_loop 
 
03.04_ARM_while_loop: 03.04_ARM_while_loop.o lib.o
	gcc -o $@ $+
 
03.04_ARM_while_loop.o : 03.04_ARM_while_loop.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.04_ARM_while_loop *.o

