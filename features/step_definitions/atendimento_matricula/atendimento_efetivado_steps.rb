Dado("que eu esteja logado como coordenador") do
    @user = User.create(name: 'Matheus', email: 'email@email.com', password: 'aaa123')
  @user.add_role(:coordinator)

  visit new_user_session_path
  fill_in :user_email, with: 'email@email.com'
  fill_in :user_password, with: 'aaa123'
  click_button 'Log in'
end

Dado("tenha um atendimento com nome do estudante {string}") do |string|
  @attendance = Attendance.create(name_student: "Artur",
                  course_student: "Ciencia da computaçao",
                  comment: "Deu ruim",
                  priority_student: "Em condição")

end

Dado("esteja na pagina para ver atendimentos") do
  visit attendances_path
end

Quando("eu clicar para mudar para realizado no botao {string}") do |string|
  path = "/attendances/#{@attendance.id}"
  link = "a[href=\'#{path}\'][data-method=\'delete\']"
  find(link).click
end

Então("sou redirecionado para página de Atendimentos") do
  expect(current_path).to eql(attendances_path)
end
