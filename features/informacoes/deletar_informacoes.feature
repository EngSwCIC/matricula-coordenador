#language: pt
#encoding: utf-8

Funcionalidade: deletar_informacoes
  Como coordenador/administrador autenticado
  Quero Deletar uma informação

  Cenario: Deletar avisos
    Dado que eu seja um coordenador
    E esteja autenticado
    Quando eu clicar em "Deletar aviso"
    Então devo ver a mensagem de sucesso "Aviso excluído com sucesso"

  Cenario: Deletar horários de atendimento
    Dado que eu seja um coordenador
    E esteja autenticado
    Quando eu clicar em "Deletar horário de atendimento"
    Então devo ver a mensagem de sucesso "Horário de atendimento excluído com sucesso"
