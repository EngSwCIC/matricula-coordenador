#language: pt
#encoding: utf-8

Funcionalidade: visualizar_informacoes_header
  Como usuário autenticado do sistema
  Quero ver em qual grupo o usuario atual pertence e preferências atraves de informacoes do header

  # cenários felizes
  Cenario: Visualizar Tipo usuário e Preferencias no header
    Dado que eu seja um usuario
    Dado que eu esteja na pagina inicial do sistema
    E esteja autenticado
    Então devo ver informações tais como "Tipo" e "Preferências" no header

  # cenários tristes
  Cenario: Falha Visualizar Tipo usuário e Preferencias no header
    Dado que eu seja um usuario nao autenticado
    Dado que eu esteja na pagina inicial do sistema
    Então nao devo ver informações tais como "Tipo" e "Preferências" no header