#language: pt
#encoding: utf-8

Funcionalidade: criar_lembretes
  Como coordenador autenticado
  Quero criar um lembrete

  #casos felizes
  Cenário: Criar um lembrete
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    Dado que eu esteja na página "root_path"
    Quando eu clicar no link com a classe "add-reminder"
    Então sou redirecionado para página criação de lembretes
    E preencher os dados do formulário:
    	| reminder[remind] | Lembrar de ...  |
    	| reminder[remind_date] | 20/10/2019 |
    Quando eu clicar no botão "Salvar"
    E sou redirecionado para página de lembretes
    Então devo ver a mensagem de sucesso "Lembrete criado com sucesso."

  # casos tristes
  Cenário: Criar um lembrete
    Dado que eu seja um coordenador
    Dado que eu esteja autenticado
    Dado que eu esteja na página "root_path"
    Quando eu clicar no link com a classe "add-reminder"
    Então sou redirecionado para página criação de lembretes
    E preencher os dados do formulário:
    	| reminder[remind] |Lembrar de ...  |
    	| reminder[remind_date] ||
    Quando eu clicar no botão "Salvar"
    Então devo ver a mensagem de sucesso "Remind date can't be blank"