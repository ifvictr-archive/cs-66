.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
array dword 1, 2, 3, 4

.code
main proc
    ; Loop runs because we work with 2 elements at a time
    mov ecx, lengthof array / 2
    mov esi, 0
l1:
    ; Exchange value with proceeding element
    mov eax, array[esi]
    xchg eax, array[esi + type array]
    mov array[esi], eax
    ; Increment index
    add esi, type array * 2
    loop l1

    invoke ExitProcess, 0
main endp
end main