all: 03.09_ARM_array_index_2 
 
03.09_ARM_array_index_2: 03.09_ARM_array_index_2.o lib.o
	gcc -o $@ $+
 
03.09_ARM_array_index_2.o : 03.09_ARM_array_index_2.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.09_ARM_array_index_2 *.o

