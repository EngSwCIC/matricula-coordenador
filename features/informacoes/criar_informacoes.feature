#language: pt
#encoding: utf-8

Funcionalidade: criar_informacoes
  Como coordenador/administrador autenticado
  Quero criar uma informação
  
  # Caso de acertos  
  Cenario: Criar avisos
    Dado que eu seja um coordenador
    E esteja autenticado
    E escreva no campo (Título)
    E escreva no campo (Observação)
    Quando eu clicar em "Criar aviso"
    Então devo ver a mensagem de sucesso "Aviso criado com sucesso"

  Cenario: Criar horários de atendimento
    Dado que eu seja um coordenador
    E esteja autenticado
    E coloque o dia da semana
    E coloque as horas em que irá ocorrer o atendimento
    Quando eu clicar em "Criar horário de atendimento"
    Então devo ver a mensagem de sucesso "Horário de atendimento criado com sucesso"


  # Caso de erros  
  Cenario: Criar avisos
    Dado que eu seja um coordenador
    E esteja autenticado
    E escreva no campo (Observação)
    Quando eu clicar em "Criar aviso"
    Então devo ver a mensagem de sucesso "Erro ao criar aviso"

  Cenario: Criar horários de atendimento
    Dado que eu seja um coordenador
    E esteja autenticado
    E coloque as horas em que irá ocorrer o atendimento
    Quando eu clicar em "Criar horário de atendimento"
    Então devo ver a mensagem de sucesso "Erro ao criar Horário de atendimento "