class RenamePriceToValueOnPrices < ActiveRecord::Migration
  def change
    rename_column :prices, :price, :value
  end
end
