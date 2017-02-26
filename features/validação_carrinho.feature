#language: pt
#utf-8

Funcionalidade: Adicionar produto no carrinho
	Eu como consumidor
	Quero procurar um produto do meu desejo
	Para adicioná-lo ao carrinho

	Cenario: Adicionar produto ao carrinho
		Dado que esteja na home do site
		E pesquise pelo produto desejado
		Quando buscar o nome do produto
		E solicitar sua compra
		Então o produto estará no carrinho


	@test	
	Cenario: Finalizar a compra com login efetuado
		Dado que esteja na compra
		E esteja efetuando o loggin
		Quando finalizá-lo
		Então comprar o produto com pagamento via boleto