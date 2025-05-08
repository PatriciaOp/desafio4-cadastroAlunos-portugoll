algoritmo "cadastro de alunos"


tipo
   // Definição do registro (struct) Aluno
   Aluno = registro
      reg: inteiro
      nome: caractere
      media: real
      situacao: caractere
   fimregistro

var
   N, M, i, j: inteiro                   // N = número de alunos, M = número de avaliações
   somaTemp: real                        // Variável auxiliar para cálculos
   contAprovados, contReprovados: inteiro // Contadores
   indiceMelhor, indicePior: inteiro     // Índices para melhor e pior aluno

   notas: vetor[1..50, 1..50] de real    // Matriz para armazenar as notas
   somaAval: vetor[1..10] de real        // Vetor para somar notas por avaliação
   mediaAval: vetor[1..10] de real       // Vetor para média de cada avaliação
   alunos: vetor[1..100] de Aluno         // Vetor de registros de alunos

inicio
   // 1. Leitura de parâmetros
   escreva("Digite o número de alunos da turma (N): ")
   leia(N)
   escreva("Digite o número de avaliações por aluno (M): ")
   leia(M)

   // Inicializa vetores de soma
   para j de 1 ate M faca
      somaAval[j] <- 0
   fimpara

   // 2 e 3. Estruturas e População de dados
   para i de 1 ate N faca
      limpatela
      escreval("--- Dados do Aluno ", i, " ---")

      escreva("Digite o número de registro: ")
      leia(alunos[i].reg)

      escreva("Digite o nome do aluno: ")
      leia(alunos[i].nome)
      //escreval("Agora, digite as ", M, " notas do aluno:")
      escreval("Digite as notas do aluno:")

      // Lê as notas de cada avaliação para o aluno atual
      para j de 1 ate M faca
         escreva("Nota da avaliação ", j, ": ")
         leia(notas[i, j])

         // Acumula a nota na soma da avaliação
         somaAval[j] <- somaAval[j] + notas[i, j]
      fimpara
   fimpara

   // 4. Cálculos

   // Calcula a média de cada avaliação
   para j de 1 ate M faca
      mediaAval[j] <- somaAval[j] / N
   fimpara

   // Inicializa contadores e índices
   contAprovados <- 0
   contReprovados <- 0
   indiceMelhor <- 1
   indicePior <- 1

   // Calcula a média de cada aluno e define sua situação
   para i de 1 ate N faca
      somaTemp <- 0

      para j de 1 ate M faca
         somaTemp <- somaTemp + notas[i, j]
      fimpara

      alunos[i].media <- somaTemp / M

      // Define a situação do aluno
      se alunos[i].media >= 6.0 entao
         alunos[i].situacao <- "Aprovado"
         contAprovados <- contAprovados + 1
      senao
         alunos[i].situacao <- "Reprovado"
         contReprovados <- contReprovados + 1
      fimse

      // Verifica se é o melhor ou pior aluno
      se alunos[i].media > alunos[indiceMelhor].media entao
         indiceMelhor <- i
      fimse

      se alunos[i].media < alunos[indicePior].media entao
         indicePior <- i
      fimse
   fimpara

   // 5. Saídas
   limpatela

   // Médias por avaliação
   escreval("===== MÉDIAS POR AVALIAÇÃO =====")
   para j de 1 ate M faca
      escreval("Média da Avaliação ", j, ": ", mediaAval[j]:4:2)
   fimpara

   escreval()
   escreval("===== LISTA DE ALUNOS =====")

   // Lista de alunos com suas informações
   para i de 1 ate N faca
      escreval("Registro: ", alunos[i].reg)
      escreval("Nome: ", alunos[i].nome)
      escreval("Média: ", alunos[i].media:4:2)
      escreval("Situação: ", alunos[i].situacao)
      escreval("----------------------------")
   fimpara

   // Contagem de aprovados e reprovados
   escreval()
   escreval("===== ESTATÍSTICAS DA TURMA =====")
   escreval("Total de alunos aprovados: ", contAprovados)
   escreval("Total de alunos reprovados: ", contReprovados)

   // Melhor e pior aluno
   escreval()
   escreval("===== DESEMPENHO DESTACADO =====")
   escreval("MELHOR ALUNO:")
   escreval("Nome: ", alunos[indiceMelhor].nome)
   escreval("Média: ", alunos[indiceMelhor].media:4:2)

   escreval()
   escreval("PIOR ALUNO:")
   escreval("Nome: ", alunos[indicePior].nome)
   escreval("Média: ", alunos[indicePior].media:4:2)

fimalgoritmo