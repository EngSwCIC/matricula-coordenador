#language: pt
#encoding: utf-8

Funcionalidade: visualizar_informacoes
  Como usuário não autenticado
  Quero visualizar uma informação

  Cenario: Visualizar avisos
    Dado que eu seja um usuario
    Quando eu selecionar um coordenador
    E clicar em "Avisos"
    Então quero visualizar todos as informações daquele coordenador

  Cenario: Visualizar horários de atendimento
    Dado que eu seja um usuario
    Quando eu selecionar um coordenador
    E clicar em "Horários de atendimento"
    Então quero visualizar todos os horários de atendimento daquele coordenador

  Cenario: Visualizar descrição do sistema
    Dado que eu seja um usuario
    Quando eu clicar em "Informações Gerais"
    Então quero visualizar as informações gerais do sistema
