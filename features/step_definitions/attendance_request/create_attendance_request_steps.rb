# frozen_string_literal: true

Dado('que eu seja um estudantee') do
    @course = Course.create(name: 'CIC')
    @user = User.create(name: 'Estudante1', email: 'email@email.com', password: '123456', course: @course)
    @user.add_role(:student)
end
  
  Dado('esteja autenticadoo') do
    visit new_user_session_path
    fill_in :user_email, with: 'email@email.com'
    fill_in :user_password, with: '123456'
    click_button 'Log in'
  end
  
  Dado('esteja na pagina de informações da fila') do
    visit information_path
  end
  
  Quando('eu clicar emm {string}') do |botao|
    click_link botao, {href: '/attendance_requests/new'}
  end
  
  Então('sou redirecionado para página de informações da requisição') do
    expect(current_path).to eql(new_attendance_request_path)
  end
  
  Quando('eu clicar no botãoo {string}') do |string|
    click_button string
  end
  
  Então('devo ver a mensagem de sucessoo {string}') do |string|
    expect(page).to have_content(string)
  end
  
  Então('sou redirecionado para página de informações da fila') do
    expect(current_path).to eql(information_path)
  end
  