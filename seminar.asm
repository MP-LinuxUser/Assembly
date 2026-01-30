%include "io.inc"
section .text
global main
main:
    mov ax, 0x1124
    cbw ;ax == 0x0024
    
    mov ax, 0x11E4
    cbw ;ax == 0xFFE4

    ;al = 0xFF (-1 signed, 255 unsigned)
    ;bl = 0x01 (1 signed, 1 unsigned)
    add al, bl ;al == 0x00
    ; signed good, unsigned bad
    ; OF == 0, CF == 1, ZF == 1
    adc al, bl; al = al + bl - CF
    sbb al, bl; al = al - bl - CF
               
    xor eax, eax
    ret