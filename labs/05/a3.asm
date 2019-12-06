.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.code
main proc
    mov ax, 00FFh ; CF = 0, ZF = 1, SF = 0
    add ax, 1     ; CF = 0, ZF = 0, SF = 0
    sub ax, 1     ; CF = 0, ZF = 0, SF = 0
    add al, 1     ; CF = 1, ZF = 1, SF = 0
    mov bh, 6Ch   ; CF = 1, ZF = 1, SF = 0
    add bh, 95h   ; CF = 1, ZF = 0, SF = 0
    mov al, 2     ; CF = 1, ZF = 0, SF = 0
    sub al, 3     ; CF = 1, ZF = 0, SF = 1

    invoke ExitProcess, 0
main endp
end main