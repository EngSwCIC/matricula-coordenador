# frozen_string_literal: true
# Helper do application
module ApplicationHelper
  # Helper pra pagina de coodenadores
  def coordinators_page?
    controller_name == 'coordinators'
  end

  # Helper pra pagina de descrição
  def abouts_page?
    controller_name == 'abouts'
  end
end
