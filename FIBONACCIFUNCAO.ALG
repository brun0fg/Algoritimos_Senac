Algoritmo "FibonacciFuncao"
Var
   i , T1, T2, T3 : Inteiro
Funcao ProximoFibonacci(Var N1, N2 : Inteiro) : inteiro
Var
   N3 : inteiro

Inicio
   N3 <- N1 + N2
   N1 <- N2
   N2<- N3
   Retorne N3

FimFuncao

Inicio

   T1 <- 0
   Escreval( T1)
   T2 <- 1
   Escreval( T2)
   Para i de 3 ate 5 faca
      T3 <- ProximoFibonacci(T1, T2)
      Escreval(T3)
   Fimpara

Fimalgoritmo