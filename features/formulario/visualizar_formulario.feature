#language: pt
#encoding: utf-8

Funcionalidade: visualizar_formulario_de_concessao_de_credito
  Como usuário autenticado
  Quero visualizar um formulário

  Cenario: Visualizar formulário de concessão de crédito como coordenador
    Dado que eu seja coordenador
    E que eu esteja autenticado no sistema
    Quando eu clicar em "Formulários"
    Então quero visualizar todos os formulários

  Cenario: Visualizar formulário de concessão de crédito como aluno
    Dado que eu seja aluno
    E que eu esteja autenticado no sistema
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