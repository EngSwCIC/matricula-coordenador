Dado("esteja na pagina inicial") do
	visit root_path
end

Então("sou redirecionado para página Informações Fila") do
  visit information_path
  expect(current_path).to eql("/information")
end

Então("devo ver informações tais como {string}") do |string|
  expect(page).to have_content(string)
end

Dado("que eu seja um usuário diferente de estudante") do
	user = User.create(name: 'student', email: 'email@email.com', password: 'aaa123')
  user.add_role(:coordinator)
end


Então("não devo ver a opção de apertar em {string}") do |string|
  expect(page).not_to have_content(string)
end