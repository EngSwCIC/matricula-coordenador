require 'rails_helper'

RSpec.describe "attendance_requests/index", type: :view do
  before(:each) do
    assign(:attendance_requests, [
      AttendanceRequest.create!(
        :user => nil,
        :status => "Status",
        :attendance => nil
      ),
      AttendanceRequest.create!(
        :user => nil,
        :status => "Status",
        :attendance => nil
      )
    ])
  end

  it "renders a list of attendance_requests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
