algoritmo "cadastro de alunos"


tipo
   // Defini��o do registro (struct) Aluno
   Aluno = registro
      reg: inteiro
      nome: caractere
      media: real
      situacao: caractere
   fimregistro

var
   N, M, i, j: inteiro                   // N = n�mero de alunos, M = n�mero de avalia��es
   somaTemp: real                        // Vari�vel auxiliar para c�lculos
   contAprovados, contReprovados: inteiro // Contadores
   indiceMelhor, indicePior: inteiro     // �ndices para melhor e pior aluno

   notas: vetor[1..50, 1..50] de real    // Matriz para armazenar as notas
   somaAval: vetor[1..10] de real        // Vetor para somar notas por avalia��o
   mediaAval: vetor[1..10] de real       // Vetor para m�dia de cada avalia��o
   alunos: vetor[1..100] de Aluno         // Vetor de registros de alunos

inicio
   // 1. Leitura de par�metros
   escreva("Digite o n�mero de alunos da turma (N): ")
   leia(N)
   escreva("Digite o n�mero de avalia��es por aluno (M): ")
   leia(M)

   // Inicializa vetores de soma
   para j de 1 ate M faca
      somaAval[j] <- 0
   fimpara

   // 2 e 3. Estruturas e Popula��o de dados
   para i de 1 ate N faca
      limpatela
      escreval("--- Dados do Aluno ", i, " ---")

      escreva("Digite o n�mero de registro: ")
      leia(alunos[i].reg)

      escreva("Digite o nome do aluno: ")
      leia(alunos[i].nome)
      //escreval("Agora, digite as ", M, " notas do aluno:")
      escreval("Digite as notas do aluno:")

      // L� as notas de cada avalia��o para o aluno atual
      para j de 1 ate M faca
         escreva("Nota da avalia��o ", j, ": ")
         leia(notas[i, j])

         // Acumula a nota na soma da avalia��o
         somaAval[j] <- somaAval[j] + notas[i, j]
      fimpara
   fimpara

   // 4. C�lculos

   // Calcula a m�dia de cada avalia��o
   para j de 1 ate M faca
      mediaAval[j] <- somaAval[j] / N
   fimpara

   // Inicializa contadores e �ndices
   contAprovados <- 0
   contReprovados <- 0
   indiceMelhor <- 1
   indicePior <- 1

   // Calcula a m�dia de cada aluno e define sua situa��o
   para i de 1 ate N faca
      somaTemp <- 0

      para j de 1 ate M faca
         somaTemp <- somaTemp + notas[i, j]
      fimpara

      alunos[i].media <- somaTemp / M

      // Define a situa��o do aluno
      se alunos[i].media >= 6.0 entao
         alunos[i].situacao <- "Aprovado"
         contAprovados <- contAprovados + 1
      senao
         alunos[i].situacao <- "Reprovado"
         contReprovados <- contReprovados + 1
      fimse

      // Verifica se � o melhor ou pior aluno
      se alunos[i].media > alunos[indiceMelhor].media entao
         indiceMelhor <- i
      fimse

      se alunos[i].media < alunos[indicePior].media entao
         indicePior <- i
      fimse
   fimpara

   // 5. Sa�das
   limpatela

   // M�dias por avalia��o
   escreval("===== M�DIAS POR AVALIA��O =====")
   para j de 1 ate M faca
      escreval("M�dia da Avalia��o ", j, ": ", mediaAval[j]:4:2)
   fimpara

   escreval()
   escreval("===== LISTA DE ALUNOS =====")

   // Lista de alunos com suas informa��es
   para i de 1 ate N faca
      escreval("Registro: ", alunos[i].reg)
      escreval("Nome: ", alunos[i].nome)
      escreval("M�dia: ", alunos[i].media:4:2)
      escreval("Situa��o: ", alunos[i].situacao)
      escreval("----------------------------")
   fimpara

   // Contagem de aprovados e reprovados
   escreval()
   escreval("===== ESTAT�STICAS DA TURMA =====")
   escreval("Total de alunos aprovados: ", contAprovados)
   escreval("Total de alunos reprovados: ", contReprovados)

   // Melhor e pior aluno
   escreval()
   escreval("===== DESEMPENHO DESTACADO =====")
   escreval("MELHOR ALUNO:")
   escreval("Nome: ", alunos[indiceMelhor].nome)
   escreval("M�dia: ", alunos[indiceMelhor].media:4:2)

   escreval()
   escreval("PIOR ALUNO:")
   escreval("Nome: ", alunos[indicePior].nome)
   escreval("M�dia: ", alunos[indicePior].media:4:2)

fimalgoritmo