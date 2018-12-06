# frozen_string_literal: true

# Model dos itens do formulário de concessão de crédito
# A descrição, o grupo, o workload, o numero de créditos e a documentação são obrigatórias
# para salvar uma linha
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
# Verifica a validade da documentação do item
def document_validation
  # Clean exit if there is a logo
  return if document.attached?

  # Unless add error
  errors.add(:base, 'Faltou anexar um documento')

  # Purge the blob
  # document.record.document_attachment.blob.purge

  # Purge attachment
  document.purge
end
