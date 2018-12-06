#language: pt
#encoding: utf-8

Funcionalidade: editar_descricao
  Como administrador autenticado
  Quero editar a descrição do sistema

  # caso feliz
  Cenario: Editar descrição com sucesso
    Dado que eu seja um administrador
    E esteja autenticado
    E exista uma descrição "Olá mundo"
    E esteja na pagina para editar descrição
    Quando eu clicar para editar descrição em "Editar"
    E preencher os dados do formulário:
    	| about_description       | IPSUMMMMM LOOREEEEMMM  |
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de sucesso "Descrição editado com sucesso"
    E sou redirecionado para página de descrições

  # caso triste
  Cenario: Editar descrição com falha
    Dado que eu seja um administrador
    E esteja autenticado
    E exista uma descrição "Olá mundo"
    E esteja na pagina para editar descrição
    Quando eu clicar para editar descrição em "Editar"
    E preencher os dados do formulário:
    	| about_description       |   |
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de falha "Erro na edição da descrição"