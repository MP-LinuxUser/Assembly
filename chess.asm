%include "io.inc"
section .text
global main
main:
    
    GET_CHAR ebx
    GET_DEC 4, ecx
    sub ebx ,'A'
    add ebx, 1

    mov eax, ebx
    add eax, ecx
         
    xor edx, edx
    xor ebx, ebx
    mov ebx, 2
    div ebx 
    
    imul eax, ebx
    add eax, edx
    sub eax, ecx
    
    mov ebx, 8
    sub ebx, eax
    mov eax, ebx
    
    mov ebx, 8
    sub ebx, ecx
    mov ecx, ebx
    
    imul eax, ecx
    add eax, edx
    
    xor edx, edx
    mov ebx, 2
    div ebx

    PRINT_DEC 4, eax
   
    xor eax, eax
    ret