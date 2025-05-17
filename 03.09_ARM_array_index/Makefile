all: 03.09_ARM_array_index 
 
03.09_ARM_array_index: 03.09_ARM_array_index.o lib.o
	gcc -o $@ $+
 
03.09_ARM_array_index.o : 03.09_ARM_array_index.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.09_ARM_array_index *.o

