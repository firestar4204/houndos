print_hex:
	pusha

	mov cx, 0 ; CX is our counter register
	
hex_loop:
	cmp cx, 4 ; Loop 4 times
	je end
	
	mov ax, dx ; AX is our working register
	and ax, 0x000f ; Mask the first 3 digits to zeros (0x1234 -> 0x0004)
	add al, 0x30
	cmp al, 0x39
	jle step2
	add al, 7

step2:
	mov bx, HEX_OUT + 5
	sub bx, cx
	mov [bx], al
	ror dx, 4
	
	add cx, 1
	jmp hex_loop

end:
	mov bx, HEX_OUT
	call print ; Print the final result
	
	popa
	ret

HEX_OUT:
	db '0x0000',0 ; Reserve memory for our string
