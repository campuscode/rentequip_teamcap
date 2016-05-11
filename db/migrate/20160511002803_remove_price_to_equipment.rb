class RemovePriceToEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :price
  end
end
