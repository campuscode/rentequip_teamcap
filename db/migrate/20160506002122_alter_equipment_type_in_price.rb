class AlterEquipmentTypeInPrice < ActiveRecord::Migration
  def change
    rename_column :prices, :equipment, :equipment_id
    change_column :prices, :equipment_id, :integer, index: true
  end
end
