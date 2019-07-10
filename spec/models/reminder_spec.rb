require 'rails_helper'

RSpec.describe Reminder, type: :model do
  context 'validation tests' do
    before(:each) do
      @coordinator = User.new(email: 'coordinator@coordinator.com', password: '123456')
      @coordinator.add_role(:coordinator)
      @coordinator.save
    end

    it 'ensures remind presence' do
      remind = Reminder.new(remind_date: 1.day.from_now , attendance_request: AttendanceRequest.first, user: @coordinator).save
      expect(remind).to eq(false)
    end

    it 'ensures remind date' do
      remind = Reminder.new(remind: "Lembrar", attendance_request: AttendanceRequest.first, user: @coordinator).save
      expect(remind).to eq(false)
    end

    it 'ensures remind date' do
      remind = Reminder.new(remind: "Lembrar", remind_date: 1.day.from_now , attendance_request: AttendanceRequest.first, user: @coordinator).save
      expect(remind).to eq(true)
    end
  end
end
