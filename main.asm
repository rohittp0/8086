.model small
.stack 100h

data segment

    buffer db  10,?, 20 dup ("$")

data ends

code segment
assume cs:code, ds:data

start:

    mov ax, data ; load data segment
    mov ds, ax ;

    mov dx, offset buffer
    call input

    xor bx, bx
    mov bl, [buffer + 1]
    mov dx, offset buffer + 2
    add dx, bx
    mov [buffer + bx +2] , 10

    call input

    mov dl, 10
    call putc

    mov dl, [buffer + 1]
    add dl, '0'
    call putc

    mov dl, 10
    call putc

    mov dx, offset buffer + 2
    call print

    call exit

    input:
        mov ah, 0ah
        int 21h
        ret

    putc:
        mov ah, 02h
        int 21h
        ret

    print:
        mov ah, 09h
        int 21h
        ret

    exit:
        mov ah, 4ch
        int 21h

code ends
end start