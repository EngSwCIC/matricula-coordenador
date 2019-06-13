#language: pt
#encoding: utf-8

Funcionalidade: create_attendance_request
  Como estudante autenticado
  Quero criar uma requisições de atendimento no sistema

  #casos felize
  Cenário: Criar uma requisição de atendimento
    Dado que eu seja um estudantee
    E esteja autenticadoo
    E esteja na pagina de informações da fila
    Quando eu clicar emm "Requisitar Atendimento"
    Então sou redirecionado para página de informações da requisição
    E eu clicar no botãoo "Confirmar Requisição"
    Então devo ver a mensagem de sucessoo "Attendance request was successfully created."
    E sou redirecionado para página de informações da fila
