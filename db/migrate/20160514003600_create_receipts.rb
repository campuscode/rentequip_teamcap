class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.references :contract, index: true, foreign_key: true
      t.string :goal

      t.timestamps null: false
    end
  end
end
