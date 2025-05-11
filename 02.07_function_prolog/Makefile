all: 02.07_function_prolog
02.07_function_prolog: 02.07_function_prolog.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.07_function_prolog.o: 02.07_function_prolog.asm 
	nasm -f elf 02.07_function_prolog.asm -o 02.07_function_prolog.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.07_function_prolog *.o