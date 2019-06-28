Então('devo ver a mensagem de sucesso {string}') do |string|
    expect(page).to have_content(string)
end