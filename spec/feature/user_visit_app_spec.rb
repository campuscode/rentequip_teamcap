feature 'user visit app' do
  scenario 'successfully' do
    visit root_path

    within('.navbar-brand') do
      expect(page).to have_content 'Aluguel de Equipamentos'
    end
    visit root_path

    within('h1') do
      expect(page).to have_content 'Contratos'
    end

    expect(page).to have_content 'Cliente'
    expect(page).to have_content 'Início'
    expect(page).to have_content 'Fim'
    expect(page).to have_content 'Valor'
  end
end
