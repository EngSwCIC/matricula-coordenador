# frozen_string_literal: true
# Controller para que os alunos requisitem atendimentos ao coordenador
class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attendance, only: %i[show edit update destroy]

  # Método index dos atendimentos
  def index
    @attendances = Attendance.all.order(priority_student: :asc)
  end

  # Método show dos atendimentos
  def show; end

  # Método new dos atendimentos
  def new
    @attendance = Attendance.new
  end

  # Método edit dos atendimentos
  def edit; end

  # Método create dos atendimentos
  # :flay:DuplicateCode
  # :reek:DuplicateMethodCall { allow_calls: ['format.html'] }
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendances_path, notice: 'Atendimento Criado com sucesso' }
      else
        flash[:danger] = "Por obséquio, favor responder todos os campos"
        format.html { render :new }
      end
    end
  end

  # Método update dos atendimentos
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

  # Método destroy dos atendimentos
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Atendimento foi realizado com sucesso' }
      format.json { head :no_content }
    end
  end

  def filter_by_priority
    priority_student = filter_params[:priority_student]
    if !priority_student.include?("Todas")
      @attendances = Attendance.where(priority_student: filter_params[:priority_student]).all
    else
      @attendances = Attendance.all.order(priority_student: :asc)
    end
    render json: { html: render_to_string(partial: 'attendances_list')  }
  end

  private

  # Recebe atendimento pelo id
  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Parâmetros do atendimento
  # Never trust parameters from the scary internet, only allow the white list through.
  def attendance_params
    params.require(:attendance).permit(:name_student, :course_student, :comment, :priority_student)
  end

  def filter_params
    params.permit(:priority_student)
  end
end
