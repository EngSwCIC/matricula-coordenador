# frozen_string_literal: true

Dado('exista um coordenador com email {string}') do |_string|
  @course = Course.create(name: 'Estatística')
  @coordenador = User.create(name: 'moutinho', email: 'mout@mout.com', password: 'aaa123', course: @course)
  @coordenador.add_role(:coordinator)
end

Quando('eu clicar para deletar no botao {string}') do |_string|
  # path = admins_coordinators_path(@user.id)
  path = "/admins/coordinators/#{@coordenador.id}"
  link = "a[href=\'#{path}\'][data-method=\'delete\']"
  find(link).click
end
