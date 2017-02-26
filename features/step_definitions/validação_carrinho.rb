Dado(/^que esteja na home do site$/) do
  visit "https:www.walmart.com.br"
end

Dado(/^pesquise pelo produto desejado$/) do
  fill_in "suggestion-search", :with => "Fralda Descartável Turma da Mônica Huggies Supreme Care Feminina G 32 Unidades"
  click_button("Procurar")
  sleep 3
end

Quando(/^buscar o nome do produto$/) do
  click_link("Fralda Descartável Turma da Mônica Huggies Supreme Care Feminina G 32 Unidades", match: :first)
  sleep 4
end

Quando(/^solicitar sua compra$/) do
	click_button("Adicionar ao carrinho")
	sleep 3
end

Então(/^o produto estará no carrinho$/) do
	click_link("Meu carrinho")
	sleep 3
end