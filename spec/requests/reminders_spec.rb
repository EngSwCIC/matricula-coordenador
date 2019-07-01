require 'rails_helper'

RSpec.describe "Reminders", type: :request do
  
  before(:each) do
    @coordinator = User.new(email: 'coordinator@coordinator.com', password: '123456')
    @coordinator.add_role(:coordinator)
    @coordinator.save!
    sign_in @coordinator
    @reminder = Reminder.create!(remind: "Lembrar", remind_date: 1.day.from_now , attendance_request: AttendanceRequest.first, user: @coordinator).save
  end

  describe "GET /reminders" do
    it "get reminders" do
      get reminders_path
      expect(response).to have_http_status(200)
    end
  end

  describe "NEW /reminders/new" do
    it "get reminders" do
      get new_reminder_path
      expect(response).to have_http_status(200)
    end
  end

  describe "SHOW /reminders/show/1" do
    it "get reminders" do
      get reminder_path(Reminder.first)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /reminders/1/edit" do
    it "get reminders" do
      get reminder_path(Reminder.first)
      expect(response).to have_http_status(200)
    end
  end
end
