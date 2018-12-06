# frozen_string_literal: true

# Controller para que o admin do sistema tenha acesso ao seu backoffice
class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  # Permite apenas admin logados
  def check_admin
    redirect_to root_path unless current_user.has_role? :admin
  end
end
