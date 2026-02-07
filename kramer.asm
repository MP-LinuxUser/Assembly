%include "io.inc"
section .bss

x resd 1
y resd 1
k11 resd 1
k12 resd 1
k21 resd 1
k22 resd 1
f12 resd 1
f21 resd 1
f22 resd 1

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
    
    ;k11 = not b1 & not b2
    mov eax, [ebp - 12]
    not eax
    mov ebx, [ebp - 8]
    not ebx
    and eax, ebx
    mov dword[k11], eax
    
    ;k12 = not(a12 ^ b1) & not(a22 ^ b2)
    mov eax, [ebp - 24]
    xor eax, [ebp - 12]
    not eax
    mov ebx, [ebp - 16]
    xor ebx, [ebp - 8]
    not ebx
    and eax, ebx
    mov dword[k12], eax
    
    ;k21 = not(a11 ^ b1) & not(a21 ^ b2)
    mov eax, [ebp - 28]
    xor eax, [ebp - 12]
    not eax
    mov ebx, [ebp - 20]
    xor ebx, [ebp - 8]
    not ebx
    and eax, ebx
    mov dword[k21], eax
    
    ;k22 = not((a11 ^ a12) ^ b1) & not((a21 ^ a22) ^ b2)
    mov eax, [ebp - 28]
    xor eax, [ebp - 24]
    xor eax, [ebp - 12]
    not eax
    mov ebx, [ebp - 20]
    xor ebx, [ebp - 16]
    xor ebx, [ebp - 8]
    not ebx
    and eax, ebx
    mov dword[k22], eax
    
    
    ;f12 = not(k11) & k12
    mov eax, dword[k11]
    not eax
    and eax, dword[k12]
    mov dword[f12], eax
    
    ;f21 = not(k11) & not(k12) & k21
    mov eax, dword[k11]
    not eax
    mov ebx, dword[k12]
    not ebx
    and eax, ebx
    and eax, dword[k21]
    mov dword[f21], eax
    
    ;f22 = not(k11) & not(k12) & not(k21) & k22
    mov eax, dword[k11]
    not eax
    mov ebx, dword[k12]
    not ebx
    and eax, ebx
    mov ebx, dword[k21]
    not ebx
    and eax, ebx
    and eax, dword[k22]
    mov dword[f22], eax
    
    ;x = f21|f22
    mov eax, dword[f21]
    or eax, dword[f22]
    mov dword[x], eax
    
    ;y = f12|f22
    mov eax, dword[f12]
    or eax, dword[f22]
    mov dword[y], eax
    
    PRINT_UDEC 4, [x]
    PRINT_CHAR ' '
    PRINT_UDEC 4, [y]
    
    leave
    xor eax, eax
    ret