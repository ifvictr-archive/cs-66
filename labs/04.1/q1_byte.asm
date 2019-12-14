.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
varA byte 1
varB byte 2
varC byte 3
varD byte 4

.code
main proc
    ; varA = (varA + varB) - (varC + varD)
    mov al, [varA]
    add al, [varB]
    mov bl, [varC]
    add bl, [varD]
    sub al, bl
    mov varA, al

    invoke ExitProcess, 0
main endp
end main