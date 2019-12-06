.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.code
main proc
    mov al, -128  ; CF = 0, OF = 0
    neg al        ; CF = 1, OF = 1
    mov ax, 8000h ; CF = 1, OF = 1
    add ax, 2     ; CF = 0, OF = 0
    mov ax, 0     ; CF = 0, OF = 0
    sub ax, 2     ; CF = 1, OF = 0
    mov al, -5    ; CF = 1, OF = 0
    sub al, +125  ; CF = 0, OF = 1

    invoke ExitProcess, 0
main endp
end main