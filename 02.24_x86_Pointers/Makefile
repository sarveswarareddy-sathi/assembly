all: 02.24_x86_Pointers
02.24_x86_Pointers: 02.24_x86_Pointers.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.24_x86_Pointers.o: 02.24_x86_Pointers.asm 
	nasm -f elf 02.24_x86_Pointers.asm -o 02.24_x86_Pointers.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.24_x86_Pointers *.o