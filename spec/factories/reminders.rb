FactoryBot.define do
  factory :reminder do
    remind { "Texto" }
    remind_date { "2019-06-29 00:07:56" }
    read { false }
    user { User.where(role: :coordinator) }
    attendance_request {AttendanceRequest.first}
  end
end
