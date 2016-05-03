class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :started_at
      t.date :finished_at

      t.timestamps null: false
    end
  end
end
