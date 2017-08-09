
all: irq.o irq.elf irq.bin

irq.o:
	arm-none-eabi-as -mcpu=arm926ej-s -g irq.s -o irq.o
# handlerc.s:
	# arm-none-eabi-gcc -S -o handlerc.s handler.c
handler.o:
	# arm-none-eabi-as -mcpu=arm926ej-s -g handlerc.s -o handler.o
	arm-none-eabi-gcc -c -mcpu=arm926ej-s -g handler.c -o handler.o
irq.elf: irq.o handler.o
	arm-none-eabi-ld -T irqld.ld -o irq.elf irq.o handler.o
irq.bin: irq.elf
	arm-none-eabi-objcopy -O binary irq.elf irq.bin
clean:
	rm *.o *.elf

.PHONY: all clean
