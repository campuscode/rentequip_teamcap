require 'rails_helper'

feature 'User creates equipment' do
  scenario 'successfully' do
    visit new_equipment_path

    fill_in 'Tipo do equipamento', with: 'Parafusadeira'
    fill_in 'Número serial', with: '5D4F5S4F'
    fill_in 'Marca', with: 'Bic'
    fill_in 'Fornecedor', with: 'Bic'
    fill_in 'Observações', with: 'Qui corrupti est quisquam. Facere animi quod
    aut. Qui nulla consequuntur consectetur sapiente.'

    click_on 'Create Equipment'

    expect(page).to have_content('Parafusadeira')
    expect(page).to have_content('5D4F5S4F')
    expect(page).to have_content('Bic')
    expect(page).to have_content('Bic')
    expect(page).to have_content('Qui corrupti est quisquam. Facere animi quod
    aut. Qui nulla consequuntur consectetur sapiente.')
  end

  scenario 'fail' do
    visit new_equipment_path

    click_on 'Create Equipment'

    expect(page).to have_content('Name can\'t be blank')
  end

  scenario 'edit' do
    equipment = create(:equipment, name: 'Parafusadeira')

    visit edit_equipment_path(equipment)

    fill_in 'Tipo do equipamento', with: 'Martelo'
    click_on 'Update Equipment'

    expect(page).to have_content('Martelo')
  end
end
