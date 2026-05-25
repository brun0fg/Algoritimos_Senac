 Algoritmo "Padaria"

Tipo Itens = Registro
   codigo : inteiro
   nome : caractere
   preco : real
   custo : real
   qnt : inteiro
   estoqueMin : inteiro
   validade : inteiro
   total : real
Fimregistro

Var
   vendas: vetor[1..20,1..7] de inteiro
   opcao : inteiro
   produtos : vetor[1..20] de Itens
   faturamentoTotal : real
   lucroTotal : real

   // NOVA VARIÁVEL CONTROLADORA
   total_cadastrado : inteiro

// =====================================================
// MOSTRAR LISTA
// =====================================================
Procedimento mostrar_lista()
Var
   i : inteiro
Inicio
   LimpaTela()
   Escreval("LISTA DE PRODUTOS")
   Escreval()
   Escreval("i | Codigo | Nome | Preco | Estoque")

   Para i de 1 ate 20 faca
      // Só mostra se o código for maior que zero (produto válido)
      Se(produtos[i].codigo > 0) entao
         Escreva(i)
         Escreva(" | ", produtos[i].codigo)
         Escreva(" | ", produtos[i].nome)
         Escreva(" | ", produtos[i].preco:0:2)
         Escreval(" | ", produtos[i].qnt)
      Fimse
   Fimpara
   Escreval()
Fimprocedimento

// =====================================================
// FUNÇÃO RECURSIVA
// =====================================================
Funcao totalSemana(produto: inteiro; dia : inteiro) : inteiro
Inicio
   Se(dia = 0) entao
      Retorne 0
   Senao
      Retorne vendas[produto,dia] + totalSemana(produto,dia-1)
   Fimse
Fimfuncao

// =====================================================
// ADICIONAR PRODUTO (Lógica infalível por contador)
// =====================================================
Procedimento add()
Var
   posicao_livre : inteiro
Inicio
   LimpaTela()

   // Se já cadastrou 20, barra o usuário
   Se (total_cadastrado >= 20) entao
      Escreval("Erro: Limite de cadastro atingido (máximo 20 produtos)!")
      Escreval()
   Senao
      // A posição livre sempre será o total atual + 1
      posicao_livre <- total_cadastrado + 1

      Escreval("ADD PRODUTO")
      Escreval()

      Escreva("Codigo: ")
      Leia(produtos[posicao_livre].codigo)
      Escreva("Nome do produto: ")
      Leia(produtos[posicao_livre].nome)
      Escreva("Preco de venda: ")
      Leia(produtos[posicao_livre].preco)
      Escreva("Custo do produto: ")
      Leia(produtos[posicao_livre].custo)
      Escreva("Quantidade em estoque: ")
      Leia(produtos[posicao_livre].qnt)
      Escreva("Estoque minimo: ")
      Leia(produtos[posicao_livre].estoqueMin)
      Escreva("Dias para vencer: ")
      Leia(produtos[posicao_livre].validade)

      produtos[posicao_livre].total <- produtos[posicao_livre].preco * produtos[posicao_livre].qnt

      // Incrementa o contador de produtos controlados
      total_cadastrado <- total_cadastrado + 1

      LimpaTela()
      Escreval("OK - Produto adicionado!")
   Fimse
Fimprocedimento

// =====================================================
// ALTERAR PRODUTO
// =====================================================
Procedimento alterar()
Var
   i : inteiro
Inicio
   LimpaTela()
   Escreval("ALTERAR PRODUTO")
   Escreval()
   mostrar_lista()

   Escreva("Informe o i do produto: ")
   Leia(i)

   Se (i >= 1) e (i <= total_cadastrado) entao
      Escreva("Codigo: ")
      Leia(produtos[i].codigo)
      Escreva("Nome: ")
      Leia(produtos[i].nome)
      Escreva("Preco: ")
      Leia(produtos[i].preco)
      Escreva("Custo: ")
      Leia(produtos[i].custo)
      Escreva("Quantidade: ")
      Leia(produtos[i].qnt)
      Escreva("Estoque minimo: ")
      Leia(produtos[i].estoqueMin)
      Escreva("Validade: ")
      Leia(produtos[i].validade)

      produtos[i].total <- produtos[i].qnt * produtos[i].preco
      LimpaTela()
      Escreval("Produto atualizado!")
   Senao
      Escreval("Posicao invalida ou vazia!")
   Fimse
Fimprocedimento

// =====================================================
// REMOVER PRODUTO (Zera o código para desativar)
// =====================================================
Procedimento remover()
Var
   i : inteiro
Inicio
   LimpaTela()
   Escreval("REMOVER PRODUTO")
   Escreval()
   mostrar_lista()

   Escreva("Informe o i do produto: ")
   Leia(i)

   Se (i >= 1) e (i <= 20) entao
      produtos[i].codigo <- 0
      produtos[i].nome <- ""
      produtos[i].preco <- 0
      produtos[i].custo <- 0
      produtos[i].qnt <- 0
      produtos[i].estoqueMin <- 0
      produtos[i].validade <- 0
      produtos[i].total <- 0
      Escreval("Produto removido do sistema!")
   Senao
      Escreval("Posicao invalida!")
   Fimse
Fimprocedimento

// =====================================================
// BUSCA LINEAR POR NOME
// =====================================================
Procedimento buscar_nome()
Var
   busca : caractere
   i : inteiro
   encontrou : logico
Inicio
   encontrou <- falso
   Escreva("Digite o nome do produto: ")
   Leia(busca)

   Para i de 1 ate total_cadastrado faca
      Se(produtos[i].codigo > 0) e (produtos[i].nome = busca) entao
         Escreval("Produto encontrado!")
         Escreval("Codigo: ", produtos[i].codigo)
         Escreval("Preco: ", produtos[i].preco:0:2)
         Escreval("Quantidade: ", produtos[i].qnt)
         encontrou <- verdadeiro
      Fimse
   Fimpara

   Se(encontrou = falso) entao
      Escreval("Produto nao encontrado!")
   Fimse
Fimprocedimento

// =====================================================
// ORDENAR POR CODIGO
// =====================================================
Procedimento ordenar_codigo()
Var
   i,j,menor, k, auxVenda : inteiro
   aux : Itens
Inicio
   // Ordena apenas o intervalo que possui produtos reais cadastrados
   Se (total_cadastrado > 1) entao
      Para i de 1 ate total_cadastrado - 1 faca
         menor <- i
         Para j de i+1 ate total_cadastrado faca
            Se (produtos[j].codigo < produtos[menor].codigo) e (produtos[j].codigo > 0) entao
               menor <- j
            Fimse
         Fimpara

         aux <- produtos[i]
         produtos[i] <- produtos[menor]
         produtos[menor] <- aux

         Para k de 1 ate 7 faca
            auxVenda <- vendas[i, k]
            vendas[i, k] <- vendas[menor, k]
            vendas[menor, k] <- auxVenda
         Fimpara
      Fimpara
   Fimse
Fimprocedimento

// =====================================================
// BUSCA BINÁRIA
// =====================================================
Procedimento busca_binaria()
Var
   codigoBusca : inteiro
   inicioBusca : inteiro
   fimBusca : inteiro
   meio : inteiro
   encontrou : logico
Inicio
   ordenar_codigo()
   encontrou <- falso
   inicioBusca <- 1
   fimBusca <- total_cadastrado

   Escreva("Digite o codigo: ")
   Leia(codigoBusca)

   Enquanto(inicioBusca <= fimBusca) faca
      meio <- (inicioBusca + fimBusca) div 2

      Se(produtos[meio].codigo = codigoBusca) e (produtos[meio].codigo > 0) entao
         Escreval("Produto encontrado!")
         Escreval("Nome: ", produtos[meio].nome)
         Escreval("Preco: ", produtos[meio].preco:0:2)
         Escreval("Quantidade: ", produtos[meio].qnt)
         encontrou <- verdadeiro
         Interrompa
      Senao
         Se(codigoBusca > produtos[meio].codigo) entao
            inicioBusca <- meio + 1
         Senao
            fimBusca <- meio - 1
         Fimse
      Fimse
   Fimenquanto

   Se(encontrou = falso) entao
      Escreval("Produto nao encontrado!")
   Fimse
Fimprocedimento

// =====================================================
// REGISTRAR VENDA
// =====================================================
Procedimento registrar_venda()
Var
   codigoBusca : inteiro
   i : inteiro
   quantidade : inteiro
   dia : inteiro
   pagamento : caractere
   valorVenda : real
   desconto : real
   encontrou : logico
Inicio
   encontrou <- falso
   Escreva("Codigo do produto: ")
   Leia(codigoBusca)

   Para i de 1 ate total_cadastrado faca
      Se(produtos[i].codigo = codigoBusca) e (produtos[i].codigo > 0) entao
         encontrou <- verdadeiro
         Escreva("Quantidade vendida: ")
         Leia(quantidade)

         Se(produtos[i].qnt >= quantidade) entao
            Escreva("Forma de pagamento (dinheiro/cartao): ")
            Leia(pagamento)

            desconto <- 0
            Se(quantidade >= 10) ou (pagamento = "dinheiro") entao
               desconto <- 0.05
            Fimse

            valorVenda <- quantidade * produtos[i].preco
            valorVenda <- valorVenda - (valorVenda * desconto)

            faturamentoTotal <- faturamentoTotal + valorVenda
            lucroTotal <- lucroTotal + ((produtos[i].preco - produtos[i].custo) * quantidade)
            produtos[i].qnt <- produtos[i].qnt - quantidade

            Escreva("Dia da venda (1 a 7): ")
            Leia(dia)

            Se (dia >= 1) e (dia <= 7) entao
               vendas[i,dia] <- vendas[i,dia] + quantidade
            Fimse

            Escreval("Venda realizada!")
            Escreval("Valor final: ", valorVenda:0:2)

            Se(produtos[i].qnt < produtos[i].estoqueMin) entao
               Escreval("ALERTA DE ESTOQUE BAIXO!")
            Fimse

            Se(produtos[i].validade <= 2) e (produtos[i].qnt > 0) entao
               Escreval("PROMOCAO SUGERIDA!")
            Fimse
         Senao
            Escreval("Estoque insuficiente!")
         Fimse
      Fimse
   Fimpara

   Se(encontrou = falso) entao
      Escreval("Produto nao encontrado!")
   Fimse
Fimprocedimento

// =====================================================
// RELATÓRIO GERAL
// =====================================================
Procedimento relatorio()
Var
   i : inteiro
   maiorVenda : inteiro
   posMaior : inteiro
Inicio
   maiorVenda <- -1
   posMaior <- -1
   LimpaTela()
   Escreval("RELATORIO GERAL")
   Escreval()

   Para i de 1 ate total_cadastrado faca
      Se(produtos[i].codigo > 0) entao
         Escreval("Produto: ", produtos[i].nome)
         Escreval("Total vendido: ", totalSemana(i,7))
         Escreval("Estoque atual: ", produtos[i].qnt)
         Escreval()

         Se(totalSemana(i,7) > maiorVenda) entao
            maiorVenda <- totalSemana(i,7)
            posMaior <- i
         Fimse
      Fimse
   Fimpara

   Escreval("Faturamento total: ", faturamentoTotal:0:2)
   Escreval("Lucro total: ", lucroTotal:0:2)

   Se (posMaior <> -1) entao
      Escreval("Produto mais vendido: ", produtos[posMaior].nome)
   Senao
      Escreval("Nenhum produto cadastrado/vendido ainda.")
   Fimse
Fimprocedimento

// =====================================================
// MENU PRINCIPAL
// =====================================================
Inicio
   // Garante que o contador comece rigorosamente em zero
   total_cadastrado <- 0

   Repita
      Escreval("===================================")
      Escreval("SISTEMA DE GERENCIAMENTO DE PADARIA")
      Escreval("===================================")
      Escreval("1 - Ver lista")
      Escreval("2 - Add produto")
      Escreval("3 - Alterar produto")
      Escreval("4 - Remover produto")
      Escreval("5 - Registrar venda")
      Escreval("6 - Buscar por nome")
      Escreval("7 - Busca binaria por codigo")
      Escreval("8 - Relatorio geral")
      Escreval("0 - Sair")
      Escreval()
      Escreva("Digite a opcao: ")
      Leia(opcao)

      Escolha(opcao)
         Caso 1
            mostrar_lista()
         Caso 2
            add()
         Caso 3
            alterar()
         Caso 4
            remover()
         Caso 5
            registrar_venda()
         Caso 6
            buscar_nome()
         Caso 7
            busca_binaria()
         Caso 8
            relatorio()
      FimEscolha
   Ate(opcao = 0)

   Escreval("Bye.")
Fimalgoritmo