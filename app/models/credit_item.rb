class CreditItem < ApplicationRecord
  belongs_to :credit_form
  has_one_attached :document
  
  validates :description, presence: true
  validates :group, presence: true
  validates :workload, presence: true
  validates :requested_credits_amount, presence: true
  validate  :document_validation
end

private
  def document_validation
    # Clean exit if there is a logo
    return if document.attached?

    # Unless add error
    errors.add(:base, 'Please upload your company logo.')

    # Purge the blob
    #document.record.document_attachment.blob.purge

    # Purge attachment
    document.purge
  end