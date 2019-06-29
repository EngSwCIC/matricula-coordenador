# frozen_string_literal: true

Dado('tenha pedidos de alunos com detalhes') do
    @course = Course.create(name: 'CIC')


        @stud1 = User.create(name: 'Estudante1', email: 'email1@email.com', password: '123456', course: @course)
        @stud1.add_role(:student)


        @attend1 = AttendanceRequest.create(user: @stud1, description: 'Descrição de atendimento', details: 'Detalhes do atendimento')


end

Então('devo ver a coluna de detalhes') do
    expect(page).to have_content('Detalhes do atendimento')
end