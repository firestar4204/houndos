#include "../drivers/screen.h"
#include "../cpu/isr.h"

void kmain()
{
	clear_screen();
	kprint("Kernel entered.\n");
	isr_install();
	kprint("Interrupts loaded.\n");
	kprint("Welcome to HoundOS.\n");
}

