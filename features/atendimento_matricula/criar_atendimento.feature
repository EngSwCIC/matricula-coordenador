#language: pt
#encoding: utf-8

Funcionalidade: criar_atendimento
  Como Coordenador autenticado
  Quero criar um atendimento para um aluno no sistema

  #casos felizes
  Cenario: Criar atendimentos com sucesso
    Dado que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina para criar antendimento
    Quando eu clicar em "Novo Atendimento"
    E preencher os dados do formulário:
    	| attendence_name_student       | Moutinho                                         |
    	| attendence_course_student     | mout@mout.com                                    |
    	| attendence_comment            | Desejo entrar na matéria Informática e sociedade |
    E selecionar "Em condição" do campo de id "user_priority"
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de sucesso "Atendimento criado com sucesso"
    E sou redirecionado para página de Atendimento

  #casos tristes
  Cenario: Criar atendimento com falha
    Dado que eu seja um coordenador
    E que eu seja um coordenador
    E esteja autenticado
    E esteja na pagina para criar atendimento
    Quando eu clicar em "Novo Coordenador"
    E preencher os dados do formulário:
    	| attendence_name_student     | Rafael                           |
    	| attendence_course_student   | mout@mout.com                    |
    	| attendence_comment          |                                  |
    E selecionar "Normal" do campo de id "attendence_priority"
    Quando eu clicar no botão "Enviar"
    Então devo ver a mensagem de falha "Erro! Por obséquio, preencha todos os campos"