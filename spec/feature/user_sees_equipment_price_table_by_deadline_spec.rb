feature 'User sees equipment price table by deadline' do
  scenario 'one day' do
    trator    = Price.create(equipment: 'Trator',
                             deadline: 1,
                             price: '1000.00'
                            )
    furadeira = Price.create(equipment: 'Furadeira',
                             deadline: 1,
                             price: '200.00'
                            )

    visit prices_path

    within('.prices h1') do
      expect(page).to have_content('Tabela de Preços')
    end

    within('table') do
      expect(page).to have_content(trator.equipment)
      expect(page).to have_content(trator.deadline)
      expect(page).to have_content(trator.amount)
      expect(page).to have_content(furadeira.equipment)
      expect(page).to have_content(furadeira.deadline)
      expect(page).to have_content(furadeira.amount)
    end
  end

  scenario 'many days' do
    trator    = Price.create(equipment: 'Trator',
                             deadline: 1,
                             price: '1000.00'
                            )
    furadeira = Price.create(equipment: 'Furadeira',
                             deadline: 1,
                             price: '200.00'
                            )

    visit prices_path

    within('.prices h1') do
      expect(page).to have_content('Tabela de Preços')
    end

    within('table') do
      expect(page).to have_content(trator.equipment)
      expect(page).to have_content(trator.deadline)
      expect(page).to have_content(trator.amount)
      expect(page).to have_content(furadeira.equipment)
      expect(page).to have_content(furadeira.deadline)
      expect(page).to have_content(furadeira.amount)
    end
  end
end
