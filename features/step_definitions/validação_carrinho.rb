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
	assert_text("Fralda Descartável Turma da Mônica Huggies Supreme Care Feminina G 32 Unidades")
	sleep 3
end

Dado(/^que esteja na compra$/) do
  visit ("https://www.walmart.com.br/fralda-descartavel-turma-da-monica-huggies-supreme-care-feminina-g-32-unidades/4912973/pr")
  click_button("Adicionar ao carrinho")
  click_link("Meu carrinho")
  find("Finalizar compra", match: :first).click
end

Dado(/^esteja efetuando o loggin$/) do
  #page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  page.find("client-sign-in").click
  fill_in "email", :with => "35263646801"
  #fill_in "password", :with => "nandinho10"
  click_button("Entrar")
  sleep 5
end

Quando(/^finalizá\-lo$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Então(/^comprar o produto com pagamento via boleto$/) do
  pending # Write code here that turns the phrase above into concrete actions
end