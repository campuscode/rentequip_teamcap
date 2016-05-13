require 'rails_helper'

feature 'User issue delivery receipts' do
  scenario 'successfully' do
    contract = create(:contract)
    visit contract_path(:contract)

    #TO DO resource to emit receipt
  end
end
