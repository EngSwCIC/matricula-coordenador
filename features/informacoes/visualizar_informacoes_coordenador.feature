#language: pt
#encoding: utf-8

Funcionalidade: visualizar_informacoes_coordenador
  Como aluno
  Quero procurar as informações de um coordenador

  # cenários felizes
  Cenario: Visualizar todos os coordenadores com sucesso
    Dado que eu seja um aluno
    E exista um coordenador do curso "Estatística" com email "maria@maria.com"
    E exista um coordenador do curso "Design" com email "pedro@pedro.com"
    Quando eu for para a pagina de coordenadores
    Então eu devo ver o coordenador do curso de "Estatística"
    E eu devo ver o coordenador do curso de "Design"

  Cenario: Visualizar as informações de um coordenador com suscesso
    Dado que eu seja um aluno
    E exista um coordenador do curso "Estatística" com email "maria@maria.com"
    Quando eu for para a pagina de coordenadores
    E eu clicar no botão "Informações" daquele coordenador
    Então sou redirecionado para página daquele coordenador
    E eu devo ver o horário de atendimento daquele coordenador
    E eu devo ver os avisos daquele coordenador

  # cenários tristes

