programa
{
//função atualizar dia

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
	funcao cadastrarKart(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[], inteiro &i ){
		
		
		cadeia resp
		logico repeticao = verdadeiro
	
			enquanto(repeticao == verdadeiro) {
				se(modelo[i]=="" e cor[i]=="" e statusUso[i]=="" e valorLocacao[i]==0 e totalGasto[i]==0 e qntVezesLocado[i]==0 e statusLocacao[i]==0 ){
				
				escreva("\n----------------------------------------------------------------------------")
				escreva("\n    Insira as seguintes informações para realizar o cadastro do kart:")
				escreva("\n----------------------------------------------------------------------------")
				
				escreva("\nModelo: ")
				leia(modelo[i])
				
				escreva("Cor: ")
				leia(cor[i])
				
				escreva("Status uso (disponível ou manutenção): ")
				leia(statusUso[i])
				
				escreva("Valor locação: R$")
				leia(valorLocacao[i])
				
				escreva("Total gasto com o Kart: R$")
				leia(totalGasto[i])
				
				escreva("Quantidade de vezes locado: ")
				leia(qntVezesLocado[i])
				
				escreva("Status locação (0 para alugado ou 1 disponível para locação): ")
				
				faca{
					escreva("\nDigite uma opção válida:\n0-Alugado \n1-Disponível p/ alugar\n")
					leia(statusLocacao[i])
				}enquanto(statusLocacao[i] != 0 e statusLocacao[i] != 1)
				
				} senao{
					escreva("\nA posição ",i," já está ocupada, escolha outra posição: ")
					leia(i)
					enquanto(i<0 ou i>14){
						escreva("\nOpção inválida. Insira um numero entre 0 e 14: ")
						leia(i)
					}
					cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
				}
	
				escreva("\nDeseja cadastrar um novo kart?(s/n): ")
				leia(resp)
	
				se(resp == "sim" ou resp == "s" ou resp == "SIM" ou resp == "S") {
					cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
				}
				senao{
					repeticao = falso
				}

			}

	}//fim funcao cadastrarKart()

//funcao para listar karts disponiveis
	funcao listarKartsDisponiveis(cadeia &modelo[], cadeia &statusUso[]){

		logico encontrou = falso

		escreva("\nKarts disponíveis:\n")
		para(inteiro i = 0; i < 15; i++) {
			se(modelo[i] != "" e statusUso[i] != "manutencao"){
				escreva("O modelo: ", modelo[i], " está disponível para uso")
				encontrou = verdadeiro
			}
		}
		
		se(encontrou == falso){
			escreva("Não há karts disponíveis!")
		}
	}//fim funcao listarKartsDisponiveis()
	
//funcao para listar karts em manutencao
	funcao listarKartsManutencao(cadeia &modelo[], cadeia &statusUso[]){

		logico encontrou = falso
		
		escreva("\nKarts em manutencao:\n")
		para(inteiro i = 0; i < 15; i++) {
			se(modelo[i] != "" e statusUso[i] != "disponivel"){
				escreva("O modelo: ", modelo[i], " está em manutencao!")
				encontrou = verdadeiro
			} 
		}

		se(encontrou == falso) {
			escreva("Não há karts em manutenção!")
		}
	}//fim funcao listarKartsManutencao()

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
		
	}//fim funcao devolverKart()

//funcao atualizar dados do kart
	funcao atualizarDadosKart(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[], inteiro &i){

		inteiro posicao, opcao=0

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
	}//fim funcao atualizarDadosKart()

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
	}//fim funcao alugarKart()

	//funcao para calcular receita e lucro do dia
	funcao receitaLucroDia(cadeia &modelo[], real &valorLocacao[], inteiro &statusLocacao[], logico &locacaoPista, real &valorLocacaoPista){

		real receitaTotal = 0, lucroTotal = 0 
		logico encontrouKart = falso

		limpa()
		escreva("====================[ RECEITA E LUCRO DO DIA ]====================\n")

		para(inteiro i = 0; i < 15; i++){
			se(modelo[i] != "" e statusLocacao[i] == 0){
				escreva("\nKart: ", modelo[i], " - Valor locação: R$", valorLocacao[i])
				receitaTotal = receitaTotal + valorLocacao[i]
				encontrouKart = verdadeiro
			}
		}

		se(encontrouKart == falso){
			escreva("\nNenhum kart locado no momento.")
		}

		se(locacaoPista == verdadeiro){
			escreva("\n\nCircuito locado - Acréscimo de 70%: R$", valorLocacaoPista * 0.7)
			receitaTotal = receitaTotal + (valorLocacaoPista * 0.7)
		}
		senao{
			escreva("\n\nCircuito não locado - sem acréscimo na receita.")
		}

		lucroTotal = receitaTotal * 0.3

		escreva("\n\n----------------------------------------------------------------")
		escreva("\nReceita total do dia: R$", receitaTotal)
		escreva("\nLucro do dia (30%): R$", lucroTotal)
		escreva("\n----------------------------------------------------------------\n")

	}//fim funcao receitaLucroDia()
	

//Menu do sistema
	funcao menuSistema() {
		
		inteiro navegaMenu
  		logico funcionamento = verdadeiro, locacaoPista = falso
  		cadeia modelo[15], cor[15], corb[15], statusUso[15], statusUsob[15] 
		real valorLocacao[15], valorLocacaob[15], totalGasto[15], totalGastob[15], valorLocacaoPista =0, novoValorPista
		inteiro qntVezesLocado[15], qntVezesLocadob[15], statusLocacao[15], statusLocacaob[15], i
		

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
				limpa()
				escreva("Escolha em qual posição (0 a 14) o kart vai ser cadastrado: ")
				leia(i)
		    		cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
		  	}
		  
		  	senao se(navegaMenu == 2){
		    		listarKartsDisponiveis(modelo, statusUso)
		  	}
	  
	 	     senao se(navegaMenu == 3){
	    			
	  		}
	
	  		senao se(navegaMenu == 4){
	    			listarKartsManutencao(modelo, statusUso)
	  		}
	
	  		senao se(navegaMenu == 5){
	    			atualizarDadosKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
	  		}
	
	  		senao se(navegaMenu == 5){
	    
	  		}
	
	  		senao se(navegaMenu == 6){
	    
	  		}
	
	  		senao se(navegaMenu == 7){
	    			
	  			devolverKart(modelo,statusLocacao)
	  		}
	
	  		senao se(navegaMenu == 8){
	    
	  		}
	
	  		senao se(navegaMenu == 9){
    			receitaLucroDia(modelo, valorLocacao, statusLocacao)
			}
	    
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
	
	}//fim funcao menuSistema()

	
	funcao inicio()
	{
		
		menuSistema()
		
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9301; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 12888; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */