Algoritmo "SistemaDeGestaoEscolar_Opcao1"

// Descrio : Sub versao do sistema princial integrado de console para gestao
//           escolar que centraliza a secao 1: o cadastro de alunos
// Autor(a)  : Mykaelly Cabral Leite
// Data atual: 30/07/2026

Var
   // Armazenamento Geral (ate 50 alunos e 20 questes)
   Nome: vetor[1..50] de caractere
   Gabarito: vetor[1..20] de caractere
   Respostas: vetor[1..20] de caractere
   Acertos: vetor[1..20] de inteiro
   Presencas: vetor[1..50] de inteiro
   NomeProfessor, NivelEnsino, SerieAno, NumeroTurma, AnoLetivo: caractere

   // Controle de Fluxo e Limites
   OpcaoMenu, TotalAlunos, TotalQuestoes, TotalAulas: inteiro
   C, C2: inteiro
   TurmaCadastrada: logico
   LimiteOpcao, Reiniciar, Confirma: caractere
   GabaritoOk, AlunoOk: logico

Inicio

   TurmaCadastrada <- Falso
   TotalAlunos <- 0

   Repita
      Limpatela
      Escreval("========================================")
      Escreval("      SISTEMA DE GESTAO ESCOLAR         ")
      Escreval("========================================")
      Escreval("")
      Escreval("  1 - Cadastro de Turma")
      Escreval("  2 - Correcao de Provas")
      Escreval("  3 - Registro de Frequencia")
      Escreval("  4 - Boletins da Turma")
      Escreval("  5 - Consultas e Relatorios Analticos")
      Escreval("  6 - Encerrar Sistema")
      Escreval("")
      Escreval("========================================")
      Escreva("Escolha uma opcao: ")
      Leia(OpcaoMenu)

      Escolha OpcaoMenu
              Caso 1
              Repita
                   Se TurmaCadastrada = falso entao

                        // --------------------------------------------------
                        // 1 - CADASTRO DE TURMA
                        // --------------------------------------------------
                        Repita
                             Limpatela
                             Escreval("--- CADASTRO DE TURMA ---")
                             Escreval("")

                             // Coleta das informaes gerais da turma
                             Escreva("Nome do(a) Professor(a): ")
                             Leia(NomeProfessor)
                             Enquanto NomeProfessor = "" faca
                                  Escreval("O nome do professor nao pode ficar em branco. Digite novamente:")
                                  Leia(NomeProfessor)
                             Fimenquanto

                             Escreva("Nivel de ensino (ex: Ensino Fundamental / Ensino Medio): ")
                             Leia(NivelEnsino)
                             Enquanto NivelEnsino = "" faca
                                  Escreval("Esta secao nao pode ficar em branco. Informe o nivel de ensino:")
                                  Leia(NivelEnsino)
                             Fimenquanto

                             Escreva("Serie/Ano (ex: 1 Ano, 8 Ano): ")
                             Leia(SerieAno)
                             Enquanto SerieAno = "" faca
                                  Escreval("Esta secao nao pode ficar em branco. Informe a serie/ ano:")
                                  Leia(SerieAno)
                             Fimenquanto

                             Escreva("Numero/Identificador da turma (ex: Turma A, 1001): ")
                             Leia(NumeroTurma)
                             Enquanto NumeroTurma = "" faca
                                  Escreval("Esta secao nao pode ficar em branco. Informe um identificador:")
                                  Leia(NumeroTurma)
                             Fimenquanto

                             Escreva("Ano letivo (ex: 2026): ")
                             Leia(AnoLetivo)
                             Enquanto AnoLetivo = "" faca
                                  Escreval("Esta secao nao pode ficar em branco. Informe o ano letivo:")
                                  Leia(AnoLetivo)
                             Fimenquanto

                             Escreval("")
                             Escreva("Quantos alunos deseja cadastrar na turma? (max 50):")
                             Leia(TotalAlunos)
                             Enquanto (TotalAlunos < 1) ou (TotalAlunos > 50) faca
                                  Escreval("Quantidade invalida! Digite um valor entre 1 e 50:")
                                  Leia(TotalAlunos)
                             Fimenquanto

                             Escreval("")
                             Escreval("--- CADASTRO DE ALUNOS ---")
                             Para C <- 1 ate TotalAlunos faca
                                  Escreval("Informe o nome do ", C, " aluno:")
                                  Leia(Nome[C])
                                  Enquanto Nome[C] = "" faca
                                       Escreval("O nome nao pode ficar em branco. Digite novamente:")
                                       Leia(Nome[C])
                                  Fimenquanto
                             Fimpara

                             // --------------------------------------------------
                             // EXIBIO DO RESUMO E CONFIRMAO
                             // --------------------------------------------------
                             Limpatela
                             Escreval("========================================")
                             Escreval("      RESUMO DA TURMA CADASTRADA       ")
                             Escreval("========================================")
                             Escreval("Professor(a) : ", NomeProfessor)
                             Escreval("Nivel        : ", NivelEnsino)
                             Escreval("Serie/Ano    : ", SerieAno)
                             Escreval("Turma        : ", NumeroTurma)
                             Escreval("Ano Letivo   : ", AnoLetivo)
                             Escreval("Total Alunos : ", TotalAlunos)
                             Escreval("----------------------------------------")
                             Escreval("LISTA DE ALUNOS CADASTRADOS:")
                             Escreval("----------------------------------------")
                             Para C <- 1 ate TotalAlunos faca
                                  Escreval(C:2, " - ", Nome[C])
                             Fimpara
                             Escreval("========================================")
                             Escreval("")

                             Repita
                                  Escreva("As informacoes acima estao corretas? (S = Salvar / N = Refazer cadastro) [S/N]: ")
                                  Leia(Confirma)
                                  Confirma <- Maiusc(Confirma)

                                  Se (Confirma <> "S") e (Confirma <> "N") entao
                                       Escreva("Opcao invalida! Digite apenas S ou N.")
                                  Fimse

                             Ate (Confirma = "S") ou (Confirma = "N")

                             Se Confirma = "S" entao
                                  TurmaCadastrada <- verdadeiro
                                  Escreval("")
                                  Escreval("-> Turma cadastrada com sucesso! Pressione ENTER para voltar ao menu.")
                                  Leia(Reiniciar)
                             Senao
                                  Se Confirma = "N" entao
                                       TurmaCadastrada <- falso
                                  Fimse
                             Fimse

                        Ate Turmacadastrada = verdadeiro
                        
                   Senao
                   
                        Se TurmaCadastrada = verdadeiro entao
                             Limpatela
                             escreval("======================================")
                             escreval("      TURMA JA CADASTRADA")
                             escreval("======================================")
                             escreval("Professor: ", NomeProfessor)
                             escreval("Serie: ", SerieAno)
                             escreval("Quantidade de alunos: ", TotalAlunos)
                             escreval("")
                             escreval("Lista de alunos:")

                             Para C <- 1 ate TotalAlunos faca
                                  escreval(C, " - ", Nome[C])
                             Fimpara

                             escreval("")

                             Repita
                                  escreva("Deseja refazer o cadastro? (S/N): ")
                                  leia(Confirma)
                                  Confirma <- Maiusc(Confirma)

                                  Se (Confirma <> "S") e (Confirma <> "N") entao
                                       escreval("Opcao invalida! Digite apenas S ou N.")
                                  Fimse

                             Ate (Confirma = "S") ou (Confirma = "N")

                             Se Confirma = "N" entao
                                  escreval("")
                                  escreval("Ok! Pressione ENTER quando quiser voltar ao menu inicial...")
                                  leia(Reiniciar)
                             Senao
                                  Se Confirma = "S" entao
                                       TurmaCadastrada <- falso
                                  Fimse
                             Fimse
                        Fimse
                   Fimse
              Ate TurmaCadastrada = verdadeiro

                   Limpatela
                   OpcaoMenu <- 0
           
              Caso 2
                   Limpatela
                   Escreval("========================================")
                   Escreval("ESSA SECAO ESTA EM MANUTENCAO!":40)
                   Escreval("========================================")
                   Escreval("")
                   Escreval("Pressione ENTER para voltar ao menu principal...")
                   Leia(Reiniciar)

              Caso 3
                   Limpatela
                   Escreval("========================================")
                   Escreval("ESSA SECAO ESTA EM MANUTENCAO!":40)
                   Escreval("========================================")
                   Escreval("")
                   Escreval("Pressione ENTER para voltar ao menu principal...")
                   Leia(Reiniciar)

              Caso 4
                   Limpatela
                   Escreval("========================================")
                   Escreval("ESSA SECAO ESTA EM MANUTENCAO!":40)
                   Escreval("========================================")
                   Escreval("")
                   Escreval("Pressione ENTER para voltar ao menu principal...")
                   Leia(Reiniciar)

              Caso 5
                   Limpatela
                   Escreval("========================================")
                   Escreval("ESSA SECAO ESTA EM MANUTENCAO!":40)
                   Escreval("========================================")
                   Escreval("")
                   Escreval("Pressione ENTER para voltar ao menu principal...")
                   Leia(Reiniciar)
           
              Caso 6
                   opcaomenu <- 6
            
              OutroCaso
              Limpatela
              Escreval("========================================================")
              Escreval("Opcao invalida! Pressione ENTER para tentar novamente...")
              Escreval("========================================================")
              Escreval("")
              Leia(Reiniciar)

      FimEscolha
      
   Ate OpcaoMenu = 6
   
Fimalgoritmo