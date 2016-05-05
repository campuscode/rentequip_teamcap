class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :price

      t.timestamps null: false
    end
  end
end
