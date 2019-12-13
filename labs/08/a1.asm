.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include Irvine32.inc

.code
main proc
    ; Initialize counter
    mov eax, 0
    ; Allow recursive call 10 times
    mov ecx, 10
    call count

    invoke ExitProcess, 0
main endp

count proc
    inc eax
    call WriteDec
    call Crlf
    loop countBack
    ret
count endp

countBack proc
    call count
    ret
countBack endp

; Non-working code saved for reference. The counter never stops increasing.
count1 proc
    inc eax
    ; Print counter for debugging
    call WriteDec
    call Crlf
    ; Decrement ECX each call until it can't loop anymore
    dec ecx
l1:
    call count
    loop l1
    ret
count1 endp

end main