Quando('eu clicar em {string}') do |botao|
    click_link botao
end

Quando('eu clicar no link {string}') do |string|
    page.find('a', text: string).click
end

Quando(/eu clicar no (?:botão|botao) "([^\"]*)"$/) do |string|
    click_button string
end