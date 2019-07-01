#language: pt
#encoding: utf-8

@reminder
Funcionalidade: excluir_lembretes
  Como coordenador autenticado
  Quero editar um lembrete

  #casos felizes
  Cenário: Editar um lembrete
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    Dado que eu esteja na página "reminders_path"
    Quando eu clicar no link com a classe "delete"
    Então devo ver a mensagem de sucesso "Lembrete excluido com sucesso"