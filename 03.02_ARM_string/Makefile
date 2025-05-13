AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
QEMU = qemu-system-arm

CFLAGS = -mcpu=arm7tdmi
LDFLAGS = -T linker.ld

all: 03.02_ARM_string.bin

03.02_ARM_string.o: 03.02_ARM_string.asm
	$(AS) $(CFLAGS) -o $@ $<

lib.o: lib.asm
	$(AS) $(CFLAGS) -o $@ $<

03.02_ARM_string.elf: 03.02_ARM_string.o lib.o
	$(LD) $(LDFLAGS) -o $@ $^

03.02_ARM_string.bin: 03.02_ARM_string.elf
	$(OBJCOPY) -O binary $< $@

run: 03.02_ARM_string.bin
	$(QEMU) -M versatilepb -m 128M -nographic -kernel $<

clean:
	rm -vf *.o *.elf *.bin
