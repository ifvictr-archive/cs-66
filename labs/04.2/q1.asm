.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
; Symbolic names for string literals
str1 equ <"this is a string", 0>
str2 equ <"here's another one", 0>
str3 equ <"...and another", 0>
; Variable definitions using symbolic names
var1 byte str1
var2 byte str2
var3 byte str3
; Instruction set using symbolics
move textequ <mov>
subtract textequ <sub>
varA byte 1
varB byte 2
varC byte 3
varD byte 4

.code
main proc
    ; varA = (varA + varB) - (varC + varD)
    move al, [varA]
    add al, [varB]
    move bl, [varC]
    add bl, [varD]
    subtract al, bl
    move varA, al

    invoke ExitProcess, 0
main endp
end main