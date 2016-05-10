class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :contracts, :equipment do |t|
       t.index [:contract_id, :equipment_id]
       t.index [:equipment_id, :contract_id]
    end
  end
end
