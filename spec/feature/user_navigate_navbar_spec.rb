require 'rails_helper'
feature 'User navigate navbar' do
  scenario 'user access companies' do
    visit root_path

    within '.navbar' do
      click_on 'Empresas'

      expect(current_path).to eq companies_path
    end
  end
end
