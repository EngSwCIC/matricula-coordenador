require 'rails_helper'

RSpec.describe "AttendanceRequests", type: :request do
  before(:each) do
    @course = Course.create(name: 'Ciência da Computação (Bacharel)')
    @student = User.new(name: 'João', email: 'student@student.com', password: '123456', course: @course)
    @student.add_role(:student)
    @student.save
    sign_in @student
  end
  
  describe "GET /attendance_requests" do
    it "has the text Requisição de atedimento" do
      get attendance_requests_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Requisição de atedimento');
    end
  end

  describe "NEW /attendance_requests" do
    it "new attendance_requests" do
      get new_attendance_request_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /attendance_requests/1/edit" do
    it "edit attendance_requests" do
      get attendance_request_path(AttendanceRequests.first)
      expect(response).to have_http_status(200)
    end
  end
end
