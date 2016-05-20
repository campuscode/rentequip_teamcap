require 'rails_helper'

feature 'User creates prices' do
  scenario 'successfully' do
    equipment = create(:equipment)
    prazo = [3, 7, 15, 30].sample

    visit new_price_path

    fill_in 'Valor', with: '1000'
    select prazo
    select equipment.name

    click_on 'Criar Preço'

    expect(page).to have_content(equipment.name)
    expect(page).to have_content(prazo)
    expect(page).to have_content('R$ 1.000,00')
  end

  scenario 'fail' do
    visit new_price_path
    click_on 'Criar Preço'

    expect(page).to have_content('Equipment can\'t be blank')
    expect(page).to have_content('Value can\'t be blank')
    expect(page).to have_content('Deadline can\'t be blank')
  end

  scenario 'edit price' do
    price = create(:price, deadline: 15)
    prazo = [3, 7, 30].sample
    visit edit_price_path price
    select prazo
    click_on 'Atualizar Preço'

    expect(page).to have_content(prazo)
  end
end
