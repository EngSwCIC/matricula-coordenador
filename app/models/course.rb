# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :users

  validates :name, presence: true
end
