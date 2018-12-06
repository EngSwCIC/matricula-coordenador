Quando("eu clicar para editar atendimento no botao {string}") do |string|
  path = "/attendances/#{@attendance.id}/edit"
  link = "a[href=\'#{path}\']"
  find(link).click
end
