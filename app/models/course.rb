# frozen_string_literal: true

# Model dos cursos dos usuários. O nome do curso é obrigatório para salvar
class Course < ApplicationRecord
  has_many :users

  validates :name, presence: true
end
