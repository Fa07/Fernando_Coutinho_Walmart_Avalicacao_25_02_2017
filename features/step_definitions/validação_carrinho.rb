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
  visit "https://www2.walmart.com.br/checkout/content/carrinho/"
  sleep 5
  click_button("btn-finalize-cart")
end

Dado(/^esteja efetuando o loggin$/) do
  visit "https://www2.walmart.com.br/login?modal=true&continue=https://connect.walmart.com.br/connect/authorize?response_type=code&client_id=walmart_checkout&redirect_uri=https://www2.walmart.com.br/checkout/services/transaction/oauth/callback/walmart_checkout"
  #page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  fill_in "signinField", :with => "35263646801"
  fill_in "password", :with => "nandinho10"
  click_button("Entrar")
  visit "https://www2.walmart.com.br/checkout/content/#chooseAddress"
  sleep 10
end

Quando(/^finalizá\-lo$/) do
  click_button("btn-set-delivery")
  find(".continue-button").click
  sleep 5
end

Então(/^comprar o produto com pagamento via boleto$/) do
  find(".icon-bank-slip-small").click
  click_button("Finalizar compra")
  assert_text("Seu pedido foi enviado com sucesso!")
end