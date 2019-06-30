#language: pt
#encoding: utf-8

Funcionalidade: ver_coluna_detalhes
  Como coordenador autenticado
  Quero quero ver a coluna de detalhes

  #casos felizes
  Cenario: Ver coluna de detalhes
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    E tenha pedidos de alunos
    E esteja na pagina de realizar atendimento
    Então devo ver o campo de detalhes
