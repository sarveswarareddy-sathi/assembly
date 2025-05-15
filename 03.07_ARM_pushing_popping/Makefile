all: 03.07_ARM_pushing_popping 
 
03.07_ARM_pushing_popping: 03.07_ARM_pushing_popping.o lib.o
	gcc -o $@ $+
 
03.07_ARM_pushing_popping.o : 03.07_ARM_pushing_popping.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.07_ARM_pushing_popping *.o

