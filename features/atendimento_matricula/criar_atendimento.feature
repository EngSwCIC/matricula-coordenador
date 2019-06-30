# #language: pt
# #encoding: utf-8

# Funcionalidade: criar_atendimento
#   Como coordenador autenticado
#   Quero criar um atendimento para um aluno no sistema

#   #casos felizes
#   Cenario: Criar atendimentos com sucesso
#     Dado que eu esteja logado como coordenador
#     E esteja na pagina para ver atendimentos
#     Quando eu clicar em "Novo atendimento"
#     E preencher os dados do formulário:
#     	| attendance_name_student       | Moutinho |                                        
#     	| attendance_comment            | Desejo entrar na matéria Informática e sociedade|
#     E selecionar "Em condição" do campo de id "attendance_priority_student"
#     Quando eu clicar no botão "Novo Atendimento"
#     Então devo ver a mensagem de sucesso "Atendimento Criado com sucesso"
#     E sou redirecionado para página de Atendimentos


#   #casos tristes
#   Cenario: Criar atendimentos com falha
#     Dado que eu esteja logado como coordenador
#     E esteja na pagina para ver atendimentos
#     Quando eu clicar em "Novo atendimento"
#     E preencher os dados do formulário:
#     	| attendance_name_student       |  |                                        
#     	| attendance_comment            | Desejo entrar na matéria Informática e sociedade|
#     E selecionar "Em condição" do campo de id "attendance_priority_student"
#     Quando eu clicar no botão "Novo Atendimento"
#     Então devo ver a mensagem de sucesso "Por obséquio, favor responder todos os campos"