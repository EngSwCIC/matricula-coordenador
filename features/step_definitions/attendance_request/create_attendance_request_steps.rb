# frozen_string_literal: true
  
  Dado('esteja na pagina de informações da fila') do
    visit information_path
  end
  
  Então('sou redirecionado para página de informações da requisição') do
    expect(current_path).to eql(new_attendance_request_path)
  end
  
  Então('sou redirecionado para página de informações da fila') do
    expect(current_path).to eql(information_path)
  end
  