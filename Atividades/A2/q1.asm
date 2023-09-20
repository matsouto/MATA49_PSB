SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

STDIN      equ   0
STDOUT     equ   1
;------------------------------------

section .bss ; Dados não inicializados
  lenNome equ 10
  nome resb lenNome 
  lenLetra equ 1
  letra resb lenLetra

;------------------------------------

section .text 
global _start

_start:
  ;LEITURA
  mov rax,  SYS_READ
  mov rdi,  STDIN
  mov rsi,  nome
  mov rdx,  lenNome
  syscall

  call contar

contar:
  xor rcx,rcx ; Limpa o registrador
  .loop:
    cmp byte [rsi + rcx], 0  ; Checa se o caractere é o último 
    je  imprimirLetras 
    inc rcx  
    jmp .loop

imprimirLetras:
  ;ESCRITA PRIMEIRA LETRA
  mov rax,  SYS_WRITE
  mov rdi,  STDOUT
  mov rsi,  nome 
  mov rdx,  1
  syscall 

exit:
  ;EXIT
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
