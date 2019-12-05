.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
bigEndian byte 12h, 34h, 56h, 78h
littleEndian dword ?

.code
main proc
    mov al, bigEndian[3]
    mov byte ptr littleEndian[0], al
    mov al, bigEndian[2]
    mov byte ptr littleEndian[1], al
    mov al, bigEndian[1]
    mov byte ptr littleEndian[2], al
    mov al, bigEndian[0]
    mov byte ptr littleEndian[3], al
    ; littleEndian is now 78 56 34 12

    invoke ExitProcess, 0
main endp
end main