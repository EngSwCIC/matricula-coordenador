# frozen_string_literal: true

# Controller para que o coordenador do sistema tenha acesso ao seu backoffice
class CoordinatorsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_coordinator

  private

  # Apenas permite coordenadores logados
  def check_coordinator
    redirect_to root_path unless current_user.has_role? :coordinator
  end
  end
