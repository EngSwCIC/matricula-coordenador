#language: pt
#encoding: utf-8

Funcionalidade: editar_informacao_coordenadores
  Como coordenador autenticado
  Quero editar minhas informações pessoais
  
  #caso feliz
  Cenario: Editar minhas informações pessoais com sucesso
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    E esteja na página de informações pessoais do coordenador
    Quando eu clicar para editar informações do coordenador em "Editar"
    E preencher os dados do formulário:
      | user_name         | Matheus Coordenador          |
      | user_notices      | Eu sou um cara muito pontual |
      | user_office_hours | Segunda: 12hr - 14hr         |
      | user_password     | aaa123                       |
      | user_email        | matheus@matheus.com          |
    Quando eu clicar no botão "Atualizar"
    Então devo ver a mensagem de sucesso "Informações atualizadas com sucesso."
    E sou redirecionado para página de informações do coordenador

  #caso triste
  Cenario: Editar minhas informações pessoais com falha
    Dado exista um coordenador do curso "Estatística" com email "mout@mout.com"
    Dado que eu seja um coordenador 
    Dado que eu esteja autenticado
    E esteja na página de informações pessoais do coordenador
    Quando eu clicar para editar informações do coordenador em "Editar"
    E preencher os dados do formulário:
      | user_name         | Matheus Coordenador          |
      | user_notices      | Eu sou um cara muito pontual |
      | user_office_hours | Segunda: 12hr - 14hr         |
      | user_password     | aaa123                       |
      | user_email        | mout@mout.com                |
    Quando eu clicar no botão "Atualizar"
    Então devo ver a mensagem de falha "Email has already been taken"