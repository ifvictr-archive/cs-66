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
    movzx ax, myBytes[2]
    movzx eax, myBytes[3]
    ; Play around with signed byte array
    movsx bx, mySBytes[2]
    movsx ebx, mySBytes[3]

    invoke ExitProcess, 0
main endp
end main