class AttendanceRequest < ApplicationRecord
  belongs_to :user
  belongs_to :attendance, optional: true

  validates :user, presence: true
end
