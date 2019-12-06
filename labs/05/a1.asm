.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
myByte byte 0FFh, 0

.code
main proc
    mov al, myByte[0] ; AL = FF, EAX = XXXXXXFF
    mov ah, myByte[1] ; AH = 00, EAX = XXXX00FF
    dec ah            ; AH = FF, EAX = XXXXFFFF
    inc al            ; AL = 00, EAX = XXXXFF00
    dec ax            ; AX = FEFF, EAX = XXXXFEFF

    invoke ExitProcess, 0
main endp
end main