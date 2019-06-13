require 'rails_helper'

RSpec.describe "AttendanceRequests", type: :request do
  describe "GET /attendance_requests" do
    it "works! (now write some real specs)" do
      get attendance_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
