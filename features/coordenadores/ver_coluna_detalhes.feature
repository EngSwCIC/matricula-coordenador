#language: pt
#encoding: utf-8

Funcionalidade: ver_coluna_detalhes
  Como coordenador autenticado
  Quero quero ver a campo de detalhes

  #casos felizes
  Cenario: Ver campo de detalhes
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    E tenha pedidos de alunos
    E esteja na pagina de informações da fila
    Quando eu clicar no link "Realizar Atendimento"
    Então devo ver o campo de detalhes
