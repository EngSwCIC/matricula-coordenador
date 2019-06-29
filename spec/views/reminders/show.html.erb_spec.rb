require 'rails_helper'

RSpec.describe "reminders/show", type: :view do
  before(:each) do
    @reminder = assign(:reminder, Reminder.create!(
      :remind => "MyText",
      :read => false,
      :user => nil,
      :attendance_request => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
