.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
arrayD dword 1, 2, 3

.code
main proc
    mov eax, arrayD[0]  ; EAX = 1, arrayD = 1, 2, 3
    xchg eax, arrayD[4] ; EAX = 2, arrayD = 1, 1, 3
    xchg eax, arrayD[8] ; EAX = 3, arrayD = 1, 1, 2
    mov arrayD, eax     ; EAX = 3, arrayD = 3, 1, 2

    invoke ExitProcess, 0
main endp
end main