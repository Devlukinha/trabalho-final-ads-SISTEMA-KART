programa
{

	funcao atualizaDia(logico &locacaoPista){
		limpa()
		inteiro menu
		
		escreva("Você tem certeza que realmente deseja atualizar o dia?")
		escreva("\n\n1 - Sim ")
		escreva("\n2 - Não")
		escreva("\n\nESCOLHA UMA OPÇÃO: ")
		leia(menu)

		se (menu == 1){
			locacaoPista = falso
			
			escreva("\nStatus da pista atualizado para NÃO LOCADO. ")
			escreva("\nKarts que deverão ser cobrado novo aluguel: ")
			
			}
		se (menu == 2){
			
			}
		}




	
//função para locação da Pista

	funcao locacao(logico &locacaoPista, real &valorLocacaoPista){
		inteiro navegaMenuLocacao
		real novoValorPista

		limpa()
		escreva("------------------------------------------------")
	  			se (valorLocacaoPista == 0){
	  				escreva("\nValor atual da locação: --- ")
	  				}
	  			senao{
	  				escreva("\nValor atual da locação: R$", valorLocacaoPista)
	  				}

				se (locacaoPista == verdadeiro){
	  				escreva("\nStatus atual da pista: Locada\n")
	  				}
	  			senao{
	  				escreva("\nStatus atual da pista: Não locada\n")
	  				}
				escreva("------------------------------------------------")
	  			
	  			
	  			escreva("\n1 - Alocar pista")
	  			escreva("\n2 - Alterar valor locação ")
	  			escreva("\n3 - Cancelar locação")
	  			escreva("\n4 - Voltar ao menu principal")
	  			escreva("\n\nEscolha uma opcão: ")
	  			leia(navegaMenuLocacao)

	  			enquanto (navegaMenuLocacao != 1 e navegaMenuLocacao != 2 e navegaMenuLocacao != 3 e navegaMenuLocacao != 4){
		  			escreva("\nInsira uma opcão válida: ")
		  			leia(navegaMenuLocacao)	
					}
				
		  		se(navegaMenuLocacao == 1){
		  				locacaoPista = verdadeiro
		  			}
		  		senao se (navegaMenuLocacao == 2){
		  				escreva("Insira o novo valor de locação: R$")
		  				leia(novoValorPista)
		 				valorLocacaoPista = novoValorPista
		  			}
		  		senao se (navegaMenuLocacao == 3){
		  				locacaoPista = falso
		  			}	
				senao se (navegaMenuLocacao == 4){
		  			//Tentar salvar de maneira permanente, pois estava sendo usado menuSistema() e dando erro de reset
		  			}
	 
	}
		
//funcao para cadastrar karts
	funcao cadastrarKart(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[], inteiro &i){

		cadeia resp
		logico repeticao = verdadeiro

		
			enquanto(repeticao == verdadeiro) {
				se(modelo[i]=="" e cor[i]=="" e statusUso[i]=="" e valorLocacao[i]==0 e totalGasto[i]==0 e qntVezesLocado[i]==0 e statusLocacao[i]==0 ){
				escreva("\nInsira as seguintes informações sobre o kart a ser cadastrado: ")
				
				escreva("\nModelo: ")
				leia(modelo[i])
				
				escreva("\nCor: ")
				leia(cor[i])
				
				escreva("\nStatus uso (disponível para uso ou em manutenção): ")
				leia(statusUso[i])

				escreva("\nValor locação: ")
				leia(valorLocacao[i])
				
				escreva("\nTotal gasto com o Kart: ")
				leia(totalGasto[i])
				
				escreva("\nQuantidade de vezes locado: ")
				leia(qntVezesLocado[i])
				
				escreva("\nStatus locação (0 para alugado ou 1 disponível para locação): ")
				leia(statusLocacao[i])
				se (statusLocacao[i] != 0 e statusLocacao[i] != 1){
					faca{
						escreva("Digite uma opção válida:\n0-Alugado \n1-Disponível p/ alugar\n")
						leia(statusLocacao[i])
					}enquanto(statusLocacao[i] != 0 e statusLocacao[i] != 1)
				}
				
			} senao{
				escreva("\nA posição ", i, " já está ocupada, escolha outra posição: ")
				leia(i)
				enquanto(i<0 ou i>14){
						escreva("\nOpção inválida. Insira um numero entre 0 e 14: ")
						leia(i)
					}
				cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
			}

			escreva("\n Deseja cadastrar um novo kart?s/n\n")
			leia(resp)

			se(resp == "sim" ou resp == "s" ou resp == "SIM" ou resp == "S") {
				cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
				resp = ""
			}
			senao {
				repeticao = falso
			}

			}

	}

//funcao para listar karts disponiveis
	funcao listarKartsDisponiveis(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[]){

		logico encontrou = falso

		escreva("\nKarts disponíveis:\n")
		para(inteiro i = 0; i < 15; i++) {

			se(modelo[i] != ""){
				
				escreva("\nKart ", i, 
         "\n-Modelo: ", modelo[i],
         "\n-Cor: ", cor[i] ,
         "\n-Status: ", statusUso[i], 
         "\n-Valor da locação: R$", valorLocacao[i],
         "\n-Total gasto: ", totalGasto[i], 
         "\n-Vezes locado: ", qntVezesLocado[i], 
         "\n-Status locação: ", statusLocacao[i], "\n")
				encontrou = verdadeiro
			}
		}
		
		se(encontrou == falso){
				escreva("Não há karts disponíveis!")
			}
	}
	
//funcao para listar karts locados

	funcao ListarKartsLocados(cadeia &modelo[], inteiro &statusLocacao[]){
		inteiro i
		logico encontrou = falso

		escreva("\nKart(s) locado(s): \n")
		para(i = 0; i < 15; i++){
			se (modelo[i] != ""){
				 se (statusLocacao[i] != 1){
				 	escreva("\n", i,"-O modelo: ", modelo[i], " está alugado")
				 	encontrou = verdadeiro
				 	}
				}
			}
      se(encontrou == falso)
			escreva("\nNão há karts Alugados")
		}



//funcao para listar karts em manutencao
	funcao listarKartsManutencao(cadeia &modelo[], cadeia &statusUso[]){
		
    logico encontrou = falso
		escreva("\nKarts em manutencao:\n")
		para(inteiro i = 0; i < 15; i++) {
      
			se(modelo[i] != "" e statusUso[i] != "disponivel"){
				
				escreva("\n", i,"-O modelo: ", modelo[i], " está em manutencao!")
				encontrou = verdadeiro
			} 
		}
    se(encontrou == falso) {
			escreva("\nNão há karts em manutenção")
		}
	}

	//FUNÇÃO RESPONSÁVEL POR DEVOLVER UM KART
	funcao devolverKart(cadeia modelo[], inteiro statusLocacao[]){

		inteiro posicaoKart

		para(inteiro i = 0; i < 15; i++){
			se(modelo[i] != "" e statusLocacao[i] == 1){
            		escreva("\nPosição ", i, " - ", modelo[i])
        		}
		}

		escreva("\nDigite a posicao do kart que deseja devolver: ")
		leia(posicaoKart)

		se(modelo[posicaoKart] != "" e statusLocacao[posicaoKart] == 1){
        		statusLocacao[posicaoKart] = 0
        		escreva("\nKart devolvido com sucesso!")
    		}
    		
    		senao{
        		escreva("\nEsse kart não está locado ou não existe.")
   	     }
	}

//Qual kart foi o mais locado
	funcao kartMaisLocado (cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[]){
		inteiro valorTemporario = 0, numeroKart = 0
		para(inteiro i=0; i<15; i++){
			se(valorTemporario < qntVezesLocado[i]){
				valorTemporario = qntVezesLocado[i]
				numeroKart = i
			}
		}
		escreva("\nO kart mais locado foi locado ", qntVezesLocado[numeroKart], " vezes!")
		escreva("\n========= ESPECIFICAÇÕES ==============")
		escreva("\nModelo: ", modelo[numeroKart])
		escreva("\nCor: ", cor[numeroKart])
		escreva("\nStatus de uso: ", statusUso[numeroKart])
		escreva("\nValor locação: ", valorLocacao[numeroKart])
		escreva("\nTotal despesas: ", totalGasto[numeroKart])
		escreva("\nStatus de locação: ", statusLocacao[numeroKart])
		escreva("========================================\n")
		
	}

//funcao atualizar dados do kart
	funcao atualizarDadosKart(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[], inteiro &i){

		inteiro posicao, opcao = 0

		escreva("Digite a posição do kart: ")
    		leia(posicao)

    		se(posicao >= 0 e posicao < 15){
    			se(modelo[posicao] != ""){
		      escreva("1 - Cor")
		      escreva("2 - Status de uso")
		      escreva("3 - Valor da locação")
		      escreva("4 - Gasto de manutenção")
		      escreva("5 - Atualizar tudo")
	        	 leia(opcao)

    	    		}
    	    		
    	    		senao{
        			escreva("Nenhum kart cadastrado nessa posição.")
    	    		}

    	    		se(opcao == 1) {
    				escreva("Digite a nova cor")
    				leia(cor[posicao])
    	    		}
    	    		
    	    		senao se(opcao == 2) {
			    escreva("Digite o novo status de uso (disponivel ou manutencao): ")
			    leia(statusUso[posicao])
			}
			
			senao se(opcao == 3) {
			    escreva("Digite o novo valor da locação: ")
			    leia(valorLocacao[posicao])
			}
			
			senao se(opcao == 4) {
			    real novoGasto
			
			    escreva("Digite o valor gasto na manutenção: ")
			    leia(novoGasto)
			
			    // Soma ao valor já existente
			    totalGasto[posicao] = totalGasto[posicao] + novoGasto
			}
			
			senao se(opcao == 5) {
			    escreva("Digite a nova cor: ")
			    leia(cor[posicao])
			
			    escreva("Digite o novo status de uso: ")
			    leia(statusUso[posicao])
			
			    escreva("Digite o novo valor da locação: ")
			    leia(valorLocacao[posicao])
			
			    escreva("Digite o total gasto com manutenção: ")
			    leia(totalGasto[posicao])
			
			    escreva("Digite a quantidade de vezes locado: ")
			    leia(qntVezesLocado[posicao])
			
			    escreva("Digite o status da locação (0 = alugado, 1 = disponível): ")
			    leia(statusLocacao[posicao])
			}
			
			senao {
			    escreva("Opção inválida!")
			}
		}

    		senao {
    			escreva("Posicao invalida!")
    		} 	
	}

//funcao para alugar um kart
	funcao alugarKart(cadeia &modelo[], cadeia &statusUso[],inteiro &statusLocacao[],inteiro &qntVezesLocado[]) {

		inteiro posicao 

		para(inteiro i = 0; i < 15; i++) {

			se(modelo[i] != "" e statusUso[i] != "manutencao" e statusLocacao[i] == 1) {
				escreva("\nPosição ", i, " - ", modelo[i])
			}
		}

		escreva("\nDigite a posição do kart que deseja alugar: ")
	     leia(posicao)
	
	    se(posicao >= 0 e posicao < 15) {
	        se(modelo[posicao] != "" e statusUso[posicao] != "manutencao" e statusLocacao[posicao] == 1) {
	            statusLocacao[posicao] = 0
	            qntVezesLocado[posicao] = qntVezesLocado[posicao] + 1
	
	            escreva("\nKart alugado com sucesso!")
	        }
	        
	        senao{
	            escreva("\nEsse kart não está disponível para locação.")
	        }
	    }
	    
	    senao{
	        escreva("\nPosição inválida!")
	    }
	}
	

//Menu do sistema
	funcao menuSistema() {
		
		inteiro navegaMenu
  		logico funcionamento = verdadeiro, locacaoPista = falso
  		cadeia modelo[15], cor[15], corb[15], statusUso[15], statusUsob[15]
		real valorLocacao[15], valorLocacaob[15], totalGasto[15], totalGastob[15], valorLocacaoPista = 0.0, novoValorPista= 0.0
		inteiro qntVezesLocado[15], qntVezesLocadob[15], statusLocacao[15], statusLocacaob[15], i
		
//Teste
para(i = 0; i < 15;i++){
  modelo[i] = ""
  cor [i] = ""
  corb[i] = ""
  statusUso[i] = ""
  statusUsob[i] = ""
  qntVezesLocadob[i] = 0
  qntVezesLocado[i] = 0
  statusLocacao[i] = 0
  statusLocacaob[i] = 0
  totalGasto[i] = 0.0
  totalGastob[i] = 0.0
  valorLocacao[i] = 0.0
  valorLocacaob[i] = 0.0
}

	  //Escrever funções de cada número do menu dentro do respectivo "se" (Função 12 já pronta, não alterar)
		
	 	enquanto(funcionamento == verdadeiro){

	  	escreva("\n======================[ MENU ]============================")
		escreva("\n1 - Cadastrar um Kart")
		escreva("\n2 - Listar Karts disponíveis")
		escreva("\n3 - Listar Karts locados")
		escreva("\n4 - Listar Karts em manutenção")
		escreva("\n5 - Atualizar dados do Kart")
		escreva("\n6 - Alugar um Kart")
		escreva("\n7 - Devolver um Kart")
		escreva("\n8 - Kart que mais gerou ganhos")
	  escreva("\n9 - Receita e lucro do dia, considerando karts locados")
		escreva("\n10 - Locação de circuito")
		escreva("\n11 - Atualizar dia")
		escreva("\n12 - Sair do programa")
		escreva("\n==========================================================")

	     escreva("\nESCOLHA UMA OPÇÃO: ")
 		leia (navegaMenu)
  
		se (navegaMenu == 1){
			escreva("Escolha em qual posição (0 a 14) o kart vai ser cadastrado: ")
			leia(i)
	    		cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
	  	}
	  
	  	senao se(navegaMenu == 2){
	    		listarKartsDisponiveis(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao)
	    		limpaProssegue()
	  	}
  
 	     senao se(navegaMenu == 3){
    			ListarKartsLocados(modelo, statusLocacao)
    			limpaProssegue()
  		}

  		senao se(navegaMenu == 4){
    			listarKartsManutencao(modelo, statusUso)
    			limpaProssegue()
  		}

  		senao se(navegaMenu == 5){
    			atualizarDadosKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
    			limpaProssegue()
  		}

  		senao se(navegaMenu == 6){
    			 alugarKart(modelo, statusUso, statusLocacao, qntVezesLocado)
    			 limpaProssegue()
  		}

  		senao se(navegaMenu == 7){
  			devolverKart(modelo,statusLocacao)
  			limpaProssegue()
  		}

  		senao se(navegaMenu == 8){
  			kartMaisLocado(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao)
  			limpaProssegue()
  		}

  		senao se(navegaMenu == 9){
    
  		}

  		senao se(navegaMenu == 10){
    			locacao(locacaoPista, valorLocacaoPista)
  		}

  		senao se(navegaMenu == 11){
    			atualizaDia(locacaoPista)
  		}

  		senao se(navegaMenu == 12){
  			escreva("\n------------------- PROGRAMA ENCERRADO -------------------\n")
    			funcionamento = falso
  		}
		}
	
	}

	
	funcao inicio()
	{
		
		menuSistema()
		
		
	}




funcao limpaProssegue(){
	cadeia prosseguir

	escreva ("\n\nPressione <enter> para prosseguir!: ")
	leia(prosseguir)
	limpa()
	}

	//COPIE E COLE
// preencherVetores(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao)


funcao preencherVetores(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[]){

modelo[0] = "Gol"
cor[0] = "Branco"
statusUso[0] = "Disponivel"
valorLocacao[0] = 120.0
totalGasto[0] = 1200.0
qntVezesLocado[0] = 10
statusLocacao[0] = 0

modelo[1] = "Onix"
cor[1] = "Preto"
statusUso[1] = "Locado"
valorLocacao[1] = 150.0
totalGasto[1] = 900.0
qntVezesLocado[1] = 6
statusLocacao[1] = 1

modelo[2] = "HB20"
cor[2] = "Prata"
statusUso[2] = "Disponivel"
valorLocacao[2] = 140.0
totalGasto[2] = 560.0
qntVezesLocado[2] = 4
statusLocacao[2] = 0

modelo[3] = "Civic"
cor[3] = "Vermelho"
statusUso[3] = "Manutencao"
valorLocacao[3] = 250.0
totalGasto[3] = 2000.0
qntVezesLocado[3] = 8
statusLocacao[3] = 2

modelo[4] = "Corolla"
cor[4] = "Azul"
statusUso[4] = "Disponivel"
valorLocacao[4] = 260.0
totalGasto[4] = 2600.0
qntVezesLocado[4] = 10
statusLocacao[4] = 0

modelo[5] = "Uno"
cor[5] = "Cinza"
statusUso[5] = "Locado"
valorLocacao[5] = 100.0
totalGasto[5] = 700.0
qntVezesLocado[5] = 7
statusLocacao[5] = 1

modelo[6] = "Argo"
cor[6] = "Branco"
statusUso[6] = "Disponivel"
valorLocacao[6] = 130.0
totalGasto[6] = 650.0
qntVezesLocado[6] = 5
statusLocacao[6] = 0

modelo[7] = "Cruze"
cor[7] = "Preto"
statusUso[7] = "Disponivel"
valorLocacao[7] = 220.0
totalGasto[7] = 1540.0
qntVezesLocado[7] = 7
statusLocacao[7] = 0

modelo[8] = "Ka"
cor[8] = "Prata"
statusUso[8] = "Locado"
valorLocacao[8] = 110.0
totalGasto[8] = 880.0
qntVezesLocado[8] = 8
statusLocacao[8] = 1

modelo[9] = "Palio"
cor[9] = "Vermelho"
statusUso[9] = "Disponivel"
valorLocacao[9] = 105.0
totalGasto[9] = 420.0
qntVezesLocado[9] = 4
statusLocacao[9] = 0

modelo[10] = "Tracker"
cor[10] = "Azul"
statusUso[10] = "Manutencao"
valorLocacao[10] = 280.0
totalGasto[10] = 1960.0
qntVezesLocado[10] = 7
statusLocacao[10] = 2

modelo[11] = "Compass"
cor[11] = "Cinza"
statusUso[11] = "Disponivel"
valorLocacao[11] = 300.0
totalGasto[11] = 2400.0
qntVezesLocado[11] = 8
statusLocacao[11] = 0

modelo[12] = "Renegade"
cor[12] = "Branco"
statusUso[12] = "Locado"
valorLocacao[12] = 290.0
totalGasto[12] = 1450.0
qntVezesLocado[12] = 5
statusLocacao[12] = 1

modelo[13] = "T-Cross"
cor[13] = "Preto"
statusUso[13] = "Disponivel"
valorLocacao[13] = 270.0
totalGasto[13] = 1080.0
qntVezesLocado[13] = 4
statusLocacao[13] = 0

modelo[14] = "Kwid"
cor[14] = "Prata"
statusUso[14] = "Disponivel"
valorLocacao[14] = 95.0
totalGasto[14] = 285.0
qntVezesLocado[14] = 3
statusLocacao[14] = 0
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5766; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
