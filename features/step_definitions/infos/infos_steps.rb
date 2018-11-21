Dado("que eu seja um coordenador") do
    @user = User.create(name: "Matheus", email: "coord@email.com", password: "aaa123")
    @user.add_role(:coordinator)
end

Dado("esteja autenticado") do
    visit new_user_session_path
    fill_in :user_email, with: "coord@email.com"
    fill_in :user_password, with: "aaa123"
    click_button "Log in"
end  

Dado("esteja na página de informações pessoais do coordenador") do
    visit coordinators_infos_path
end

Quando("eu clicar no botao {string}") do |botao|
    click_link botao
end

Quando("preencher os dados do formulário:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.rows_hash.each do |key, value|
        fill_in key, with: value
    end
end

Quando("eu clicar no botao para atualizar {string}") do |str|
    find('[name=commit]').click
end

Então("devo ver uma mensagem de sucesso {string}") do |string|
	expect(page).to have_content(string)
end

Então("sou redirecionado para página de informações do coordenador") do
    expect(current_path).to eql(coordinators_infos_path)
end
