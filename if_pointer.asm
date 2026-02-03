%include "io.inc"
section .data
    fmt_zero db 'Its zero', 0
    fmt_not_zero db 'its not zero', 0
    fmt_scanf db "%d"
section .bss
    input resb 4
section .text
global main
extern scanf, printf, exit
main:
    push input
    push fmt_scanf
    call scanf
    add esp, 8
    mov eax, dword [input]
    cmp eax, 0
    jz .itzero
.exit:
    call exit
.itzero:
    push fmt_zero
    call printf
    jmp .exit
.itsnot:
    push fmt_not_zero
    call printf
    jmp .exit
