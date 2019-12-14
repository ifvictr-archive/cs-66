.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
varA dword 1
varB dword 2
varC dword 3
varD dword 4

.code
main proc
    ; varA = (varA + varB) - (varC + varD)
    mov eax, [varA]
    add eax, [varB]
    mov ebx, [varC]
    add ebx, [varD]
    sub eax, ebx
    mov varA, eax

    invoke ExitProcess, 0
main endp
end main