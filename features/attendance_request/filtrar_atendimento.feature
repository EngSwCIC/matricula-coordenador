#language: pt
#encoding: utf-8

@coordinator
Funcionalidade: filtrar_atendimento
  Como coordenador autenticado
  Quero filtrar um atendimento por prioridade

  #casos felizes
  Cenario: Filtrar atendimento por prioridade corretamente
    Dado tenha pedidos de alunos
    Dado que eu esteja na pagina para ver atendimentos
    Quando eu clicar em filtrar por "Prioridade" e selecionar "Em condição" do campo de id "priority_filter"
    Então devo ver na tabela de atendimentos em todas as linhas a coluna "Prioridade" com o valor "Em condição"
    
  #casos tristes
  # Cenario: Filtrar atendimentos por prioridade com falha
  #   Dado que eu esteja na pagina para ver atendimentos
  #   Quando eu clicar em filtrar por "Prioridade"
  #   E selecionar "Em condição" do campo de id "priority_filter"
  #   Então devo ver na tabela de atendimentos em todas as linhas a coluna "Prioridade" com o valor diferente de "Em condição"