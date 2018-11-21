#language: pt
#encoding: utf-8

Funcionalidade: editar_coordenadores
  Como coordenador autenticado
  Quero excluir um coordenador do sistema

  Cenario: Editar coordenadores com sucesso
    Dado que eu seja um administrador
    E esteja autenticado
    E exista um coordenador com email "mout@mout.com"
    E tenha o curso "Design"
    E esteja na pagina para criar coordenadores
    Quando eu clicar para editar no botao "Editar"
    E preencher os dados do formulário:
    	| user_name       | Rafael                           |
    	| user_email      | rafa@rafa.com                    |
    	| user_password   | aaa123                           |
    E selecionar "Design" do campo de id "user_course_id"
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de sucesso "Coordenador editado com sucesso"
    E sou redirecionado para página de coordenadores