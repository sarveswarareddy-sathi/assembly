all: 04.19_C_x86_integers
04.19_C_x86_integers: 04.19_C_x86_integers.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.19_C_x86_integers.o: 04.19_C_x86_integers.asm 
	nasm -f elf 04.19_C_x86_integers.asm -o 04.19_C_x86_integers.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.19_C_x86_integers *.o