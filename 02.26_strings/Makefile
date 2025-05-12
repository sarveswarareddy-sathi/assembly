all: 02.26_strings
02.26_strings: 02.26_strings.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.26_strings.o: 02.26_strings.asm 
	nasm -f elf 02.26_strings.asm -o 02.26_strings.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.26_strings *.o