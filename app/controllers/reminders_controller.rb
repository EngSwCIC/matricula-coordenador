class RemindersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = Reminder.where(user_id: current_user.id).order(:remind_date)
  end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  def show
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.remind_date = Time.zone.parse(reminder_params[:remind_date])
    @reminder.user_id = current_user.id

    if reminder_params[:attendance_request_id].blank?
      @reminder.attendance_request_id = reminder_params[:attendance_request_id]
    end

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to reminders_path, notice: 'Lembrete criado com sucesso .' }
        format.json { render :index, status: :created, location: @reminder }
      else
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    @reminder.remind_date = Time.zone.parse(reminder_params[:remind_date])
    if reminder_params[:attendance_request_id].blank?
      @reminder.attendance_request_id = reminder_params[:attendance_request_id]
    end
    @reminder.update(reminder_params)
    respond_to do |format|
      if @reminder.save
        format.html { redirect_to reminders_path, notice: 'Lembrete atualizado com sucesso' }
        format.json { render :index, status: :ok, location: @reminder }
      else
        puts @reminder.errors.empty?
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to reminders_url, notice: 'Lembrete excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
      params.require(:reminder).permit(:remind, :remind_date, :read, :user_id, :attendance_request_id)
    end
end
