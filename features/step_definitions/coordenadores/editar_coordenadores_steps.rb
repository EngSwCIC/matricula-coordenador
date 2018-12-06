# frozen_string_literal: true

Quando('eu clicar para editar no botao {string}') do |_string|
  path = "/admins/coordinators/#{@user.id}/edit"
  link = "a[href=\'#{path}\']"
  find(link).click
end

Então('devo ver a mensagem de falha {string}') do |string|
  expect(page).to have_content(string)
end
