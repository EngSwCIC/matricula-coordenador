class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :attendance_request, optional: true
  validates_presence_of :remind, :remind_date
end
