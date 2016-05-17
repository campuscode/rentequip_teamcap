class ChangeGoalToTypeIntoReceipt < ActiveRecord::Migration
  def change
    rename_column :receipts, :goal, :type
  end
end
