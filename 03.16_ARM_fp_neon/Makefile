all: 03.16_ARM_fp_neon 
 
03.16_ARM_fp_neon: 03.16_ARM_fp_neon.o lib.o
	gcc -o $@ $+
 
03.16_ARM_fp_neon.o : 03.16_ARM_fp_neon.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.16_ARM_fp_neon *.o

