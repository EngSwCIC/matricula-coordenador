#language: pt
#encoding: utf-8

Funcionalidade: delete_attendance_request
  Como estudante autenticado
  Quero deletar uma requisições de atendimento no sistema

  #casos felize
  Cenário: Deletar uma requisição de atendimento
    Dado que eu seja um estudante
    Dado que eu esteja autenticado
    E possua uma requisição
    E esteja na pagina de informações da fila
    Quando eu clicar no link "Remover Requisição"
    Então devo ver a mensagem de sucesso "Attendance request was successfully destroyed."
    E sou redirecionado para página de informações da fila
