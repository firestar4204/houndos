#include "../cpu/types.h"

void
lba_to_chs(u32 lba, u16 *cyl, u16 *head, u16 *sector)
{
    *cyl    = lba / (2 * 18);
    *head   = ((lba % (2 * 18)) / 18);
    *sector = ((lba % (2 * 18)) % 18 + 1);
}