#language: pt
#encoding: utf-8

Funcionalidade: atendimento_efetivado
  Como Coordenador autenticado
  Quero marcar um atendimento como efetivado

  #caso felizes
  Cenario: Macar atendimento como efetivado
    Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina para criar antendimento
    Quando eu clicar em "Efetivado"
    Então devo ver a mensagem de sucesso "Atendimento efetivado com sucesso"
    E sou redirecionado para página de Atendimento
