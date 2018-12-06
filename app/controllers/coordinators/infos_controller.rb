# frozen_string_literal: true

# Controller para que o coordenador do sistema tenha acesso as suas informações
class Coordinators::InfosController < CoordinatorsController
  before_action :authenticate_user!
  before_action :set_coordinator, only: %i[edit update]
  # GET /coordinators
  # GET /coordinators.json
  # Mostra as informações do coordenador
  def index
    @coordinator = current_user
  end

  # Método update das infos do coordenador
  def update
    respond_to do |format|
      if @coordinator.update_without_password(coordinator_params)
        flash[:success] = 'Sucesso na edição dos dados do coordenador'
        format.html { redirect_to coordinators_infos_path, notice: 'Informações atualizadas com sucesso.' }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        flash[:danger] = 'Erro na edição dos dados do coordenador'
        format.html { render :edit }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Seta o coordenador a partir do usuario logado pelo devise
  # Use callbacks to share common setup or constraints between actions.
  def set_coordinator
    @coordinator = current_user
  end

  # Parâmetros do coordenador
  # Never trust parameters from the scary internet, only allow the white list through.
  def coordinator_params
    params.require(:user).permit(:name, :notices, :office_hours, :email, :password)
  end
end
