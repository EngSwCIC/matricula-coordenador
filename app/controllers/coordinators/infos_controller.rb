class Coordinators::InfosController < CoordinatorsController
  before_action :authenticate_user!
  before_action :set_coordinator, only: [:edit, :update]
  # GET /coordinators
  # GET /coordinators.json 
  def index
    @coordinator = current_user
  end

  def update
    respond_to do |format|
      if @coordinator.update_without_password(coordinator_params)
        format.html { redirect_to coordinators_infos_path, notice: 'Informações atualizadas com sucesso.' }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        format.html { render :edit }
      format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_params
      params.require(:user).permit(:name, :notices, :office_hours, :email, :password)
    end
end
