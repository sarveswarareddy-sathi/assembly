all: 03.19_ARM_Encryption_SIMD 
 
03.19_ARM_Encryption_SIMD: 03.19_ARM_Encryption_SIMD.o lib.o
	gcc -o $@ $+
 
03.19_ARM_Encryption_SIMD.o : 03.19_ARM_Encryption_SIMD.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.19_ARM_Encryption_SIMD *.o

