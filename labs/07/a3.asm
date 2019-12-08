.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
source byte "This is the source string", 0
target byte sizeof source dup('#')

.code
main proc
    mov ecx, sizeof source
    mov esi, 0
l1:
    ; Copy current character over
    mov al, source[esi]
    mov target[esi], al
    ; Increment index
    add esi, type source
    loop l1

    invoke ExitProcess, 0
main endp
end main