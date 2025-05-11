all: 02.13_Local_Variables_Stack
02.13_Local_Variables_Stack: 02.13_Local_Variables_Stack.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.13_Local_Variables_Stack.o: 02.13_Local_Variables_Stack.asm 
	nasm -f elf 02.13_Local_Variables_Stack.asm -o 02.13_Local_Variables_Stack.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.13_Local_Variables_Stack *.o