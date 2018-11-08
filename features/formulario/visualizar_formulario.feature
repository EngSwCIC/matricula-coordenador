#language: pt
#encoding: utf-8

Funcionalidade: visualizar_formulario_de_concessao_de_credito
  Como usuário autenticado
  Quero visualizar um formulário

  Cenario: Visualizar formulário de concessão de crédito como coordenador
    Dado que eu seja coordenador
    E que eu esteja autenticado no sistema
    E que eu esteja na página de visualizar formulários
    Quando eu clicar em "Formulários"
    Então quero visualizar todos os formulários

  Cenario: Excluir formulário de concessão de crédito como coordenador
    Dado que eu seja coordenador
    E que eu esteja autenticado no sistema
    E que eu esteja na página de excluir formulários
    Quando eu clicar em "Excluir"
    Então quero excluir um formulário

  Cenario: Visualizar formulário de concessão de crédito como aluno
    Dado que eu seja aluno
    E que eu esteja autenticado no sistema
    E que eu esteja na página de visualização formulários
    Quando eu clicar em "Formulários"
    Então quero visualizar apenas meus formulários

    # Dado que exista o curso com os campos:
    #   |kind          |presencial   |
    #   |code          |19           |
    #   |name          |ADMINISTRAÇÃO|
    #   |turn          |Diurno       |
    #   |classification|humanas      |
    #   |opcode        |8117         |
    # E que exista um professor que seja o orientador desse curso com os campos:
    #   |name|Marcos|
    # E que eu esteja na pagina de vizualização desse curso
    # Então devo um card com o nome do orientador

  Cenario: Preencher formulário de concessão de créditos como aluno
    Dado que eu seja aluno 
    E que eu esteja autenticado no sistema
    E que eu esteja na página de adicionar formulários
    Quando eu clicar em "Preencher"
    Então quero preencher um formulário de concessão de créditos

  Cenario: Anexar documentos ao formulário de concessão de créditos como aluno
    Dado que eu seja aluno 
    E que eu esteja autenticado no sistema
    #E que eu esteja preenchendo um formulário
    Quando eu clicar em "Anexar"
    Então quero anexar documentos ao formulário de concessão de créditos

  #Deve ser dentro da visualização de Formulários?
  Cenario: Editar um formulário de concessão de créditos não autenticado como aluno
    Dado que eu seja aluno
    E que eu esteja autenticado no sistema
    E que o formulário não esteja autenticado
    Quando eu clicar em "Editar"
    Então quero editar um formulário de concessão de créditos não autenticado

  #Deve ser dentro da visualização de Formulários?
  Cenario: Excluir um formulário de concessão de créditos não autenticado como aluno
    Dado que eu seja aluno
    E que eu esteja autenticado no sistema
    E que o formulário não esteja autenticado
    Quando eu clicar em "Excluir"
    Então quero excluir um formulário de concessão de créditos não autenticado