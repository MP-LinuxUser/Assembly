%include "io.inc"
section .text
global main
main:
    push ebp
    mov ebp, esp
    sub esp, 28
    
    GET_UDEC 4, [ebp - 28];a11
    GET_UDEC 4, [ebp - 24];a12
    GET_UDEC 4, [ebp - 20];a21
    GET_UDEC 4, [ebp - 16];a22
    GET_UDEC 4, [ebp - 12];b1
    GET_UDEC 4, [ebp - 8];b2
    
    mov eax, [ebp - 12]
    imul eax, [ebp - 16]
    mov ecx, [ebp - 24]
    imul ecx, [ebp - 8]
    xor eax, ecx
    
    mov ecx, [ebp - 28]
    imul ecx, [ebp - 16]
    mov edx, [ebp - 24]
    imul edx, [ebp - 20]
    xor ecx, edx
    
    mov ebx, ecx
    xor edx, edx
    div ebx
    

    
    PRINT_UDEC 4, eax
    PRINT_CHAR " "
            
    mov eax, [ebp - 28]
    imul eax, [ebp - 8]
    mov ecx, [ebp - 12]
    imul ecx, [ebp - 20]
    xor eax, ecx
    
    xor edx, edx
    div ebx
    
    
    PRINT_UDEC 4, eax
    
    leave
    xor eax, eax
    ret