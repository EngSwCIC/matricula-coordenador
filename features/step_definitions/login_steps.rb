Dado(/^que eu seja um (\w*)$/) do |usuario|
    @course = Course.create(name: 'CIC')

    if usuario.match(/estudante|alunos/)
        @user = User.create(name: 'Estudante1', email: 'estud@email.com', password: '123456', course: @course)
        @user.add_role(:student)
    elsif usuario.match(/coordenador/)
        @user = User.create(name: 'Matheus', email: 'email@email.com', password: '123456', course: @course)
        @user.add_role(:coordinator)

        @reminder = Reminder.create!(
            remind: "Lembrar de ...", 
            remind_date: 1.day.from_now, 
			attendance_request_id: AttendanceRequest.first, user_id: @user.id )
    elsif usuario.match(/administrador/)
        @user = User.create(name: 'admin', email: 'adm@email.com', password: '123456', course: @course)
        @user.add_role(:admin)
    else
        @user = User.create(name: 'Estudante1', email: 'stur@email.com', password: '123456', course: @course)
        @user.add_role(:student)
    end
end

Dado("que eu seja um usuario nao autenticado") do
    destroy_user_session_path
  end

Dado('que eu esteja autenticado') do
    Login::as(@user.email, @user.password)
end