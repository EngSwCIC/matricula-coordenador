# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if !Rails.env.production?
  User.destroy_all
  puts "Usuarios apagados"
  About.destroy_all
  puts "Descrição apagada"
  Course.destroy_all
  puts "Cursos apagados"

  About.create(
    description:"
      O sistema se resume em faciltar tanto o aluno quanto o coordenador com relação ao atendimento durante o período de matrículas. Nele será possível que o aluno, ao se autenticar, possa entrar em uma fila para atendimento, em que essa será automatizada visando priorizar a ordem pedida pela universidade, como: Aluno em condição, Aluno com atendimento especial, entre outros.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing.
    "
  )
  puts "Descrição Criada"

  Course.create(name:"Ciência da Computação (Bacharel)")
  Course.create(name:"Computação (Licenciatura)")
  Course.create(name:"Engenharia da Computação")
  Course.create(name:"Estatística")
  Course.create(name:"Design")
  Course.create(name:"Administração")
  puts "Cursos criados"

  c = Course.find_by(name:"Ciência da Computação (Bacharel)")
  u = User.create(email:"email@email.com", password:"aaa123", course:c)
  u.add_role(:admin)
  puts "Usuario email@email.com criado"

end