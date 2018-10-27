#language: pt
#encoding: utf-8

Funcionalidade: editar_informacoes
  Como coordenador/administrador autenticado
  Quero criar uma informação

  #Caso de acerto
  Cenario: Editar avisos
    Dado que eu seja um coordenador
    E esteja autenticado
    E digite um (Título)
    Quando eu clicar em "Editar aviso"
    Então devo ver a mensagem de sucesso "Aviso editado com sucesso"
  
  Cenario: Editar avisos
    Dado que eu seja um coordenador
    E esteja autenticado
    E digite uma (Observação)
    Quando eu clicar em "Editar aviso"
    Então devo ver a mensagem de sucesso "Aviso editado com sucesso"

  Cenario: Editar horários de atendimento
    Dado que eu seja um coordenador
    E esteja autenticado
    E mude a (Data da Semana)
    Quando eu clicar em "Editar horário de atendimento"
    Então devo ver a mensagem de sucesso "Horário de atendimento editado com sucesso"

  Cenario: Editar horários de atendimento
    Dado que eu seja um coordenador
    E esteja autenticado
    E mude as (Horas)
    Quando eu clicar em "Editar horário de atendimento"
    Então devo ver a mensagem de sucesso "Horário de atendimento editado com sucesso"

  Cenario: Editar descrição do sistema
    Dado que eu seja um administrador
    E esteja autenticado
    Quando eu clicar em "Editar descrição do sistema"
    Então devo ver a mensagem de sucesso "Descrição editada com sucesso"