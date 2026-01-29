%include "io.inc"
section .text
global main
main:
    GET_DEC 4, ebx
    mov eax, ebx
    cdq
    xor eax, edx
    sub eax, edx
    PRINT_DEC 4, eax
    xor eax, eax
    ret