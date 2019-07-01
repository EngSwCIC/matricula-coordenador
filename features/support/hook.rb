Before do
  $session = Capybara::Session.new(:chrome)
end

Before('@coordinator') do 
  @user = User.create(name: 'Coordenador', email: 'coordenador@coordenador.com', password: '123qwe123')
  @user.add_role(:coordinator)
  # visit new_user_session_path
  fill_in :user_email, with: 'coordenador@coordenador.com'
  fill_in :user_password, with: '123qwe123'
  click_button 'Log in'
end