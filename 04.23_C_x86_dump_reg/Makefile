all: 04.23_C_x86_dump_reg
04.23_C_x86_dump_reg: 04.23_C_x86_dump_reg.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.23_C_x86_dump_reg.o: 04.23_C_x86_dump_reg.asm 
	nasm -f elf 04.23_C_x86_dump_reg.asm -o 04.23_C_x86_dump_reg.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.23_C_x86_dump_reg *.o