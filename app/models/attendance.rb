class Attendance < ApplicationRecord
	validates :name_student, presence: true
	validates :comment, presence: true
end
