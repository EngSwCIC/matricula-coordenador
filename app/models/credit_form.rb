class CreditForm < ApplicationRecord
  ITEMS_COUNT_MIN = 1

  has_many :credit_items, :dependent => :destroy, index_errors: true
  accepts_nested_attributes_for :credit_items, allow_destroy: true

  validates :credit_items, :presence => true
end