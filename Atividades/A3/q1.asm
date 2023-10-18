;MATA49	- PROGRAMAÇÃO DE SOFTWARE BÁSICO - T01
;ATIVIDADE PRÁTICA 3
;MATHEUS MONTEIRO SOUTO - 223215395

;------------------------------------
SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

STDIN equ 0
STDOUT equ 1
;------------------------------------

bits 64
global  main
extern printf
extern scanf

section .text
main:
  push rbp
  mov rbp, rsp

  ; Solicitação do dado 1
  mov rax, 1
  mov rsi, rax
  mov rdi, initial_message ; String de formatação
  call printf

  mov rsi, idade1
  mov rdi, format_alt
  call scanf

  ; Solicitação do dado 2
  mov rax, 2
  mov rsi, rax
  mov rdi, initial_message
  call printf

  mov rsi, idade2
  mov rdi, format_alt
  call scanf

  ; Solicitação do dado 3
  mov rax, 3
  mov rsi, rax
  mov rdi, initial_message
  call printf

  mov rsi, idade3
  mov rdi, format_alt
  call scanf

  ; Solicitação do dado 4
  mov rax, 4
  mov rsi, rax
  mov rdi, initial_message
  call printf

  mov rsi, idade4
  mov rdi, format_alt
  call scanf

mean:
  movq xmm0, [idade1]
  movq xmm1, [idade2]
  movq xmm2, [idade3]
  movq xmm3, [idade4]
  addsd xmm0, xmm1
  addsd xmm0, xmm2
  addsd xmm0, xmm3

  movq xmm4, [total]
  divsd xmm0,xmm4
  
  movq [output], xmm0
  mov rdi, final_message
  mov rsi, [output]
  call printf

exit:
  mov rax,SYS_EXIT
  mov rdi, 0
  syscall

;------------------------------------
section   .data
  initial_message db "Forneça a altura da pessoa %d:", 10, 0
  final_message db "A média é: %f:", 10, 0
  format_alt dq "%lf",0
  total dq 4.0,0
    
section .bss
  idade1 resq 1
  idade2 resq 1
  idade3 resq 1
  idade4 resq 1
  output resq 2
  
  
