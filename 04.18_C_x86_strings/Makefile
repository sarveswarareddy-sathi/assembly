all: 04.18_C_x86_strings
04.18_C_x86_strings: 04.18_C_x86_strings.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.18_C_x86_strings.o: 04.18_C_x86_strings.asm 
	nasm -f elf 04.18_C_x86_strings.asm -o 04.18_C_x86_strings.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.18_C_x86_strings *.o