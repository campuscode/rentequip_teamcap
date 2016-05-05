require 'rails_helper'

feature 'user view equipment list' do

  scenario 'successfully' do
    equipment = Equipment.create(name: 'Furadeira',
                                 price: 'R$200,00')

    equipment2 = Equipment.create(name: 'Betoneira',
                                 price: 'R$2000,00')

    visit equipment_index_path

    expect(page).to have_content (equipment.name)
    expect(page).to have_content (equipment.price)
    expect(page).to have_content (equipment2.name)
    expect(page).to have_content (equipment2.price)
  end

  scenario 'user view equipment detail' do

    equipment = Equipment.create(name: 'Furadeira',
                                 price: 'R$200,00')

    visit equipment_path equipment

    expect(page).to have_content (equipment.name)
    expect(page).to have_content (equipment.price)
  end

  scenario 'user do not see equipment' do

    visit equipment_index_path

    expect(page).to have_content('Não há equipamentos cadastrados')
  end
end
