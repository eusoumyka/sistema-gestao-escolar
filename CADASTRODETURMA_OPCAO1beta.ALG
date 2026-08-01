Algoritmo "SistemaDeGestaoEscolar_Opcao1"

// Descricao : Sub versao do sistema principal integrado de console para gestao
//           escolar que centraliza a secao 1: o cadastro de alunos
// Autor(a)  : Mykaelly Cabral Leite
// Data atual: 30/07/2026

Var
   // Armazenamento Geral (ate 50 alunos e 20 questoes)
   Nome: vetor[1..50] de caractere
   Gabarito: vetor[1..20] de caractere
   Respostas: vetor[1..20] de caractere
   Acertos: vetor[1..20] de inteiro
   Presencas: vetor[1..50] de inteiro
   NomeProfessor, NivelEnsino, SerieAno, NumeroTurma, AnoLetivo: caractere

   // Controle de Fluxo e Limites
   OpcaoMenu, TotalAlunos, TotalQuestoes, TotalAulas: inteiro
   C, C2, IndiceAluno, OpcaoEdicao: inteiro
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
      Escreval("  5 - Consultas e Relatorios Analiticos")
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

                             // Coleta das informacoes gerais da turma
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
                             Escreva("Quantos alunos deseja cadastrar na turma? (max 50): ")
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
                             // EXIBICAO DO RESUMO E CONFIRMACAO
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
                                       Escreval("Opcao invalida! Digite apenas S ou N.")
                                  Fimse

                             Ate (Confirma = "S") ou (Confirma = "N")

                             Se Confirma = "S" entao
                                  TurmaCadastrada <- verdadeiro
                                  Escreval("")
                                  Escreval("-> Turma cadastrada com sucesso! Pressione ENTER para voltar ao menu.")
                                  Leia(Reiniciar)
                             Senao
                                  TurmaCadastrada <- falso
                             Fimse

                        Ate TurmaCadastrada = verdadeiro

                   Senao

                        Se TurmaCadastrada = verdadeiro entao
                             Limpatela
                             Escreval("======================================")
                             Escreval("      TURMA JA CADASTRADA")
                             Escreval("======================================")
                             Escreval("Professor: ", NomeProfessor)
                             Escreval("Serie: ", SerieAno, " | Turma: ", NumeroTurma)
                             Escreval("Quantidade de alunos: ", TotalAlunos)
                             Escreval("--------------------------------------")
                             Escreval("LISTA DE ALUNOS:")
                             Para C <- 1 ate TotalAlunos faca
                                  Escreval(C:2, " - ", Nome[C])
                             Fimpara
                             Escreval("======================================")
                             Escreval("")
                             Escreval("OPCOES DE EDICAO:")
                             Escreval("  1 - Alterar apenas dados da turma")
                             Escreval("  2 - Modificar lista de alunos")
                             Escreval("  3 - Refazer TODO o cadastro do zero")
                             Escreval("  4 - Voltar ao menu principal")
                             Escreval("")
                             Escreva("Escolha uma opcao: ")
                             Leia(OpcaoEdicao)

                             Escolha OpcaoEdicao
                                  Caso 1
                                       Limpatela
                                       Escreval("--- EDICAO DE DADOS DA TURMA ---")
                                       Escreva("Nome do(a) Professor(a) [Atual: ", NomeProfessor, "]: ")
                                       Leia(NomeProfessor)
                                       Escreva("Nivel de ensino [Atual: ", NivelEnsino, "]: ")
                                       Leia(NivelEnsino)
                                       Escreva("Serie/Ano [Atual: ", SerieAno, "]: ")
                                       Leia(SerieAno)
                                       Escreva("Numero/Turma [Atual: ", NumeroTurma, "]: ")
                                       Leia(NumeroTurma)
                                       Escreva("Ano Letivo [Atual: ", AnoLetivo, "]: ")
                                       Leia(AnoLetivo)
                                       Escreval("")
                                       Escreval("-> Dados da turma atualizados com sucesso!")
                                       Leia(Reiniciar)

                                  Caso 2
                                       Limpatela
                                       Escreval("--- MODIFICAR LISTA DE ALUNOS ---")
                                       Escreval("1 - Alterar nome de um aluno especifico")
                                       Escreval("2 - Adicionar um novo aluno")
                                       Escreval("3 - Remover o ultimo aluno")
                                       Escreval("")
                                       Escreva("Escolha: ")
                                       Leia(IndiceAluno)

                                       Se IndiceAluno = 1 entao
                                            Escreva("Informe o numero do aluno (1 a ", TotalAlunos, "): ")
                                            Leia(C2)
                                            Se (C2 >= 1) e (C2 <= TotalAlunos) entao
                                                 Escreva("Novo nome para o aluno ", C2, " [Atual: ", Nome[C2], "]: ")
                                                 Leia(Nome[C2])
                                                 Escreval("-> Nome atualizado!")
                                            Senao
                                                 Escreval("-> Numero invalido!")
                                            Fimse
                                       Senao
                                            Se (IndiceAluno = 2) e (TotalAlunos < 50) entao
                                                 TotalAlunos <- TotalAlunos + 1
                                                 Escreva("Nome do novo aluno: ")
                                                 Leia(Nome[TotalAlunos])
                                                 Escreval("-> Aluno adicionado!")
                                            Senao
                                                 Se (IndiceAluno = 3) e (TotalAlunos > 1) entao
                                                      Nome[TotalAlunos] <- ""
                                                      TotalAlunos <- TotalAlunos - 1
                                                      Escreval("-> Ultimo aluno removido!")
                                                 Senao
                                                      Escreval("-> Operacao nao realizada!")
                                                 Fimse
                                            Fimse
                                       Fimse
                                       Leia(Reiniciar)

                                  Caso 3
                                       TurmaCadastrada <- falso

                                  Caso 4
                                       // Retorna mantendo a turma cadastrada
                                       OpcaoEdicao <- 4

                                  OutroCaso
                                       Escreval("Opcao invalida!")
                                       Leia(Reiniciar)
                             FimEscolha

                        Fimse
                   Fimse
              Ate (TurmaCadastrada = verdadeiro) ou (TurmaCadastrada = falso)

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