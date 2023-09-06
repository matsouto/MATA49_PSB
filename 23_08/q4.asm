JMP start
var1: DB 25
var2: DB 10
RES: DB 0

start:
  MOV A,[var1]
  MOV B,[var2]
  SUB A,B
  MOV [RES],A

