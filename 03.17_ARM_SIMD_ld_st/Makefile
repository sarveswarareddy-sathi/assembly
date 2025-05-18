all: 03.17_ARM_SIMD_ld_st 
 
03.17_ARM_SIMD_ld_st: 03.17_ARM_SIMD_ld_st.o lib.o
	gcc -o $@ $+
 
03.17_ARM_SIMD_ld_st.o : 03.17_ARM_SIMD_ld_st.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.17_ARM_SIMD_ld_st *.o

