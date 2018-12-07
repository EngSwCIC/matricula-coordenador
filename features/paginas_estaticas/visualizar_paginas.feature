#language: pt
#encoding: utf-8

Funcionalidade: visualizar_paginas_estaticas
  Como usuário autenticado ou não autenticado do sistema
  Quero acessar as paginas estaticas através dos links do header

  # cenários felizes
  Cenario: Visualizar Sobre
    Dado que eu esteja na pagina inicial do sistema
    Quando eu apertar em "Sobre"
    Então sou redirecionado para página Sobre
    E eu devo ver informações tais como "Descrição" e "Serviços"

  Cenario: Visualizar Contato
    Dado que eu esteja na pagina inicial do sistema
    Quando eu apertar em "Contato"
    Então sou redirecionado para página Contato
    E eu devo ver informações tais como "Email"


  # cenários tristes
  Cenario: Falha ao redirecionar para a pagina Sobre
    Dado que eu esteja na pagina inicial do sistema
    Quando eu apertar em "Sobre"
    Então sou redirecionado para página Sobre
    E não devo estar na rota de outra pagina

  Cenario: Falha ao redirecionar para a pagina Contato
    Dado que eu esteja na pagina inicial do sistema
    Quando eu apertar em "Contato"
    Então sou redirecionado para página Contato
    E não devo estar na rota de outra pagina