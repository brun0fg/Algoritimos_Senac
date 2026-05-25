Algoritmo "FatorialFuncao"
Var
   N, F: Inteiro

Funcao Fatorial(V: inteiro) : inteiro

Var
   C, R : inteiro

Inicio
   R <- 1
   Para C de 1 ate V faca
      R <- R * C
      Retorne R
   FimPara
FimFuncao

Inicio
   Escreva("Digite um numero: ")
   Leia(N)
   F <- Fatorial(N)
   Escreval( " O valor de ", N, "! é igual a ", F)


Fimalgoritmo