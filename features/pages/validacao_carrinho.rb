class Home < SitePrism::Page
  #site utilizado para o teste
  set_url "https:www.walmart.com.br"
  #elementos que serão utilizados na automação
  element :campo_busca, '[id="suggestion-search"]'
  element :btn_busca, '[class="search-icon-topbar wm-icon icon-search-topbar"]' #'//*[@id="site-topbar"]/div[2]/form/button'
  element :produto, '[class="column item-0 shelf-product-item"]'
  element :btn_add_carrinho, '[class="button-success button-pill right buy-button buy-button-product fluid"]'
  element :btn_meu_carrinho, '[class="topbar-buttons open-link cart-link"]'
  element :btn_comprar, '[id="btn-finalize-cart"]'

  def busca_produto
    campo_busca.set "Fralda Descartável Turma da Mônica Tripla Ação Jumbo P 36 Unidades"
    btn_busca.click
  end

  def seleciona_prod
    produto.click
  end

  def adiciona_carrinho
    btn_add_carrinho.click
  end

  def meu_carrinho
    btn_meu_carrinho.click
  end

  def finalizar_compra
    btn_comprar.click
  end

  def logar
    page.within_frame('//*[@id="iframeLogin"]') do
      page.find('[id="signinField"]').set '35263646801'
      page.find('[id="password"]').set 'nandinho10'
      page('[id="signinButtonSend"]').click
    end
  end

end

#//html/body/div[4]/section/main/iframe
