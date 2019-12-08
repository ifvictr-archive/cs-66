.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
array byte 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

.code
main proc
    ; We only need to go halfway to swap everything
    mov ecx, lengthof array / 2
    ; Ascending and descending indexes
    mov esi, 0
    mov edi, sizeof array - type array
l1:
    ; Swap values
    mov al, array[esi]
    xchg al, array[edi]
    mov array[esi], al
    ; Update indexes
    add esi, type array
    sub edi, type array
    loop l1

    invoke ExitProcess, 0
main endp
end main