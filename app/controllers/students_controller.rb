# frozen_string_literal: true

# Controller para que listar os alunos do sistema
class StudentsController < ApplicationController
  before_action :set_student, only: %i[destroy edit update] 
  # GET /coordinators
  # GET /coordinators.json

  # Método index dos alunos
  def index
    @students = [current_user]
  end

  # Método update dos alunos
  def update
    respond_to do |format|
      if @student.update_without_password(student_params)
        format.html { redirect_to students_path, notice: 'student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Pega aluno pela id
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = User.find(params[:id])
  end

  # Parâmetros dos alunos
  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:user).permit(:name, :email, :password)
  end
end
