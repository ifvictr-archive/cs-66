.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
myBytes byte 80h, 66h, 0A5h, 7Bh
mySBytes sbyte 80h, 66h, 0A5h, 7Bh

.code
main proc
    ; Play around with unsigned byte array
    mov al, myBytes[0]
    mov ah, myBytes[1]
    ; Play around with signed byte array
    mov bl, mySBytes[0]
    mov bh, mySBytes[1]

    invoke ExitProcess, 0
main endp
end main