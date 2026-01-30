%include "io.inc"
section .text
global main
main:
    push ebp
    mov ebp, esp
    sub esp, 16
    
    GET_DEC 2, [ebp - 16];x1
    GET_DEC 2, [ebp - 14];y1
    GET_DEC 2, [ebp - 12];x2
    GET_DEC 2, [ebp - 10];y2
    GET_DEC 2, [ebp - 8];x3
    GET_DEC 2, [ebp - 6];y3
    
    mov ax, [ebp - 16]
    CWDE
    mov ebx, eax
    
    mov cx, [ebp - 10]
    sub cx, [ebp - 6]
    xor eax, eax
    mov ax, cx
    CWDE
    imul ebx, eax
    
    xor eax, eax
    mov ax, [ebp - 12]
    CWDE
    mov edx, eax
    
    mov cx, [ebp - 6]
    sub cx, [ebp - 14]
    xor eax, eax
    mov ax, cx
    CWDE
    imul edx, eax
    add ebx, edx
    
    xor eax, eax
    mov ax, [ebp - 8]
    CWDE
    mov edx, eax
    
    mov cx, [ebp - 14]
    sub cx, [ebp - 10]
    xor eax, eax
    mov ax, cx
    CWDE
    imul edx, eax
    add ebx, edx
    
    xor edx, edx
    mov eax, ebx
    cdq
    xor eax, edx
    sub eax, edx
    
    imul eax, 10
    xor edx, edx
    mov ebx, 2
    div ebx
    
    xor edx, edx
    mov ebx, 10
    div ebx
    
    PRINT_DEC 4, eax
    PRINT_CHAR '.'
    PRINT_DEC 4, edx
    xor eax, eax
    leave
    ret