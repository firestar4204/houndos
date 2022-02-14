#ifndef MEM_H
#define MEM_H

#include "../cpu/types.h"

void memcpy(u8 *source, u8 *dest, int nbytes);
void memset(u8 *dest, u8 val, u32 len);

#endif

