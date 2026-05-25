Algoritmo "ParOuImparFuncao"

Var
   N: Inteiro
   R: Caractere

Funcao ParOuImpar(V : inteiro) : inteiro
Inicio
   Se (V%2 = 0) entao
      Retorne "PAR"
   Senao
      Retorne "IMPAR"
   FimSe


FimFuncao


Inicio

   Escreva("Digite um numero: ")
   Leia(N)
   R <- ParOuImpar(N)
   Escreva("O numero ", N, " é um valor ", R)



Fimalgoritmo