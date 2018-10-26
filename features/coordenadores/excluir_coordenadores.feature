#language: pt
#encoding: utf-8

Funcionalidade: excluir_coordenadores
  Como administrador autenticado
  Quero excluir um coordenador do sistema

  Cenario: Excluir coordenadores com sucesso
    Dado que eu seja um administrador
    E esteja autenticado
    Quando eu clicar em "Excluir coordenador"
    Então devo ver a mensagem de sucesso "Coordenador excluído com sucesso"