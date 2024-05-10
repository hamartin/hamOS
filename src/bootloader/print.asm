;
; Prints a string to the screen.
; Params:
;   - ds:si: points to string
;
print:
    push si						; Save registers we modify to stack before starting.
    push ax
    push bx

.loop:
    lodsb						; Loads the next character in SI to AL.
    or al, al						; Checking for null byte.
    jz .done						; Jump to done if the previous operation set the zero flag.

    mov ah, 0x0e					; Call BIOS interrupt -- Write Character in TTY mode.
    mov bh, 0						; Set the page number to zero.
    int 0x10						; Calls the print to screen interrupt in BIOS.

    jmp .loop						; Notice that this is an eternal loop. Checking for the 
    							;	null byte is what escapes us from here.
.done:
    pop bx						; Put registers back to how they were before returning.
    pop ax
    pop si
    ret
