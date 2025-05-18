all: 04.07_C_x86_Struct_malloc
04.07_C_x86_Struct_malloc: 04.07_C_x86_Struct_malloc.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.07_C_x86_Struct_malloc.o: 04.07_C_x86_Struct_malloc.asm 
	nasm -f elf 04.07_C_x86_Struct_malloc.asm -o 04.07_C_x86_Struct_malloc.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.07_C_x86_Struct_malloc *.o