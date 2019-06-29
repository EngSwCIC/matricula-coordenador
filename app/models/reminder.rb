class Reminder < ApplicationRecord
  belongs_to :user
  has_one :attendance_request
end
