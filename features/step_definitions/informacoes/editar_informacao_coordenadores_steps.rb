# frozen_string_literal: true

Dado('esteja na página de informações pessoais do coordenador') do
  visit coordinators_infos_path
end

Quando('eu clicar para editar informações do coordenador em {string}') do |_string|
  path = "/coordinators/infos/#{@user.id}/edit"
  link = "a[href=\'#{path}\']"
  find(link).click
end

Então('sou redirecionado para página de informações do coordenador') do
  expect(current_path).to eql(coordinators_infos_path)
end
