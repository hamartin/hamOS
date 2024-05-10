bits 16									; Make sure the CPU boots in 16 bit real mode.
org 0x7c00								; This sets where in memory the code begins. By
									;	using the org instruction/keyword, we
									;	can calculate positions inn memory
									;	relative to org. In other words, we do
									;	not need to add the base 0x7c00 to every
									;	address we are using.
%include "define.asm"							; To keep the code relatively clean, all %define
									; 	statements can be found in this file.
jmp short start								; In the FAT documentation, it says we need to
									;	create a set of headers in the beginning
									;	of the binary. To make sure those headers
									;	are not executed as code, we need to skip
									;	them.
nop									; There must be a no operation statement between
									;	the jump and the headers.
%include "fat_headers.asm"						; This includes all the headers needed to use
									;	FAT12.
start:
    mov ax, 0
    mov ds, ax
    mov es, ax

    mov ss, ax
    mov sp, 0x7c00

    mov si, os_running_msg
    call print

    cli									; Disable interrupts, this way the CPU can't get
									;	out of "halt" state
    hlt

halt:
    jmp halt

os_running_msg: db "hamOS running.", ENDL, 0

%include "print.asm"

times 510-($-$$) db 0							; We make sure to that the every byte in the sector
									;	that is not used is a zero up until the
									;	last 2 bytes.
dw 0xaa55								; The last 2 bytes in the sector contains the magic
									;	"header" which tells the BIOS that this is
									;	a bootloader.
