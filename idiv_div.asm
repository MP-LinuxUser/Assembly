%include "io.inc"
section .bss
a resd 4
b resw 4
c resd 4
d resw 4
p resb 4
q resb 4
l resq 1

section .text
global main
main:
    ;a[0] = b[0] + b[1] - b[2]
    mov ax, word[b]
    add ax, word[b+2]
    sub ax, word[b+4]
    movsx dword[a], ax
    
    ;p[0] = a[0] + d[3]
    movsx eax, dword[d+6]
    add eax, dword[a]
    mov byte[p], al
    
    ;a[0] /= a[1]
    mov eax, [a]
    cdq
    idiv dword[a+4]
    mov dword[a], eax
    
    ;eax = q[0] | (q[1] << 8) | (q[2] << 16)
    mov al, byte[q+2]
    shl eax, 16
    mov al, byte[q]
    mov ah, byte[q+1]

    ;a[1] = c[0] * d[3] 
    movsx eax, dword[d+6]
    mul dword[c]
    mov dword[a+4], eax
        
    ;l = c[0] * d[3] 
    movsx eax, dword[d+6]
    mul dword[c]
    mov dword[l], edx
    mov dword[l+4], eax
    
    ;a[0] = a[0] << a[1]
    shl dword[a], byte[a+7]
    
    ;b[2] = l/p[2]
    movsx ebx, byte[p+2]
    mov edx, dword[l]
    mov eax, dword[l+4]
    idiv ebx
    mov word[b+4], ax
    
    xor eax, eax
    ret
    
    ;shl - shift left unsigned
    ;shr - shift right unsigned
    ;sar - shift right signed
    ;sal - shift left signed
    ;rol - rotate left
    ;ror - rotate right
    ;rcl, rcr - rotate with carry flag