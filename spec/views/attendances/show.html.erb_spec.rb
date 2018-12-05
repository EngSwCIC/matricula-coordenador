require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :name_student => "Name Student",
      :course_student => "Course Student",
      :comment => "MyText",
      :priority_student => "Priority Student"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name Student/)
    expect(rendered).to match(/Course Student/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Priority Student/)
  end
end
