Algoritmo "SistemaGerenciamentoPadaria"
Const
   MAX_PRODUTOS = 20
   MAX_DIAS = 7

Var
   codigos: vetor[1..MAX_PRODUTOS] de inteiro
   nomes: vetor[1..MAX_PRODUTOS] de caractere
   precos: vetor[1..MAX_PRODUTOS] de real
   custo: vetor[1..MAX_PRODUTOS] de real
   estoques: vetor[1..MAX_PRODUTOS] de inteiro
   estoqueMinimos: vetor[1..MAX_PRODUTOS] de inteiro
   diasParaVencer : vetor[1..MAX_PRODUTOS] de inteiro
   
   vendas: vetor[1..MAX_PRODUTOS, 1..MAX_DIAS] de inteiro
   faturamentoProduto: vetor[1..MAX_PRODUTOS] de real
   lucroProduto: vetor[1..MAX_PRODUTOS] de real
   qtdProdutos: inteiro
   opcao: inteiro
   
   

Inicio



Fimalgoritmo