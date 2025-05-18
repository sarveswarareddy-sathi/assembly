all: 04.25_C_x86_shared_lib
04.25_C_x86_shared_lib: 04.25_C_x86_shared_lib.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.25_C_x86_shared_lib.o: 04.25_C_x86_shared_lib.asm 
	nasm -f elf 04.25_C_x86_shared_lib.asm -o 04.25_C_x86_shared_lib.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.25_C_x86_shared_lib *.o