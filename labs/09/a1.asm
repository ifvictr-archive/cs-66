.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include Irvine32.inc

.data
sizePrompt byte "How many fibonacci numbers do you want to see? ", 0
timeElapsedMessage1 byte "fib took ", 0
timeElapsedMessage2 byte " ms to execute", 0

.data?
array dword 100000 dup(?)
startTime dword ?

.code
main proc
prompt:
    ; Get size
    mov edx, offset sizePrompt
    call WriteString
    call ReadDec
    ; If input isn't valid, ask again
    cmp eax, 0
    je prompt

    ; Print amount of numbers according to user input
    mov ecx, eax
    mov edx, offset array
    ; Get start time
    call GetMseconds
    mov [startTime], eax
    call fib
    ; Get time elapsed since we started the fib procedure
    call GetMseconds
    sub eax, [startTime]
    mov edx, offset timeElapsedMessage1
    call WriteString
    call WriteDec
    mov edx, offset timeElapsedMessage2
    call WriteString

    invoke ExitProcess, 0
main endp

; Parameters:
;   ECX: Amount of fibonacci numbers to calculate
;   EDX: Pointer to the array to store
; Returns:
;   EDX: Pointer to the array filled with fibonacci numbers
fib proc uses eax ebx edi
    ; mov edi, 0
    ; 0 and 1 are first two required numbers
    mov eax, 0
    mov ebx, 1
l1:
    ; Print new number
    ; call WriteHex
    call WriteDec
    call Crlf
    ; Calculate the next fibonacci number
    add eax, ebx
    xchg eax, ebx
    ; Store in the array
    ; mov [edx][edi], eax
    ; Increment index
    ; add edi, type edx
    loop l1
    ret
fib endp

end main