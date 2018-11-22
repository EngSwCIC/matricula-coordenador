Dado("que eu seja um coordenador") do
    @user = User.create(name: "Matheus", email: "coord@email.com", password: "aaa123")
    @user.add_role(:coordinator)
end

Dado("esteja na página de informações pessoais do coordenador") do
    visit coordinators_infos_path
end

Quando("eu clicar no botao para atualizar {string}") do |str|
    find('[name=commit]').click
end

Então("sou redirecionado para página de informações do coordenador") do
    expect(current_path).to eql(coordinators_infos_path)
end
