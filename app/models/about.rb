# frozen_string_literal: true

# Model da descrição do sistema. A descrição é obrigatória para salvar
class About < ApplicationRecord
  validates :description, presence: true
end
