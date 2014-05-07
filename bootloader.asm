
; source: http://viralpatel.net/taj/tutorial/hello_world_bootloader.php

		[BITS 16]
		[ORG 0x7c00]

		mov si, hw_str
		mov ah, 0x0e
		mov bh, 0x00
		mov bl, 0x07
		
		call pstrf

pstrf:		mov al, [si]
		cmp al, 0
		jz done
		int 0x10
		inc si
		call pstrf

done:		nop

hw_str db 'Hello World!', 0

times 510 - ($ - $$) db 0
dw 0xaa55

