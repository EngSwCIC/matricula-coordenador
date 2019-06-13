require 'rails_helper'

RSpec.describe "attendance_requests/new", type: :view do
  before(:each) do
    assign(:attendance_request, AttendanceRequest.new(
      :user => nil,
      :status => "MyString",
      :attendance => nil
    ))
  end

  it "renders new attendance_request form" do
    render

    assert_select "form[action=?][method=?]", attendance_requests_path, "post" do

      assert_select "input[name=?]", "attendance_request[user_id]"

      assert_select "input[name=?]", "attendance_request[status]"

      assert_select "input[name=?]", "attendance_request[attendance_id]"
    end
  end
end
