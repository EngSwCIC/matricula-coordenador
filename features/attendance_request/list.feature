#language: pt
#encoding: utf-8

Funcionalidade: listar_attendance_request
  Como estudante autenticado
  Quero listar minhas requisições de atendimento no sistema

  #casos felize
  Cenário: Listar todos as minhas requisições de atendimento
    # Dado que eu seja um estudante
    # E esteja autenticado
    # E esteja na pagina de informações da fila
    # Quando eu clicar em "Requisitar Atendimento"
    # Então sou redirecionado para página de informações da requisição
    # E eu clicar no botão "Confirmar Requisição"
    # Então devo ver a mensagem de sucesso "Attendance request was successfully created."
    # E sou redirecionado para página de informações da fila


