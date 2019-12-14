.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include Irvine32.inc

.data
daySets byte 1, 2, 4, 8, 16
guessDay byte 0
promptMessage byte "Is your birthday in the above set? (y/n)", 0
guessMessage byte "Seems like your birthday is ", 0

.code
main proc
    ; Prompt the user for their birthday in all the sets
    mov esi, 0
    mov ecx, lengthof daySets
l1:
    mov al, daySets[esi]
    call prompt
    call Crlf
    ; Add current set number to guess if user said yes
    cmp al, 1
    je updateGuessDay
    jmp continue
updateGuessDay:
    mov al, [guessDay]
    add al, daySets[esi]
    mov [guessDay], al
continue:
    inc esi
    loop l1

    ; Print our birthday guess
    mov edx, offset guessMessage
    call WriteString
    movzx eax, [guessDay]
    call WriteDec

    invoke ExitProcess, 0
main endp

; Parameters:
;   AL: Binary filter
; Returns:
;   AL: 1 = User's birthday was in set, 0 = Not in set
prompt proc uses ebx ecx edx
    ; Loop through 1–31 and print days that pass the filter
    mov bl, 1
    mov ecx, 31
l1:
    test bl, al
    jnz printDay
    jmp continue
printDay:
    push eax
    movzx eax, bl
    call WriteDec
    mov al, ' '
    call WriteChar
    pop eax
    jmp continue
continue:
    inc bl
    loop l1

    ; Print prompt message
    call Crlf
    mov edx, offset promptMessage
    call WriteString
    ; Read user input
    call ReadChar
    ; User input sets return value
    cmp al, 'y'
    je isInSet
    jne isNotInSet
isInSet:
    mov al, 1
    jmp finish
isNotInSet:
    mov al, 0
    jmp finish
finish:
    call Crlf
    ret
prompt endp

end main