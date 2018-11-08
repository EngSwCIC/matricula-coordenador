class CreditItem < ApplicationRecord
  belongs_to :credit_form
  has_one_attached :document
end