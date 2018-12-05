require 'rails_helper'

RSpec.describe "attendances/new", type: :view do
  before(:each) do
    assign(:attendance, Attendance.new(
      :name_student => "MyString",
      :course_student => "MyString",
      :comment => "MyText",
      :priority_student => "MyString"
    ))
  end

  it "renders new attendance form" do
    render

    assert_select "form[action=?][method=?]", attendances_path, "post" do

      assert_select "input[name=?]", "attendance[name_student]"

      assert_select "input[name=?]", "attendance[course_student]"

      assert_select "textarea[name=?]", "attendance[comment]"

      assert_select "input[name=?]", "attendance[priority_student]"
    end
  end
end
