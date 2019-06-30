#language: pt
#encoding: utf-8

Funcionalidade: criar_coordenadores
  Como administrador autenticado
  Quero criar um coordenador no sistema

  #casos felizes
  Cenario: Criar coordenadores com sucesso
    Dado que eu seja um administrador
    Dado que eu esteja autenticado
    E esteja na pagina para criar coordenadores
    E tenha o curso "Engenharia de Computação"
    Quando eu clicar em "Novo Coordenador"
    E preencher os dados do formulário:
    	| user_name       | Moutinho                         |
    	| user_email      | mout@mout.com                    |
    	| user_password   | 123456                           |
    E selecionar "Engenharia de Computação" do campo de id "user_course_id"
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de sucesso "Coordenador criado com sucesso"
    E sou redirecionado para página de coordenadores

  #casos tristes
  Cenario: Criar coordenadores com falha
    Dado exista um coordenador do curso "Estatística" com email "mout@mout.com"
    E que eu seja um administrador
    Dado que eu esteja autenticado
    E esteja na pagina para criar coordenadores
    Quando eu clicar em "Novo Coordenador"
    E preencher os dados do formulário:
    	| user_name       | Rafael                           |
    	| user_email      | mout@mout.com                    |
    	| user_password   | aaa123                           |
    E selecionar "Estatística" do campo de id "user_course_id"
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de falha "Email has already been taken"