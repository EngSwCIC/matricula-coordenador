#language: pt
#encoding: utf-8

Funcionalidade: editar_coordenadores_infos
  Como coordenador autenticado
  Quero editar minhas informações pessoais

  Cenario: Editar minhas informações pessoais com sucesso
    Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na página de informações pessoais do coordenador
    Quando eu clicar no botao "Editar"
    E preencher os dados do formulário:
      | user_name     | Matheus Coordenador      |
    Quando eu clicar no botao para atualizar "Atualizar"
    Então devo ver uma mensagem de sucesso "Informações atualizadas com sucesso."
    E sou redirecionado para página de informações do coordenador