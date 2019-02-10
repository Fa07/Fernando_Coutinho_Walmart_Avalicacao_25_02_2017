#require 'rspec'
require 'cucumber'
require 'selenium/webdriver'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'pry'
require 'site_prism'

#CONFIGURANDO O DRIVER CAPYBARA
Capybara.register_driver :chromedriver do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#SETANDO A CONFIGURAÇÃO DO DRIVER COMO PADRÃO
Capybara.default_driver = :chromedriver

#TIMEOUT PADRÃO NA EXECUÇÃO
Capybara.default_max_wait_time = 15

#MAXIMIZAR A TELA AO INICIAR O TESTE
Capybara.page.driver.browser.manage.window.maximize
