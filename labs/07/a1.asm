.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include Irvine32.inc

.code
main proc
    ; Store the number before the previous one
    mov eax, 0
    ; Store previous number
    mov ebx, 1
    mov ecx, 7
l1:
    ; Print oldest number
    call WriteDec
    call Crlf
    ; Calculate the next fibonacci number
    add eax, ebx
    xchg eax, ebx
    loop l1

    invoke ExitProcess, 0
main endp
end main