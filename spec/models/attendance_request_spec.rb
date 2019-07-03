require 'rails_helper'

RSpec.describe AttendanceRequest, type: :model do
  context 'validation tests' do
    before(:each) do
      @course = Course.create(name: 'Ciência da Computação (Bacharel)')
      @student = User.new(name: 'João', email: 'student@student.com', password: '123456', course: @course)
      @student.add_role(:student)
      @student.save
    end

    it "ensures invalid if has no User and Description" do
      expect(AttendanceRequest.new()).to_not be_valid
    end

    it 'ensures User and Description presence' do
      request = AttendanceRequest.create(user: @student, description: 'Requer atendimento')
      expect(request).to be_valid
    end

    it 'ensures position is set' do
      request = AttendanceRequest.create(user: @student, description: 'Requer atendimento')
      request = AttendanceRequest.first
      expect(request.position).to eq(1)
    end
  end
end
