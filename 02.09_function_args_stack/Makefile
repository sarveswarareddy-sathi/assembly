all: 02.09_function_args_stack
02.09_function_args_stack: 02.09_function_args_stack.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.09_function_args_stack.o: 02.09_function_args_stack.asm 
	nasm -f elf 02.09_function_args_stack.asm -o 02.09_function_args_stack.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.09_function_args_stack *.o