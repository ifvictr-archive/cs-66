.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
wordArray word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
dwordArray dword lengthof wordArray dup(?)

.code
main proc
    ; Initialize indexes
    mov edi, 0
    mov esi, 0
    mov ecx, lengthof wordArray
l1:
    ; Copy value over
    movsx eax, wordArray[esi]
    mov dwordArray[edi], eax
    ; Increment indexes
    add edi, type dwordArray
    add esi, type wordArray
    loop l1

    invoke ExitProcess, 0
main endp
end main