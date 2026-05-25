Algoritmo "Lista_churrasco

Tipo Produto = Registro
   nome : caractere
   preco, qnt, total : real
Fimregistro

Var

   opcao : inteiro
   ingredientes :  vetor[1..5] de Produto

Funcao pegar_prox_posicao_livre() : inteiro
Var
   i : inteiro
Inicio
   Para i de 1 ate 5 faca
      Se(ingredientes[i].nome = "") entao
         Retorne i
         Interrompa
      Fimse
   Fimpara
Fimfuncao


Procedimento mostrar_lista()
Var
   i : inteiro
Inicio
   LimpaTela()

   Escreval("LISTA DE INGREDIENTES ")
   Escreval()

   Escreval(" i | Nome | Preço | Qnt | Total ")

   Para i de 1 ate 5 faca
      Se(ingredientes[i].nome <> "") entao
         Escreva(i)
         Escreva(" | ", ingredientes[i].nome)
         Escreva(" | ", ingredientes[i].preco)
         Escreva(" | ", ingredientes[i].qnt)
         Escreval(" | ", ingredientes[i].total)
      Fimse
   Fimpara

   Escreval()
Fimprocedimento


Procedimento add()
Var
   posicao_livre : inteiro
Inicio
   LimpaTela()

   posicao_livre <- pegar_prox_posicao_livre()

   Escreval("ADD INGREDIENTES NO CHURRASCO")
   Escreval(" Adicionar á posicação: ", posicao_livre)
   Escreval()

   Escreva("Informe o nome do ingrediente: ")
   Leia(ingredientes[posicao_livre].nome)
   Escreva("Digite o preço: ")
   Leia(ingredientes[posicao_livre].preco)
   Escreva("Informe a quantidade: ")
   Leia(ingredientes[posicao_livre].qnt)
   ingredientes[posicao_livre].total <- ingredientes[posicao_livre].qnt*ingredientes[posicao_livre].preco

   LimpaTela()
   Escreval(" OK - Ingrediente add com sucesso")
   Escreval()
Fimprocedimento


Procedimento alterar()
Var
   i : inteiro
Inicio
   LimpaTela()
   Escreval("ALTERAR UM INGREDIENTE")
   Escreval()
   
   mostrar_lista()
   Escreval()
   
   Escreval("ALTERAR UM INGREDIENTE")
   Escreval()
   
   Escreva("Informe o i do ingrediente a ser alterado: ")
   Leia(i)

   Escreva("Informe o nome do ingrediente: ")
   Leia(ingredientes[i].nome)
   Escreva("Digite o preço: ")
   Leia(ingredientes[i].preco)
   Escreva("Informe a quantidade: ")
   Leia(ingredientes[i].qnt)
   ingredientes[i].total <- ingredientes[i].qnt*ingredientes[i].preco

   Limpatela()
   Escreval(" OK - Ingrediente atualizado com sucesso!")
   Escreval()
Fimprocedimento


Procedimento remover()
Var
   i : inteiro
Inicio
   LimpaTela()
   Escreval("REMOVER UM INGREDIENTE")
   Escreval()

   mostrar_lista()
   Escreval()
   
   Escreval("REMOVER UM INGREDIENTE")
   Escreval()

   Escreva("Informe o i do ingrediente a ser removido: ")
   Leia(i)
   
   ingredientes[i].nome <- ""
   ingredientes[i].preco <- 0
   ingredientes[i].qnt <- 0
   ingredientes[i].total <- 0

Fimprocedimento



Inicio
   Repita
      Escreval("Sistema de Calculo do Churrasco")
      Escreval("Selecione uma opção: ")
      Escreval(" 1 - Ver a lista de ingredientes")
      Escreval(" 2 - Add ingredientes")
      Escreval(" 3 - Alterar um ingrediente")
      Escreval(" 4 - Remover um ingrediente")
      Escreval(" 0 - Sair")
      Escreva("Digite a opção: ")
      Leia(opcao)

      Escolha(opcao)
      Caso 1
         mostrar_lista()
      caso 2
         add()
      Caso 3
         alterar()
      Caso 4
         remover()

      FimEscolha

   Ate(opcao = 0)

   Escreval("Bye.")

Fimalgoritmo