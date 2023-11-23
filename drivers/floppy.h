#ifndef FLOPPY_H
#define FLOPPY_H

enum floppy_registers
{
    FLOPPY_DOR = 2,
    FLOPPY_MSR = 4,
    FLOPPY_FIFO = 5,
    FLOPPY_CCR = 7,
};

enum floppy_commands
{
    READ_TRACK = 0x2,
    SPECIFY = 0x3,
    SENSE_DRIVE_STATUS = 0x4,
    WRITE_DATA = 0x5,
    READ_DATA = 0x6,
    RECALIBRATE = 0x7,
    SENSE_INTERRUPT = 0x8,
    WRITE_DELETED_DATA = 0x9,
    READ_ID = 0xA,
    READ_DELETED_DATA = 0xC,
    FORMAT_TRACK = 0xD,
    DUMPREG = 0xE,
    SEEK = 0xF,
    VERSION = 0x10,
    SCAN_EQUAL = 0x11,
    PERPENDICULAR_MODE = 0x12,
    CONFIGURE = 0x13,
    LOCK = 0x14,
    VERIFY = 0x16,
    SCAN_LOW_OR_EQUAL = 0x19,
    SCAN_HIGH_OR_EQUAL = 0x1D,
};

extern const char *drive_types[];

void floppy_detect_drives();

#endif
