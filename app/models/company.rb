class Company < ActiveRecord::Base
  validates :name, :cnpj, :address, :mail, :phone, :company_name, :contact,
            presence: true
end
