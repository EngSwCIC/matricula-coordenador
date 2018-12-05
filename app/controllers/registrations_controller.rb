# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    super do
      resource.add_role(:student)
      resource.save
    end
  end
end
