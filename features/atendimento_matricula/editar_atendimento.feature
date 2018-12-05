#language: pt
#encoding: utf-8

Funcionalidade: editar_atendimento
  Como coordenador autenticado
  Quero editar um atendimento do sistema

  #casos felizes
  Cenario: Editar atendimentos com sucesso
    Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina para criar atendimentos
    Quando eu clicar para editar no botao "Editar"
    E preencher os dados do formulário:
    	| attendence_name_student       | Moutinho                                         |
    	| attendence_course_student     | mout@mout.com                                    |
    	| attendence_comment            | Desejo entrar na matéria Informática e sociedade |
    E selecionar "Em condição" do campo de id "user_priority"
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de sucesso "Atendimento editado com sucesso"
    E sou redirecionado para página de atendimentos

  #casos tristes
  Cenario: Editar atendimentos com falha
  Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina para criar atendimentos
    Quando eu clicar para editar no botao "Editar"
    E preencher os dados do formulário:
    	| attendence_name_student       | Moutinho       |
    	| attendence_course_student     | mout@mout.com  |
    	| attendence_comment            |                |
    E selecionar "Em condição" do campo de id "user_priority"
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de falha "Erro! Por obséquio, preencha todos os campos"