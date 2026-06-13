programa
{
	
	funcao cadastrarKart(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[], inteiro &i ){

		cadeia resp
		logico repeticao = verdadeiro

		
			enquanto(repeticao == verdadeiro) {
				se(modelo[i]=="" e cor[i]=="" e statusUso[i]=="" e valorLocacao[i]==0 e totalGasto[i]==0 e qntVezesLocado[i]==0 e statusLocacao[i]==0 ){
				escreva("\nInsira as seguintes informações sobre o kart a ser cadastrado:")
				
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
				
			} senao{
				escreva("\nA posição ", i, " já está ocupada, escolha outra posição")
				leia(i)
				cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
			}

			escreva("\n Deseja cadastrar um novo kart?\n")
			leia(resp)

			se(resp == "sim") {
				cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
			}
			senao {
				repeticao = falso
			}

			}

			
		
	}

	funcao listarKartsDisponiveis(cadeia &modelo[], cadeia &statusUso[]){

		escreva("\n Karts disponíveis:\n")
		para(inteiro i = 0; i < 15; i++) {

			se(modelo[i] != "" e statusUso[i] != "manutencao"){
				
				escreva("O modelo: ", modelo[i], " está disponível para uso")
				
			}
		}
	}



	funcao menuSistema() {
		
		inteiro navegaMenu
  		logico funcionamento = verdadeiro
  		cadeia modelo[15], cor[15], corb[15], statusUso[15], statusUsob[15]
		real valorLocacao[15], valorLocacaob[15], totalGasto[15], totalGastob[15]
		inteiro qntVezesLocado[15], qntVezesLocadob[15], statusLocacao[15], statusLocacaob[15], i
		

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
		escreva("\n12 - Sair do programa")
		escreva("\n==========================================================")
  
  		escreva("\nESCOLHA UMA OPÇÃO: ")
 		leia (navegaMenu)
  

	  //Escrever funções de cada número do menu dentro do respectivo "se" (Função 12 já pronta, não alterar)

	  enquanto(funcionamento == verdadeiro)
		se (navegaMenu == 1){
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
    
  		}

  		senao se(navegaMenu == 5){
    
  		}

  		senao se(navegaMenu == 5){
    
  		}

  		senao se(navegaMenu == 6){
    
  		}

  		senao se(navegaMenu == 7){
    
  		}

  		senao se(navegaMenu == 8){
    
  		}

  		senao se(navegaMenu == 9){
    
  		}

  		senao se(navegaMenu == 10){
    
  		}

  		senao se(navegaMenu == 11){
    
  		}

  		senao se(navegaMenu == 12){
  			escreva("\n------------------- PROGRAMA ENCERRADO -------------------\n")
    			funcionamento = falso
  		}
	}
	
	
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
 * @POSICAO-CURSOR = 1444; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */