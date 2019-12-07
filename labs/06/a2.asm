.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
array dword 0, 2, 5, 9, 10

.code
main proc
    ; Initialize sum counter to 0
    mov ebx, 0
    mov esi, 0
    mov ecx, lengthof array - 1
l1:
    ; Get the difference between the proceeding and current values
    mov eax, array[esi + type array]
    sub eax, array[esi]
    ; Add difference to sum
    add ebx, eax
    ; Increment index
    add esi, type array
    loop l1

    invoke ExitProcess, 0
main endp
end main