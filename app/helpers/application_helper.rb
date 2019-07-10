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

  def verify_coordinator_reminders
    count = 0
    if current_user.has_role? :coordinator
      reminders = current_user.reminders
      if reminders.size > 0
        reminders.each do |reminder|
          if reminder.remind_date <= 1.day.from_now
            count += 1
          end
        end
      end
    end
    count
  end
end
