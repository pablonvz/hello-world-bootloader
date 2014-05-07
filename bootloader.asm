; source: http://www.osdever.net/tutorials/view/hello-world-boot-loader

		[BITS 16]
		[ORG 0x7c00]

		mov si, hw_str
		mov ah, 0x0e	; function (0x0e) puts a character on the screen
		mov bh, 0x00
		mov bl, 0x07
		
		call pstrf

pstrf:		mov al, [si]	; pstrf -> print a character while not equal to zero
		cmp al, 0
		jz done
		int 0x10
		inc si
		call pstrf

done:		nop

hw_str db 'Hello World!', 0

times 510 - ($ - $$) db 0	; fill the rest of the sector with zero's
dw 0xaa55			; add the bootloader signature at the end

