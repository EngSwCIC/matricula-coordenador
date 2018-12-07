Dado("que eu esteja na pagina inicial do sistema") do
  visit root_path
end

Quando("eu apertar em {string}") do |string|
  expect(page).to have_content(string)	
end

Então("sou redirecionado para página Sobre") do
	visit about_path
  expect(current_path).to eql("/about")
end

Então("eu devo ver informações tais como {string} e {string}") do |string, string2|
  visit about_path
  expect(page).to have_content(string)
end

Então("não devo estar na rota de outra pagina") do
  visit about_path
  expect(current_path).not_to eql("/contact")
end

Então("sou redirecionado para página Contato") do
	visit contact_path
end

Então("eu devo ver informações tais como {string}") do |string|
	visit contact_path
end
