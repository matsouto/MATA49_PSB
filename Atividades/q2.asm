SYS_READ   equ   0
SYS_WRITE  equ   1
SYS_EXIT   equ   60

STDIN      equ   0
STDOUT     equ   1
;------------------------------------

section     .data; declaração e inicialização de dados

;------------------------------------

section .bss; declaração sem inicialização das informações que serão usadas
letra    resb 1
lenLetra equ $-letra

;------------------------------------

section .text
global  _start

_start:
  ;LEITURA
  mov rax,  SYS_READ
  mov rdi,  STDIN
  mov rsi,  letra
  mov rdx,  lenLetra
  syscall

  ;CONVERTE PARA MAIUSCULO
  mov al, [letra]
  sub al, 32    ; Subtrai 32 para converter para maiúscula
  mov [letra], al

  ;ESCRITA
  mov rax,  SYS_WRITE
  mov rdi,  STDOUT
  mov rsi,  letra 
  mov rdx,  lenLetra
  syscall 

  ;EXIT
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
