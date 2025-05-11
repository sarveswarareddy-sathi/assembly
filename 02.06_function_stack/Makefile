all: 02.06_function_stack
02.06_function_stack: 02.06_function_stack.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.06_function_stack.o: 02.06_function_stack.asm 
	nasm -f elf 02.06_function_stack.asm -o 02.06_function_stack.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.06_function_stack *.o