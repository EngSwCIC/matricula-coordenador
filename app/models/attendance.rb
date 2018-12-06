# frozen_string_literal: true

# Model da tabela de atendimentos para o banco. Nome e comentários são obrigatórios
# para salvar
class Attendance < ApplicationRecord
  validates :name_student, presence: true
  validates :comment, presence: true
end
