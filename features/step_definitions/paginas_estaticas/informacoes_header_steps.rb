Então("devo ver informações tais como {string} e {string} no header") do |string, string2|
  expect(page).to have_content(string)	
  expect(page).to have_content(string2)	
end

Então("nao devo ver informações tais como {string} e {string} no header") do |string, string2|
  expect(page).not_to have_content(string)
  expect(page).not_to have_content(string2)
end
