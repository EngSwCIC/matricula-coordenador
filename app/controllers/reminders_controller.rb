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
    @reminder = Reminder.new(reminder_params_parsed)
    respond_to do |format|
      if @reminder.save
        format.html { redirect_to reminders_path, notice: 'Lembrete criado com sucesso.' }
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
    respond_to do |format|
      if @reminder.update(reminder_params_parsed)
        format.html { redirect_to reminders_path, notice: 'Lembrete atualizado com sucesso' }
        format.json { render :index, status: :ok, location: @reminder }
      else
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

    def reminder_params_parsed
      params_parsed = Hash.new
      request_id = reminder_params[:attendance_request_id]
      params_parsed[:remind_date] = timezoned_date
      params_parsed[:remind] = reminder_params[:remind]
      params_parsed[:user_id] = current_user.id
      params_parsed[:attendance_request_id] = request_id.blank? ? nil : request_id
      return params_parsed
    end

    def timezoned_date 
      Time.zone.parse(reminder_params[:remind_date])
    end
end
