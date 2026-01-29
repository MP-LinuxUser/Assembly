%include "io.inc"
section .text
global main
main:
    xor cx, cx
    mov ax, 0xFFFF
    mov bx, 9
    add ax, bx
    ADC cx, 0
    PRINT_HEX 4, cx
    NEWLINE
    PRINT_HEX 4, ax
    xor ax, ax
    xor bx, bx
    ret