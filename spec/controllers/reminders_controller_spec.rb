require 'rails_helper'

RSpec.describe RemindersController, type: :controller do

  before(:each) do
    @coordinator = User.new(email: 'coordinator@coordinator.com', password: '123456')
    @coordinator.add_role(:coordinator)
    @coordinator.save!
    sign_in @coordinator
  end

  
  let(:valid_attributes) {
    {remind: "Lembrar", remind_date: 1.day.from_now , attendance_request: AttendanceRequest.first, user: @coordinator}
  }

  let(:invalid_attributes) {
    {remind_date: 1.day.from_now , attendance_request: AttendanceRequest.first, user: @coordinator}
  }


  describe "GET #index" do
    it 'return all reminders' do
      reminders = Reminder.create!(valid_attributes)
      get :index
      expect(assigns(:reminders)).to match_array([reminders])
    end

    it "returns a success response" do
      Reminder.create! valid_attributes
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      reminder = Reminder.create! valid_attributes
      get :show, params: {id: reminder.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it 'assigns a new Reminder to @reminder' do
      get :new
      expect(assigns(:reminder)).to_not be_nil
    end
    
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      reminder = Reminder.create! valid_attributes
      get :edit, params: {id: reminder.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      
      it "creates a new Reminder" do
        expect {
          post :create, params: {reminder: valid_attributes}
        }.to change(Reminder, :count).by(1)
      end

      it "redirects to reminders list" do
        post :create, params: {reminder: valid_attributes}
        expect(response).to redirect_to(reminders_path)
      end
    end

    context "with invalid params" do
      it "returns the error" do
        post :create, params: {reminder: invalid_attributes}
        expect(assigns(:reminder).errors).to_not be_empty
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {remind: "Lembrete", remind_date: 1.day.from_now , attendance_request: AttendanceRequest.last, user: @coordinator}
      }

      it "updates the requested reminder" do
        reminder = Reminder.create! valid_attributes
        put :update, params: {id: reminder.to_param, reminder: new_attributes}
        reminder.reload
        expect(reminder.remind).to eql('Lembrete')
      end

      it "redirects to the reminders path" do
        reminder = Reminder.create! valid_attributes
        put :update, params: {id: reminder.to_param, reminder: valid_attributes}
        expect(response).to redirect_to(reminders_path)
      end
    end

    context "with invalid params" do
      it "returns the error message" do
        reminder = Reminder.create! valid_attributes
        put :update, params: {id: reminder.to_param, reminder: invalid_attributes}
        reminder.reload
        expect(reminder.remind).to_not eql(invalid_attributes[:remind])
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested reminder" do
      reminder = Reminder.create! valid_attributes
      expect {
        delete :destroy, params: {id: reminder.to_param}
      }.to change(Reminder, :count).by(-1)
    end

    it "redirects to the reminders list" do
      reminder = Reminder.create! valid_attributes
      delete :destroy, params: {id: reminder.to_param}
      expect(response).to redirect_to(reminders_url)
    end
  end

end
