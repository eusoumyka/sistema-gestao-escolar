Algoritmo "SistemaDeGestaoEscolar_Opcao2"

// Descricao : Sistema integrado de console para gestao escolar.
//           - Secao 1: Cadastro de Turma e Alunos
//           - Secao 2: Correcao de Provas e Analise Estatistica de Desempenho
// Autor(a)  : Mykaelly Cabral Leite
// Data atual: 04/08/2026

Var
   // Armazenamento Geral (ate 50 alunos)
   Nome: vetor[1..50] de caractere
   NomeProfessor, NivelEnsino, SerieAno, NumeroTurma, AnoLetivo: caractere
   TempProf, TempNivel, TempSerie, TempTurma, TempAno: caractere

   // Armazenamento Permanente de Provas (suporta ate 20 provas e 20 questoes por prova)
   // Matrizes/Vetores Indexados por [Aluno, Prova] ou [Prova, Questao]
   TituloProva: vetor[1..20] de caractere
   QtdQuestoes: vetor[1..20] de inteiro
   QtdAlternativas: vetor[1..20] de inteiro
   ValorPorQuestao: vetor[1..20] de real
   NotaMaxima: vetor[1..20] de real
   MediaAprovacao: vetor[1..20] de real
   MaiorLetraPermitida: vetor[1..20] de caractere
   Gabarito: vetor[1..20, 1..20] de caractere

   // Dados das Provas por Aluno [Aluno, Prova]
   ProvaCorrigida: vetor[1..50, 1..20] de logico
   AlunoPresente: vetor[1..50, 1..20] de logico
   AcertosAluno: vetor[1..50, 1..20] de inteiro
   ErrosAluno: vetor[1..50, 1..20] de inteiro
   NotaAluno: vetor[1..50, 1..20] de real

   // Solucao para Limite de 2D no Visualg: String compactada com todas as respostas da prova
   RespostasAluno: vetor[1..50, 1..20] de caractere

   // Identificacao de Provas por Semestre
   NumProvaSemestre: vetor[1..20] de inteiro
   SemestreProva: vetor[1..20] de inteiro

   // Configuracoes Globais do Sistema de Provas
   ConfigProvasRealizada: logico
   QtdProvasPorSemestre: inteiro
   SemestreAtual: inteiro
   TotalProvasCadastradas: inteiro

   // Variaveis Auxiliares e Temporarias para Processamento da Opcao 2
   RespTemp, RespQuestao: caractere
   GabaritoTemp: vetor[1..20] de caractere
   ConfirmarGabarito: caractere
   OpcaoOp2, OpcaoSubMenu, ProvaSelecionada: inteiro
   PendenteEncontrado: logico
   QtdPendentes, OpcaoPendente, AlunoSelecionadoPendente: inteiro
   ListaPendentes: vetor[1..50] de inteiro

   // Estatisticas Locais/Temporarias de Calculo de Prova
   SomaNotas, MediaTurma, MaiorNota, MenorNota: real
   AlunosAcima, AlunosNaMedia, AlunosAbaixo: inteiro
   TotalPresentes, TotalFaltas: inteiro
   ClassificacaoTurma: caractere
   ConfirmarPresenca: caractere
   GabaritoOk, AlunoOk: logico

   // Controle de Fluxo Geral e Limites
   OpcaoMenu, TotalAlunos, TotalQuestoes, TotalAulas: inteiro
   C, C2, C3, IndiceAluno, OpcaoEdicao: inteiro
   TurmaCadastrada: logico
   LimiteOpcao, Reiniciar, Confirma, OpcaoContinuar: caractere

   // Novas Variaveis Auxiliares para Confirmacao de Respostas
   RespAlunoTemp: vetor[1..20] de caractere
   ConfirmarRespostas, ConfirmarNome: caractere

Inicio

   TurmaCadastrada <- Falso
   TotalAlunos <- 0
   ConfigProvasRealizada <- Falso
   TotalProvasCadastradas <- 0

   // Inicializacao das matrizes de controle de provas
   Para C <- 1 ate 50 faca
      Para C2 <- 1 ate 20 faca
         ProvaCorrigida[C, C2] <- Falso
         AlunoPresente[C, C2] <- Falso
         AcertosAluno[C, C2] <- 0
         ErrosAluno[C, C2] <- 0
         NotaAluno[C, C2] <- 0
         RespostasAluno[C, C2] <- ""
      Fimpara
   Fimpara

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
                                  TotalAlunos <- 0
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

                             // Valida a opcao do menu principal de edicao
                             Enquanto (OpcaoEdicao < 1) ou (OpcaoEdicao > 4) faca
                                  Escreval("Opcao invalida! Digite um numero de 1 a 4:")
                                  Leia(OpcaoEdicao)
                             Fimenquanto

                             Escolha OpcaoEdicao
                                  Caso 1
                                       Limpatela
                                       Escreval("--- EDICAO DE DADOS DA TURMA ---")
                                       Escreval("(Digite 0 em qualquer campo para CANCELAR a alteracao)")
                                       Escreval("")
                                       Escreva("Nome do(a) Professor(a) [Atual: ", NomeProfessor, "]: ")
                                       Leia(TempProf)
                                       Se TempProf <> "0" entao
                                            Escreva("Nivel de ensino [Atual: ", NivelEnsino, "]: ")
                                            Leia(TempNivel)
                                            Se TempNivel <> "0" entao
                                                 Escreva("Serie/Ano [Atual: ", SerieAno, "]: ")
                                                 Leia(TempSerie)
                                                 Se TempSerie <> "0" entao
                                                      Escreva("Numero/Turma [Atual: ", NumeroTurma, "]: ")
                                                      Leia(TempTurma)
                                                      Se TempTurma <> "0" entao
                                                           Escreva("Ano Letivo [Atual: ", AnoLetivo, "]: ")
                                                           Leia(TempAno)
                                                           Se TempAno <> "0" entao
                                                                Se TempProf <> "" entao
                                                                     NomeProfessor <- TempProf
                                                                Fimse
                                                                Se TempNivel <> "" entao
                                                                     NivelEnsino <- TempNivel
                                                                Fimse
                                                                Se TempSerie <> "" entao
                                                                     SerieAno <- TempSerie
                                                                Fimse
                                                                Se TempTurma <> "" entao
                                                                     NumeroTurma <- TempTurma
                                                                Fimse
                                                                Se TempAno <> "" entao
                                                                     AnoLetivo <- TempAno
                                                                Fimse
                                                                Escreval("")
                                                                Escreval("-> Dados da turma atualizados com sucesso!")
                                                           Senao
                                                                Escreval("-> Operacao cancelada.")
                                                           Fimse
                                                      Senao
                                                           Escreval("-> Operacao cancelada.")
                                                      Fimse
                                                 Senao
                                                      Escreval("-> Operacao cancelada.")
                                                 Fimse
                                            Senao
                                                 Escreval("-> Operacao cancelada.")
                                            Fimse
                                       Senao
                                            Escreval("-> Operacao cancelada.")
                                       Fimse
                                       Escreval("")
                                       Escreval("Pressione ENTER para retornar ao menu de cadastro...")
                                       Leia(Reiniciar)

                                  Caso 2
                                       Limpatela
                                       Escreval("--- MODIFICAR LISTA DE ALUNOS ---")
                                       Escreval("1 - Alterar nome de um aluno especifico")
                                       Escreval("2 - Adicionar novos alunos")
                                       Escreval("3 - Remover um aluno")
                                       Escreval("0 - Cancelar e voltar")
                                       Escreval("")
                                       Escreva("Escolha: ")
                                       Leia(IndiceAluno)

                                       // Valida opcao do submenu de alteracao de alunos
                                       Enquanto (IndiceAluno < 0) ou (IndiceAluno > 3) faca
                                            Escreval("Opcao invalida! Digite um numero de 0 a 3:")
                                            Leia(IndiceAluno)
                                       Fimenquanto

                                       Se IndiceAluno = 1 entao
                                            Repita
                                                 Limpatela
                                                 Escreval("===== ALTERAR ALUNO =====")
                                                 Escreval("(Digite 0 para cancelar)")
                                                 Escreval("---------------------------")
                                                 Para C <- 1 ate TotalAlunos faca
                                                      Escreval(C:2, " - ", Nome[C])
                                                 Fimpara
                                                 Escreval("---------------------------")
                                                 Escreva("Informe o numero do aluno (1 a ", TotalAlunos, ") ou 0 para cancelar: ")
                                                 Leia(C2)

                                                 Se C2 = 0 entao
                                                      Escreval("-> Operacao cancelada.")
                                                 Senao
                                                      Se (C2 >= 1) e (C2 <= TotalAlunos) entao
                                                           Repita
                                                                Escreva("Novo nome para o aluno ", C2, " [Atual: ", Nome[C2], "]: ")
                                                                Leia(TempProf)

                                                                Se (TempProf = "0") ou (TempProf = "") entao
                                                                     Escreval("-> Operacao cancelada!")
                                                                     ConfirmarNome <- "S"
                                                                Senao
                                                                     Escreval("")
                                                                     Escreval("Novo nome digitado: ", TempProf)
                                                                     Repita
                                                                          Escreva("Confirma a alteracao? (S/N): ")
                                                                          Leia(ConfirmarNome)
                                                                          ConfirmarNome <- Maiusc(ConfirmarNome)
                                                                          Se (ConfirmarNome <> "S") e (ConfirmarNome <> "N") entao
                                                                               Escreval("Opcao invalida! Digite apenas S ou N.")
                                                                          Fimse
                                                                     Ate (ConfirmarNome = "S") ou (ConfirmarNome = "N")

                                                                     Se ConfirmarNome = "S" entao
                                                                          Nome[C2] <- TempProf
                                                                          Escreval("-> Nome atualizado com sucesso!")
                                                                     Fimse
                                                                Fimse
                                                           Ate ConfirmarNome = "S"
                                                      Senao
                                                           Escreval("")
                                                           Escreval("Numero invalido! Digite apenas um numero da lista de alunos.")
                                                           Escreval("Pressione ENTER para tentar novamente...")
                                                           Leia(Reiniciar)
                                                      Fimse
                                                 Fimse
                                            Ate (C2 >= 0) e (C2 <= TotalAlunos)
                                            Escreval("")
                                            Escreval("Pressione ENTER para retornar ao menu de cadastro...")
                                            Leia(Reiniciar)

                                       Senao
                                            Se IndiceAluno = 2 entao
                                                 Repita
                                                      Limpatela
                                                      Escreval("===== ADICIONAR ALUNO =====")
                                                      Escreval("(Digite 0 no nome para cancelar)")
                                                      Escreval("---------------------------")
                                                      Para C <- 1 ate TotalAlunos faca
                                                           Escreval(C:2, " - ", Nome[C])
                                                      Fimpara
                                                      Escreval("---------------------------")

                                                      Se TotalAlunos >= 50 entao
                                                           Escreval("-> Limite maximo de 50 alunos atingido!")
                                                           OpcaoContinuar <- "N"
                                                      Senao
                                                           Escreva("Nome do novo aluno (ou 0 para cancelar): ")
                                                           Leia(TempProf)

                                                           Se (TempProf = "0") ou (TempProf = "") entao
                                                                Escreval("-> Adicao cancelada.")
                                                                OpcaoContinuar <- "N"
                                                           Senao
                                                                TotalAlunos <- TotalAlunos + 1
                                                                Nome[TotalAlunos] <- TempProf
                                                                Escreval("-> Aluno adicionado com sucesso!")
                                                                Escreval("")

                                                                Se TotalAlunos < 50 entao
                                                                     Repita
                                                                          Escreva("Deseja adicionar outro aluno? [S/N]: ")
                                                                          Leia(OpcaoContinuar)
                                                                          OpcaoContinuar <- Maiusc(OpcaoContinuar)
                                                                          Se (OpcaoContinuar <> "S") e (OpcaoContinuar <> "N") entao
                                                                               Escreval("Opcao invalida! Digite apenas S ou N.")
                                                                          Fimse
                                                                     Ate (OpcaoContinuar = "S") ou (OpcaoContinuar = "N")
                                                                Senao
                                                                     OpcaoContinuar <- "N"
                                                                Fimse
                                                           Fimse
                                                      Fimse
                                                 Ate OpcaoContinuar = "N"

                                                 Escreval("")
                                                 Escreval("Operacao finalizada. Pressione ENTER para voltar ao menu de cadastro...")
                                                 Leia(Reiniciar)

                                            Senao
                                                 Se IndiceAluno = 3 entao
                                                      Se TotalAlunos = 0 entao
                                                           Escreval("-> Nao ha alunos cadastrados para remover!")
                                                      Senao
                                                           Repita
                                                                Limpatela
                                                                Escreval("===== REMOVER ALUNO =====")
                                                                Escreval("(Digite 0 para cancelar)")
                                                                Escreval("---------------------------")
                                                                Para C <- 1 ate TotalAlunos faca
                                                                     Escreval(C:2, " - ", Nome[C])
                                                                Fimpara
                                                                Escreval("---------------------------")
                                                                Escreva("Digite o numero do aluno que deseja remover (1 a ", TotalAlunos, ") ou 0 para cancelar: ")
                                                                Leia(C2)

                                                                Se C2 = 0 entao
                                                                     Escreval("-> Operacao cancelada.")
                                                                Senao
                                                                     Se (C2 >= 1) e (C2 <= TotalAlunos) entao
                                                                          Para C <- C2 ate TotalAlunos - 1 faca
                                                                               Nome[C] <- Nome[C + 1]
                                                                          Fimpara
                                                                          Nome[TotalAlunos] <- ""
                                                                          TotalAlunos <- TotalAlunos - 1
                                                                          Escreval("-> Aluno removido com sucesso!")
                                                                     Senao
                                                                          Escreval("")
                                                                          Escreval("Numero invalido! Digite apenas um numero da lista de alunos.")
                                                                          Escreval("Pressione ENTER para tentar novamente...")
                                                                          Leia(Reiniciar)
                                                                     Fimse
                                                                Fimse
                                                           Ate (C2 >= 0) e (C2 <= TotalAlunos)
                                                      Fimse
                                                      Escreval("")
                                                      Escreval("Pressione ENTER para retornar ao menu de cadastro...")
                                                      Leia(Reiniciar)
                                                 Fimse
                                            Fimse
                                       Fimse

                                  Caso 3
                                       TurmaCadastrada <- falso
                                       TotalAlunos <- 0
                                       OpcaoEdicao <- 4

                                  Caso 4
                                       // Retorna mantendo a turma cadastrada

                             FimEscolha

                        Fimse
                   Fimse
              Ate (OpcaoEdicao = 4)

                   Limpatela
                   OpcaoMenu <- 0

              Caso 2
                   // --------------------------------------------------
                   // 2 - CORRECAO DE PROVAS
                   // --------------------------------------------------
                   Limpatela
                   Se TurmaCadastrada = falso entao
                        Escreval("========================================")
                        Escreval("        ATENCAO: TURMA NAO ENCONTRADA   ")
                        Escreval("========================================")
                        Escreval("Nenhuma turma foi cadastrada ainda.")
                        Escreval("Cadastre uma turma no Menu 1 antes de realizar a correcao de provas.")
                        Escreval("========================================")
                        Escreval("")
                        Escreval("Pressione ENTER para voltar ao menu principal...")
                        Leia(Reiniciar)
                   Senao
                        // Configuracao Inicial (Executada apenas 1 vez)
                        Se ConfigProvasRealizada = falso entao
                             Escreval("========================================")
                             Escreval("   CONFIGURACAO INICIAL DE PROVAS       ")
                             Escreval("========================================")
                             Escreval("")
                             Escreva("Informe a quantidade de provas por semestre: ")
                             Leia(QtdProvasPorSemestre)
                             Enquanto QtdProvasPorSemestre < 1 faca
                                  Escreval("Quantidade invalida! Digite um valor maior ou igual a 1:")
                                  Leia(QtdProvasPorSemestre)
                             Fimenquanto

                             Escreval("")
                             Escreval("Estamos em qual semestre?")
                             Escreval("1 - Primeiro semestre")
                             Escreval("2 - Segundo semestre")
                             Escreva("Escolha a opcao: ")
                             Leia(SemestreAtual)
                             Enquanto (SemestreAtual <> 1) e (SemestreAtual <> 2) faca
                                  Escreval("Opcao invalida! Digite 1 para 1 Semestre ou 2 para 2 Semestre:")
                                  Leia(SemestreAtual)
                             Fimenquanto

                             ConfigProvasRealizada <- verdadeiro
                        Fimse

                        // Menu Interativo da Opcao 2
                        Repita
                             OpcaoSubMenu <- 0
                             Limpatela
                             Escreval("========================================")
                             Escreval("          CORRECAO DE PROVAS            ")
                             Escreval("========================================")
                             Escreval("")
                             Escreval("1 - Corrigir nova prova")

                             Se TotalProvasCadastradas = 0 entao
                                  Escreval("2 - Voltar ao menu")
                                  Escreval("")
                                  Escreva("Escolha uma opcao: ")
                                  Leia(OpcaoOp2)
                                  Enquanto (OpcaoOp2 <> 1) e (OpcaoOp2 <> 2) faca
                                       Escreval("Opcao invalida! Digite 1 ou 2:")
                                       Leia(OpcaoOp2)
                                  Fimenquanto
                                  Se OpcaoOp2 = 2 entao
                                       OpcaoOp2 <- 3 // Mapeia para entrada de saida do loop
                                  Fimse
                             Senao
                                  Escreval("2 - Consultar provas anteriores")
                                  Escreval("3 - Voltar ao menu")
                                  Escreval("")
                                  Escreva("Escolha uma opcao: ")
                                  Leia(OpcaoOp2)
                                  Enquanto (OpcaoOp2 < 1) ou (OpcaoOp2 > 3) faca
                                       Escreval("Opcao invalida! Digite um numero entre 1 e 3:")
                                       Leia(OpcaoOp2)
                                  Fimenquanto
                             Fimse

                             // --------------------------------------------------
                             // SUB-OPCAO 1: CORRIGIR NOVA PROVA
                             // --------------------------------------------------
                             Se OpcaoOp2 = 1 entao
                                  TotalProvasCadastradas <- TotalProvasCadastradas + 1
                                  ProvaSelecionada <- TotalProvasCadastradas

                                  // Calculo do Numero e Semestre da Prova (Ex: 1.1, 2.1, 1.2...)
                                  SemestreProva[ProvaSelecionada] <- SemestreAtual
                                  NumProvaSemestre[ProvaSelecionada] <- ((ProvaSelecionada - 1) % QtdProvasPorSemestre) + 1

                                  Repita
                                       Limpatela
                                       Escreval("========================================")
                                       Escreval("   CADASTRO DA PROVA ", NumProvaSemestre[ProvaSelecionada], ".", SemestreProva[ProvaSelecionada])
                                       Escreval("========================================")
                                       Escreval("")

                                       Escreva("De um titulo para esta prova: ")
                                       Leia(TituloProva[ProvaSelecionada])
                                       Enquanto TituloProva[ProvaSelecionada] = "" faca
                                            Escreval("O titulo da prova nao pode ficar em branco. Digite novamente:")
                                            Leia(TituloProva[ProvaSelecionada])
                                       Fimenquanto

                                       Escreva("Quantas questoes possui esta prova? (1 a 20): ")
                                       Leia(QtdQuestoes[ProvaSelecionada])
                                       Enquanto (QtdQuestoes[ProvaSelecionada] < 1) ou (QtdQuestoes[ProvaSelecionada] > 20) faca
                                            Escreval("Quantidade invalida! Digite um valor entre 1 e 20:")
                                            Leia(QtdQuestoes[ProvaSelecionada])
                                       Fimenquanto

                                       Escreva("Quantas alternativas possui cada questao? (2 a 26): ")
                                       Leia(QtdAlternativas[ProvaSelecionada])
                                       Enquanto (QtdAlternativas[ProvaSelecionada] < 2) ou (QtdAlternativas[ProvaSelecionada] > 26) faca
                                            Escreval("Quantidade invalida! Digite um valor entre 2 e 26:")
                                            Leia(QtdAlternativas[ProvaSelecionada])
                                       Fimenquanto

                                       MaiorLetraPermitida[ProvaSelecionada] <- Carac(64 + QtdAlternativas[ProvaSelecionada])

                                       Escreva("Cada questao vale quantos pontos? ")
                                       Leia(ValorPorQuestao[ProvaSelecionada])
                                       Enquanto ValorPorQuestao[ProvaSelecionada] <= 0 faca
                                            Escreval("O valor da questao deve ser maior que zero. Digite novamente:")
                                            Leia(ValorPorQuestao[ProvaSelecionada])
                                       Fimenquanto

                                       NotaMaxima[ProvaSelecionada] <- QtdQuestoes[ProvaSelecionada] * ValorPorQuestao[ProvaSelecionada]

                                       Escreva("Qual a media necessaria para aprovacao nesta prova? ")
                                       Leia(MediaAprovacao[ProvaSelecionada])
                                       Enquanto (MediaAprovacao[ProvaSelecionada] < 0) ou (MediaAprovacao[ProvaSelecionada] > NotaMaxima[ProvaSelecionada]) faca
                                            Escreval("Media invalida! Deve ser entre 0 e ", NotaMaxima[ProvaSelecionada]:4:2, ":")
                                            Leia(MediaAprovacao[ProvaSelecionada])
                                       Fimenquanto

                                       // Cadastro do Gabarito
                                       Limpatela
                                       Escreval("========================================")
                                       Escreval("      CADASTRO DO GABARITO OFICIAL      ")
                                       Escreval("========================================")
                                       Escreval("Prova       : ", TituloProva[ProvaSelecionada])
                                       Escreval("Alternativas: De A ate ", MaiorLetraPermitida[ProvaSelecionada])
                                       Escreval("----------------------------------------")
                                       Escreval("")

                                       Para C <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                            Repita
                                                 Escreva("Informe a resposta correta da questao ", C:2, " [A-", MaiorLetraPermitida[ProvaSelecionada], "]: ")
                                                 Leia(RespTemp)
                                                 RespTemp <- Maiusc(RespTemp)

                                                 GabaritoOk <- verdadeiro
                                                 Se (RespTemp < "A") ou (RespTemp > MaiorLetraPermitida[ProvaSelecionada]) entao
                                                      GabaritoOk <- falso
                                                      Escreval("Resposta invalida! Digite apenas uma letra entre A e ", MaiorLetraPermitida[ProvaSelecionada], ".")
                                                 Fimse
                                            Ate GabaritoOk = verdadeiro
                                            GabaritoTemp[C] <- RespTemp
                                       Fimpara

                                       // Resumo e Confirmacao
                                       Limpatela
                                       Escreval("========================================")
                                       Escreval("            RESUMO DA PROVA             ")
                                       Escreval("========================================")
                                       Escreval("Titulo               : ", TituloProva[ProvaSelecionada])
                                       Escreval("Quantidade questoes : ", QtdQuestoes[ProvaSelecionada])
                                       Escreval("Alternativas         : De A ate ", MaiorLetraPermitida[ProvaSelecionada])
                                       Escreval("Valor por questao    : ", ValorPorQuestao[ProvaSelecionada]:4:2)
                                       Escreval("Nota maxima          : ", NotaMaxima[ProvaSelecionada]:4:2)
                                       Escreval("Media para aprovacao : ", MediaAprovacao[ProvaSelecionada]:4:2)
                                       Escreval("----------------------------------------")
                                       Escreval("Gabarito:")
                                       Para C <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                            Escreval("Questao ", C:2, " -> ", GabaritoTemp[C])
                                       Fimpara
                                       Escreval("========================================")
                                       Escreval("")

                                       Repita
                                            Escreva("As informacoes estao corretas? (S - Confirmar / N - Refazer) [S/N]: ")
                                            Leia(ConfirmarGabarito)
                                            ConfirmarGabarito <- Maiusc(ConfirmarGabarito)
                                            Se (ConfirmarGabarito <> "S") e (ConfirmarGabarito <> "N") entao
                                                 Escreval("Opcao invalida! Digite S ou N.")
                                            Fimse
                                       Ate (ConfirmarGabarito = "S") ou (ConfirmarGabarito = "N")

                                  Ate ConfirmarGabarito = "S"

                                  // Grava gabarito temporario no arranjo definitivo
                                  Para C <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                       Gabarito[ProvaSelecionada, C] <- GabaritoTemp[C]
                                  Fimpara

                                  // Correcao regular das Provas dos Alunos
                                  Limpatela
                                  Escreval("========================================")
                                  Escreval("     CORRECAO DAS PROVAS DA TURMA       ")
                                  Escreval("========================================")
                                  Escreval("")

                                  Para C <- 1 ate TotalAlunos faca
                                       Escreval("----------------------------------------")
                                       Repita
                                            Escreva("O aluno ", Nome[C], " compareceu? (S/N): ")
                                            Leia(ConfirmarPresenca)
                                            ConfirmarPresenca <- Maiusc(ConfirmarPresenca)
                                            Se (ConfirmarPresenca <> "S") e (ConfirmarPresenca <> "N") entao
                                                 Escreval("Opcao invalida! Digite S para Sim ou N para Nao.")
                                            Fimse
                                       Ate (ConfirmarPresenca = "S") ou (ConfirmarPresenca = "N")

                                       ProvaCorrigida[C, ProvaSelecionada] <- verdadeiro

                                       Se ConfirmarPresenca = "N" entao
                                            AlunoPresente[C, ProvaSelecionada] <- falso
                                            NotaAluno[C, ProvaSelecionada] <- 0
                                            AcertosAluno[C, ProvaSelecionada] <- 0
                                            ErrosAluno[C, ProvaSelecionada] <- 0
                                            RespostasAluno[C, ProvaSelecionada] <- ""
                                            Escreval("-> Aluno marcado como AUSENTE.")
                                       Senao
                                            AlunoPresente[C, ProvaSelecionada] <- verdadeiro

                                            Repita
                                                 Escreval("")
                                                 Escreval("Informe as respostas do aluno ", Nome[C], ":")
                                                 Para C2 <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                                      Repita
                                                           Escreva("  Questao ", C2:2, " [A-", MaiorLetraPermitida[ProvaSelecionada], "]: ")
                                                           Leia(RespTemp)
                                                           RespTemp <- Maiusc(RespTemp)

                                                           AlunoOk <- verdadeiro
                                                           Se (RespTemp < "A") ou (RespTemp > MaiorLetraPermitida[ProvaSelecionada]) entao
                                                                AlunoOk <- falso
                                                                Escreval("  Opcao invalida! Digite uma alternativa entre A e ", MaiorLetraPermitida[ProvaSelecionada], ".")
                                                           Fimse
                                                      Ate AlunoOk = verdadeiro
                                                      RespAlunoTemp[C2] <- RespTemp
                                                 Fimpara

                                                 Limpatela
                                                 Escreval("========================================")
                                                 Escreval("          RESPOSTAS DIGITADAS           ")
                                                 Escreval("========================================")
                                                 Escreval("Aluno: ", Nome[C])
                                                 Escreval("----------------------------------------")
                                                 Para C2 <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                                      Escreval("Questao ", C2:2, " -> ", RespAlunoTemp[C2])
                                                 Fimpara
                                                 Escreval("========================================")
                                                 Escreval("")

                                                 Repita
                                                      Escreva("Confirma as respostas? (S/N): ")
                                                      Leia(ConfirmarRespostas)
                                                      ConfirmarRespostas <- Maiusc(ConfirmarRespostas)
                                                      Se (ConfirmarRespostas <> "S") e (ConfirmarRespostas <> "N") entao
                                                           Escreval("Opcao invalida! Digite apenas S ou N.")
                                                      Fimse
                                                 Ate (ConfirmarRespostas = "S") ou (ConfirmarRespostas = "N")

                                                 Se ConfirmarRespostas = "N" entao
                                                      Escreval("-> Respostas descartadas! Digite novamente.")
                                                 Fimse

                                            Ate ConfirmarRespostas = "S"

                                            // Processa as respostas confirmadas
                                            AcertosAluno[C, ProvaSelecionada] <- 0
                                            ErrosAluno[C, ProvaSelecionada] <- 0
                                            RespostasAluno[C, ProvaSelecionada] <- ""

                                            Para C2 <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                                 RespostasAluno[C, ProvaSelecionada] <- RespostasAluno[C, ProvaSelecionada] + RespAlunoTemp[C2]

                                                 Se RespAlunoTemp[C2] = Gabarito[ProvaSelecionada, C2] entao
                                                      AcertosAluno[C, ProvaSelecionada] <- AcertosAluno[C, ProvaSelecionada] + 1
                                                 Senao
                                                      ErrosAluno[C, ProvaSelecionada] <- ErrosAluno[C, ProvaSelecionada] + 1
                                                 Fimse
                                            Fimpara

                                            NotaAluno[C, ProvaSelecionada] <- AcertosAluno[C, ProvaSelecionada] * ValorPorQuestao[ProvaSelecionada]
                                            Escreval("-> Respostas registradas e nota calculada!")
                                       Fimse
                                       Escreval("")
                                  Fimpara

                                  // Exibe os relatorios completos apos finalizar
                                  OpcaoSubMenu <- 1
                             Fimse

                             // --------------------------------------------------
                             // SUB-OPCAO 2: CONSULTAR PROVAS ANTERIORES
                             // --------------------------------------------------
                             Se OpcaoOp2 = 2 entao
                                  Limpatela
                                  Escreval("========================================")
                                  Escreval("       PROVAS ANTERIORES CADASTRADAS    ")
                                  Escreval("========================================")
                                  Escreval("")
                                  Para C <- 1 ate TotalProvasCadastradas faca
                                       Escreval(C:2, " - ", NumProvaSemestre[C], ".", SemestreProva[C], " - ", TituloProva[C])
                                  Fimpara
                                  Escreval("")
                                  Escreva("Selecione a prova desejada (1 a ", TotalProvasCadastradas, "), ou 0 para voltar ao menu de Correcao de Provas: ")
                                  Leia(ProvaSelecionada)

                                  Enquanto (ProvaSelecionada < 0) ou (ProvaSelecionada > TotalProvasCadastradas) faca
                                       Escreval("Selecao invalida! Digite um numero de 0 a ", TotalProvasCadastradas, ":")
                                       Leia(ProvaSelecionada)
                                  Fimenquanto

                                  Se ProvaSelecionada > 0 entao

                                       // Verifica se ha pendencias de correcao para alunos cadastrados
                                       PendenteEncontrado <- Falso
                                       Para C <- 1 ate TotalAlunos faca
                                            Se ProvaCorrigida[C, ProvaSelecionada] = Falso entao
                                                 PendenteEncontrado <- Verdadeiro
                                            Fimse
                                       Fimpara

                                       Se PendenteEncontrado = Falso entao
                                            Limpatela
                                            Escreval("Todos os alunos cadastrados ja possuem nota registrada nesta prova.")
                                            Escreval("Pressione ENTER para visualizar o relatorio completo...")
                                            Leia(Reiniciar)
                                            OpcaoSubMenu <- 1
                                       Senao
                                            Limpatela
                                            Escreval("========================================")
                                            Escreval("PROVA ", NumProvaSemestre[ProvaSelecionada], ".", SemestreProva[ProvaSelecionada], " - ", TituloProva[ProvaSelecionada])
                                            Escreval("========================================")
                                            Escreval("")
                                            Escreval("Existem alunos sem nota registrada nesta prova.")
                                            Escreval("")
                                            Escreval("1 - Visualizar resultados")
                                            Escreval("2 - Corrigir prova de alunos pendentes")
                                            Escreval("3 - Voltar")
                                            Escreval("")
                                            Escreva("Escolha uma opcao: ")
                                            Leia(OpcaoSubMenu)

                                            Enquanto (OpcaoSubMenu < 1) ou (OpcaoSubMenu > 3) faca
                                                 Escreval("Opcao invalida! Digite 1, 2 ou 3:")
                                                 Leia(OpcaoSubMenu)
                                            Fimenquanto

                                            Se OpcaoSubMenu = 2 entao
                                                 // Correcao de Alunos Pendentes
                                                 Repita
                                                      Limpatela
                                                      QtdPendentes <- 0
                                                      Escreval("Alunos pendentes nesta prova:")
                                                      Escreval("")

                                                      Para C <- 1 ate TotalAlunos faca
                                                           Se ProvaCorrigida[C, ProvaSelecionada] = Falso entao
                                                                QtdPendentes <- QtdPendentes + 1
                                                                ListaPendentes[QtdPendentes] <- C
                                                                Escreval(QtdPendentes:2, " - ", Nome[C])
                                                           Fimse
                                                      Fimpara

                                                      Se QtdPendentes = 0 entao
                                                           Escreval("-> Nao restam mais alunos pendentes nesta prova!")
                                                           Escreval("Pressione ENTER para visualizar o relatorio atualizado...")
                                                           Leia(Reiniciar)
                                                           OpcaoSubMenu <- 1
                                                           OpcaoPendente <- 0
                                                      Senao
                                                           Escreval("")
                                                           Escreval("Digite o numero do aluno a corrigir (1 a ", QtdPendentes, ") ou 0 para voltar:")
                                                           Leia(OpcaoPendente)

                                                           Enquanto (OpcaoPendente < 0) ou (OpcaoPendente > QtdPendentes) faca
                                                                Escreval("Opcao invalida! Digite um valor de 0 a ", QtdPendentes, ":")
                                                                Leia(OpcaoPendente)
                                                           Fimenquanto

                                                           Se OpcaoPendente > 0 entao
                                                                AlunoSelecionadoPendente <- ListaPendentes[OpcaoPendente]

                                                                Limpatela
                                                                Escreval("----------------------------------------")
                                                                Escreval("CORRECAO PENDENTE: ", Nome[AlunoSelecionadoPendente])
                                                                Escreval("----------------------------------------")

                                                                Repita
                                                                     Escreva("O aluno compareceu a prova? (S/N): ")
                                                                     Leia(ConfirmarPresenca)
                                                                     ConfirmarPresenca <- Maiusc(ConfirmarPresenca)
                                                                     Se (ConfirmarPresenca <> "S") e (ConfirmarPresenca <> "N") entao
                                                                          Escreval("Opcao invalida! Digite S ou N.")
                                                                     Fimse
                                                                Ate (ConfirmarPresenca = "S") ou (ConfirmarPresenca = "N")

                                                                ProvaCorrigida[AlunoSelecionadoPendente, ProvaSelecionada] <- verdadeiro

                                                                Se ConfirmarPresenca = "N" entao
                                                                     AlunoPresente[AlunoSelecionadoPendente, ProvaSelecionada] <- falso
                                                                     NotaAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- 0
                                                                     AcertosAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- 0
                                                                     ErrosAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- 0
                                                                     RespostasAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- ""
                                                                     Escreval("-> Aluno marcado como AUSENTE.")
                                                                Senao
                                                                     AlunoPresente[AlunoSelecionadoPendente, ProvaSelecionada] <- verdadeiro

                                                                     Repita
                                                                          Escreval("")
                                                                          Escreval("Informe as respostas de ", Nome[AlunoSelecionadoPendente], ":")
                                                                          Para C2 <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                                                               Repita
                                                                                    Escreva("  Questao ", C2:2, " [A-", MaiorLetraPermitida[ProvaSelecionada], "]: ")
                                                                                    Leia(RespTemp)
                                                                                    RespTemp <- Maiusc(RespTemp)

                                                                                    AlunoOk <- verdadeiro
                                                                                    Se (RespTemp < "A") ou (RespTemp > MaiorLetraPermitida[ProvaSelecionada]) entao
                                                                                         AlunoOk <- falso
                                                                                         Escreval("  Opcao invalida! Digite entre A e ", MaiorLetraPermitida[ProvaSelecionada], ".")
                                                                                    Fimse
                                                                               Ate AlunoOk = verdadeiro
                                                                               RespAlunoTemp[C2] <- RespTemp
                                                                          Fimpara

                                                                          Limpatela
                                                                          Escreval("========================================")
                                                                          Escreval("          RESPOSTAS DIGITADAS           ")
                                                                          Escreval("========================================")
                                                                          Escreval("Aluno: ", Nome[AlunoSelecionadoPendente])
                                                                          Escreval("----------------------------------------")
                                                                          Para C2 <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                                                               Escreval("Questao ", C2:2, " -> ", RespAlunoTemp[C2])
                                                                          Fimpara
                                                                          Escreval("========================================")
                                                                          Escreval("")

                                                                          Repita
                                                                               Escreva("Confirma as respostas? (S/N): ")
                                                                               Leia(ConfirmarRespostas)
                                                                               ConfirmarRespostas <- Maiusc(ConfirmarRespostas)
                                                                               Se (ConfirmarRespostas <> "S") e (ConfirmarRespostas <> "N") entao
                                                                                    Escreval("Opcao invalida! Digite apenas S ou N.")
                                                                               Fimse
                                                                          Ate (ConfirmarRespostas = "S") ou (ConfirmarRespostas = "N")

                                                                          Se ConfirmarRespostas = "N" entao
                                                                               Escreval("-> Respostas descartadas! Digite novamente.")
                                                                          Fimse

                                                                     Ate ConfirmarRespostas = "S"

                                                                     // Processa respostas confirmadas do aluno pendente
                                                                     AcertosAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- 0
                                                                     ErrosAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- 0
                                                                     RespostasAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- ""

                                                                     Para C2 <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                                                          RespostasAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- RespostasAluno[AlunoSelecionadoPendente, ProvaSelecionada] + RespAlunoTemp[C2]

                                                                          Se RespAlunoTemp[C2] = Gabarito[ProvaSelecionada, C2] entao
                                                                               AcertosAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- AcertosAluno[AlunoSelecionadoPendente, ProvaSelecionada] + 1
                                                                          Senao
                                                                               ErrosAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- ErrosAluno[AlunoSelecionadoPendente, ProvaSelecionada] + 1
                                                                          Fimse
                                                                     Fimpara

                                                                     NotaAluno[AlunoSelecionadoPendente, ProvaSelecionada] <- AcertosAluno[AlunoSelecionadoPendente, ProvaSelecionada] * ValorPorQuestao[ProvaSelecionada]
                                                                     Escreval("-> Respostas salvas com sucesso!")
                                                                Fimse
                                                                Escreval("")
                                                                Escreval("Pressione ENTER para continuar...")
                                                                Leia(Reiniciar)
                                                           Fimse
                                                      Fimse
                                                 Ate OpcaoPendente = 0
                                            Fimse
                                       Fimse

                                  Fimse
                             Fimse

                             // --------------------------------------------------
                             // EXIBICAO DOS RESULTADOS E ESTATISTICAS DA PROVA
                             // --------------------------------------------------
                             Se (OpcaoOp2 <> 3) e (OpcaoSubMenu = 1) entao
                                  // Recalculo Geral das Estatisticas
                                  SomaNotas <- 0
                                  TotalPresentes <- 0
                                  TotalFaltas <- 0
                                  MaiorNota <- -1
                                  MenorNota <- NotaMaxima[ProvaSelecionada] + 1

                                  Para C <- 1 ate TotalAlunos faca
                                       Se ProvaCorrigida[C, ProvaSelecionada] = verdadeiro entao
                                            Se AlunoPresente[C, ProvaSelecionada] = verdadeiro entao
                                                 TotalPresentes <- TotalPresentes + 1
                                                 SomaNotas <- SomaNotas + NotaAluno[C, ProvaSelecionada]

                                                 Se NotaAluno[C, ProvaSelecionada] > MaiorNota entao
                                                      MaiorNota <- NotaAluno[C, ProvaSelecionada]
                                                 Fimse
                                                 Se NotaAluno[C, ProvaSelecionada] < MenorNota entao
                                                      MenorNota <- NotaAluno[C, ProvaSelecionada]
                                                 Fimse
                                            Senao
                                                 TotalFaltas <- TotalFaltas + 1
                                            Fimse
                                       Fimse
                                  Fimpara

                                  Se TotalPresentes > 0 entao
                                       MediaTurma <- SomaNotas / TotalPresentes
                                  Senao
                                       MediaTurma <- 0
                                       MaiorNota <- 0
                                       MenorNota <- 0
                                  Fimse

                                  AlunosAcima <- 0
                                  AlunosNaMedia <- 0
                                  AlunosAbaixo <- 0

                                  Para C <- 1 ate TotalAlunos faca
                                       Se (ProvaCorrigida[C, ProvaSelecionada] = verdadeiro) e (AlunoPresente[C, ProvaSelecionada] = verdadeiro) entao
                                            Se NotaAluno[C, ProvaSelecionada] > MediaAprovacao[ProvaSelecionada] entao
                                                 AlunosAcima <- AlunosAcima + 1
                                            Senao
                                                 Se NotaAluno[C, ProvaSelecionada] = MediaAprovacao[ProvaSelecionada] entao
                                                      AlunosNaMedia <- AlunosNaMedia + 1
                                                 Senao
                                                      AlunosAbaixo <- AlunosAbaixo + 1
                                                 Fimse
                                            Fimse
                                       Fimse
                                  Fimpara

                                  // Classificacao do Desempenho usando a Media Geral da Turma vs 4 Faixas da Nota Maxima
                                  Se MediaTurma <= (NotaMaxima[ProvaSelecionada] * 0.25) entao
                                       ClassificacaoTurma <- "Péssima"
                                  Senao
                                       Se MediaTurma <= (NotaMaxima[ProvaSelecionada] * 0.50) entao
                                            ClassificacaoTurma <- "Ruim"
                                       Senao
                                            Se MediaTurma <= (NotaMaxima[ProvaSelecionada] * 0.75) entao
                                                 ClassificacaoTurma <- "Boa"
                                            Senao
                                                 ClassificacaoTurma <- "Excelente"
                                            Fimse
                                       Fimse
                                  Fimse

                                  Limpatela
                                  Escreval("========================================")
                                  Escreval("       RELATORIO COMPLETO DA PROVA      ")
                                  Escreval("========================================")
                                  Escreval("Título          : ", TituloProva[ProvaSelecionada])
                                  Escreval("Semestre        : ", SemestreProva[ProvaSelecionada])
                                  Escreval("Número da Prova : ", NumProvaSemestre[ProvaSelecionada], ".", SemestreProva[ProvaSelecionada])
                                  Escreval("Nota Máxima     : ", NotaMaxima[ProvaSelecionada]:4:2)
                                  Escreval("Média Necessária: ", MediaAprovacao[ProvaSelecionada]:4:2)
                                  Escreval("----------------------------------------")
                                  Escreval("GABARITO COMPLETO:")
                                  Para C <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                       Escreva("[Q", C:2, ": ", Gabarito[ProvaSelecionada, C], "] ")
                                  Fimpara
                                  Escreval("")
                                  Escreval("========================================")
                                  Escreval("        DETALHAMENTO POR ALUNO          ")
                                  Escreval("========================================")

                                  Para C <- 1 ate TotalAlunos faca
                                       Escreval("")
                                       Escreval("Aluno: ", Nome[C])
                                       Se ProvaCorrigida[C, ProvaSelecionada] = Falso entao
                                            Escreval("Status: CORRECAO PENDENTE")
                                       Senao
                                            Se AlunoPresente[C, ProvaSelecionada] = Falso entao
                                                 Escreval("Status: Faltou")
                                                 Escreval("Acertos: 0 | Erros: 0")
                                                 Escreval("Nota Final: 0.00")
                                            Senao
                                                 Escreval("Status: Compareceu")
                                                 Escreval("Acertos: ", AcertosAluno[C, ProvaSelecionada], " | Erros: ", ErrosAluno[C, ProvaSelecionada])
                                                 Escreval("Nota Final: ", NotaAluno[C, ProvaSelecionada]:4:2)
                                                 Escreval("Respostas:")
                                                 Para C2 <- 1 ate QtdQuestoes[ProvaSelecionada] faca
                                                      // Extrai a resposta individual usando Copia()
                                                      RespQuestao <- Copia(RespostasAluno[C, ProvaSelecionada], C2, 1)

                                                      Escreva("  Questão ", C2:2, " - Resposta: ", RespQuestao, " | Gabarito: ", Gabarito[ProvaSelecionada, C2])
                                                      Se RespQuestao = Gabarito[ProvaSelecionada, C2] entao
                                                           Escreval(" -> Correta")
                                                      Senao
                                                           Escreval(" -> Errada")
                                                      Fimse
                                                 Fimpara
                                            Fimse
                                       Fimse
                                       Escreval("----------------------------------------")
                                  Fimpara

                                  Escreval("")
                                  Escreval("========================================")
                                  Escreval("       ESTATISTICAS GERAIS DA TURMA     ")
                                  Escreval("========================================")
                                  Escreval("Maior nota da turma         : ", MaiorNota:4:2)
                                  Escreval("Menor nota da turma         : ", MenorNota:4:2)
                                  Escreval("Média geral da turma        : ", MediaTurma:4:2)
                                  Escreval("----------------------------------------")
                                  Escreval("Alunos Acima da Média       : ", AlunosAcima)
                                  Escreval("Alunos Na Média             : ", AlunosNaMedia)
                                  Escreval("Alunos Abaixo da Média      : ", AlunosAbaixo)
                                  Escreval("----------------------------------------")
                                  Escreval("Quantidade de Presentes     : ", TotalPresentes)
                                  Escreval("Quantidade de Faltas        : ", TotalFaltas)
                                  Escreval("----------------------------------------")
                                  Escreval("CLASSIFICACAO GERAL DA PROVA: ", ClassificacaoTurma)
                                  Escreval("========================================")
                                  Escreval("")
                                  Escreval("Pressione ENTER para voltar ao menu de provas...")
                                  Leia(Reiniciar)
                             Fimse

                        Ate OpcaoOp2 = 3
                   Fimse

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