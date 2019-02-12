Dado(/^que esteja na home do site$/) do
  Home = Home.new
  Home.load
end

Dado(/^pesquise pelo produto desejado$/) do
  Home.busca_produto
end

Quando(/^buscar o nome do produto$/) do
  Home.seleciona_prod
end

Quando(/^solicitar sua compra$/) do
  Home.adiciona_carrinho
end

Então(/^o produto estará no carrinho$/) do
  Home.meu_carrinho
  Home.finalizar_compra
  Home.logar
end

Dado(/^que esteja na compra$/) do
  visit ("https://www.walmart.com.br/fralda-descartavel-turma-da-monica-huggies-supreme-care-feminina-g-32-unidades/4912973/pr")
  page.find('[class="topbar-buttons open-link cart-link"]').click
end

Dado(/^esteja efetuando o loggin$/) do
  visit "https://www2.walmart.com.br/login?modal=true&continue=https://connect.walmart.com.br/connect/authorize?response_type=code&client_id=walmart_checkout&redirect_uri=https://www2.walmart.com.br/checkout/services/transaction/oauth/callback/walmart_checkout"
  #page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  fill_in "signinField", :with => "35263646801"
  fill_in "password", :with => "nandinho10"
  click_button("Entrar")
  visit "https://www2.walmart.com.br/checkout/content/#chooseAddress"
end

Quando(/^finalizá\-lo$/) do
  click_button("btn-set-delivery")
  find(".continue-button").click
end

Então(/^comprar o produto com pagamento via boleto$/) do
  find(".icon-bank-slip-small").click
  click_button("Finalizar compra")
  assert_text("Seu pedido foi enviado com sucesso!")
end
