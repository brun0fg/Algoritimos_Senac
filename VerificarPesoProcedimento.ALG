Algoritmo "semnome"

Var
   i : inteiro
   N, Pesado : caractere
   P, Mai: real

Procedimento Topo()
Inicio

   LimpaTela
   Escreval("-----------------------------------")
   Escreval("D E T E C T O R   DE   P E S A D O ")
   Escreval(" Maior Peso ate agora: ", Mai, " Kg")
   Escreval("-----------------------------------")

FimProcedimento
Inicio

   Topo()
   
   Para i de 1 ate 5 faca
      Escreval("Digite o nome: ")
      Leia(N)
      Escreva("Digite o peso de ", N, ": ")
      Leia(P)
      Se (P>Mai) entao
         Mai <- P
         Pesado <- N
      Fimse
   Topo()
   FimPara
   
   Topo()
   Escreval(" A pessoa mais pesada foi ", Pesado, ",Com ", Mai, " quilos. ")



Fimalgoritmo