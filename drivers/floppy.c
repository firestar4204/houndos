#include "floppy.h"
#include "screen.h"
#include "../cpu/ports.h"
#include "../cpu/timer.h"

const char *drive_types[8] = {
    "none",
    "360kB 5.25\"",
    "1.2MB 5.25\"",
    "720kB 3.5\"",

    "1.44MB 3.5\"",
    "2.88MB 3.5\"",
    "unknown type",
    "unknown type"
};

void floppy_detect_drives()
{
    outb(0x70, 0x10);
    unsigned int drives = inb(0x71);

    printk("Floppy drive 0: ");
    printk(drive_types[drives >> 4]);
    printk("\n");
    printk("Floppy drive 1: ");
    printk(drive_types[drives & 0xf]);
    printk("\n");
}

void floppy_write_cmd(int base, char cmd)
{
    int i;
    for (i=0; i < 600; i++) {
        sleep(1);
        if (0x80 & inb(base+FLOPPY_MSR)) {
            return (void)(outb(base+FLOPPY_FIFO, cmd));
        }
    }
    printk("ERROR: floppy_write_cmd timeout\n");
}

unsigned char floppy_read_data(int base)
{
    int i;
    for (i = 0; i < 600; i++) {
        sleep(1);
        if(0x80 & inb(base+FLOPPY_MSR)) {
            return inb(base+floppy_FIFO);
        }
    }
    printk("ERROR: floppy_read_data timeout\n");
    return 0;
}
