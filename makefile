
bootloader: bootloader.asm
	rm -f bootloader.bin bootloader.iso os.vdi
	nasm bootloader.asm -f bin -o bootloader.bin
	dd if=bootloader.bin bs=512 of=bootloader.iso
	VBoxManage convertfromraw -format VDI bootloader.iso os.vdi

clean:
	rm -f bootloader.bin bootloader.iso os.vdi
