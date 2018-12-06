#language: pt
#encoding: utf-8

Funcionalidade: visualizar_paginas_fila_de_espera
  Como estudante autenticado 
  Quero acessar a pagina que informa o estudante sobre a lista de espera

  # cenários felizes
  Cenario: Visualizar pagina Informações Fila
    Dado que eu seja um estudante
    E esteja autenticado
    Dado que eu esteja na pagina inicial do sistema    
    Quando eu apertar em "Informações Fila"
    Então sou redirecionado para página Informações Fila
    Então devo ver informações tais como "fila de espera"


  # cenários tristes
  Cenario: Falha ao visualizar pagina Informações Fila
    Dado que eu seja um usuário diferente de estudante
    E esteja autenticado
    Dado que eu esteja na pagina inicial do sistema    
    Então não devo ver a opção de apertar em "Informações Fila"
