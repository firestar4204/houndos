[org 0x7c00] ; Set the alignment at 0x7c00 in memory
KERNEL_OFFSET equ 0x1000
;BIOS PARAMETER BLOCK
jmp short boot
nop

OEMIdentifier db 'MSWIN4.1'
BytesPerSector dw 0x200
SectorsPerCluster dw 0x80
ReservedSectors dw 0x10
FATCopies db 0x02
RootDirEntries dw 0x0800
NumSectors dw 0x0B30
MediaType db 0xF0
SectorsPerFAT dw 
SectorsPerTrack dw 0x12
NumberOfHeads dw 0x02
HiddenSectors dd 0x10
SectorsBig dd 0x0

DriveNumber db 0x0
WinNTBit db 0x0
Signature db 0x29
VolumeID dd 0x0000D105
VolumeIDString db "HOUND BOOT "
SystemIDString db "FAT12   "

boot:
	mov [BOOT_DRIVE], dl
	mov bp, 0x9000
	mov sp, bp
	
	;mov bx, MSG_REAL_MODE
	;call print
	;call print_nl
	
	call load_kernel
	call switch_to_pm
	jmp $

%include "boot/houndboot/realmode/print.asm"
; %include "boot/houndboot/realmode/print_hex.asm"
%include "boot/houndboot/realmode/disk.asm"
%include "boot/houndboot/pm/gdt.asm"
;%include "boot/houndboot/pm/32bit-print.asm"
%include "boot/houndboot/pm/32bit-switch.asm"

[bits 16]
load_kernel:
	;mov bx, MSG_LOAD_KERNEL
	;call print
	;call print_nl
	
	mov bx, KERNEL_OFFSET
	mov dh, 32
	mov dl, [BOOT_DRIVE]
	call disk_load
	ret

[bits 32]
BEGIN_PM:
	;mov ebx, MSG_PROT_MODE
	;call print_string_pm
	call KERNEL_OFFSET
	jmp $

BOOT_DRIVE db 0
MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Switched to 32-bit protected mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory...", 0

times 0x1b4-($-$$) db 0

UID times 10 db 0
;Partition 1
P1Attributes db 0x80
P1BeginHeads db 0x1
P1BeginSectors db 0x17
P1BeginCylinders db 0x0
P1PartitionType db 0x01
P1EndHeads db 0x2
P1EndSectors db 0x12
P1EndCylinders db 0x50
P1StartLBA dd 0x10
P1NumSectors dd 0xB30
;Partition 2
P2Attributes db 0x0
P2BeginHeads db 0x0
P2BeginSectors db 0x0
P2BeginCylinders db 0x0
P2PartitionType db 0x00
P2EndHeads db 0x0
P2EndSectors db 0x0
P2EndCylinders db 0x0
P2StartLBA dd 0x0
P2NumSectors dd 0x0
;Partition 3
P3Attributes db 0x0
P3BeginHeads db 0x0
P3BeginSectors db 0x0
P3BeginCylinders db 0x0
P3PartitionType db 0x00
P3EndHeads db 0x0
P3EndSectors db 0x0
P3EndCylinders db 0x0
P3StartLBA dd 0x0
P3NumSectors dd 0x0
;Partition 4
P4Attributes db 0x0
P4BeginHeads db 0x0
P4BeginSectors db 0x0
P4BeginCylinders db 0x0
P4PartitionType db 0x00
P4EndHeads db 0x0
P4EndSectors db 0x0
P4EndCylinders db 0x0
P4StartLBA dd 0x0
P4NumSectors dd 0x0

dw 0xaa55
