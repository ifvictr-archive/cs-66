.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
array1 byte 10h, 20h, 30h, 40h
array2 word 10h, 20h, 30h, 40h
array3 dword 10h, 20h, 30h, 40h

.code
main proc
    ; Demo on byte array
    mov ecx, lengthof array1 - 1
    mov esi, sizeof array1 - type array1
    ; Continuing swapping until the very last element reaches the front
l1:
    ; Swap current element with preceding element
    mov al, array1[esi]
    xchg al, array1[esi - type array1]
    mov array1[esi], al
    ; Decrement index
    sub esi, type array1
    loop l1

    ; Demo on word array
    mov ecx, lengthof array2 - 1
    mov esi, sizeof array2 - type array2
l2:
    mov ax, array2[esi]
    xchg ax, array2[esi - type array2]
    mov array2[esi], ax
    sub esi, type array2
    loop l2

    ; Demo on dword array
    mov ecx, lengthof array3 - 1
    mov esi, sizeof array3 - type array3
l3:
    mov eax, array3[esi]
    xchg eax, array3[esi - type array3]
    mov array3[esi], eax
    sub esi, type array3
    loop l3

    invoke ExitProcess, 0
main endp
end main