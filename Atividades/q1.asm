SYS_READ   equ   0
SYS_WRITE  equ   1
SYS_EXIT   equ   60

STDIN      equ   0
STDOUT     equ   1
;------------------------------------

section     .data; declaração e inicialização de dados
mensagem    db " é bem-vindo(a) ao semestre da disciplina de PSB"
lenMensagem equ $-mensagem; tamanho da string mensagem

;------------------------------------

section .bss; declaração sem inicialização das informações que serão usadas
nome     resb 10; reserva 10 bytes para a variável nome
lenNome  equ $-nome 

;------------------------------------

section .text
global  _start

_start:
  ;LEITURA
	mov rax,  SYS_READ; índice da syscall: sys_read
	mov rdi,  STDIN; índice de destino de operações com string: fd_stdin
	mov rsi,  nome; índice de origem em comandos de manipulação de string
	mov rdx,  lenNome; armazena dados durante operações entrada/saída
	syscall

  ;ESCREVE NOME
  mov rax,  SYS_WRITE
  mov rdi,  STDOUT
  mov rsi,  nome
  mov rdx,  lenNome
  syscall 

  ;ESCREVE MENSAGEM
  mov rax,  SYS_WRITE
  mov rdi,  STDOUT
  mov rsi,  mensagem
  mov rdx,  lenMensagem
  syscall 

  ;EXIT
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
