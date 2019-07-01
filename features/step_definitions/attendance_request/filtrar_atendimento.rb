
Dado('que eu esteja na pagina para ver atendimentos') do
  visit attendance_requests_path
end

Quando('eu clicar em filtrar por {string} e selecionar {string} do campo de id {string}') do |s,t,g|
  find('#priority_filter').find('option', text: /#{t}/i).select_option
end


Então('devo ver na tabela de atendimentos em todas as linhas a coluna {string} com o valor {string}') do |column, value| 
  all('table tr > td:nth-child(6)').each do |td|
    expect("#{value}").to include td.text || td.text.has_no_content?
  end
end