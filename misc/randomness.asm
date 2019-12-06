.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include Irvine32.inc

.code
main proc
    call Randomize
    ; Initialize sum to 0
    mov ebx, 0
    mov ecx, 100
L1:
    ; Generate random number from 1–6
    mov eax, 6
    call RandomRange
    inc eax
    ; Add current number to sum
    add ebx, eax
    loop L1

    ; Print sum
    mov eax, ebx
    call WriteInt

    invoke ExitProcess, 0
main endp
end main