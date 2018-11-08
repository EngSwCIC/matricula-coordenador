class Admins::CoordinatorsController < AdminsController
  before_action :set_coordinator, only: [:destroy, :edit, :update]
  # GET /coordinators
  # GET /coordinators.json
  def index
    @coordinators = User.with_role(:coordinator)
  end

  def new
    @coordinator = User.new
  end

  def create
    @coordinator = User.new(coordinator_params)

    respond_to do |format|
      if @coordinator.save
        @coordinator.add_role :coordinator
        format.html { redirect_to admins_coordinators_path, notice: 'coordinator was successfully created.' }
        format.json { render :show, status: :created, location: @coordinator }
      else
        format.html { render :new }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @coordinator.update_without_password(coordinator_params)
        format.html { redirect_to admins_coordinators_path, notice: 'Coordinator was successfully updated.' }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        format.html { render :edit }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinators/1
  # DELETE /coordinators/1.json
  def destroy
    @coordinator.destroy
    respond_to do |format|
      format.html { redirect_to admins_coordinators_url, notice: 'Coordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_params
      params.require(:user).permit(:name, :email, :password)
    end
end
