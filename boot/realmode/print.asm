print:
	pusha

start:
	mov al, [bx]
	cmp al, 0 ; Check for null terminator
	je done ; If the current char is a null terminator, finish the function
	
	mov ah, 0x0e; scrolling teletype BIOS routine
	int 0x10
	
	add bx, 1 ; Increment BX to the next char
	jmp start ; Loop

done:
	popa
	ret



print_nl:
	pusha
	
	mov ah, 0x0e ; Scrolling teletype BIOS routine
	mov al, 0x0a ; Newline char
	int 0x10
	mov al, 0x0d ; Carriage return
	int 0x10
	
	popa
	ret
