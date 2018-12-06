# frozen_string_literal: true

# Controller para que os alunos se registrem no sistema
class RegistrationsController < Devise::RegistrationsController
  # Método create dos registros
  def create
    super do
      resource.add_role(:student)
      resource.save
    end
  end
end
