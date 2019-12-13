.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include Irvine32.inc

.data
array dword 47 dup(?)

.code
main proc
    mov ecx, 47
    mov edx, offset array
    call fib

    invoke ExitProcess, 0
main endp

; Parameters:
;   ECX: Amount of fibonacci numbers to calculate
;   EDX: Pointer to the array to store
; Returns:
;   EDX: Pointer to the array filled with fibonacci numbers
fib proc uses eax ebx edi
    mov edi, 0
    ; 0 and 1 are first two required numbers
    mov eax, 0
    mov ebx, 1
l1:
    ; Calculate the next fibonacci number
    add eax, ebx
    xchg eax, ebx
    ; Store in the array
    mov [edx][edi], eax
    ; Print new number
    call WriteDec
    call Crlf
    ; Increment index
    add edi, type edx
    loop l1
    ret
fib endp

end main