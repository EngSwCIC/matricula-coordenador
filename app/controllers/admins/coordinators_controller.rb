class Admins::CoordinatorsController < AdminsController

  # GET /coordinators
  # GET /coordinators.json
  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = coordinator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_params
      params.require(:coordinator).permit(:name, :email, :password, :admin)
    end
end
