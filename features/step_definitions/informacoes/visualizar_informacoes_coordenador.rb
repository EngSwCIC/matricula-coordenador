# frozen_string_literal: true
Dado('exista um coordenador do curso {string} com email {string}') do |string, string2|
  c = Course.create(name: string)
  @coordenador = User.create(name: string2, email: string2, password: 'aaa123', course: c, office_hours: '12hr - 14hr', notices: 'Oi, tudo bem?')
  @coordenador.add_role(:coordinator)
end

Quando('eu for para a pagina de coordenadores') do
  visit coordinators_path
end

Então('eu devo ver o coordenador do curso de {string}') do |string|
  expect(page).to have_content(string)
end

Quando('eu clicar no botão {string} daquele coordenador') do |_string|
  path = "coordinator/#{@coordenador.id}"
  link = "a[href=\'#{path}\']"
  find(link).click
end

Então('sou redirecionado para página daquele coordenador') do
  expect(current_path).to eql("/coordinator/#{@coordenador.id}")
end

Então('eu devo ver o horário de atendimento daquele coordenador') do
  expect(page).to have_content(@coordenador.office_hours)
end

Então('eu devo ver os avisos daquele coordenador') do
  expect(page).to have_content(@coordenador.notices)
end

Dado('exista um coordenador do curso {string} com email {string} sem ter declarado o horário de atendimento') do |string, string2|
  c = Course.create(name: string)
  @coordenador = User.create(name: string2, email: string2, password: 'aaa123', course: c, notices: 'Oi, tudo bem?')
  @coordenador.add_role(:coordinator)
end

Então('eu não devo encontrar o horário de atendimento daquele coordenador') do
  expect(page).to have_no_content('Horário de Atendimento')
end
