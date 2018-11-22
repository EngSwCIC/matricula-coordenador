Quando("eu clicar para editar no botao {string}") do |string|
  path = "/admins/coordinators/#{@user.id}/edit"
  link = "a[href=\'#{path}\']"
  find(link).click
end