require 'rails_helper'

feature 'User creates prices' do
  scenario 'successfully' do
    equipment = create(:equipment)

    visit new_price_path

    fill_in 'Valor', with: '1000'
    fill_in 'Prazo', with: 2
    select equipment.name

    click_on 'Create Price'

    expect(page).to have_content(equipment.name)
    expect(page).to have_content(2)
    expect(page).to have_content('R$ 1.000,00  ')
  end

  scenario 'fail' do
    visit new_price_path
    click_on 'Create Price'

    expect(page).to have_content('Equipment can\'t be blank')
    expect(page).to have_content('Value can\'t be blank')
    expect(page).to have_content('Deadline can\'t be blank')
  end
end
