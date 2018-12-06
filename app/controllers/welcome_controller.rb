# frozen_string_literal: true

class WelcomeController < ApplicationController
  #pagina estatica home com informações do sistema
  def index
    @about = About.first
  end

  #pagina estatica about com descrição do funcionamento do sistema
  def about
    @about = About.first
  end

  def coordinators
    @coordinators = User.with_role(:coordinator).order(:name)
  end

  def show
    @coordinator = User.find(params[:id])
  end

  #pagina estatica com informações de contato
  def contact
  end

  ##pagina information com informações sobre o que é necessário pra entrar lista de espera
  def information
  end

end
