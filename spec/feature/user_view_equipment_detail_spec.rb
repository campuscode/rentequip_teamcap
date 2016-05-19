require 'rails_helper'

feature 'user view equipment detail' do
  scenario 'from equipment list' do
    equipment = create(:equipment)
    price1 = create(:price, equipment: equipment)

    visit equipment_index_path

    click_on equipment.name

    expect(page).to have_css('h1', text: equipment.name)
    expect(page).to have_content(equipment.serial_number)
    expect(page).to have_content(equipment.supplier)
    expect(page).to have_content(equipment.brand)
    expect(page).to have_content(equipment.notes)
  end

  scenario 'successfully' do
    equipment = create(:equipment)
    price1 = create(:price, equipment: equipment)
    price2 = create(:price, value: 46_735, deadline: 7, equipment: equipment)
    price3 = create(:price, value: 34, deadline: 3, equipment: equipment)

    visit equipment_path(equipment)

    expect(page).to have_css('h1', text: equipment.name)
    expect(page).to have_content(equipment.serial_number)
    expect(page).to have_content(equipment.supplier)
    expect(page).to have_content(equipment.brand)
    expect(page).to have_content(equipment.notes)
    within('#prices') do
      expect(page).to have_content(price1.value)
      expect(page).to have_content(price2.value)
      expect(page).to have_content(price3.value)
      expect(page).to have_content(price1.deadline)
      expect(page).to have_content(price2.deadline)
      expect(page).to have_content(price3.deadline)
    end
  end
end
