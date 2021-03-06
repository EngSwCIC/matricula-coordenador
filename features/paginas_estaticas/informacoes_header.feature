#language: pt
#encoding: utf-8

Funcionalidade: visualizar_informacoes_header
  Como usuário autenticado do sistema
  Quero ver em qual grupo o usuario atual pertence e preferências atraves de informacoes do header

  # cenários felizes
  Cenario: Visualizar Tipo usuário e Preferencias no header
    Dado que eu seja um usuario
    Dado que eu esteja na pagina inicial do sistema
    Dado que eu esteja autenticado
    Então devo ver informações tais como "Tipo" e "Preferências" no header