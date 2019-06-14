require 'rails_helper'

RSpec.describe "attendance_requests/show", type: :view do
  before(:each) do
    @attendance_request = assign(:attendance_request, AttendanceRequest.create!(
      :user => nil,
      :status => "Status",
      :attendance => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
  end
end
