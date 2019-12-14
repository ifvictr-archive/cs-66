; .386
; .model flat, stdcall
; .stack 4096
; ExitProcess proto, dwExitCode:dword
include Irvine32.inc

pow proto, base:dword, exponent:dword
log2 proto, n:dword

.data
characterPoolSize dword 0
passwordLength dword 0
; Message strings
lengthPrompt byte "How long is your password? ", 0
uppercasesPrompt byte "Does it contain uppercase letters (A-Z)? (y/n) ", 0
lowercasesPrompt byte "Does it contain lowercase letters (a-z)? (y/n) ", 0
digitsPrompt byte "Does it contain any digits (0-9)? (y/n) ", 0
symbolsPrompt byte "Does it contain any symbols? (y/n) ", 0
lengthMessage byte "Your password length is ", 0
poolSizeMessage byte "Your character pool size is ", 0
entropyMessage byte "Your password entropy is ", 0

.code
main proc
    ; Prompt user for length
promptForLength:
    mov edx, offset lengthPrompt
    call WriteString
    call ReadDec
    ; Prompt again if bad input is received
    cmp eax, 0
    je promptForLength
    mov [passwordLength], eax

    ; Prompt user for uppercases
promptForUppercase:
    call Crlf
    mov edx, offset uppercasesPrompt
    call WriteString
    call ReadChar
    cmp al, 'y'
    jne promptForLowercase
    add characterPoolSize, 26

    ; Prompt user for lowercases
promptForLowercase:
    call Crlf
    mov edx, offset lowercasesPrompt
    call WriteString
    call ReadChar
    cmp al, 'y'
    jne promptForDigits
    add characterPoolSize, 26

    ; Prompt user for digits
promptForDigits:
    call Crlf
    mov edx, offset digitsPrompt
    call WriteString
    call ReadChar
    cmp al, 'y'
    jne promptForSymbols
    add characterPoolSize, 10

    ; Prompt user for symbols
promptForSymbols:
    call Crlf
    mov edx, offset symbolsPrompt
    call WriteString
    call ReadChar
    cmp al, 'y'
    jne printResults
    add characterPoolSize, 32

printResults:
    call Crlf
    call Crlf
    ; Print inputted length
    mov edx, offset lengthMessage
    call WriteString
    mov eax, [passwordLength]
    call WriteDec
    call Crlf
    ; Print total pool size from input
    mov edx, offset poolSizeMessage
    call WriteString
    mov eax, [characterPoolSize]
    call WriteDec
    call Crlf
    ; Print entropy
    mov edx, offset entropyMessage
    call WriteString
    invoke pow, characterPoolSize, passwordLength
    ; call WriteDec
    invoke log2, eax
    mov ebx, 4
    call WriteBinB

    invoke ExitProcess, 0
main endp

pow proc uses ecx, base:dword, exponent:dword
    mov eax, 1
    ; If exponent is 0, just return EAX
    cmp exponent, 0
    je done
    mov ecx, exponent
l1:
    mul base
    loop l1
done:
    ret
pow endp

log2 proc uses ebx, n:dword
    ; Set default return value
    mov eax, 0
    ; (n > 1) ? 1 + log2(n / 2) : 0
    cmp n, 1
    jng done
    mov eax, n
    mov ebx, 2
    div ebx
    invoke log2, eax
    inc eax
done:
    ret
log2 endp

end main