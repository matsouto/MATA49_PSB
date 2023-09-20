SYS_READ   equ   0
SYS_WRITE  equ   1
SYS_EXIT   equ   60

STDIN      equ   0
STDOUT     equ   1
;------------------------------------

section     .data; declaração e inicialização de dados
frasePar  db  "Qtd de letras PAR" 
lenFrasePar equ   $ - frasePar
fraseImpar  db  "Qtd de letras IMPAR" 
lenFraseImpar equ   $ - fraseImpar

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

  xor rax,rax ; Limpa o registrador

contar:
  cmp byte [rsi + rax], 0  ; Checa se o charactere é o último 
  je  testar 
  inc rax  
  jmp contar

testar:
  test rax,1
  jz   par 
  jnz  impar 

impar:
  ;ESCRITA
  mov rax,  SYS_WRITE
  mov rdi,  STDOUT
  mov rsi,  frasePar 
  mov rdx,  lenFrasePar           
  syscall 
  jmp exit
  
par:
  ;ESCRITA
  mov rax,  SYS_WRITE
  mov rdi,  STDOUT
  mov rsi,  fraseImpar 
  mov rdx,  lenFraseImpar           
  syscall 
  jmp exit

exit:
  ;EXIT
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
