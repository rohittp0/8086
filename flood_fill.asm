; A library for string operations

.model small
.stack 100h

; Macros

data segment

data ends

code segment
assume cs:code,ds:data

start:
    mov al, 13h
    mov ah, 0
    int 10h ; set graphics video mode.
    mov al, 1100b
    mov ah, 0ch
    
    mov cx, 10
    mov dx, 20
    
    mov bx, 1
    
    draw:
        mov al, 1100b
        mov ah, 0ch
        add cx, bx
        int 10h ; set pixel.
        
        cmp cx, 1
        je switch 
        cmp cx, 100
        jle draw
        inc dx
        mov bx, -1
        cmp dx, 100
        jle draw
    
    mov ax, 04h
    int 21h ; exit to DOS.
    
    switch:
        mov ah, 86h
        int 15h
        mov bx, 2
        jmp draw

code ends
end start