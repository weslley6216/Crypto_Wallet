class WelcomeController < ApplicationController
  def index
    cookies[:curso] = 'Curso de Ruby on Rails [COOKIE]'
    session[:session] = 'Curso de Ruby on Rails [SESSION]'
    @meu_nome = params[:nome]
  end
end
