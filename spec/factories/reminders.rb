FactoryBot.define do
  factory :reminder do
    remind { "MyText" }
    remind_date { "2019-06-29 00:07:56" }
    read { false }
    user { nil }
    attendance_request { nil }
  end
end
