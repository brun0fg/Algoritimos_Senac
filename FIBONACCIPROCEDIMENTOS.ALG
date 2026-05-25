Algoritmo "FibonacciProcedimentos"

Var
   C, T1, T2, T3 : inteiro

Procedimento ProximoFibonacci (Var A, B: inteiro)
Var C: inteiro

inicio
      C <- A + B
       Escreva (C)
       A <- B
       B <- C
Fimprocedimento
Inicio
  T1 <- 0
  Escreval (T1)
  T2 <- 1
  Escreva (T2)
  Para C <- 1 ate 13 faca
       ProximoFibonacci (T1, T2)

  Fimpara
Fimalgoritmo