# frozen_string_literal: true

Dado('que eu seja um aluno não autenticado') do
end

Quando('eu clicar no botao em {string}') do |botao|
  click_link botao
end

Então('devo ser redirecionado para rota {string}') do |_string|
  expect(current_path).to eql('/users/sign_in')
end

Então('devo ser redirecionado para a pagina principal') do
  expect(current_path).to eql(root_path)
end
