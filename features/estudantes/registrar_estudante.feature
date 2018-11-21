#language: pt
#encoding: utf-8

Funcionalidade: registrar_estudante
  Como aluno não autenticado
  Quero me cadastrar no sistema

  Cenario: Se cadastrar no sistema
  	Dado que eu seja um aluno não utenticado
  	E esteja na página principal
  	Quando eu clicar no botao em "Login"
  	Então devo ser redirecionado para rota "users/sign_in"
  	Quando eu clicar em "Sign up"
  	E preencher os dados do formulário:
    	| user_email                 | mout@mout.com |
    	| user_password              | 123456        |
    	| user_password_confirmation | 123456        |
    Quando eu clicar no botão "Sign up"
    Então devo ser redirecionado para a pagina principal

