all: 03.24_ARM_IT_block 
 
03.24_ARM_IT_block: 03.24_ARM_IT_block.o lib.o
	gcc -o $@ $+
 
03.24_ARM_IT_block.o : 03.24_ARM_IT_block.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.24_ARM_IT_block *.o

