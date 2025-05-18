all: 04.13_C_x86_Inline
04.13_C_x86_Inline: 04.13_C_x86_Inline.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.13_C_x86_Inline.o: 04.13_C_x86_Inline.asm 
	nasm -f elf 04.13_C_x86_Inline.asm -o 04.13_C_x86_Inline.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.13_C_x86_Inline *.o