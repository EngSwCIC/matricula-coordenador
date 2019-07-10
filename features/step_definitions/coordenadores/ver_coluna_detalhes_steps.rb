# frozen_string_literal: true
Então('devo ver o campo de detalhes') do
    expect(page).to have_content('Detalhes')
end