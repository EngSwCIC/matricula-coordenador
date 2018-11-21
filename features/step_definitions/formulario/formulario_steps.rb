Dado("que eu seja coordenador") do
  @coordenador = User.create!(email:"artur123@email.com", password:"aaa123")
end

Dado("que eu esteja autenticado no sistema") do
  email = 'khalindo@gmail.com'
  password = 'aaa123'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"  
end

Dado("que eu esteja na página de visualizar formulários") do
  visit '/credit_forms'
end

Então("quero visualizar todos os formulários") do
  forms = CreditForm.all
  forms.count
end

Dado("que eu esteja na página de excluir formulários") do
  visit '/credit_forms'
end

Então("quero excluir um formulário") do
  pending # Write code here that turns the phrase above into concrete actions
end

Dado("que eu seja aluno") do
  @student = User.create!(email:"artur123@email.com", password:"aaa123")
end

Dado("que eu esteja na página inicial") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("quero visualizar apenas meus formulários") do
  pending # Write code here that turns the phrase above into concrete actions
end

Dado("que eu esteja na página de adicionar formulários") do
  visit '/credit_forms'
end

Quando("que eu estiver na página de visualizar formulários") do
  visit '/credit_forms/new'
end

Quando("eu estiver preenchendo um formulário") do
  pending # Write code here that turns the phrase above into concrete actions
end

# Quando("eu clicar em {string}") do |string|
#   if string == 'EXCLUIR'
#     find('#EXCLUIR').click
#   end
# end

Então("quero preencher um formulário de concessão de créditos") do
  
end