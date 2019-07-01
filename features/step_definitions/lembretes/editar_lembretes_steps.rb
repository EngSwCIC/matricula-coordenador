# frozen_string_literal: true


Quando('eu clicar no link {string} de um lembrete') do |_string|
  path = "/reminders/#{@user.reminders.first.id}/edit"
  link = "a[href=\'#{path}\']"
  find(link).click
end