# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Comandos uteis: 
# rdoc app (documentacao para app)
# saikuro -i app -c (complexidade ciclomatica para app)
# flog check app (abc score para app)
# Seeds para o ambiente de desenvolvimento
unless Rails.env.production?
  # Apaga formularios de concessao de credito
  CreditForm.destroy_all
  puts 'Formularios de concessao de credito apagados'

  # Apaga requisicao atendimentos 
  AttendanceRequest.destroy_all
  puts 'Requisicao de atendimento apagados'

  # Apaga todos usuários, descrições e cursos
  User.destroy_all
  puts 'Usuarios apagados'

  About.destroy_all
  puts 'Descrição apagada'

  Course.destroy_all
  puts 'Cursos apagados'

  # Cria a descrição
  About.create(
    description: "
      O sistema se resume em faciltar tanto o aluno quanto o coordenador com relação ao atendimento durante o período de matrículas. Nele será possível que o aluno, ao se autenticar, possa entrar em uma fila para atendimento, em que essa será automatizada visando priorizar a ordem pedida pela universidade, como: Aluno em condição, Aluno com atendimento especial, entre outros.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
    "
  )
  puts 'Descrição Criada'

  # Cria cursos
  Course.create(name: 'Ciência da Computação (Bacharel)')
  Course.create(name: 'Computação (Licenciatura)')
  Course.create(name: 'Engenharia da Computação')
  Course.create(name: 'Estatística')
  Course.create(name: 'Design')
  Course.create(name: 'Administração')
  puts 'Cursos criados'

  # Cria admin
  c_cic = Course.find_by(name: 'Ciência da Computação (Bacharel)')
  u = User.create(name: 'Admin', email: 'email@email.com', password: 'aaa123', course: c_cic)
  u.add_role(:admin)
  puts 'Usuario email@email.com criado'

  # Cria alunos
  alu_1 = User.create(name: 'Estudante1', email: 'teste@teste', password: '123456', course: c_cic)
  alu_1.add_role(:student)
  alu_2 = User.create(name: 'Estudante2', email: 'teste2@teste', password: '123456', course: c_cic)
  alu_2.add_role(:student)
  puts 'Estudantes criados'

  #Cria Atendimentos
  AttendanceRequest.create(user: alu_1, description: 'Requisição de Atendimento 1', priority_student: 'normal')
  AttendanceRequest.create(user: alu_2, description: 'Requisição de Atendimento 2', priority_student: 'em condição')
  AttendanceRequest.create(user: alu_1, description: 'Requisição de Atendimento 2', priority_student: 'outros')
  puts 'Atendimentos requisitados criados'

  # Cria coordenadores
  c = Course.find_by(name: 'Ciência da Computação (Bacharel)')
  u = User.create(name: 'Genaina', office_hours: '12hr - 14hr', notices: 'Estou ocupado hoje', email: 'genaina@genaina.com', password: 'aaa123', course: c)
  u.add_role(:coordinator)

  c = Course.find_by(name: 'Computação (Licenciatura)')
  u = User.create(name: 'Bonifacio', office_hours: '12hr - 14hr', notices: 'Estou ocupado hoje', email: 'bonifacio@bonifacio.com', password: 'aaa123', course: c)
  u.add_role(:coordinator)

  c = Course.find_by(name: 'Engenharia da Computação')
  u = User.create(name: 'Ishikawa', office_hours: '12hr - 14hr', notices: 'Estou ocupado hoje', email: 'ishikawa@ishikawa.com', password: 'aaa123', course: c)
  u.add_role(:coordinator)

  c = Course.find_by(name: 'Estatística')
  u = User.create(name: 'Roldolfo', office_hours: '12hr - 14hr', notices: 'Estou ocupado hoje', email: 'rodolfo@rodolfo.com', password: 'aaa123', course: c)
  u.add_role(:coordinator)

  c = Course.find_by(name: 'Design')
  u = User.create(name: 'Maria', office_hours: '12hr - 14hr', notices: 'Estou ocupado hoje', email: 'maria@maria.com', password: 'aaa123', course: c)
  u.add_role(:coordinator)

  c = Course.find_by(name: 'Administração')
  u = User.create(name: 'Creusa', office_hours: '12hr - 14hr', notices: 'Estou ocupado hoje', email: 'creusa@creusa.com', password: 'aaa123', course: c)
  u.add_role(:coordinator)

  puts 'Coordenadores criados'

end
