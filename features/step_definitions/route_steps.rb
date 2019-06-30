Dado('que eu esteja na página {string}') do |string|
  case string
  when 'root_path'
    visit root_path
  end
end