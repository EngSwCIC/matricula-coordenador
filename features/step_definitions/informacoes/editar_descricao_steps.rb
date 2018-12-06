# frozen_string_literal: true

Dado('exista uma descrição {string}') do |string|
  @about = About.create(description: string)
end

Dado('esteja na pagina para editar descrição') do
  visit admins_abouts_path
end

Quando('eu clicar para editar descrição em {string}') do |_string|
  path = "/admins/abouts/#{@about.id}/edit"
  link = "a[href=\'#{path}\']"
  find(link).click
end

Então('sou redirecionado para página de descrições') do
  expect(current_path).to eql(admins_abouts_path)
end
