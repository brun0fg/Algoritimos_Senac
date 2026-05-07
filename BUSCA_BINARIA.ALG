Algoritmo "Busca_Binaria"

Var

   vet: vetor[1..10] de inteiro
   i, j, menor, posMenor, temp: inteiro
   ini, fim, meio, numero: inteiro
   encontrado: logico

Inicio

   escreval("=== SELECTION SORT + BUSCA BINARIA ===")

   para i de 1 ate 10 faca
      escreva("Digite o numero ", i, ": ")
      leia(vet[i])
   fimpara


   // selection sort


   para i de 1 ate 9 faca

      menor <- vet[i]
      posMenor <- i

      para j de i+1 ate 10 faca

         se vet[j] < menor entao
            menor <- vet[j]
            posMenor <- j
         fimse

      fimpara

      // troca de valores
      temp <- vet[i]
      vet[i] <- vet[posMenor]
      vet[posMenor] <- temp

   fimpara


   // exibir vetor ordenado
   escreval()
   escreval("Vetor ordenado:")

   para i de 1 ate 10 faca
      escreval(vet[i], " ")
   fimpara

   escreval()
   escreval()


// busca binaria

   escreva("Digite o numero que deseja buscar: ")
   leia(numero)

   ini <- 1
   fim <- 10
   encontrado <- falso

   enquanto (ini <= fim) e (encontrado = falso) faca

      meio <- (ini + fim) div 2

      se vet[meio] = numero entao

         encontrado <- verdadeiro

      senao

         se numero < vet[meio] entao
            fim <- meio - 1
         senao
            ini <- meio + 1
         fimse

      fimse

   fimenquanto


   // resultado
   se encontrado entao
      escreval("Numero encontrado na posicao ", meio)
   senao
      escreval("Numero nao encontrado")
   fimse

Fimalgoritmo