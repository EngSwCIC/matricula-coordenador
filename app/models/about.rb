# frozen_string_literal: true

class About < ApplicationRecord
  validates :description, presence: true
end
