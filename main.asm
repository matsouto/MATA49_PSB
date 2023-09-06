global _start: ; global keyword is used make an identified accessible to the linker

_start:
  mov eax, 1 ; 1 represents the system exit cal  
  mov ebx, 42 ; exb represents exit status, can be any integer
  int 0x80 ; performs an interrupt. The processor will transfer control to the interrupt handler 0x80 (SYSTEM CALL)
