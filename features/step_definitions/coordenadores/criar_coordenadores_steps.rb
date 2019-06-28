# frozen_string_literal: true
Dado('esteja na pagina para criar coordenadores') do
  visit admins_coordinators_path
end

Dado('tenha o curso {string}') do |string|
  Course.create(name: string)
end

Quando('preencher os dados do formulário:') do |table|
  table.rows_hash.each do |key, value|
    fill_in key, with: value
  end
end

Quando('selecionar {string} do campo de id {string}') do |string, string2|
  select string, from: string2
end

Então('sou redirecionado para página de coordenadores') do
  expect(current_path).to eql(admins_coordinators_path)
end
