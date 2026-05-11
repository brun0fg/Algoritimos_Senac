algoritmo "InsertionSort"

var
   vetor: vetor[1..10] de inteiro
   i, j, chave: inteiro

inicio

   // Entrada dos valores
   para i de 1 ate 10 faca
      escreva("Digite o ", i, "º valor: ")
      leia(vetor[i])
   fimpara

   // Algoritmo Insertion Sort
   para i de 2 ate 10 faca
      chave <- vetor[i]
      j <- i - 1

      enquanto (j >= 1) e (vetor[j] > chave) faca
         vetor[j + 1] <- vetor[j]
         j <- j - 1
      fimenquanto

      vetor[j + 1] <- chave
   fimpara

   // Exibição do vetor ordenado
   escreval("")
   escreval("Vetor ordenado:")

   para i de 1 ate 10 faca
      escre(vetor[i], " ")
   fimpara

fimalgoritmo