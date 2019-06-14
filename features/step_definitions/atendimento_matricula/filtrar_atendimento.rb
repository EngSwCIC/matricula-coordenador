
Dado('que eu esteja na pagina para ver atendimentos') do
  visit attendances_path
end

Quando('eu clicar em filtrar por {string} e selecionar {string} do campo de id {string}') do |s,t,g|
  find('#priority_filter').click
  find('#priority_filter option', :text => t).click
end


Então('devo ver na tabela de atendimentos em todas as linhas a coluna {string} com o valor {string}') do |column, value| 
  all('table tr > td:nth-child(4)').each do |td|
    %w{value}.should include td.text
  end
end