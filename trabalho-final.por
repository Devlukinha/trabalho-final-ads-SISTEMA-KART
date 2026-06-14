programa
{

	//FUNÇÃO CRIADA APENAS PARA PREENCHER OS VETORES
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


	//FUNÇÃO RESPONSÁVEL POR DEVOLVER UM KART
	funcao devolverKart(cadeia modelo[], cadeia cor[], inteiro statusLocacao[]){
		inteiro kartsDisponiveis[15], selecionarKart
		//LISTANDO CARROS LOCADOS
		escreva("LISTA DE KARTS LOCADOS: \n")
		para(inteiro i=0; i<15; i++){
			se(statusLocacao[i] == 0){
				escreva("=============================================\n")
				escreva("Kart ", i, "\n")
				escreva("Modelo : ", modelo[i], "\n")
				escreva("Cor    : ", cor[i], "\n")
				escreva("=============================================\n")
				kartsDisponiveis[i] = 99
			}senao{
				kartsDisponiveis[i] = i
			}
		}
		//SELECIONAR QUAL KART VAI SER DEVOLVIDO
		faca{
			escreva("SELECIONE QUAL CARRO VOCÊ DESEJA REMOVER: ")
			leia(selecionarKart)
			
			para(inteiro i=0; i<15; i++){
				se(selecionarKart == kartsDisponiveis[i]){
					escreva("ESTE CARRO NÃO ESTÁ LOCADO!\n")
					selecionarKart = -1
				}
			}
		}enquanto(selecionarKart == -1 ou selecionarKart < 0 ou selecionarKart > 15)
			
			statusLocacao[selecionarKart] = 1
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
  			preencherVetores(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao) // adicionei so para testar o código
  			devolverKart(modelo, cor, statusLocacao)
  			funcionamento = falso
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
 * @POSICAO-CURSOR = 7306; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {modelo, 181, 28, 6}-{cor, 181, 45, 3}-{statusLocacao, 181, 60, 13}-{kartsDisponiveis, 182, 10, 16}-{selecionarKart, 182, 32, 14};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */