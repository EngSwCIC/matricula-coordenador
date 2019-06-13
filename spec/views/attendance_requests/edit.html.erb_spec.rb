require 'rails_helper'

RSpec.describe "attendance_requests/edit", type: :view do
  before(:each) do
    @attendance_request = assign(:attendance_request, AttendanceRequest.create!(
      :user => nil,
      :status => "MyString",
      :attendance => nil
    ))
  end

  it "renders the edit attendance_request form" do
    render

    assert_select "form[action=?][method=?]", attendance_request_path(@attendance_request), "post" do

      assert_select "input[name=?]", "attendance_request[user_id]"

      assert_select "input[name=?]", "attendance_request[status]"

      assert_select "input[name=?]", "attendance_request[attendance_id]"
    end
  end
end
