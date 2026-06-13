programa
{
	
	funcao cadastrarKart(cadeia &modelo[], cadeia &cor[], cadeia &statusUso[], real &valorLocacao[], real &totalGasto[], inteiro &qntVezesLocado[], inteiro &statusLocacao[], inteiro &i ){
		
		
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
		
	}

	funcao listarKartsDisponiveis(){
		
	}
	
	
	funcao inicio()
	{
		
		cadeia modelo[15], modelob[15], cor[15], corb[15], statusUso[15], statusUsob[15]
		real valorLocacao[15], valorLocacaob[15], totalGasto[15], totalGastob[15]
		inteiro qntVezesLocado[15], qntVezesLocadob[15], statusLocacao[15], statusLocacaob[15], i
		
		escreva("Escolha em qual posição (0 a 14) o kart vai ser cadastrado: ")
		leia(i)
		
		cadastrarKart(modelo, cor, statusUso, valorLocacao, totalGasto, qntVezesLocado, statusLocacao, i)
		
		modelob[i]=modelo[i]
		corb[i]=cor[i]
		statusUsob[i]=statusUso[i]
		valorLocacaob[i]=valorLocacao[i]
		totalGastob[i]=totalGasto[i]
		qntVezesLocadob[i]=qntVezesLocado[i]
		statusLocacaob[i]=statusLocacao[i]
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 401; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {cor, 4, 48, 3}-{modelob, 40, 21, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */