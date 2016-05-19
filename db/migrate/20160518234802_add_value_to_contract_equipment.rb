class AddValueToContractEquipment < ActiveRecord::Migration
  def change
    add_column :contracts_equipment, :value, :float
  end
end
