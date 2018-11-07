class CreditForm < ApplicationRecord
  has_many :credit_items, :dependent => :destroy
  accepts_nested_attributes_for :credit_items, allow_destroy: true,
    reject_if: lambda { |a| a[:description].blank? }
    
end