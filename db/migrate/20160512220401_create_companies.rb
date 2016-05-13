class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.string :address
      t.string :mail
      t.string :phone
      t.string :company_name
      t.string :contact

      t.timestamps null: false
    end
  end
end
