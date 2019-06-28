# frozen_string_literal: true

Dado('tenha pedidos de alunos') do
    @course = Course.create(name: 'CIC')


        @stud1 = User.create(name: 'Estudante1', email: 'email1@email.com', password: '123456', course: @course)
        @stud1.add_role(:student)
        @stud2 = User.create(name: 'Estudante2', email: 'email2@email.com', password: '123456', course: @course)
        @stud2.add_role(:student)
        @stud3 = User.create(name: 'Estudante3', email: 'email3@email.com', password: '123456', course: @course)
        @stud3.add_role(:student)

        @attend1 = AttendanceRequest.create(user: @stud1, description: 'Descrição de atendimento')
        @attend2 = AttendanceRequest.create(user: @stud2, description: 'Descrição de atendimento')
        @attend3 = AttendanceRequest.create(user: @stud3, description: 'Descrição de atendimento')

end

Então('devo ver uma lista com os pedidos de todos os alunos') do
    expect(page).to have_content(@attend1.user.name)
    expect(page).to have_content(@attend2.user.name)
    expect(page).to have_content(@attend3.user.name)
end