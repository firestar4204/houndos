#include "types.h"
#include "../drivers/screen.h"
#include "../libc/string.h"
#include "isr.h"
#include "ports.h"

u32 tick = 0;
volatile u32 countdown;

static void
timer_callback(registers_t regs)
{
    tick++;
    if (countdown > 0)
        countdown--;
}

void
init_timer(u32 freq)
{
    register_interrupt_handler(IRQ0, timer_callback);

    u32 divisor = 1193180 / freq;
    u8 low = (u8)(divisor & 0xFF);
    u8 high = (u8)((divisor >> 8) & 0xFF);
    outb(0x43, 0x36);
    outb(0x40, low);
    outb(0x40, high);
}

void 
sleep(u32 ms)
{
    countdown = ms;
    while (countdown > 0)
        asm volatile ("nop");
}