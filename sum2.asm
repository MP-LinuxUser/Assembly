%import "io.inc"



section .bss
a resq 1
b resq 1

section .text
global main
main:
    call io_get_dec
    mov dword [a], eax
    call io_get_dec
    mov dword [a + 4], eax
    
    call io_get_dec
    mov dword [b], eax
    call io_get_dec
    mov dword [b + 4], eax
    
    add eax, dword [a + 4]
    
    mov ebx, dword [a]
    adc ebx, dword [b]
    
    mov dword [a], ebx
    mov dword [a+4], eax
    
    xor eax, eax
    ret