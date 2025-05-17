all: 03.13_ARM_vfp_neon 
 
03.13_ARM_vfp_neon: 03.13_ARM_vfp_neon.o lib.o
	gcc -o $@ $+
 
03.13_ARM_vfp_neon.o : 03.13_ARM_vfp_neon.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.13_ARM_vfp_neon *.o

