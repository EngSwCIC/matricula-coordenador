#language: pt
#encoding: utf-8

Funcionalidade: criar_coordenadores
  Como administrador autenticado
  Quero criar um coordenador no sistema

  Cenario: Criar coordenadores com sucesso
    Dado que eu seja um administrador
    E esteja autenticado
    E esteja na pagina para criar coordenadores
    Quando eu clicar em "Novo Coordenador"
    E preencher os dados do formulário:
    	| user_name     | Moutinho      |
    	| user_email    | mout@mout.com |
    	| user_password | 123456        |
    Quando eu clicar no botão "Criar Coordenador"
    Então devo ver a mensagem de sucesso "Coordenador criado com sucesso"
    E sou redirecionado para página de coordenadores