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

  #Helper das mensagens
  def render_alert_message key
    case key
    when "alert"
      "danger" 
    when "notice"
      "success"
    when "info"
      "warning"
    else
      key
    end
  end
end
