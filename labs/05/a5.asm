.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
storedFlags byte ?

.code
main proc
    ; Save status flags
    lahf
    mov storedFlags, ah
    ; Turn CY and OV flag on
    mov al, -128
    neg al
    ; Turn ZR flag on
    add al, 128
    ; Restore status flags
    mov ah, storedFlags
    sahf

    invoke ExitProcess, 0
main endp
end main