#language: pt
#encoding: utf-8

Funcionalidade: editar_coordenadores
  Como coordenador autenticado
  Quero excluir um coordenador do sistema

  Cenario: Editar coordenadores com sucesso
    Dado que eu seja um coordenador
    E esteja autenticado
    Quando eu clicar em "Editar perfil"
    Então devo poder modificar as informações do meu perfil
    Quando eu clicar em "Salvar edição"
    Então devo ver a mensagem de sucesso "Coordenador atualizado com sucesso"