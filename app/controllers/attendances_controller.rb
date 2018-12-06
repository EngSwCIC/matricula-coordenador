class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = Attendance.all.order(priority_student: :asc)
  end

  def show
  end

  def new
    @attendance = Attendance.new
  end

  def edit
  end

  # :flay:DuplicateCode
  # :reek:DuplicateMethodCall { allow_calls: ['format.html'] }
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendances_path, notice: 'Atendimento Criado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  # :reek:DuplicateMethodCall { allow_calls: ['format.html'] }
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendances_path, notice: 'Atendimento editado com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Atendimento foi realizado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:name_student, :course_student, :comment, :priority_student)
    end
end
