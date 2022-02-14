#include "mem.h"

void memcpy(u8 *source, u8 *dest, int nbytes)
{
	for (int i = 0; i < nbytes; i++) {
		*(dest + i) = *(source + i);
	}
}

void memset(u8 *dest, u8 val, u32 len)
{
	u8 *temp = (u8 *)dest;
	for ( ; len != 0; len--)
		*temp++ = val;
}

