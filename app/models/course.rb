class Course < ApplicationRecord
  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
end
