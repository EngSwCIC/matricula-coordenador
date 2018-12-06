Dado("que eu seja um usuario") do
	user = User.create(name: 'student', email: 'email@email.com', password: 'aaa123')
  user.add_role(:student)
end

Então("devo ver informações tais como {string} e {string} no header") do |string, string2|
  expect(page).to have_content(string)	
  expect(page).to have_content(string2)	
end

Dado("que eu seja um usuario nao autenticado") do
  destroy_user_session_path
end

Então("nao devo ver informações tais como {string} e {string} no header") do |string, string2|
  expect(page).not_to have_content(string)
  expect(page).not_to have_content(string2)
end
