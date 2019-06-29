require 'rails_helper'

RSpec.describe "reminders/edit", type: :view do
  before(:each) do
    @reminder = assign(:reminder, Reminder.create!(
      :remind => "MyText",
      :read => false,
      :user => nil,
      :attendance_request => nil
    ))
  end

  it "renders the edit reminder form" do
    render

    assert_select "form[action=?][method=?]", reminder_path(@reminder), "post" do

      assert_select "textarea[name=?]", "reminder[remind]"

      assert_select "input[name=?]", "reminder[read]"

      assert_select "input[name=?]", "reminder[user_id]"

      assert_select "input[name=?]", "reminder[attendance_request_id]"
    end
  end
end
