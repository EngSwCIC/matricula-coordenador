require 'rails_helper'

RSpec.describe "reminders/new", type: :view do
  before(:each) do
    assign(:reminder, Reminder.new(
      :remind => "MyText",
      :read => false,
      :user => nil,
      :attendance_request => nil
    ))
  end

  it "renders new reminder form" do
    render

    assert_select "form[action=?][method=?]", reminders_path, "post" do

      assert_select "textarea[name=?]", "reminder[remind]"

      assert_select "input[name=?]", "reminder[read]"

      assert_select "input[name=?]", "reminder[user_id]"

      assert_select "input[name=?]", "reminder[attendance_request_id]"
    end
  end
end
