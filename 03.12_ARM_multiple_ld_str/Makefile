all: 03.12_ARM_multiple_ld_str 
 
03.12_ARM_multiple_ld_str: 03.12_ARM_multiple_ld_str.o lib.o
	gcc -o $@ $+
 
03.12_ARM_multiple_ld_str.o : 03.12_ARM_multiple_ld_str.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.12_ARM_multiple_ld_str *.o

