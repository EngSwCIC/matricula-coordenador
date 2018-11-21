#language: pt
#encoding: utf-8

Funcionalidade: excluir_coordenadores
  Como administrador autenticado
  Quero excluir um coordenador do sistema

  Cenario: Excluir coordenadores com sucesso
    Dado que eu seja um administrador
    E esteja autenticado
    E exista um coordenador com email "mout@mout.com"
    E esteja na pagina para criar coordenadores
    Quando eu clicar para deletar no botao "Excluir"
    Então devo ver a mensagem de sucesso "Coordenador excluído com sucesso"
    E sou redirecionado para página de coordenadores