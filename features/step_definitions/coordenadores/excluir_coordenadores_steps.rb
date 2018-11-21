Dado("exista um coordenador com email {string}") do |string|
	@user = User.create(name: "moutinho", email: "mout@mout.com", password: "123456")
	@user.add_role(:coordinator)
end

Quando("eu clicar para deletar no botao {string}") do |string|
  # path = admins_coordinators_path(@user.id)
  path = "/admins/coordinators/#{@user.id}"
  link = "a[href=\'#{path}\'][data-method=\'delete\']"
  find(link).click
end