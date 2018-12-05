class StudentsController < ApplicationController
  before_action :set_student, only: [:destroy, :edit, :update, :show]
  # GET /coordinators
  # GET /coordinators.json 
  def index
    @students = User.with_role(:student)
  end

  def new
    @student = User.new
  end

  def create
    @student = User.new(student_params).add_role :student

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: 'student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
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

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'student was successfully destroyed.' }
    end
  end

  def show
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
