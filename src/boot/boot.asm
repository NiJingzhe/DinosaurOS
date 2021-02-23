org 0x7c00

    jmp START
    nop

StackBase equ 0x7c00

BootMessage: dd "System Booting......"

START:
    ;因为cx一开始就是正确地指向0x7c00，所以用cx来对齐寄存器
    mov ax,cx
    mov ds,ax
    mov ss,ax
    mov sp,StackBase

    ;Now we will going to print BootMessage
    mov al,1        ;1表示要打印字符
    mov bh,0        ;page number
    mov bl,0x70     
    mov cx,20       ;Length of string
    mov dh,0        ;起始光标列位置
    mov dl,0        ;起始光标行位置
    push ds
    pop es
    mov bp,BootMessage
    mov ah,0x13
    int 0x10

    jmp $

times 510-($-$$)  db 0 
dw 0xaa55