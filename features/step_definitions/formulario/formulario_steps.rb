Dado("que eu seja coordenador") do
  pending # Write code here that turns the phrase above into concrete actions
end

Dado("que eu esteja autenticado no sistema") do
  pending
  @usr = User.create(email:"artur@email.com", password:"123456")
  visit("/credit_forms") 
end

Então("quero visualizar todos os formulários") do
  pending # Write code here that turns the phrase above into concrete actions
end

Dado("que eu seja aluno") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("quero visualizar apenas meus formulários") do
  pending # Write code here that turns the phrase above into concrete actions
end
