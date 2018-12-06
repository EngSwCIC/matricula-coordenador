#language: pt
#encoding: utf-8

Funcionalidade: atendimento_efetivado
  Como coordenador autenticado
  Quero marcar um atendimento como efetivado

  #caso felizes
  Cenario: Marcar atendimento como efetivado
    Dado que eu esteja logado como coordenador
    E tenha um atendimento com nome do estudante "Artur"
    E esteja na pagina para ver atendimentos
    Quando eu clicar para mudar para realizado no botao "Realizado"
    Então devo ver a mensagem de sucesso "Atendimento foi realizado com sucesso"
    E sou redirecionado para página de Atendimentos
