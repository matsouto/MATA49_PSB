SYS_READ   equ   0
SYS_WRITE  equ   1
SYS_EXIT   equ   60

STDIN      equ   0
STDOUT     equ   1
;------------------------------------

section     .data; declaração e inicialização de dados

;------------------------------------

section .bss; declaração sem inicialização das informações que serão usadas
lenString equ 50 
string resb lenString 

;------------------------------------

section .text
global  _start

_start:
  ;LEITURA
  mov rax,  SYS_READ
  mov rdi,  STDIN
  mov rsi,  string
  mov rdx,  lenString
  syscall

  ;ESCRITA
  mov rax,  SYS_WRITE
  mov rdi,  STDOUT
  mov rsi,  string 
  mov rdx,  3           ; printa apenas os primeiros 3 digitos
  syscall 

  ;EXIT
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
