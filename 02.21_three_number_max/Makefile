all: 02.21_three_number_max
02.21_three_number_max: 02.21_three_number_max.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.21_three_number_max.o: 02.21_three_number_max.asm 
	nasm -f elf 02.21_three_number_max.asm -o 02.21_three_number_max.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.21_three_number_max *.o