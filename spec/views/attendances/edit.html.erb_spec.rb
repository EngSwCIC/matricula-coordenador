require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :name_student => "MyString",
      :course_student => "MyString",
      :comment => "MyText",
      :priority_student => "MyString"
    ))
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

      assert_select "input[name=?]", "attendance[name_student]"

      assert_select "input[name=?]", "attendance[course_student]"

      assert_select "textarea[name=?]", "attendance[comment]"

      assert_select "input[name=?]", "attendance[priority_student]"
    end
  end
end
