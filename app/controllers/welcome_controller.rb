# frozen_string_literal: true

# Controller para controlar as páginas estáticas da aplicação
class WelcomeController < ApplicationController
  # pagina estatica home com informações do sistema
  def index
    @about = About.first
  end

  # pagina estatica about com descrição do funcionamento do sistema
  def about
    @about = About.first
  end

  # pagina estatica com a lsita de coordenadores do sistema
  def coordinators
    @coordinators = User.with_role(:coordinator).order(:name)
  end

  # pagina estatica com as infos de algum coordenador específico selecionado
  def show
    @coordinator = User.find(params[:id])
  end

  # pagina estatica com informações de contato
  def contact; end

  # pagina information com informações sobre o que é necessário pra entrar lista de espera
  def information; end
end
