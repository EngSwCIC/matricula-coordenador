#language: pt
#encoding: utf-8

@reminder
Funcionalidade: editar_lembretes
  Como coordenador autenticado
  Quero editar um lembrete

  #casos felizes
  Cenário: Editar um lembrete
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    Dado que eu esteja na página "reminders_path"
    Quando eu clicar no link "Editar" de um lembrete
    E preencher os dados do formulário:
    	| reminder[remind] | Lembrar desse atendimento aqui...  |
    	| reminder[remind_date] | 15/11/2019 |
    Quando eu clicar no botão "Salvar"
    Então devo ver a mensagem de sucesso "Lembrete atualizado com sucesso"