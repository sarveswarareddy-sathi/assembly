all: 04.21_C_x86_MMX
04.21_C_x86_MMX: 04.21_C_x86_MMX.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.21_C_x86_MMX.o: 04.21_C_x86_MMX.asm 
	nasm -f elf 04.21_C_x86_MMX.asm -o 04.21_C_x86_MMX.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.21_C_x86_MMX *.o