feature 'User access price table' do
  scenario 'successfully' do
    trator    = create(:equipment, name: 'Trator')
    furadeira = create(:equipment, name: 'Furadeira')

    trator_price    = create(:price, equipment: trator)
    furadeira_price = create(:price, equipment: furadeira)

    visit prices_path

    within('.prices h1') do
      expect(page).to have_content('Tabela de Preços')
    end

    expect(page).to have_content('Novo Valor')

    within('table') do
      expect(page).to have_content(trator_price.equipment.name)
      expect(page).to have_content(trator_price.deadline)
      expect(page).to have_content(trator_price.value)
      expect(page).to have_content(furadeira_price.equipment.name)
      expect(page).to have_content(furadeira_price.deadline)
      expect(page).to have_content(furadeira_price.value)
    end
  end

  scenario 'dont see any price' do
    visit prices_path

    expect(page).to have_content('Nenhum Preço cadastrado.')
  end
end
