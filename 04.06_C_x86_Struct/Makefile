all: 04.06_C_x86_Struct
04.06_C_x86_Struct: 04.06_C_x86_Struct.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.06_C_x86_Struct.o: 04.06_C_x86_Struct.asm 
	nasm -f elf 04.06_C_x86_Struct.asm -o 04.06_C_x86_Struct.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.06_C_x86_Struct *.o