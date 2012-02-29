class AddStockCountToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :entry_stock_count, :integer

  end
end
