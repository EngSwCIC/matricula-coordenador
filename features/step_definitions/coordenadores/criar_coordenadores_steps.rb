Dado("que eu seja um administrador") do
  user = User.create(name: "admin", email: "email@email.com", password: "aaa123")
  user.add_role(:admin)
end

Dado("esteja autenticado") do
  visit new_user_session_path
  fill_in :user_email, with: "email@email.com"
  fill_in :user_password, with: "aaa123"
  click_button "Log in"
end

Dado("esteja na pagina para criar coordenadores") do
	visit admins_coordinators_path
end

Dado("tenha o curso {string}") do |string|
  Course.create(name:string)
end

Quando("eu clicar em {string}") do |botao|
  click_link botao
end

Quando("preencher os dados do formulário:") do |table|
  table.rows_hash.each do |key, value|
  	fill_in key, with: value
  end
end

Quando("selecionar {string} do campo de id {string}") do |string, string2|
  select string, :from => string2
end

Quando("eu clicar no botão {string}") do |string|
  click_button string
end

Então("devo ver a mensagem de sucesso {string}") do |string|
	expect(page).to have_content(string)
end

Então("sou redirecionado para página de coordenadores") do
	expect(current_path).to eql(admins_coordinators_path)
end
