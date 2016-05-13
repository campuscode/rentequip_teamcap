require 'rails_helper'

feature 'user view equipment list' do
  scenario 'successfully' do
    equipment = create_list(:equipment, 2)

    visit equipment_index_path

    expect(page).to have_content(equipment.first.name)
    expect(page).to have_content(equipment.last.name)
  end

  scenario 'user view equipment detail' do
    equipment = create(:equipment)

    visit equipment_path equipment

    expect(page).to have_content(equipment.name)
  end

  scenario 'user do not see equipment' do
    visit equipment_index_path

    expect(page).to have_content('Não há equipamentos cadastrados')
  end
end
