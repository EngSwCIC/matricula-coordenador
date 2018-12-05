#language: pt
#encoding: utf-8

Funcionalidade: excluir_atendimento
  Como coordenador autenticado
  Quero excluir um atendimento do sistema

  #caso feliz
  Cenario: Excluir atendimento com sucesso
    Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina para visualizar atendimento
    Quando eu clicar para deletar no botao "Excluir"
    Então devo ver a mensagem de sucesso "Atendimento excluído com sucesso"
    E sou redirecionado para página de coordenadores