%define SYS_WRITE 1 
%define SYS_EXIT 60
%define STDOUT 1
; "constantes", reemplazadas por preporcesasor


section .data
msg db 'hola mundo', 10 ; pseudo instruccion, define bytes, reemlpaza a msg en todo por puntero
len EQU $ - msg ; no entiendi

global _start  ; directiva de ensamblador
section .text
_start:
    mov rax, SYS_WRITE
    mov RDI, STDOUT
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, SYS_EXIT
    mov rdi, 0
    syscall



; hexa 0x, octal 0q, bin 0b1001_0111 / 10010111b