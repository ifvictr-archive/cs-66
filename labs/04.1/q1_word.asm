.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
varA word 1
varB word 2
varC word 3
varD word 4

.code
main proc
    ; varA = (varA + varB) - (varC + varD)
    mov ax, [varA]
    add ax, [varB]
    mov bx, [varC]
    add bx, [varD]
    sub ax, bx
    mov varA, ax

    invoke ExitProcess, 0
main endp
end main