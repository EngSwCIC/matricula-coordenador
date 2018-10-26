#language: pt
#encoding: utf-8

Funcionalidade: criar_coordenadores
  Como administrador autenticado
  Quero criar um coordenador do sistema

  Cenario: Criar coordenadores com sucesso
    Dado que eu seja um administrador
    E esteja autenticado
    Quando eu clicar em "Criar coordenador"
    Então devo ver a mensagem de sucesso "Coordenador criado com sucesso"