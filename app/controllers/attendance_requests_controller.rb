class AttendanceRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attendance_request, only: [:show, :edit, :update, :destroy]
  

  # GET /attendance_requests
  # GET /attendance_requests.json
  def index
    if current_user.has_role? :coordinator or current_user.has_role? :admin
      @attendance_requests = AttendanceRequest.joins(:user).where("users.course_id = #{current_user.course_id}").all
    else
      @attendance_requests = AttendanceRequest.where(user_id: current_user.id).all
    end
    render :index
  end

  # GET /attendance_requests/1
  # GET /attendance_requests/1.json
  def show
  end

  # GET /attendance_requests/new
  def new
    @attendance_request = AttendanceRequest.new
  end

  # GET /attendance_requests/1/edit
  def edit
  end

  # POST /attendance_requests
  # POST /attendance_requests.json
  def create
    @attendance_request = AttendanceRequest.new;
    @attendance_request.user = current_user;
    @attendance_request.description = attendance_request_params.to_h[:description];

    respond_to do |format|
      if @attendance_request.save
        format.html { redirect_to attendance_requests_path, notice: 'Attendance request was successfully created.' }
        format.json { render :index, status: :created, location: @attendance_request }
      else
        format.html { render :new }
        format.json { render json: @attendance_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendance_requests/1
  # PATCH/PUT /attendance_requests/1.json
  def update
    respond_to do |format|
      if @attendance_request.update(attendance_request_params)
        format.html { redirect_to attendance_requests_path, notice: 'Attendance request was successfully updated.' }
        format.json { render :index, status: :ok, location: @attendance_request }
      else
        format.html { render :edit }
        format.json { render json: @attendance_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_requests/1
  # DELETE /attendance_requests/1.json
  def destroy
    @attendance_request.destroy
    respond_to do |format|
      format.html { redirect_to attendance_requests_url, notice: 'Attendance request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #filtra os atendimento pelo tipo de prioridade
  def filter_by_priority
    priority_student = filter_params[:priority_student]
    if !priority_student.include?("Todas")
      @attendance_requests = AttendanceRequest.where("Lower(priority_student) = ?", "#{priority_student.downcase}").all
    else
      @attendance_requests = AttendanceRequest.all.order(priority_student: :asc)
    end
    render json: { html: render_to_string(partial: 'attendances_requests_list')  }
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_request
      @attendance_request = AttendanceRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_request_params
      params.require(:attendance_request).permit(:description, :details)
    end

    def filter_params
      params.permit(:priority_student)
    end
end
