all: 03.18_ARM_SIMD_process 
 
03.18_ARM_SIMD_process: 03.18_ARM_SIMD_process.o lib.o
	gcc -o $@ $+
 
03.18_ARM_SIMD_process.o : 03.18_ARM_SIMD_process.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.18_ARM_SIMD_process *.o

