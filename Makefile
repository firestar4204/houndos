C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c libc/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h libc/*.h)
OBJ = ${C_SOURCES:.c=.o cpu/interrupt.o}

CC = i686-elf-gcc
GDB = i386-elf-gdb
CFLAGS = -g

all: os.img

os.img: os.bin
	dd if=/dev/zero of=os.img bs=512 count=2880
	dd if=os.bin of=os.img conv=notrunc

os.bin: boot/houndboot/boot.bin kernel.bin
	cat $^ > os.bin

kernel.bin: boot/houndboot/kernel_entry.o ${OBJ}
	i686-elf-ld -o $@ -Ttext 1000 $^ --oformat binary

kernel.elf: boot/houndboot/kernel_entry.o ${OBJ}
	i686-elf-ld -o $@ -Ttext 1000 $^

run: os.img
	qemu-system-i386 -fda os.img

debug: os.img kernel.elf
	qemu-system-i386 -s -fda os.img &
	${GDB} -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

clean:
	rm -rf *.bin *.dis *.o os.bin os.img *.elf
	rm -rf kernel/*.o boot/*.bin drivers/*.o boot/*.o libc/*.o cpu/*.o

