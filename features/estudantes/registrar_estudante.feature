#language: pt
#encoding: utf-8

Funcionalidade: registrar_estudante
  Como aluno não autenticado
  Quero me cadastrar no sistema

	#caso feliz
  Cenario: Se cadastrar no sistema com sucesso
  	Dado que eu seja um aluno não autenticado
  	Dado que eu esteja na página "root_path"
  	Quando eu clicar no botao em "Login"
  	Então devo ser redirecionado para rota "users/sign_in"
  	Quando eu clicar em "Sign up"
  	E preencher os dados do formulário:
    	| user_email                 | mout@mout.com |
    	| user_password              | 123456        |
    	| user_password_confirmation | 123456        |
    Quando eu clicar no botão "Sign up"
    Então devo ser redirecionado para a pagina principal

	#caso triste
	Cenario: Se cadastrar no sistema com falha
		Dado exista um coordenador com email "mout@mout.com"
		E que eu seja um aluno não autenticado
  	Dado que eu esteja na página "root_path"
  	Quando eu clicar no botao em "Login"
  	Então devo ser redirecionado para rota "users/sign_in"
  	Quando eu clicar em "Sign up"
  	E preencher os dados do formulário:
    	| user_email                 | mout@mout.com |
    	| user_password              | 123456        |
    	| user_password_confirmation | 123456        |
    Quando eu clicar no botão "Sign up"
    Então devo ver a mensagem de falha "Email has already been taken"