#language: pt
#encoding: utf-8

Funcionalidade: criar_formularios
  Como estudante autenticado
  Quero criar um formulario no sistema

  #casos felizes
  Cenario: Criar formulario com sucesso
    Dado que eu seja um estudante
    E esteja autenticado
    E esteja na pagina para criar formularios
    Quando eu clicar em "Novo Formulário"
    E preencher "Descrição" com "Inglês"
    E preencher "Grupo" com "1"
    E preencher "Carga horária" com "12"
    E preencher "Quantidade de créditos solicitados" com "4"
    E anexar "Documentação" com "224298.png"
    #Então devo ver a mensagem de sucesso "Seu formulário de aproveitamento de créditos foi criado com sucesso"
    Então sou redirecionado para página de formularios

  #casos tristes
  Cenario: Criar formulario apenas com Descrição
    Dado que eu seja um estudante
    E esteja autenticado
    E esteja na pagina para criar formularios
    Quando eu clicar em "Novo Formulário"
    E preencher "Descrição" com "Inglês"
    Quando eu clicar no botão "Enviar"
    Então sou redirecionado para a página de novo formulario

  Cenario: Criar formulario apenas com Grupo
    Dado que eu seja um estudante
    E esteja autenticado
    E esteja na pagina para criar formularios
    Quando eu clicar em "Novo Formulário"
    E preencher "Grupo" com "1"
    Quando eu clicar no botão "Enviar"
    Então sou redirecionado para a página de novo formulario

  Cenario: Criar formulario apenas com Carga Horária
    Dado que eu seja um estudante
    E esteja autenticado
    E esteja na pagina para criar formularios
    Quando eu clicar em "Novo Formulário"
    E preencher "Carga horária" com "10"
    Quando eu clicar no botão "Enviar"
    Então sou redirecionado para a página de novo formulario
  
  Cenario: Criar formulario apenas com Quantidade de créditos
    Dado que eu seja um estudante
    E esteja autenticado
    E esteja na pagina para criar formularios
    Quando eu clicar em "Novo Formulário"
    E preencher "Quantidade de créditos solicitados" com "4"
    Quando eu clicar no botão "Enviar"
    Então sou redirecionado para a página de novo formulario
