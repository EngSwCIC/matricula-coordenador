#language: pt
#encoding: utf-8

Funcionalidade: criar_informacoes
  Como coordenador/administrador autenticado
  Quero criar uma informação

  Cenario: Criar avisos
    Dado que eu seja um coordenador
    E esteja autenticado
    Quando eu clicar em "Criar aviso"
    Então devo ver a mensagem de sucesso "Aviso criado com sucesso"

  Cenario: Criar horários de atendimento
    Dado que eu seja um coordenador
    E esteja autenticado
    Quando eu clicar em "Criar horário de atendimento"
    Então devo ver a mensagem de sucesso "Horário de atendimento criado com sucesso"