# frozen_string_literal: true

# Controller for admins controll all coordinators
class Admins::CoordinatorsController < AdminsController
  before_action :set_coordinator, only: %i[destroy edit update]
  before_action :get_all_courses, only: %i[create edit update new]
  # GET /coordinators
  # GET /coordinators.json
  def index
    @coordinators = User.with_role(:coordinator)
  end

  def new
    @coordinator = User.new
  end

  # :reek:DuplicateMethodCall { allow_calls: ['format.html', 'format2.html'] }
  def create
    @coordinator = User.new(coordinator_params)
    @coordinator.add_role :coordinator
    respond_to do |format|
      if @coordinator.save
        format.html { redirect_to admins_coordinators_path, notice: 'Coordenador criado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  # :reek:DuplicateMethodCall
  def update
    respond_to do |format|
      if @coordinator.update_without_password(coordinator_params)
        format.html { redirect_to admins_coordinators_path, notice: 'Coordenador editado com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /coordinators/1
  # DELETE /coordinators/1.json
  def destroy
    @coordinator.destroy
    respond_to do |format|
      format.html { redirect_to admins_coordinators_url, notice: 'Coordenador excluído com sucesso' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_coordinator
    @coordinator = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def coordinator_params
    params.require(:user).permit(:name, :email, :password, :course_id)
  end

  def get_all_courses
    @courses = Course.all
  end
end
