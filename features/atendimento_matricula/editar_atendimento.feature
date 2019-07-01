# #language: pt
# #encoding: utf-8

# Funcionalidade: editar_atendimento
#   Como coordenador autenticado
#   Quero editar um atendimento do sistema

#   Cenario: Editar atendimentos com sucesso
#     Dado que eu esteja logado como coordenador
#     E tenha um atendimento com nome do estudante "Artur"
#     E esteja na pagina para ver atendimentos
#     Quando eu clicar para editar atendimento no botao "Edit"
#     E preencher os dados do formulário:
#     	| attendance_name_student       | Moutinho                                         |
#     	| attendance_comment            | Desejo entrar na matéria Informática e sociedade |
#     E selecionar "Em condição" do campo de id "attendance_priority_student"
#     Quando eu clicar no botão "Novo Atendimento"
#     Então devo ver a mensagem de sucesso "Atendimento editado com sucesso"
#     E sou redirecionado para página de Atendimentos