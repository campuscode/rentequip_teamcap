class AddFieldsToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :serial_number, :string
    add_column :equipment, :supplier, :string
    add_column :equipment, :brand, :string
    add_column :equipment, :notes, :text
  end
end
