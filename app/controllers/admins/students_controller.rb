class Admins::StudentsController < AdminsController
  before_action :set_student, only: [:destroy, :edit, :update]
  # GET /coordinators
  # GET /coordinators.json 
  def index
    @students = User.with_role(:student)
  end

  def new
    @student = User.new
  end

  def create
    @student = User.new(student_params)

    respond_to do |format|
      if @student.save
        @student.add_role :student
        format.html { redirect_to admins_students_path, notice: 'student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @student.update_without_password(student_params)
        format.html { redirect_to admins_students_path, notice: 'student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to admins_students_url, notice: 'student was successfully destroyed.' }
      format.json { head :no_content }
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
