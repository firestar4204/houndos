; Load 'DH' sectors from drive 'DL' to ES:BX

disk_load:
	pusha
	push dx
	
	mov ah, 0x02 ; 'int 0x13' function.  0x02 -> read
	mov al, dh
	mov cl, 0x02 ; 0x01 is our boot sector, so use 0x02.
	mov ch, 0x00
	mov dh, 0x00
	
	int 0x13 ; BIOS interrupt
	jc disk_error ; if error (stored in carry bit)
	
	pop dx
	cmp al, dh ; if not the same number of sectors read...
	jne sectors_error
	popa
	ret

disk_error:
	mov bx, DISK_ERROR
	call print
	call print_nl
	mov dh, ah
	;call print_hex
	jmp disk_loop

sectors_error:
	mov bx, SECTORS_ERROR
	call print

disk_loop:
	hlt
	jmp disk_loop

DISK_ERROR: db "Disk read error!",0
SECTORS_ERROR: db "Incorrect number of sectors read",0
