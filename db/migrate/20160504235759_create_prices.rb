class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :equipment
      t.integer :deadline
      t.float :price

      t.timestamps null: false
    end
  end
end
