#language: pt
#encoding: utf-8

Funcionalidade: ver_lista_attendance
  Como coordenador autenticado
  Quero quero ver a lista de atendimentos requisitados de todos os alunos

  #casos felizes
  Cenario: Ver Lista de Requisições de Atendimento de Todos os Alunos
    Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina de informações da fila
    E tenha pedidos de alunos com os dados:
    	| user_name       | Moutinho                         |
    	| user_email      | mout@mout.com                    |
    	| user_password   | 123456                           |
    Então devo ver uma lista com 3 entradas

  #casos tristes
  Cenario: Ver Lista de Requisições de Atendimento de Todos os Alunos
    Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina de informações da fila
    E tenha pedidos de alunos com os dados:
    	| user_name       | Moutinho                         |
    	| user_email      | mout@mout.com                    |
    	| user_password   | 123456                           |
    Então não vejo nada