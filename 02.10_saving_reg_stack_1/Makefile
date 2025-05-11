all: 02.10_saving_reg_stack_1
02.10_saving_reg_stack_1: 02.10_saving_reg_stack_1.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.10_saving_reg_stack_1.o: 02.10_saving_reg_stack_1.asm 
	nasm -f elf 02.10_saving_reg_stack_1.asm -o 02.10_saving_reg_stack_1.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.10_saving_reg_stack_1 *.o