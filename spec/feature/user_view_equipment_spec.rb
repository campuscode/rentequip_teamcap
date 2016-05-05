require 'rails_helper'

feature 'user view equipment' do

  scenario 'successfully' do
    equipment = Equipment.create(name: 'Furadeira',
                                 price: 'R$200,00')

    visit equipment_index_path

    expect(page).to have_content (equipment.name)
    expect(page).to have_content (equipment.price)
  end

  scenario 'user view equipment detail' do

    equipment = Equipment.create(name: 'Furadeira',
                                 price: 'R$200,00')

    visit equipment_path equipment

    expect(page).to have_content (equipment.name)
    expect(page).to have_content (equipment.price)
  end
end
