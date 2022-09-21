#include "../drivers/screen.h"
#include "../cpu/isr.h"
#include "../libc/string.h"
#include "lba.h"
#include "../cpu/types.h"
#include "../drivers/floppy.h"
#include "../cpu/timer.h"

void kmain()
{
	clear_screen();
	printk("Kernel entered.\n");
	isr_install();
	asm volatile ("sti");
	printk("Interrupts loaded.\n");
	init_timer(10);
	printk("Timer started\n");
	printk("Welcome to HoundOS.\n");
}

