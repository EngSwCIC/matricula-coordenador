require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :name_student => "Name Student",
        :course_student => "Course Student",
        :comment => "MyText",
        :priority_student => "Priority Student"
      ),
      Attendance.create!(
        :name_student => "Name Student",
        :course_student => "Course Student",
        :comment => "MyText",
        :priority_student => "Priority Student"
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => "Name Student".to_s, :count => 2
    assert_select "tr>td", :text => "Course Student".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Priority Student".to_s, :count => 2
  end
end
