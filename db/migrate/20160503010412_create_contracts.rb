class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :customer
      t.date :started_at
      t.date :finished_at
      t.string :price
      t.string :equipment
      t.string :address
      t.string :contact

      t.timestamps null: false
    end
  end
end
