#language: pt
#encoding: utf-8

Funcionalidade: ver_lista_attendance
  Como coordenador autenticado
  Quero quero ver a lista de atendimentos requisitados de todos os alunos

  #casos felizes
  Cenario: Ver Lista de Requisições de Atendimento de Todos os Alunos
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    E tenha pedidos de alunos
    E esteja na pagina de informações da fila
    Então devo ver uma lista com os pedidos de todos os alunos
