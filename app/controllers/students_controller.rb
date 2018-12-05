# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[destroy edit update] 
  # GET /coordinators
  # GET /coordinators.json
  def index
    @students = [current_user]
  end

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

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:user).permit(:name, :email, :password)
  end
end
