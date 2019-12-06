.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
valR dword ?
valX byte 10
valY word 2
valZ dword 8

.code
main proc
    ; valR = valX - (-valY + valZ)
    movzx eax, valX
    movzx ebx, valY
    neg ebx
    add ebx, valZ
    sub eax, ebx
    mov valR, eax
    ; valR should be 4

    invoke ExitProcess, 0
main endp
end main