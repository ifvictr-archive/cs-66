.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
include Irvine32.inc

GAMES_TO_PLAY = 10000
.data
winCount dword 0
loseCount dword 0
gamesPlayedMessage byte "Total games of Craps played: ", 0
winsMessage byte "Total wins: ", 0
lossesMessage byte "Total losses: ", 0

.code
main proc
    call Randomize
    mov ecx, GAMES_TO_PLAY
play:
    call playGame
    ; Update counts depending on the result of the game
    cmp al, 1
    je won
    inc [loseCount]
    jmp continue
won:
    inc [winCount]
continue:
    loop play

    ; Print games played
    mov edx, offset gamesPlayedMessage
    call WriteString
    mov eax, GAMES_TO_PLAY
    call WriteDec
    call Crlf
    ; Print wins
    mov edx, offset winsMessage
    call WriteString
    mov eax, [winCount]
    call WriteDec
    call Crlf
    ; Print losses
    mov edx, offset lossesMessage
    call WriteString
    mov eax, [loseCount]
    call WriteDec

    invoke ExitProcess, 0
main endp

; Returns:
;   AL: 0 = lost, 1 = won
playGame proc uses ebx
    call rollDices
    ; Check if won
    cmp al, 7
    je won
    cmp al, 11
    je won
    ; Check if lost
    cmp al, 2
    je lost
    cmp al, 3
    je lost
    cmp al, 12
    je lost
    ; If the sum didn't win or lose, it becomes the point
    mov bl, al
    ; Continue rolling until we win/lose
rollAgain:
    call rollDices
    ; Check if won
    cmp al, bl
    je won
    ; Check if lost
    cmp al, 7
    je lost
    jmp rollAgain
won:
    mov al, 1
    jmp done
lost:
    mov al, 0
done:
    ret
playGame endp

; Returns:
;   EAX: Number between 2–12
rollDices proc
    mov eax, 11
    call RandomRange
    add eax, 2
    ret
rollDices endp

end main