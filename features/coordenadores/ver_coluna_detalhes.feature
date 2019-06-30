#language: pt
#encoding: utf-8

Funcionalidade: ver_coluna_detalhes
  Como coordenador autenticado
  Quero quero ver a coluna de detalhes

  #casos felizes
  Cenario: Ver coluna de detalhes
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    E tenha pedidos de alunos com detalhes
    E esteja na pagina de informações da fila
    Então devo ver a coluna de detalhes
