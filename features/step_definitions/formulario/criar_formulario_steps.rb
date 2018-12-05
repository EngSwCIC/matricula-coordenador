# frozen_string_literal: true

Dado('que eu seja um estudante') do
  user = User.create(name: 'student', email: 'email@email.com', password: 'aaa123')
  user.add_role(:student)
end

Quando('preencher {string} com {string}') do |string, string2|
  fill_in string, with: string2
end

Quando('anexar {string} com {string}') do |string, string2|
  attach_file string, Rails.root.join('public', string2)
end

Dado('esteja na pagina para criar formularios') do
  visit credit_forms_path
end

Então('sou redirecionado para página de formularios') do
  expect(current_path).to eql(new_credit_form_path)
end

Então('sou redirecionado para a página de novo formulario') do
  expect(current_path).to eql(credit_forms_path)
end
