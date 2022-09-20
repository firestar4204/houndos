#ifndef HOUNDOS_LBA_H
#define HOUNDOS_LBA_H

#include "../cpu/types.h"

void lba_to_chs(u32 lba, u16 *cyl, u16 *head, u16 *sector);

#endif