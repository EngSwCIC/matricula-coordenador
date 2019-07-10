# frozen_string_literal: true
  
Então('sou redirecionado para página criação de lembretes') do
  expect(current_path).to eql(new_reminder_path)
end

Então('sou redirecionado para página de lembretes') do
  expect(current_path).to eql(reminders_path)
end
