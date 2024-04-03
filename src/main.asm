org 0x7C00

bits 16


start:
	jmp main


; puts data to the screen in text mode
; si - pointer to the null terminated string
puts:
	push si
	push ax

.loop:
	lodsb
	or al, al
	jz .done

	mov ah, 0x0E
	int 0x10
	jmp .loop

.done:
	pop ax
	pop si
	ret

main:
	mov ax, 0
	mov ds, ax
	mov es, ax

	mov ss, ax
	mov sp, 0x7C00
	mov si, ms
	call puts
	hlt

.halt:
	jmp .halt

ms: db 'Hello, world!', 13, 10, 0

times 510-($-$$) db 0
dw 0AA55H
