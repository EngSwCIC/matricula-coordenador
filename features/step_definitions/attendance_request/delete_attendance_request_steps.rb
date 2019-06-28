# frozen_string_literal: true
  
  Dado('possua uma requisição') do
    @attendance_request = AttendanceRequest.create(user: @user, description: 'Descrição de atendimento')
  end