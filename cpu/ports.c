#include "ports.h"

u8
inb (u16 port)
{
	u8 result;
	__asm__("in %%dx, %%al" : "=a" (result) : "d" (port));
	return result;
}

void
outb (u16 port, u8 data)
{
	__asm__("out %%al, %%dx" : : "a" (data), "d" (port));
}

u16
inw (u16 port)
{
	u16 result;
	__asm__("in %%dx, %%ax" : "=a" (result) : "d" (port));
	return result;
}

void
outw (u16 port, u16 data)
{
	__asm("out %%ax, %%dx" : : "a" (data), "d" (port));
}

